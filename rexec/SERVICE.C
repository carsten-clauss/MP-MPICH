// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
// ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//
// Copyright (C) 1993-1996  Microsoft Corporation.  All Rights Reserved.
//
//  MODULE:   service.c
//
//  PURPOSE:  Implements functions required by all services
//            windows.
//
//  FUNCTIONS:
//    main(int argc, char **argv);
//    service_ctrl(DWORD dwCtrlCode);
//    service_main(DWORD dwArgc, LPTSTR *lpszArgv);
//    CmdInstallService();
//    CmdRemoveService();
//    CmdDebugService(int argc, char **argv);
//    ControlHandler ( DWORD dwCtrlType );
//    GetLastErrorText( LPTSTR lpszBuf, DWORD dwSize );
//
//  COMMENTS:
//
//  AUTHOR: Craig Link - Microsoft Developer Support
//


#include <windows.h> 
#include <winnt.h>
#include <stdio.h>
#include <stdlib.h>
#include <process.h>
#include <tchar.h>

#include "service.h"
#include "messages.h"
#include "helpers.h"

#define SERVICE_CONTROL_RECONFIG 128

extern ULONG MinimumThreads;
extern BOOL Reconfig;
extern BOOL debug_flag;
extern BOOL NoUser;

// internal variables
SERVICE_STATUS          ssStatus;       // current status of the service
SERVICE_STATUS_HANDLE   sshStatusHandle;
DWORD                   dwErr = 0;
BOOL                    bDebug = FALSE;
TCHAR                   szErr[256];

// internal function prototypes
VOID WINAPI service_ctrl(DWORD dwCtrlCode);
VOID WINAPI service_main(DWORD dwArgc, LPTSTR *lpszArgv);
VOID CmdInstallService();
VOID CmdRemoveService();
VOID CmdDebugService(int argc, char **argv);
BOOL WINAPI ControlHandler ( DWORD dwCtrlType );
LPTSTR GetLastErrorText( DWORD error, LPTSTR lpszBuf, DWORD dwSize );

//
//  FUNCTION: main
//
//  PURPOSE: entrypoint for service
//
//  PARAMETERS:
//    argc - number of command line arguments
//    argv - array of command line arguments
//
//  RETURN VALUE:
//    none
//
//  COMMENTS:
//    main() either performs the command line task, or
//    call StartServiceCtrlDispatcher to register the
//    main service thread.  When the this call returns,
//    the service has stopped, so exit.
//


char *makeExceptionMessage(DWORD code,void *address,DWORD *info) {
	static char m[255];

	switch(code) {
	case EXCEPTION_ACCESS_VIOLATION : sprintf(m,"Invalid %s of address 0x%X at 0x%X",(info[0]?"write":"read"),info[1],address); break;
    case EXCEPTION_ARRAY_BOUNDS_EXCEEDED : sprintf(m,"Index out of bounds at 0x%X",address); break;
	case EXCEPTION_BREAKPOINT :	sprintf(m,"Breakpoint at 0x%X",address); break;
	case EXCEPTION_DATATYPE_MISALIGNMENT : sprintf(m,"Datatype misalignement at 0x%X",address); break;
	case EXCEPTION_FLT_DENORMAL_OPERAND : sprintf(m,"Floatingpoint denormal operand at 0x%X",address);break;
	case EXCEPTION_FLT_DIVIDE_BY_ZERO :  sprintf(m,"Floatingpoint division by zero at 0x%X",address); break;
	case EXCEPTION_FLT_INEXACT_RESULT : sprintf(m,"Inexact floatingpoint result at 0x%X",address); break;
	case EXCEPTION_FLT_INVALID_OPERATION : sprintf(m,"Invalid floatingpoint operation at 0x%X",address); break;
	case EXCEPTION_FLT_OVERFLOW : sprintf(m,"Floatingpoint overflow at 0x%X",address);  break;
	case EXCEPTION_FLT_STACK_CHECK : sprintf(m,"Floatingpoint stack over/underflow at 0x%X",address); break;
	case EXCEPTION_FLT_UNDERFLOW : sprintf(m,"Floatingpoint underflow at 0x%X",address); break;
	case EXCEPTION_ILLEGAL_INSTRUCTION : sprintf(m,"Illegal instruction at 0x%X",address); break;
	case EXCEPTION_IN_PAGE_ERROR : sprintf(m,"Invalid page at 0x%X",address); break;
	case EXCEPTION_INT_DIVIDE_BY_ZERO : sprintf(m,"Integer division by zero at 0x%X",address); break;
	case EXCEPTION_INT_OVERFLOW : sprintf(m,"Integer overflow at 0x%X",address); break;
 	case EXCEPTION_INVALID_DISPOSITION : sprintf(m,"Invalid disposition at 0x%X (How did you do that ???) ",address); break;
 	case EXCEPTION_NONCONTINUABLE_EXCEPTION : sprintf(m,"noncontinuable exception at 0x%X",address); break;
	case EXCEPTION_PRIV_INSTRUCTION : sprintf(m,"Privileged instruction at 0x%X",address); break;
	case EXCEPTION_SINGLE_STEP : sprintf(m,"Single step at 0x%X",address); break;
	case EXCEPTION_STACK_OVERFLOW : sprintf(m,"Stack overflow at 0x%X",address); break;
	default: sprintf(m,"Unknown exception 0x%X at 0x%X",code,address); break;
	}

	return m;
}

LONG GlobalExceptionFilter(PEXCEPTION_POINTERS ExceptionInfo) {
	EXCEPTION_RECORD *ExRec=ExceptionInfo->ExceptionRecord;
	AddToMessageLog(IDM_EXCEPTION,ERROR_SUCCESS,makeExceptionMessage(ExRec->ExceptionCode,
		        ExRec->ExceptionAddress,ExRec->ExceptionInformation));
	
	
	//ExitThread(1);
	return EXCEPTION_CONTINUE_SEARCH;
}

 
int __cdecl main(int argc, char **argv)
{
    SERVICE_TABLE_ENTRY dispatchTable[] =
    {
        { TEXT(SZSERVICENAME), (LPSERVICE_MAIN_FUNCTION)service_main },
        { NULL, NULL }
    };

    if ( (argc > 1) &&
         ((*argv[1] == '-') || (*argv[1] == '/')) )
    {
        if ( _stricmp( "install", argv[1]+1 ) == 0 )
        {
            CmdInstallService();
        }
        else if ( _stricmp( "uninstall", argv[1]+1 ) == 0 )
        {
            CmdRemoveService();
        }
        else if ( _stricmp( "debug", argv[1]+1 ) == 0 )
        {
            bDebug = TRUE;
            CmdDebugService(argc, argv);
        }
	else if ( _stricmp( "update", argv[1]+1 ) == 0 )
	{
	    char message[255];
	    if(argc<3) {
		fprintf(stderr,"Update must be called with filename parameter\n");
		return 1;
	    }
	    GetLastErrorText(UpdateService(argv[2]),message,255);
	    printf("%s\n",message);
	    fflush(stdout);
	    return 0;
	}
        else
        {
            goto dispatch;
        }
        exit(0);
    }

    // if it doesn't match any of the above parameters
    // the service control manager may be starting the service
    // so we must call StartServiceCtrlDispatcher
    dispatch:
        // this is just to be friendly
        printf( "%s -install          to install the service\n", SZAPPNAME );
        printf( "%s -uninstall        to remove the service\n", SZAPPNAME );
        printf( "%s -debug <params>   to run as a console app for debugging\n", SZAPPNAME );
	printf( "%s -update <filename>   to update the server\n", SZAPPNAME );
        printf( "\nStartServiceCtrlDispatcher being called.\n" );
        printf( "This may take several seconds.  Please wait.\n" );
	fflush(stdout);
        if (!StartServiceCtrlDispatcher(dispatchTable))
            AddToMessageLog(IDM_DISPATCHER,GetLastError(),0);
	return 0;
}



//
//  FUNCTION: service_main
//
//  PURPOSE: To perform actual initialization of the service
//
//  PARAMETERS:
//    dwArgc   - number of command line arguments
//    lpszArgv - array of command line arguments
//
//  RETURN VALUE:
//    none
//
//  COMMENTS:
//    This routine performs the service initialization and then calls
//    the user defined ServiceStart() routine to perform majority
//    of the work.
//
void WINAPI service_main(DWORD dwArgc, LPTSTR *lpszArgv)
{

    // register our service control handler:
    //
    sshStatusHandle = RegisterServiceCtrlHandler( TEXT(SZSERVICENAME), service_ctrl);

    if (!sshStatusHandle)
        goto cleanup;

    // SERVICE_STATUS members that don't change in example
    //
    ssStatus.dwServiceType = SERVICE_WIN32_OWN_PROCESS;
    ssStatus.dwServiceSpecificExitCode = 0;


    // report the status to the service control manager.
    //
    if (!ReportStatusToSCMgr(
        SERVICE_START_PENDING, // service state
        NO_ERROR,              // exit code
        3000))                 // wait hint
        goto cleanup;


    ServiceStart( dwArgc, lpszArgv );

cleanup:

    // try to report the stopped status to the service control manager.
    //
    if (sshStatusHandle)
        (VOID)ReportStatusToSCMgr(
                            SERVICE_STOPPED,
                            dwErr,
                            0);
    CloseLogFile();

    return;
}



//
//  FUNCTION: service_ctrl
//
//  PURPOSE: This function is called by the SCM whenever
//           ControlService() is called on this service.
//
//  PARAMETERS:
//    dwCtrlCode - type of control requested
//
//  RETURN VALUE:
//    none
//
//  COMMENTS:
//
VOID WINAPI service_ctrl(DWORD dwCtrlCode)
{
    // Handle the requested control code.
    //
    switch(dwCtrlCode)
    {
        // Stop the service.
        //
        case SERVICE_CONTROL_STOP:
	case SERVICE_CONTROL_SHUTDOWN:
            ReportStatusToSCMgr(SERVICE_STOP_PENDING, NO_ERROR, 3000);
	    Reconfig = FALSE;
	    ReportStatusToSCMgr(SERVICE_PAUSED, NO_ERROR, 3000);
            ServiceStop();
            return;
	case SERVICE_CONTROL_RECONFIG:
		// this is a code sent by the control applet
	    Reconfig = TRUE;
	    ReportStatusToSCMgr(SERVICE_PAUSED, NO_ERROR, 3000);
            ServiceStop();
            return;
        case SERVICE_CONTROL_INTERROGATE:
            break;

        // invalid control code
        //
        default:
            break;

    }

    ReportStatusToSCMgr(ssStatus.dwCurrentState, NO_ERROR, 0);

}



//
//  FUNCTION: ReportStatusToSCMgr()
//
//  PURPOSE: Sets the current status of the service and
//           reports it to the Service Control Manager
//
//  PARAMETERS:
//    dwCurrentState - the state of the service
//    dwWin32ExitCode - error code to report
//    dwWaitHint - worst case estimate to next checkpoint
//
//  RETURN VALUE:
//    TRUE  - success
//    FALSE - failure
//
//  COMMENTS:
//
BOOL ReportStatusToSCMgr(DWORD dwCurrentState,
                         DWORD dwWin32ExitCode,
                         DWORD dwWaitHint)
{
    static DWORD dwCheckPoint = 1;
    BOOL fResult = TRUE;


    if ( !bDebug ) // when debugging we don't report to the SCM
    {
        if (dwCurrentState == SERVICE_START_PENDING || 
	    dwCurrentState == SERVICE_STOP_PENDING ||
	    dwCurrentState == SERVICE_PAUSED	    
	    )
            ssStatus.dwControlsAccepted = 0;
        else
            ssStatus.dwControlsAccepted = SERVICE_ACCEPT_STOP|SERVICE_ACCEPT_SHUTDOWN;

        ssStatus.dwCurrentState = dwCurrentState;
        ssStatus.dwWin32ExitCode = dwWin32ExitCode;
        ssStatus.dwWaitHint = dwWaitHint;

        if ( ( dwCurrentState == SERVICE_RUNNING ) ||
             ( dwCurrentState == SERVICE_STOPPED ) )
            ssStatus.dwCheckPoint = 0;
        else
            ssStatus.dwCheckPoint = dwCheckPoint++;


        // Report the status of the service to the service control manager.
        //
        if (!(fResult = SetServiceStatus( sshStatusHandle, &ssStatus))) {
            AddToMessageLog(IDM_STATUS,GetLastError(),0);
        }
    }
    return fResult;
}



//
//  FUNCTION: AddToMessageLog(LPTSTR lpszMsg)
//
//  PURPOSE: Allows any thread to log an error message
//
//  PARAMETERS:
//    lpszMsg - text for message
//
//  RETURN VALUE:
//    none
//
//  COMMENTS:
//
VOID AddToMessageLog(DWORD ID,DWORD error,const LPTSTR lpszMsg)
{
    TCHAR   szMsg[256]="";
    HANDLE  hEventSource;
    LPTSTR  lpszStrings[2] = {0,0};
    WORD	type;
    WORD	n=0;
    TOKEN_USER *pTokenUser;
    DWORD dummy;
    PSID    pSid = 0;
    
    if ( !bDebug )
    {
	
	pTokenUser=GetActualUserToken(&dummy);
	if(pTokenUser) {
	    pSid = pTokenUser->User.Sid;
	    if(!IsValidSid(pSid)) {   
            pSid = NULL; 
	        free(pTokenUser);  
            pTokenUser = NULL;//effect : Remote execution more than once possible            
        }
    }else pSid = NULL;

        dwErr = error;
	type = (WORD)(ID >> 30);
	switch (type) {
	case 0: type = EVENTLOG_SUCCESS; break;
	case 1: type = EVENTLOG_INFORMATION_TYPE; break;
	case 2: type = EVENTLOG_WARNING_TYPE; break;
	case 3: type = EVENTLOG_ERROR_TYPE; break;
	}
	 
	if(error != ERROR_SUCCESS) {
	    GetLastErrorText( error,szMsg, 256 );
	    lpszStrings[n++] = szMsg;
	}
	
	if(lpszMsg) lpszStrings[n++]=lpszMsg;

        // Use event logging to log the error.
        //
        hEventSource = RegisterEventSource(NULL, TEXT(SZSERVICENAME));
	
	if(debug_flag) {
	    LogLogMessage(ID,pSid,n,lpszStrings);
	}

        if (hEventSource != NULL) {
            ReportEvent(hEventSource, // handle of event source
                type,				  // event type
                0,                    // event category
                ID,					  // event ID
                pSid,                 // current user's SID
                n,                    // strings in lpszStrings
                0,                    // no bytes of raw data
                lpszStrings,          // array of error strings
                NULL);                // no raw data
	    
            (VOID) DeregisterEventSource(hEventSource);
        }
    } else fprintf(stderr,"%s\n",lpszMsg);
    if(pSid) free(pTokenUser);
}


int AddLogSource(char *path) {
	HKEY hk; 
	DWORD dwData; 
	
	/* 
	* Add your source name as a subkey under the Application 
	* key in the EventLog service portion of the registry. 
	*/ 
	
	if (RegCreateKey(HKEY_LOCAL_MACHINE, 
		"SYSTEM\\CurrentControlSet\\Services\\EventLog\\Application\\rcluma", 
		&hk)) {
		fprintf(stderr,"Could not create registry key for log source\n");
		return 1;
	}
	
	/* Set the Event ID message-file name. */ 
	
	//sprintf((char*)szBuf, "%s\\%s.exe",path,SZAPPNAME); 
	
	/* Add the Event ID message-file name to the subkey. */ 
	
	if (RegSetValueEx(hk,             /* subkey handle         */ 
        "EventMessageFile",       /* value name            */ 
        0,                        /* must be zero          */ 
        REG_EXPAND_SZ,            /* value type            */ 
        (LPBYTE) path,           /* address of value data */ 
        strlen(path) + 1))       /* length of value data  */ 
	{ 
		fprintf(stderr,"Could not set event message file\n");
		RegCloseKey(hk); 
		return 1;
	}
		
	
	/* Set the supported types flags. */ 
	
	dwData = EVENTLOG_ERROR_TYPE | EVENTLOG_WARNING_TYPE | 
		EVENTLOG_INFORMATION_TYPE; 
	
	if (RegSetValueEx(hk,      /* subkey handle                */ 
        "TypesSupported",  /* value name                   */ 
        0,                 /* must be zero                 */ 
        REG_DWORD,         /* value type                   */ 
        (LPBYTE) &dwData,  /* address of value data        */ 
        sizeof(DWORD)))    /* length of value data         */ 
	{
		fprintf(stderr,"could not set supported types\n");
		RegCloseKey(hk); 
		return 1;
	}

	RegCloseKey(hk); 
	return 0;
}

int RemoveLogSource() {
	if (RegDeleteKey(HKEY_LOCAL_MACHINE, 
		"SYSTEM\\CurrentControlSet\\Services\\EventLog\\Application\\rcluma")) {
		fprintf(stderr,"Could not delete registry key\n");
		return 1;
	}
	return 0;
}

///////////////////////////////////////////////////////////////////
//
//  The following code handles service installation and removal
//


//
//  FUNCTION: CmdInstallService()
//
//  PURPOSE: Installs the service
//
//  PARAMETERS:
//    none
//
//  RETURN VALUE:
//    none
//
//  COMMENTS:
//
void CmdInstallService()
{
    SC_HANDLE   schService;
    SC_HANDLE   schSCManager;

    TCHAR szPath[512];

    if ( GetModuleFileName( NULL, szPath, 512 ) == 0 )
    {
        _tprintf(TEXT("Unable to install %s - %s\n"), TEXT(SZSERVICEDISPLAYNAME), 
			GetLastErrorText(GetLastError(),szErr, 256));
        return;
    }

    schSCManager = OpenSCManager(
                        NULL,                   // machine (NULL == local)
                        NULL,                   // database (NULL == default)
                        SC_MANAGER_ALL_ACCESS   // access required
                        );
    if ( schSCManager )
    {
        schService = CreateService(
            schSCManager,               // SCManager database
            TEXT(SZSERVICENAME),        // name of service
            TEXT(SZSERVICEDISPLAYNAME), // name to display
            SERVICE_ALL_ACCESS,         // desired access
            SERVICE_WIN32_OWN_PROCESS,  // service type
            SERVICE_AUTO_START,         // start type
            SERVICE_ERROR_NORMAL,       // error control type
            szPath,                     // service's binary
            NULL,                       // no load ordering group
            NULL,                       // no tag identifier
            TEXT(SZDEPENDENCIES),       // dependencies
            NULL,                       // LocalSystem account
            NULL);                      // no password

        if ( schService )
        {
            _tprintf(TEXT("%s installed.\n"), TEXT(SZSERVICEDISPLAYNAME) );
            CloseServiceHandle(schService);
			AddLogSource(szPath);
        }
        else
        {
            _tprintf(TEXT("CreateService failed - %s\n"), GetLastErrorText(GetLastError(), szErr, 256));
        }

        CloseServiceHandle(schSCManager);
    }
    else
        _tprintf(TEXT("OpenSCManager failed - %s\n"), GetLastErrorText(GetLastError(), szErr,256));
}



//
//  FUNCTION: CmdRemoveService()
//
//  PURPOSE: Stops and removes the service
//
//  PARAMETERS:
//    none
//
//  RETURN VALUE:
//    none
//
//  COMMENTS:
//
void CmdRemoveService()
{
    SC_HANDLE   schService;
    SC_HANDLE   schSCManager;

    schSCManager = OpenSCManager(
                        NULL,                   // machine (NULL == local)
                        NULL,                   // database (NULL == default)
                        SC_MANAGER_ALL_ACCESS   // access required
                        );
    if ( schSCManager )
    {
        schService = OpenService(schSCManager, TEXT(SZSERVICENAME), SERVICE_ALL_ACCESS);

        if (schService)
        {
            // try to stop the service
            if ( ControlService( schService, SERVICE_CONTROL_STOP, &ssStatus ) )
            {
                _tprintf(TEXT("Stopping %s."), TEXT(SZSERVICEDISPLAYNAME));
                Sleep( 1000 );

                while( QueryServiceStatus( schService, &ssStatus ) )
                {
                    if ( ssStatus.dwCurrentState == SERVICE_STOP_PENDING )
                    {
                        _tprintf(TEXT("."));
                        Sleep( 1000 );
                    }
                    else
                        break;
                }

                if ( ssStatus.dwCurrentState == SERVICE_STOPPED )
                    _tprintf(TEXT("\n%s stopped.\n"), TEXT(SZSERVICEDISPLAYNAME) );
                else
                    _tprintf(TEXT("\n%s failed to stop.\n"), TEXT(SZSERVICEDISPLAYNAME) );

            }

            // now remove the service
            if( DeleteService(schService) )
                _tprintf(TEXT("%s removed.\n"), TEXT(SZSERVICEDISPLAYNAME) );
            else
                _tprintf(TEXT("DeleteService failed - %s\n"), GetLastErrorText(GetLastError(), szErr,256));


			RemoveLogSource();
            CloseServiceHandle(schService);
        }
        else
            _tprintf(TEXT("OpenService failed - %s\n"), GetLastErrorText(GetLastError(), szErr,256));

        CloseServiceHandle(schSCManager);
    }
    else
        _tprintf(TEXT("OpenSCManager failed - %s\n"), GetLastErrorText(GetLastError(), szErr,256));
}




///////////////////////////////////////////////////////////////////
//
//  The following code is for running the service as a console app
//


//
//  FUNCTION: CmdDebugService(int argc, char ** argv)
//
//  PURPOSE: Runs the service as a console application
//
//  PARAMETERS:
//    argc - number of command line arguments
//    argv - array of command line arguments
//
//  RETURN VALUE:
//    none
//
//  COMMENTS:
//
void CmdDebugService(int argc, char ** argv)
{
    DWORD dwArgc;
    LPTSTR *lpszArgv;

#ifdef UNICODE
    lpszArgv = CommandLineToArgvW(GetCommandLineW(), &(dwArgc) );
#else
    dwArgc   = (DWORD) argc;
    lpszArgv = argv;
#endif

    _tprintf(TEXT("Debugging %s.\n"), TEXT(SZSERVICEDISPLAYNAME));

    SetConsoleCtrlHandler( ControlHandler, TRUE );

    ServiceStart( dwArgc, lpszArgv );
}


//
//  FUNCTION: ControlHandler ( DWORD dwCtrlType )
//
//  PURPOSE: Handled console control events
//
//  PARAMETERS:
//    dwCtrlType - type of control event
//
//  RETURN VALUE:
//    True - handled
//    False - unhandled
//
//  COMMENTS:
//
BOOL WINAPI ControlHandler ( DWORD dwCtrlType )
{
    switch( dwCtrlType )
    {
        case CTRL_BREAK_EVENT:  // use Ctrl+C or Ctrl+Break to simulate
        case CTRL_C_EVENT:      // SERVICE_CONTROL_STOP in debug mode
            _tprintf(TEXT("Stopping %s.\n"), TEXT(SZSERVICEDISPLAYNAME));
            ServiceStop();
            return TRUE;
            break;

    }
    return FALSE;
}

//
//  FUNCTION: GetLastErrorText
//
//  PURPOSE: copies error message text to string
//
//  PARAMETERS:
//    lpszBuf - destination buffer
//    dwSize - size of buffer
//
//  RETURN VALUE:
//    destination buffer
//
//  COMMENTS:
//
LPTSTR GetLastErrorText( DWORD error,LPTSTR lpszBuf, DWORD dwSize )
{
    DWORD dwRet;
    LPTSTR lpszTemp = NULL;

    dwRet = FormatMessage( FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM |FORMAT_MESSAGE_ARGUMENT_ARRAY,
                           NULL,
                           error,
                           MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                           (LPTSTR)&lpszTemp,
                           0,
                           NULL );

    // supplied buffer is not long enough
    if ( !dwRet || ( (long)dwSize < (long)dwRet+14 ) ) {
        if(dwSize) _stprintf( lpszBuf, TEXT("%d"),error );
    } else
    {
        lpszTemp[lstrlen(lpszTemp)-2] = TEXT('\0');  //remove cr and newline character
        _stprintf( lpszBuf, TEXT("%s (%d)"), lpszTemp, error );
    }

    if ( lpszTemp )
        LocalFree((HLOCAL) lpszTemp );

    return lpszBuf;
}
