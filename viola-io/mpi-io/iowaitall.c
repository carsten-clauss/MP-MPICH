/* -*- Mode: C; c-basic-offset:4 ; -*- */
/* 
 *   $Id: iowaitall.c,v 1.1.1.1 2005/03/10 16:07:13 mhs Exp $    
 *
 *   Copyright (C) 2003 University of Chicago. 
 *   See COPYRIGHT notice in top-level directory.
 */

#include "mpioimpl.h"

#ifdef HAVE_WEAK_SYMBOLS

#if defined(HAVE_PRAGMA_WEAK)
#pragma weak MPIO_Waitall = PMPIO_Waitall
#elif defined(HAVE_PRAGMA_HP_SEC_DEF)
#pragma _HP_SECONDARY_DEF PMPIO_Waitall MPIO_Waitall
#elif defined(HAVE_PRAGMA_CRI_DUP)
#pragma _CRI duplicate MPIO_Waitall as PMPIO_Waitall
/* end of weak pragmas */
#endif

/* Include mapping from MPI->PMPI */
#define MPIO_BUILD_PROFILING
#include "mpioprof.h"
#endif

/*
  This is a temporary function until we switch to using MPI-2's generalized
  requests.
*/

int MPIO_Waitall( int count, MPIO_Request requests[], MPI_Status statuses[] )
{
    int notdone, i, flag, err; 

    if (count == 1) 
	return MPIO_Wait( requests, statuses );
    
    do {
	notdone = 0;
	for (i=0; i<count; i++) {
	    if (requests[i] != MPIO_REQUEST_NULL) {
		err = MPIO_Test( &requests[i], &flag, &statuses[i] );
		if (!flag) notdone = 1;
		if (err) return err;
	    }
	    else {
#ifdef MPICH2
		/* need to set empty status */
		if (statuses != MPI_STATUSES_IGNORE) {
		    statuses[i].MPI_SOURCE = MPI_ANY_SOURCE;
		    statuses[i].MPI_TAG    = MPI_ANY_TAG;
		    statuses[i].count      = 0;
		    statuses[i].cancelled  = 0;
		}
#else
		;
#endif
	    }
	}
    } while (notdone);

    return MPI_SUCCESS;
}
