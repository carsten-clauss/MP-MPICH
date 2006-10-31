CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C     This file contains all definitions of constants necessary in
C     conjunction with the SMI-library.
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC


C     Shared memory region's physical distribution policy 
      PARAMETER (UNDIVIDED = 0, BLOCKED = 1, CUSTOMIZED = 2)

C     Error codes
      PARAMETER (SMISUCCESS = 0,  SMIERROTHER = 1,  SMIERRNOINIT = 2)
      PARAMETER (SMIERRPARAM = 3, SMIERRBADADR = 4, SMIERRMAPFAILED = 5)
      PARAMETER (SMIERRNODEVICE = 6, SMIERRNOSEGMENT = 7)
      PARAMETER (SMIERRNOMEM = 8)

C     Combination/Replication strategies
      PARAMETER (SINGLESOURCE = 1, LOOPSPLITTING = 2, ADD = 4)
      PARAMETER (NOTHING = 8, EVERYTHING = 16, LOCALANDBEYOND = 32)
      PARAMETER (EVERYLOCAL = 64)							   
      PARAMETER (SPARSE = 256, BAND = 512, ONEPERNODE = 1024)
      PARAMETER (FIXPOINT = 2048, FLOATINGPOINT = 4096)
      PARAMETER (HIGHPRECISION = 8192)

C     Loop Scheduling
      PARAMETER (SMIPARTBLOCKED        = 1)
      PARAMETER (SMIPARTCYCLIC         = 2)
      PARAMETER (SMIPARTADAPTEDBLOCKED = 3)
      PARAMETER (SMIPARTTIMEDBLOCKED   = 4)
      PARAMETER (SMILOOPREADY          = 0)
      PARAMETER (SMILOOPLOCAL          = 1)
      PARAMETER (SMILOOPREMOTE         = 2)
      PARAMETER (SMINOADAPT            = 1)
      PARAMETER (SMIADAPTEXPO          = 2)
      PARAMETER (SMIADAPTLINEAR        = 3)
      PARAMETER (SMIADAPTOPT           = 4)
      PARAMETER (SMIHELPONLYSMP        = -1)
      PARAMETER (SMINOCHANGE           = 0)

C	I/O Redirection
	PARAMETER (SMIIOASIS     = 0)
	PARAMETER (SMIIOFILE     = 1)
