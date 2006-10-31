# Microsoft Developer Studio Project File - Name="ch_ntshmem_meta" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** NICHT BEARBEITEN **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=ch_ntshmem_meta - Win32 Debug
!MESSAGE Dies ist kein g�ltiges Makefile. Zum Erstellen dieses Projekts mit NMAKE
!MESSAGE verwenden Sie den Befehl "Makefile exportieren" und f�hren Sie den Befehl
!MESSAGE 
!MESSAGE NMAKE /f "ch_ntshmem_meta.mak".
!MESSAGE 
!MESSAGE Sie k�nnen beim Ausf�hren von NMAKE eine Konfiguration angeben
!MESSAGE durch Definieren des Makros CFG in der Befehlszeile. Zum Beispiel:
!MESSAGE 
!MESSAGE NMAKE /f "ch_ntshmem_meta.mak" CFG="ch_ntshmem_meta - Win32 Debug"
!MESSAGE 
!MESSAGE F�r die Konfiguration stehen zur Auswahl:
!MESSAGE 
!MESSAGE "ch_ntshmem_meta - Win32 Release" (basierend auf  "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ch_ntshmem_meta - Win32 Debug" (basierend auf  "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "ch_ntshmem_meta - Win32 Release"

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
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ch_ntshmem_meta_EXPORTS" /YX /FD /c
# ADD CPP /nologo /MD /GX /Ox /Ot /Og /Gf /Gy /I "..\..\unix2nt" /I "..\lfbs_common" /I ".\\" /I "..\..\include" /I "..\ch2" /I "..\util" /I "..\..\mpi-2-c++\src" /D "NDEBUG" /D "MPID_DEBUG_NONE" /D "META" /D "YYDEBUG" /D "IN_MPICH_DLL" /D "_WINDOWS" /D "HAS_VOLATILE" /D "RNDV_STATIC" /D "SINGLECOPY" /D "_MBCS" /D "USE_STDARG" /D "WIN32_LEAN_AND_MEAN" /D "WIN32" /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "NTSHMEM"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 kernel32.lib user32.lib rpcrt4.lib advapi32.lib ws2_32.lib /nologo /subsystem:windows /dll /machine:I386 /out:"../../lib/mpich_smp.dll" /link50compat /Release
# SUBTRACT LINK32 /pdb:none /debug
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copy Release\mpich_smp.lib ..\..\lib
# End Special Build Tool

!ELSEIF  "$(CFG)" == "ch_ntshmem_meta - Win32 Debug"

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
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ch_ntshmem_meta_EXPORTS" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /GX /Z7 /Od /Gf /Gy /I "..\..\src\coll" /I "C:\Programme\Microsoft SDK\Include" /I "..\lfbs_common" /I ".\\" /I "..\..\include" /I "..\ch2" /I "..\util" /I "..\..\mpi-2-c++\src" /I "..\..\unix2nt" /D "YYDEBUG" /D "_DEBUG" /D "MPID_DEBUG_ALL" /D "_USRDLL" /D "MPID_STATISTICS" /D "META" /D "IN_MPICH_DLL" /D "_WINDOWS" /D "HAS_VOLATILE" /D "RNDV_STATIC" /D "SINGLECOPY" /D "_MBCS" /D "USE_STDARG" /D "WIN32_LEAN_AND_MEAN" /D "WIN32" /FR /FD /GZ /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "NTSHMEM"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 csmi.lib sisci_api.lib kernel32.lib user32.lib rpcrt4.lib advapi32.lib ws2_32.lib /nologo /subsystem:console /dll /pdb:none /map /debug /machine:I386 /nodefaultlib:"libcmt.lib" /out:"../../lib/mpich_smp_meta.dll" /libpath:"$(SMIDIR)\lib" /libpath:"$(DOLPHIN_BASE)\lib" /link50compat
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copy Debug\mpich_smp.lib ..\..\lib
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "ch_ntshmem_meta - Win32 Release"
# Name "ch_ntshmem_meta - Win32 Debug"
# Begin Group "src"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\..\SRC\ENV\abort.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\accumulate.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\address.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\allgather.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\allgatherv.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\allocmem.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\allreduce.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\alltoall.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\alltoallv.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\attr_delval.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\attr_getval.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\attr_putval.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\attr_util.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\barrier.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\bcast.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\bsend.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\bsend_init.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\UTIL\bsendutil2.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\bufattach.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\buffree.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\cancel.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\cart_coords.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\cart_create.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\cart_get.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\cart_map.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\cart_rank.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\cart_shift.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\cart_sub.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\cartdim_get.c
# End Source File
# Begin Source File

SOURCE=..\ch2\chtime.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_create.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_dup.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_free.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_group.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_name_get.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_name_put.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_rank.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_rgroup.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_rsize.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_size.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_split.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_testic.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\comm_util.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\commcompare.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\commreq_free.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\context_util.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\create_recv.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\create_send.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\darray.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\debugutil.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\dims_create.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\DMPI\dmpipk.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\dup_fn.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\errclass.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\errcreate.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\errfree.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\errget.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\errhandler.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\errorstring.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\errset.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\fence.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\finalize.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\finalized.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\freemem.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\gather.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\gatherv.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\get.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\getattr.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\getcount.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\getelements.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\getgrp.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\getpname.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\getversion.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\global_ops.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\graph_get.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\graph_map.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\graph_nbr.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\graphcreate.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\graphdimsget.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\graphnbrcnt.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_diff.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_excl.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_free.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_incl.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_inter.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_rank.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_rexcl.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_rincl.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_size.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_tranks.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_union.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\group_util.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\groupcompare.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\ibsend.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\ic_create.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\ic_merge.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_c2f.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_create.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_delete.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_dup.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_f2c.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_free.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_get.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_getnks.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_getnth.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_getvln.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\info_set.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\init.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\initdte.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\initialize.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\initthread.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\initutil.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\inter_fns.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\intra_fns.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\intra_scan.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\iprobe.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\irecv.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\irsend.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\isend.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\issend.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\keyval_free.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\keyvalcreate.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\mmx_ops.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\mperror.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\UTIL\mpirutil.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\msgqdllloc.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\nerrmsg.c
# End Source File
# Begin Source File

SOURCE=.\ntshmemdebug.h
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\null_copyfn.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\CONTEXT\null_del_fn.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\opcreate.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\opfree.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\oputil.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\pack.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\pack_size.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PROFILE\pcontrol.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\DMPI\pkutil.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\probe.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\UTIL\ptrcvt.c
# End Source File
# Begin Source File

SOURCE=..\..\src\ssided\put.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\recv.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\red_scat.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\reduce.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\requestc2f.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\rsend.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\rsend_init.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\scan.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\scatter.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\COLL\scatterv.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\send.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\sendrecv.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\sendrecv_rep.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\sendutil.c
# End Source File
# Begin Source File

SOURCE=..\ch_wsock2\Skript1.rc
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\sse_ops.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\ssend.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\ssend_init.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\start.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\startall.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\statusc2f.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\EXTERNAL\statuscancel.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\EXTERNAL\statuselm.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\statusf2c.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\subarray.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\test.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\testall.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\testany.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\testcancel.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\testsome.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\topo_test.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\TOPOL\topo_util.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\MISC2\type_blkind.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_commit.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_contig.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_extent.c
# End Source File
# Begin Source File

SOURCE=..\..\src\pt2pt\type_ff.c
# End Source File
# Begin Source File

SOURCE=..\..\src\external\type_flatten.c

!IF  "$(CFG)" == "ch_ntshmem_meta - Win32 Release"

# ADD CPP /Oi /FAs

!ELSEIF  "$(CFG)" == "ch_ntshmem_meta - Win32 Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_free.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\EXTERNAL\type_get_cont.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\EXTERNAL\type_get_env.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_hind.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_hvec.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_ind.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_lb.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_size.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_struct.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_ub.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_util.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\type_vec.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\unpack.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\UTIL\util_hbt.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\wait.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\waitall.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\waitany.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\PT2PT\waitsome.c
# End Source File
# Begin Source File

SOURCE=..\ch_smi\wc_memcpy_win32.c
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

SOURCE=..\..\SRC\ENV\wtick.c
# End Source File
# Begin Source File

SOURCE=..\..\SRC\ENV\wtime.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\x86_ops.c
# End Source File
# Begin Source File

SOURCE=..\..\src\coll\x86_ops.h
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
# Begin Source File

SOURCE=.\mpich.def
# End Source File
# Begin Source File

SOURCE=..\lfbs_common\mpich.def.in

!IF  "$(CFG)" == "ch_ntshmem_meta - Win32 Release"

# Begin Custom Build - Creating DEF file
ProjDir=.
InputPath=..\lfbs_common\mpich.def.in

"$(ProjDir)\mpich.def" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	cl /DLIBNAME=mpich_smp /DMAGPIE /nologo /EP $(InputPath) >$(ProjDir)\mpich.def

# End Custom Build

!ELSEIF  "$(CFG)" == "ch_ntshmem_meta - Win32 Debug"

# Begin Custom Build - Creating DEF file
ProjDir=.
InputPath=..\lfbs_common\mpich.def.in

"$(ProjDir)\mpich.def" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	cl /DLIBNAME=mpich_smp /DMETA /DMAGPIE /nologo /EP $(InputPath) >$(ProjDir)\mpich.def

# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\order.txt
# End Source File
# End Target
# End Project