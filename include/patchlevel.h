/* $Id: patchlevel.h,v 1.7 2004/03/19 23:02:42 joachim Exp $ 

   Change and commit this file for a new release. The version information 
   specified here will be printed using the -mpiversion option with an application. */

#define PATCHLEVEL 1.3
#define PATCHLEVEL_MAJOR 1
#define PATCHLEVEL_MINOR 3
#define PATCHLEVEL_SUBMINOR 0
#define PATCHLEVEL_RELEASE_KIND "b"
#ifndef PATCHLEVEL_RELEASE_DATE 
#ifdef RELEASE_DATE
#define PATCHLEVEL_RELEASE_DATE RELEASE_DATE
#else
#define PATCHLEVEL_RELEASE_DATE "$Date: 2004/03/19 23:02:42 $"
#endif
#endif

#define ADI2PATCHLEVEL "2.0"