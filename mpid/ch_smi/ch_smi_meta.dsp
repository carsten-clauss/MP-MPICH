# Microsoft Developer Studio Project File - Name="ch_smi_meta" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** NICHT BEARBEITEN **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=ch_smi_meta - Win32 Debug
!MESSAGE Dies ist kein g�ltiges Makefile. Zum Erstellen dieses Projekts mit NMAKE
!MESSAGE verwenden Sie den Befehl "Makefile exportieren" und f�hren Sie den Befehl
!MESSAGE 
!MESSAGE NMAKE /f "ch_smi_meta.mak".
!MESSAGE 
!MESSAGE Sie k�nnen beim Ausf�hren von NMAKE eine Konfiguration angeben
!MESSAGE durch Definieren des Makros CFG in der Befehlszeile. Zum Beispiel:
!MESSAGE 
!MESSAGE NMAKE /f "ch_smi_meta.mak" CFG="ch_smi_meta - Win32 Debug"
!MESSAGE 
!MESSAGE F�r die Konfiguration stehen zur Auswahl:
!MESSAGE 
!MESSAGE "ch_smi_meta - Win32 Release" (basierend auf  "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ch_smi_meta - Win32 Debug" (basierend auf  "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "ch_smi_meta - Win32 Release"

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
LIB32=link.exe
# ADD BASE LIB32 /dll kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib
# ADD LIB32 /dll kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib
F90=df.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CH_SMI_EXPORTS" /YX /FD /c
# ADD CPP /nologo /MD /GX /Ox /Ot /Og /Gf /Gy /I "..\lfbs_common" /I ".\\" /I "..\..\include" /I "..\ch2" /I "..\util" /I "..\..\mpi-2-c++\src" /I "..\..\unix2nt" /D "META" /D "YYDEBUG" /D "NDEBUG" /D "MPID_DEBUG_NONE" /D "IN_MPICH_DLL" /D "_WINDOWS" /D "HAS_VOLATILE" /D "RNDV_STATIC" /D "SINGLECOPY" /D "_MBCS" /D "USE_STDARG" /D "WIN32_LEAN_AND_MEAN" /D "WIN32" /Fr /YX /FD /c
# SUBTRACT CPP /Os
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "SMI"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 ws2_32.lib smidll.lib kernel32.lib user32.lib rpcrt4.lib advapi32.lib /nologo /subsystem:console /dll /machine:I386 /nodefaultlib:"libc.lib" /nodefaultlib:"libcd.lib" /out:"..\..\lib\mpich.dll" /libpath:"$(SMIDIR)\lib" /libpath:"$(DOLPHIN_BASE)\lib" /link50compat
# SUBTRACT LINK32 /pdb:none /debug
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copy Release\mpich.lib ..\..\lib
# End Special Build Tool

!ELSEIF  "$(CFG)" == "ch_smi_meta - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
LIB32=link.exe
# ADD BASE LIB32 /dll kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib
# ADD LIB32 /dll kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib
F90=df.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CH_SMI_EXPORTS" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /GX /Z7 /Od /Gf /Gy /I "..\lfbs_common" /I ".\\" /I "..\..\include" /I "..\ch2" /I "..\util" /I "..\..\mpi-2-c++\src" /I "..\..\unix2nt" /D "META" /D "_DEBUG" /D "MPID_DEBUG_ALL" /D "_USRDLL" /D "MPID_STATISTICS" /D "YYDEBUG" /D "IN_MPICH_DLL" /D "_WINDOWS" /D "HAS_VOLATILE" /D "RNDV_STATIC" /D "SINGLECOPY" /D "_MBCS" /D "USE_STDARG" /D "WIN32_LEAN_AND_MEAN" /D "WIN32" /Fr /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ws2_32.lib smidll.lib sisci_api.lib kernel32.lib user32.lib rpcrt4.lib advapi32.lib /nologo /subsystem:console /dll /incremental:no /debug /debugtype:both /machine:I386 /nodefaultlib:"libc.lib" /nodefaultlib:"libcd.lib" /nodefaultlib:"libcmt.lib" /out:"..\..\lib\mpich.dll" /pdbtype:sept /libpath:"$(SMIDIR)\lib" /libpath:"$(DOLPHIN_BASE)\lib" /link50compat
# SUBTRACT LINK32 /pdb:none
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copy Debug\mpich.lib ..\..\lib
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "ch_smi_meta - Win32 Release"
# Name "ch_smi_meta - Win32 Debug"
# Begin Group "Ressourcendateien"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=..\ch_wsock2\Skript1.rc

!IF  "$(CFG)" == "ch_smi_meta - Win32 Release"

!ELSEIF  "$(CFG)" == "ch_smi_meta - Win32 Debug"

# ADD BASE RSC /l 0x407 /i "\home\martin\src\mp-mpich\mpid\ch_wsock2" /i "\home\users\karsten\c++\mp-mpich\mpid\ch_wsock2" /i "\home\users\karsten\c++\mp-mpich-1.2.0\MPID\ch_wsock2" /i "\home\users\karsten\c++\mp-mpich\MPID\ch_wsock2"
# ADD RSC /l 0x409 /i "\home\martin\src\mp-mpich\mpid\ch_wsock2" /i "\home\users\karsten\c++\mp-mpich\mpid\ch_wsock2" /i "\home\users\karsten\c++\mp-mpich-1.2.0\MPID\ch_wsock2" /i "\home\users\karsten\c++\mp-mpich\MPID\ch_wsock2" /d "SMI"

!ENDIF 

# End Source File
# End Group
# Begin Group "src"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\..\src\env\abort.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\accumulate.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\address.c
# End Source File
# Begin Source File

SOURCE=..\ch2\adi2config.h
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\allgather.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\allgatherv.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\allocmem.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\allreduce.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\alltoall.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\alltoallv.c
# End Source File
# Begin Source File

SOURCE=..\ch2\attach.h
# End Source File
# Begin Source File

SOURCE=..\..\include\attr.h
# End Source File
# Begin Source File

SOURCE=..\..\src\context\attr_delval.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\attr_getval.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\attr_putval.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\attr_util.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\barrier.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\bcast.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\bsend.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\bsend_init.c
# End Source File
# Begin Source File

SOURCE=..\..\src\util\bsendutil2.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\bufattach.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\buffree.c
# End Source File
# Begin Source File

SOURCE=..\ch2\calltrace.h
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\cancel.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\cart_coords.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\cart_create.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\cart_get.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\cart_map.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\cart_rank.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\cart_shift.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\cart_sub.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\cartdim_get.c
# End Source File
# Begin Source File

SOURCE=..\ch2\chhetero.h
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\coll.h
# End Source File
# Begin Source File

SOURCE=..\ch2\comm.h
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_create.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_dup.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_free.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_group.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_name_get.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_name_put.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_rank.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_rgroup.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_rsize.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_size.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_split.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_testic.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\comm_util.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\commcompare.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\commreq_free.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\context_util.c
# End Source File
# Begin Source File

SOURCE=..\ch2\cookie.h
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\create_recv.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\create_send.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\darray.c
# End Source File
# Begin Source File

SOURCE=..\util\dataqueue.c
# End Source File
# Begin Source File

SOURCE=..\util\dataqueue.h
# End Source File
# Begin Source File

SOURCE=..\ch2\datatype.h
# End Source File
# Begin Source File

SOURCE=..\..\src\env\debugutil.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\dims_create.c
# End Source File
# Begin Source File

SOURCE=..\..\src\dmpi\dmpipk.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\dup_fn.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\errclass.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\errcreate.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\errfree.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\errget.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\errhandler.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\errorstring.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\errset.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\fence.c
# End Source File
# Begin Source File

SOURCE=..\util\fifo.c
# End Source File
# Begin Source File

SOURCE=..\util\fifo.h
# End Source File
# Begin Source File

SOURCE=..\..\src\env\finalize.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\finalized.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\freemem.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\fstrutils.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\gather.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\gatherv.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\get.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\getattr.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\getcount.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\getelements.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\getgrp.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\getpname.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\getversion.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\global_ops.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\graph_get.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\graph_map.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\graph_nbr.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\graphcreate.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\graphdimsget.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\graphnbrcnt.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_diff.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_excl.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_free.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_incl.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_inter.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_rank.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_rexcl.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_rincl.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_size.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_tranks.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_union.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\group_util.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\groupcompare.c
# End Source File
# Begin Source File

SOURCE=..\util\hash.c
# End Source File
# Begin Source File

SOURCE=..\util\hash.h
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\ibsend.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\ic.h
# End Source File
# Begin Source File

SOURCE=..\..\src\context\ic_create.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\ic_merge.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_c2f.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_create.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_delete.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_dup.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_f2c.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_free.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_get.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_getnks.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_getnth.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_getvln.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\info_set.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\init.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\initdte.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\initialize.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\initthread.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\initutil.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\inter_fns.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\intra_fns.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\intra_scan.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\iprobe.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\irecv.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\irsend.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\isend.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\issend.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\keyval_free.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\keyvalcreate.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\mmx_ops.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\mperror.c
# End Source File
# Begin Source File

SOURCE=..\..\include\mpi.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mpi_errno.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mpi_error.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mpicoll.h
# End Source File
# Begin Source File

SOURCE=..\ch2\mpid.h
# End Source File
# Begin Source File

SOURCE=..\ch2\mpid_bind.h
# End Source File
# Begin Source File

SOURCE=..\ch2\mpid_time.h
# End Source File
# Begin Source File

SOURCE=..\..\INCLUDE\MPIDEFS.H
# End Source File
# Begin Source File

SOURCE=..\..\include\mpidmpi.h
# End Source File
# Begin Source File

SOURCE=..\..\src\env\mpierrstrings.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mpifort.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mpiimpl.h
# End Source File
# Begin Source File

SOURCE=.\mpimem.h
# End Source File
# Begin Source File

SOURCE=..\..\include\MPIO.H
# End Source File
# Begin Source File

SOURCE=..\..\include\mpiops.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mpiprof.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mpipt2pt.h
# End Source File
# Begin Source File

SOURCE=..\..\src\util\mpirutil.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\mpitopo.h
# End Source File
# Begin Source File

SOURCE=..\..\src\env\msgqdllloc.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\nerrmsg.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\null_copyfn.c
# End Source File
# Begin Source File

SOURCE=..\..\src\context\null_del_fn.c
# End Source File
# Begin Source File

SOURCE=..\ch2\objtrace.h
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\opcreate.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\opfree.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\oputil.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\pack.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\pack_size.c
# End Source File
# Begin Source File

SOURCE=..\..\include\patchlevel.h
# End Source File
# Begin Source File

SOURCE=..\..\src\profile\pcontrol.c
# End Source File
# Begin Source File

SOURCE=..\..\src\dmpi\pkutil.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\probe.c
# End Source File
# Begin Source File

SOURCE=..\..\src\util\ptrcvt.c
# End Source File
# Begin Source File

SOURCE=..\..\include\ptrcvt.h
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\put.c
# End Source File
# Begin Source File

SOURCE=..\util\queue.c
# End Source File
# Begin Source File

SOURCE=..\util\queue.h
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\recv.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\red_scat.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\reduce.c
# End Source File
# Begin Source File

SOURCE=..\ch2\req.h
# End Source File
# Begin Source File

SOURCE=..\ch2\reqalloc.h
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\requestc2f.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\rsend.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\rsend_init.c
# End Source File
# Begin Source File

SOURCE=..\..\include\sbcnst.h
# End Source File
# Begin Source File

SOURCE=..\util\sbcnst2.h
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\scan.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\scatter.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\scatterv.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\send.c
# End Source File
# Begin Source File

SOURCE=..\..\include\sendq.h
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\sendrecv.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\sendrecv_rep.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\sendutil.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\sse_ops.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\ssend.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\ssend_init.c
# End Source File
# Begin Source File

SOURCE=..\util\stack.c
# End Source File
# Begin Source File

SOURCE=..\util\stack.h
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\start.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\startall.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\statusc2f.c
# End Source File
# Begin Source File

SOURCE=..\..\src\external\statuscancel.c
# End Source File
# Begin Source File

SOURCE=..\..\src\external\statuselm.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\statusf2c.c
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\subarray.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\test.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\testall.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\testany.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\testcancel.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\testsome.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\topo_test.c
# End Source File
# Begin Source File

SOURCE=..\..\src\topol\topo_util.c
# End Source File
# Begin Source File

SOURCE=..\util\tr2.h
# End Source File
# Begin Source File

SOURCE=..\..\src\misc2\type_blkind.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_commit.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_contig.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_extent.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_ff.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_ff.h
# End Source File
# Begin Source File

SOURCE=..\..\src\external\type_flatten.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_free.c
# End Source File
# Begin Source File

SOURCE=..\..\src\external\type_get_cont.c
# End Source File
# Begin Source File

SOURCE=..\..\src\external\type_get_env.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_hind.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_hvec.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_ind.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_lb.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_size.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_struct.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_ub.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_util.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_vec.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\unpack.c
# End Source File
# Begin Source File

SOURCE=..\..\src\util\util_hbt.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\wait.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\waitall.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\waitany.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\waitsome.c
# End Source File
# Begin Source File

SOURCE=.\wc_memcpy_win32.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\wincomplete.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\wincreate.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\winfree.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\winlock.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\winpost.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\winstart.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\wintest.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\winunlock.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\winwait.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\wtick.c
# End Source File
# Begin Source File

SOURCE=..\..\src\env\wtime.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\x86_ops.c
# End Source File
# End Group
# Begin Group "Routing"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\..\src\routing\atm_connection.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\atm_connection.h
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\connection.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\connection.h
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\intqueue.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\intqueue.h
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\mpi_router.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\mpi_router.h
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\pbarrier.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\pbarrier.h
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\perfserver.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\rconf_parser.tab.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\rconf_parser.y
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\rdebug.h
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\rhlist.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\rhlist.h
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\router.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\router_config.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\router_config.h
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\tcp_connection.c
# End Source File
# Begin Source File

SOURCE=..\..\src\routing\tcp_connection.h
# End Source File
# End Group
# Begin Group "tunnel"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\ch_tunnel\tunnelchkdev.c
# End Source File
# Begin Source File

SOURCE=..\ch_tunnel\tunneleager.c
# End Source File
# Begin Source File

SOURCE=..\ch_tunnel\tunnelinit.c
# End Source File
# Begin Source File

SOURCE=..\ch_tunnel\tunnelnrndv.c
# End Source File
# Begin Source File

SOURCE=..\ch_tunnel\tunnelpriv.c
# End Source File
# Begin Source File

SOURCE=..\ch_tunnel\tunnelshort.c
# End Source File
# End Group
# Begin Group "gateway"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\ch_gateway\bswap2.c
# End Source File
# Begin Source File

SOURCE=..\ch_gateway\chhetero.c
# End Source File
# Begin Source File

SOURCE=..\ch_gateway\gatewaycancel.c
# End Source File
# Begin Source File

SOURCE=..\ch_gateway\gatewaychkdev.c
# End Source File
# Begin Source File

SOURCE=..\ch_gateway\gatewayeager.c
# End Source File
# Begin Source File

SOURCE=..\ch_gateway\gatewayinit.c
# End Source File
# Begin Source File

SOURCE=..\ch_gateway\gatewaynrndv.c
# End Source File
# Begin Source File

SOURCE=..\ch_gateway\gatewaypriv.c
# End Source File
# Begin Source File

SOURCE=..\ch_gateway\gatewayshort.c
# End Source File
# End Group
# Begin Source File

SOURCE=.\mpich.def
# End Source File
# Begin Source File

SOURCE=..\lfbs_common\mpich.def.in

!IF  "$(CFG)" == "ch_smi_meta - Win32 Release"

# Begin Custom Build - mpich.def erstellen
ProjDir=.
InputPath=..\lfbs_common\mpich.def.in

"$(ProjDir)\mpich.def" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	cl /DLIBNAME=mpich /DMAGPIE /nologo /EP $(InputPath) >$(ProjDir)\mpich.def

# End Custom Build

!ELSEIF  "$(CFG)" == "ch_smi_meta - Win32 Debug"

# Begin Custom Build - DEF erzeugen
ProjDir=.
InputPath=..\lfbs_common\mpich.def.in

"$(ProjDir)\mpich.def" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	cl /DMETA /DLIBNAME=mpich_smi_meta  /nologo /EP $(InputPath) >$(ProjDir)\mpich.def

# End Custom Build

!ENDIF 

# End Source File
# End Target
# End Project
