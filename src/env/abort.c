/*
 *  $Id: abort.c,v 1.8.2.1 2004/11/12 15:38:27 carsten Exp $
 *
 *  (C) 1993 by Argonne National Laboratory and Mississipi State University.
 *      See COPYRIGHT in top-level directory.
 */
#include "mpiimpl.h"
 
#ifdef HAVE_WEAK_SYMBOLS

#if defined(HAVE_PRAGMA_WEAK)
#pragma weak MPI_Abort = PMPI_Abort
#elif defined(HAVE_ATTRIBUTE_WEAK)
EXPORT_MPI_API int MPI_Abort( MPI_Comm comm, int errorcode ) __attribute__ ((weak, alias ("PMPI_Abort")));
#elif defined(HAVE_PRAGMA_HP_SEC_DEF)
#pragma _HP_SECONDARY_DEF PMPI_Abort  MPI_Abort
#elif defined(HAVE_PRAGMA_CRI_DUP)
#pragma _CRI duplicate MPI_Abort as PMPI_Abort
/* end of weak pragmas */
#endif

/* Include mapping from MPI->PMPI */
#define MPI_BUILD_PROFILING
#include "mpiprof.h"
/* Insert the prototypes for the PMPI routines */
#undef __MPI_BINDINGS
#include "binding.h"
#endif

#ifdef WIN32
#include <stdlib.h>
#endif

/*@
   MPI_Abort - Terminates MPI execution environment

Input Parameters:
+ comm - communicator of tasks to abort 
- errorcode - error code to return to invoking environment 

Notes:
Terminates all MPI processes associated with the communicator 'comm'; in
most systems (all to date), terminates `all` processes.

.N fortran
@*/
EXPORT_MPI_API int MPI_Abort( MPI_Comm comm, int errorcode )
{
    struct MPIR_COMMUNICATOR *comm_ptr;
    static char myname[] = "MPI_ABORT";
    int mpi_errno = MPI_SUCCESS;

    fflush(stdout);
    fflush(stderr);
    comm_ptr = MPIR_GET_COMM_PTR(comm);
    MPIR_TEST_MPI_COMM(comm,comm_ptr,comm_ptr,myname);
    
    MPID_Abort( comm_ptr, errorcode, "MPI Abort by user", (char *)0 );

/* If for some reason we get here, force an abort */
    abort( );

/* This keeps lint happy */
    return MPI_ERR_UNKNOWN;
}