# Microsoft Developer Studio Project File - Name="cpistatic" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** NICHT BEARBEITEN **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=cpistatic - Win32 Debug
!MESSAGE Dies ist kein g�ltiges Makefile. Zum Erstellen dieses Projekts mit NMAKE
!MESSAGE verwenden Sie den Befehl "Makefile exportieren" und f�hren Sie den Befehl
!MESSAGE 
!MESSAGE NMAKE /f "cpistatic.mak".
!MESSAGE 
!MESSAGE Sie k�nnen beim Ausf�hren von NMAKE eine Konfiguration angeben
!MESSAGE durch Definieren des Makros CFG in der Befehlszeile. Zum Beispiel:
!MESSAGE 
!MESSAGE NMAKE /f "cpistatic.mak" CFG="cpistatic - Win32 Debug"
!MESSAGE 
!MESSAGE F�r die Konfiguration stehen zur Auswahl:
!MESSAGE 
!MESSAGE "cpistatic - Win32 Release" (basierend auf  "Win32 (x86) Console Application")
!MESSAGE "cpistatic - Win32 Debug" (basierend auf  "Win32 (x86) Console Application")
!MESSAGE "cpistatic - Win32 trace" (basierend auf  "Win32 (x86) Console Application")
!MESSAGE "cpistatic - Win32 log" (basierend auf  "Win32 (x86) Console Application")
!MESSAGE "cpistatic - Win32 anim" (basierend auf  "Win32 (x86) Console Application")
!MESSAGE "cpistatic - Win32 meta" (basierend auf  "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "cpistatic - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /GX /O2 /I "$(MPI_ROOT)\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(MPI_ROOT)\lib"

!ELSEIF  "$(CFG)" == "cpistatic - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "cpistatic___Win32_Debug"
# PROP BASE Intermediate_Dir "cpistatic___Win32_Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /G6 /Gm /GX /ZI /Od /I "$(MPI_ROOT)\include" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /FR /YX /FD /GZ /c
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept /libpath:"$(MPI_ROOT)\lib"

!ELSEIF  "$(CFG)" == "cpistatic - Win32 trace"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "cpistatic___Win32_trace"
# PROP BASE Intermediate_Dir "cpistatic___Win32_trace"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "trace"
# PROP Intermediate_Dir "trace"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /GX /O2 /I "$(MPI_ROOT)\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /GX /O2 /I "$(MPI_ROOT)\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /FR /YX /FD /c
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(MPI_ROOT)\lib"
# ADD LINK32 tmpi.lib mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(MPI_ROOT)\lib"

!ELSEIF  "$(CFG)" == "cpistatic - Win32 log"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "cpistatic___Win32_log"
# PROP BASE Intermediate_Dir "cpistatic___Win32_log"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "log"
# PROP Intermediate_Dir "log"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /GX /O2 /I "$(MPI_ROOT)\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /GX /O2 /I "$(MPI_ROOT)\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(MPI_ROOT)\lib"
# ADD LINK32 lmpi.lib mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(MPI_ROOT)\lib"

!ELSEIF  "$(CFG)" == "cpistatic - Win32 anim"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "cpistatic___Win32_anim"
# PROP BASE Intermediate_Dir "cpistatic___Win32_anim"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "anim"
# PROP Intermediate_Dir "anim"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /GX /O2 /I "$(MPI_ROOT)\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /GX /O2 /I "$(MPI_ROOT)\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(MPI_ROOT)\lib"
# ADD LINK32 ampi.lib mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(MPI_ROOT)\lib"

!ELSEIF  "$(CFG)" == "cpistatic - Win32 meta"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "cpistatic___Win32_meta"
# PROP BASE Intermediate_Dir "cpistatic___Win32_meta"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "cpistatic___Win32_meta"
# PROP Intermediate_Dir "cpistatic___Win32_meta"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /GX /O2 /I "$(MPI_ROOT)\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /GX /O2 /I "$(MPI_ROOT)\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(MPI_ROOT)\lib"
# ADD LINK32 mpichstatic.lib rpcrt4.lib Iphlpapi.lib ws2_32.lib kernel32.lib user32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(MPI_ROOT)\lib"

!ENDIF 

# Begin Target

# Name "cpistatic - Win32 Release"
# Name "cpistatic - Win32 Debug"
# Name "cpistatic - Win32 trace"
# Name "cpistatic - Win32 log"
# Name "cpistatic - Win32 anim"
# Name "cpistatic - Win32 meta"
# Begin Group "Quellcodedateien"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\cpi.c
# End Source File
# End Group
# End Target
# End Project