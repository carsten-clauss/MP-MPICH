        MODULE MPI1__<type>_v2
        IMPLICIT NONE
        PRIVATE
        PUBLIC :: MPI_ADDRESS
        INTERFACE MPI_ADDRESS
          MODULE PROCEDURE MPI_ADDRESS_T
        END INTERFACE ! MPI_ADDRESS

        PUBLIC :: MPI_BSEND
        INTERFACE MPI_BSEND
          MODULE PROCEDURE MPI_BSEND_T
        END INTERFACE ! MPI_BSEND

        PUBLIC :: MPI_BSEND_INIT
        INTERFACE MPI_BSEND_INIT
          MODULE PROCEDURE MPI_BSEND_INIT_T
        END INTERFACE ! MPI_BSEND_INIT

        PUBLIC :: MPI_BUFFER_ATTACH
        INTERFACE MPI_BUFFER_ATTACH
          MODULE PROCEDURE MPI_BUFFER_ATTACH_T
        END INTERFACE ! MPI_BUFFER_ATTACH

        PUBLIC :: MPI_BUFFER_DETACH
        INTERFACE MPI_BUFFER_DETACH
          MODULE PROCEDURE MPI_BUFFER_DETACH_T
        END INTERFACE ! MPI_BUFFER_DETACH

        PUBLIC :: MPI_IBSEND
        INTERFACE MPI_IBSEND
          MODULE PROCEDURE MPI_IBSEND_T
        END INTERFACE ! MPI_IBSEND

        PUBLIC :: MPI_IRECV
        INTERFACE MPI_IRECV
          MODULE PROCEDURE MPI_IRECV_T
        END INTERFACE ! MPI_IRECV

        PUBLIC :: MPI_IRSEND
        INTERFACE MPI_IRSEND
          MODULE PROCEDURE MPI_IRSEND_T
        END INTERFACE ! MPI_IRSEND

        PUBLIC :: MPI_ISEND
        INTERFACE MPI_ISEND
          MODULE PROCEDURE MPI_ISEND_T
        END INTERFACE ! MPI_ISEND

        PUBLIC :: MPI_ISSEND
        INTERFACE MPI_ISSEND
          MODULE PROCEDURE MPI_ISSEND_T
        END INTERFACE ! MPI_ISSEND

        PUBLIC :: MPI_RECV
        INTERFACE MPI_RECV
          MODULE PROCEDURE MPI_RECV_T
        END INTERFACE ! MPI_RECV

        PUBLIC :: MPI_RECV_INIT
        INTERFACE MPI_RECV_INIT
          MODULE PROCEDURE MPI_RECV_INIT_T
        END INTERFACE ! MPI_RECV_INIT

        PUBLIC :: MPI_RSEND
        INTERFACE MPI_RSEND
          MODULE PROCEDURE MPI_RSEND_T
        END INTERFACE ! MPI_RSEND

        PUBLIC :: MPI_RSEND_INIT
        INTERFACE MPI_RSEND_INIT
          MODULE PROCEDURE MPI_RSEND_INIT_T
        END INTERFACE ! MPI_RSEND_INIT

        PUBLIC :: MPI_SEND
        INTERFACE MPI_SEND
          MODULE PROCEDURE MPI_SEND_T
        END INTERFACE ! MPI_SEND

        PUBLIC :: MPI_SENDRECV_REPLACE
        INTERFACE MPI_SENDRECV_REPLACE
          MODULE PROCEDURE MPI_SENDRECV_REPLACE_T
        END INTERFACE ! MPI_SENDRECV_REPLACE

        PUBLIC :: MPI_SEND_INIT
        INTERFACE MPI_SEND_INIT
          MODULE PROCEDURE MPI_SEND_INIT_T
        END INTERFACE ! MPI_SEND_INIT

        PUBLIC :: MPI_SSEND
        INTERFACE MPI_SSEND
          MODULE PROCEDURE MPI_SSEND_T
        END INTERFACE ! MPI_SSEND

        PUBLIC :: MPI_SSEND_INIT
        INTERFACE MPI_SSEND_INIT
          MODULE PROCEDURE MPI_SSEND_INIT_T
        END INTERFACE ! MPI_SSEND_INIT

        PUBLIC :: MPI_BCAST
        INTERFACE MPI_BCAST
          MODULE PROCEDURE MPI_BCAST_T
        END INTERFACE ! MPI_BCAST

        CONTAINS
!
        SUBROUTINE MPI_ADDRESS_T(LOCATION, ADDRESS, IERROR)
        <type> LOCATION(:,:)
        INTEGER  ADDRESS, IERROR
        EXTERNAL MPI_ADDRESS
        CALL MPI_ADDRESS(LOCATION, ADDRESS, IERROR)
        END SUBROUTINE MPI_ADDRESS_T
!
        SUBROUTINE MPI_BSEND_T(BUF, COUNT, DATATYPE, DEST, TAG, COMM,  &
      &   IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, IERROR
        EXTERNAL MPI_BSEND
        CALL MPI_BSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, IERROR)
        END SUBROUTINE MPI_BSEND_T
!
        SUBROUTINE MPI_BSEND_INIT_T(BUF, COUNT, DATATYPE, DEST, TAG,   &
      &   COMM, REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_BSEND_INIT
        CALL MPI_BSEND_INIT(BUF, COUNT, DATATYPE, DEST, TAG, COMM,     &
      &   REQUEST, IERROR) 
        END SUBROUTINE MPI_BSEND_INIT_T
!
        SUBROUTINE MPI_BUFFER_ATTACH_T( BUFFER, SIZE, IERROR)
        <type> BUFFER(:,:)
        INTEGER  SIZE, IERROR
        EXTERNAL MPI_BUFFER_ATTACH
        CALL MPI_BUFFER_ATTACH( BUFFER, SIZE, IERROR)
        END SUBROUTINE MPI_BUFFER_ATTACH_T
!
        SUBROUTINE MPI_BUFFER_DETACH_T( BUFFER_ADDR, SIZE, IERROR)
        <type> BUFFER_ADDR(:,:)
        INTEGER  SIZE, IERROR
        EXTERNAL MPI_BUFFER_DETACH
        CALL MPI_BUFFER_DETACH( BUFFER_ADDR, SIZE, IERROR)
        END SUBROUTINE MPI_BUFFER_DETACH_T
!
        SUBROUTINE MPI_IBSEND_T(BUF, COUNT, DATATYPE, DEST, TAG, COMM, &
      &   REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_IBSEND
        CALL MPI_IBSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM,         &
      &   REQUEST, IERROR) 
        END SUBROUTINE MPI_IBSEND_T
!
        SUBROUTINE MPI_IRECV_T(BUF, COUNT, DATATYPE, SOURCE, TAG,      &
      &   COMM, REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, SOURCE, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_IRECV
        CALL MPI_IRECV(BUF, COUNT, DATATYPE, SOURCE, TAG, COMM,        &
      &   REQUEST, IERROR) 
        END SUBROUTINE MPI_IRECV_T
!
        SUBROUTINE MPI_IRSEND_T(BUF, COUNT, DATATYPE, DEST, TAG, COMM, &
      &   REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_IRSEND
        CALL MPI_IRSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM,         &
      &   REQUEST, IERROR) 
        END SUBROUTINE MPI_IRSEND_T
!
        SUBROUTINE MPI_ISEND_T(BUF, COUNT, DATATYPE, DEST, TAG, COMM,  &
      &   REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_ISEND
        CALL MPI_ISEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, &
      &   IERROR) 
        END SUBROUTINE MPI_ISEND_T
!
        SUBROUTINE MPI_ISSEND_T(BUF, COUNT, DATATYPE, DEST, TAG, COMM, &
      &   REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_ISSEND
        CALL MPI_ISSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM,         &
      &   REQUEST, IERROR) 
        END SUBROUTINE MPI_ISSEND_T
!
        SUBROUTINE MPI_RECV_T(BUF, COUNT, DATATYPE, SOURCE, TAG, COMM, &
      &   STATUS, IERROR) 
        USE MPI_CONSTANTS,ONLY: MPI_STATUS_SIZE
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, SOURCE, TAG, COMM,                   &
      &   STATUS(MPI_STATUS_SIZE), IERROR 
        EXTERNAL MPI_RECV
        CALL MPI_RECV(BUF, COUNT, DATATYPE, SOURCE, TAG, COMM, STATUS, &
      &   IERROR) 
        END SUBROUTINE MPI_RECV_T
!
        SUBROUTINE MPI_RECV_INIT_T(BUF, COUNT, DATATYPE, SOURCE, TAG,  &
      &   COMM, REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, SOURCE, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_RECV_INIT
        CALL MPI_RECV_INIT(BUF, COUNT, DATATYPE, SOURCE, TAG, COMM,    &
      &   REQUEST, IERROR) 
        END SUBROUTINE MPI_RECV_INIT_T
!
        SUBROUTINE MPI_RSEND_T(BUF, COUNT, DATATYPE, DEST, TAG, COMM,  &
      &   IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, IERROR
        EXTERNAL MPI_RSEND
        CALL MPI_RSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, IERROR)
        END SUBROUTINE MPI_RSEND_T
!
        SUBROUTINE MPI_RSEND_INIT_T(BUF, COUNT, DATATYPE, DEST, TAG,   &
      &   COMM, REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_RSEND_INIT
        CALL MPI_RSEND_INIT(BUF, COUNT, DATATYPE, DEST, TAG, COMM,     &
      &   REQUEST, IERROR) 
        END SUBROUTINE MPI_RSEND_INIT_T
!
        SUBROUTINE MPI_SEND_T(BUF, COUNT, DATATYPE, DEST, TAG, COMM,   &
      &   IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, IERROR
        EXTERNAL MPI_SEND
        CALL MPI_SEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, IERROR)
        END SUBROUTINE MPI_SEND_T
!
        SUBROUTINE MPI_SENDRECV_REPLACE_T(BUF, COUNT, DATATYPE, DEST,  &
      &   SENDTAG, SOURCE, RECVTAG, COMM, STATUS, IERROR) 
        USE MPI_CONSTANTS,ONLY: MPI_STATUS_SIZE
        <type> BUF(:,:)
        INTEGER COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, &
      &   STATUS(MPI_STATUS_SIZE), IERROR 
        EXTERNAL MPI_SENDRECV_REPLACE
        CALL MPI_SENDRECV_REPLACE(BUF, COUNT, DATATYPE, DEST, SENDTAG, &
      &   SOURCE, RECVTAG, COMM, STATUS, IERROR) 
        END SUBROUTINE MPI_SENDRECV_REPLACE_T
!
        SUBROUTINE MPI_SEND_INIT_T(BUF, COUNT, DATATYPE, DEST, TAG,    &
      &   COMM, REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_SEND_INIT
        CALL MPI_SEND_INIT(BUF, COUNT, DATATYPE, DEST, TAG, COMM,      &
      &   REQUEST, IERROR) 
        END SUBROUTINE MPI_SEND_INIT_T
!
        SUBROUTINE MPI_SSEND_T(BUF, COUNT, DATATYPE, DEST, TAG, COMM,  &
      &   IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, IERROR
        EXTERNAL MPI_SSEND
        CALL MPI_SSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, IERROR)
        END SUBROUTINE MPI_SSEND_T
!
        SUBROUTINE MPI_SSEND_INIT_T(BUF, COUNT, DATATYPE, DEST, TAG,   &
      &   COMM, REQUEST, IERROR) 
        <type> BUF(:,:)
        INTEGER  COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
        EXTERNAL MPI_SSEND_INIT
        CALL MPI_SSEND_INIT(BUF, COUNT, DATATYPE, DEST, TAG, COMM,     &
      &   REQUEST, IERROR) 
        END SUBROUTINE MPI_SSEND_INIT_T
!
        SUBROUTINE MPI_BCAST_T(BUFFER, COUNT, DATATYPE, ROOT, COMM,    &
      &   IERROR) 
        <type> BUFFER(:,:)
        INTEGER COUNT, DATATYPE, ROOT, COMM, IERROR
        EXTERNAL MPI_BCAST
        CALL MPI_BCAST(BUFFER, COUNT, DATATYPE, ROOT, COMM, IERROR)
        END SUBROUTINE MPI_BCAST_T
        END MODULE MPI1__<type>_v2
