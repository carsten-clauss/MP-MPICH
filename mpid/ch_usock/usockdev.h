/* $Id$ */

/* Definitions for the device only 
   This is an example that can can be used by channel codes
 */

#ifndef MPID_DEV_H
#define MPID_DEV_H

#include "dev.h"
#include "mpid_common.h"
#include "usockinsocket.h"
#include "statistic.h"

#undef  _USOCK_CHECK_DEV_VALIDITY
#ifdef  _USOCK_CHECK_DEV_VALIDITY
extern int MPID_USOCK_Test_device(void*, char*);
#else
#define MPID_USOCK_Test_device(a, b)
#endif

/* Globals - For the device */
extern int          MPID_n_pending;
extern MPID_DevSet *MPID_devset;
extern MPID_INFO   *MPID_tinfo;

typedef
struct _MPID_USOCK_Data_global_type
{
  int MyWorldRank;
  int MyWorldSize;
  HANDLE *Events;
  int long_len_value;
  int vlong_len_value;

  /* pointer to the private data: */
  void *local_data_priv;
  void *local_data_getopt;
  void *local_data_tcpcomm;
  void *local_data_brndv;

} MPID_USOCK_Data_global_type;

/* macro to get a pointer to the global data of the device instance: */
#define MPID_USOCK_Get_global_data(dev) ((MPID_USOCK_Data_global_type*)(dev)->global_data)


#define MPIDTRANSPORT "ch_usock"

/* usockpackets.h include chdef.h and channel.h */
#include "usockpackets.h"
#include "usockdebug.h"

/* 
   Common macro for checking the actual length (msglen) against the
   declared max length in a handle (dmpi_recv_handle).  
   Resets msglen if it is too long; also sets err to MPI_ERR_TRUNCATE.
   This will set the error field to be added to a handle "soon" 
   (Check for truncation)

   This does NOT call the MPID_ErrorHandler because that is for panic
   situations.
 */
#define MPID_CHK_MSGLEN(rhandle,msglen,err) \
if ((rhandle)->len < (msglen)) {\
    err = MPI_ERR_TRUNCATE;\
    rhandle->s.MPI_ERROR = MPI_ERR_TRUNCATE;\
    msglen = (rhandle)->len;\
    }
#define MPID_CHK_MSGLEN2(actlen,msglen,err) \
if ((actlen) < (msglen)) {\
    err = MPI_ERR_TRUNCATE;\
    msglen = (actlen);\
    }

/* Function prototypes for routines known only to the device */
extern MPID_Device *MPID_CH_USOCK_InitMsgPass ANSI_ARGS(( int *, char ***, 
						    int, int ));
extern MPID_Protocol *MPID_USOCK_Short_setup ANSI_ARGS((void));
extern MPID_Protocol *MPID_USOCK_Rndvb_setup ANSI_ARGS((void));
extern MPID_Protocol *MPID_USOCK_Eagern_setup ANSI_ARGS((void));
extern int MPID_USOCK_Check_incoming ANSI_ARGS(( MPID_Device *, 
					      MPID_BLOCKING_TYPE));
extern int  MPID_CH_Init_hetero ANSI_ARGS(( int *, char *** ));
extern void MPID_CH_Pkt_pack ANSI_ARGS(( void *, int, int ));
extern void MPID_CH_Pkt_unpack ANSI_ARGS(( void *, int, int ));

extern int MPID_PackMessageFree ANSI_ARGS((MPIR_SHANDLE *));
extern void MPID_PackMessage ANSI_ARGS((void *, int, struct MPIR_DATATYPE *, 
					struct MPIR_COMMUNICATOR *, int, 
					MPID_Msgrep_t, MPID_Msg_pack_t, 
					void **, int *, int *));
extern void MPID_UnpackMessageSetup ANSI_ARGS(( int, struct MPIR_DATATYPE *, 
						struct MPIR_COMMUNICATOR *,
						int, MPID_Msgrep_t, void **, 
						int *, int * ));
extern int MPID_UnpackMessageComplete ANSI_ARGS(( MPIR_RHANDLE * ));

int MPID_USOCK_SendCancelPacket ANSI_ARGS(( MPIR_SHANDLE* ));

/* 
   Devices that provide their own datatype handling may need to provide their
   own MPI_Get_count and MPI_Get_elements routines.  They should provide
   MPID_Get_count and MPID_Get_elements, and define the macros
   MPID_HAS_GET_COUNT and MPID_HAS_GET_ELEMENTS in mpid.h .  The 
   definitions of the MPID versions is exactly the same as the MPI versions.
 */
#endif
