#ifndef _BTITYPES_H_INCLUDED
/*************************************************************************
**
**  Copyright 2019 Actian Corporation All Rights Reserved
**
*************************************************************************/
/*************************************************************************
   BTITYPES.H
     This module contains platform-independent data types used by the
     Btrieve MS Windows, LinuX and MacOS.

     You must define one of the following to your compiler in order to
     compile for a particular platform:

        BTI_WIN_32    - Windows                               32-bit Apps
        BTI_WIN_64    - 64-bit Windows                        64-bit Apps
        BTI_LINUX     - Linux                                 32-bit Apps
        BTI_LINUX_64  - 64-bit Linux                          64-bit Apps
        BTI_MACOSX    - MacOSX                                32-bit Apps
        BTI_MACOSX_64 - 64-bit MacOSX                         64-bit Apps

     If you do not specify one of the above switches to your compiler,
     an error directive in btitypes.h will halt the compilation.

     To use the new stdint.h based typedefs define BTITYPES_USE_STDINT before
     including this file.  Otherwise the old definitions are made available.
     Both definitions are binary compatible.
*************************************************************************/
#if !defined(BTI_WIN_32)  && \
    !defined(BTI_LINUX)   && !defined(BTI_WIN_64)  && !defined(BTI_LINUX_64) && \
    !defined(BTI_MACOSX)  && !defined(BTI_MACOSX_64)
#error You must define one of the following: BTI_WIN_32, BTI_WIN_64, BTI_LINUX, BTI_LINUX_64, BTI_MACOSX, BTI_MACOSX_64
#endif

   #include <stdlib.h>

   #define BTI_FAR
   #if defined(BTI_WIN_32) || defined(BTI_WIN_64)
      #define BTIAPICALLTYPE __stdcall
   #endif

   #if defined(BTI_LINUX)  || defined(BTI_LINUX_64) || \
       defined(BTI_MACOSX) || defined(BTI_MACOSX_64)
      #define BTIAPICALLTYPE
   #endif
   #define DDFAPICALLTYPE BTIAPICALLTYPE
   #define BTI_PASCAL BTIAPICALLTYPE

#ifdef BTITYPES_USE_STDINT
   #include <stdint.h>
   typedef int16_t               BTI_INT16,  BTI_SINT;
   typedef uint16_t              BTI_UINT16, BTI_WORD;
   typedef int32_t               BTI_INT32,  BTI_LONG;
   typedef uint32_t              BTI_UINT32, BTI_ULONG;
   typedef int64_t               BTI_INT64,  BTI_LONGLONG;
   typedef uint64_t              BTI_UINT64, BTI_ULONGLONG;
   typedef uintptr_t             BTI_PTR_CAST;
#else /* BTITYPES_USE_STDINT */
   #if !defined(BTI_LINUX_64) && !defined(BTI_MACOSX_64)
   typedef long                  BTI_INT32,  BTI_LONG;
   typedef unsigned long         BTI_UINT32, BTI_ULONG;
   #else
   typedef int                   BTI_INT32,  BTI_LONG;
   typedef unsigned int          BTI_UINT32, BTI_ULONG;
   #endif

   /* Platform-Independent Data Types */
   typedef short int             BTI_SINT,   BTI_INT16;
   typedef unsigned short        BTI_WORD,   BTI_UINT16;
   #if defined(_MSC_VER) && (_MSC_VER >= 1400)
      #define HAVE_LONG_LONG 1
   #endif
   #if defined(__GNUC__) || defined(__clang__)
      #define HAVE_LONG_LONG 1
   #endif

   #if defined(HAVE_LONG_LONG)
   typedef long long             BTI_LONGLONG,  BTI_INT64;
   typedef unsigned long long    BTI_ULONGLONG, BTI_UINT64;
   #elif defined(__BORLANDC__)
   typedef LARGE_INTEGER         BTI_LONGLONG,  BTI_INT64;
   typedef ULARGE_INTEGER        BTI_ULONGLONG, BTI_UINT64;
   #elif defined (BTI_WIN_64) || defined (BTI_WIN_32)
   typedef signed __int64        BTI_LONGLONG,  BTI_INT64;
   typedef unsigned __int64      BTI_ULONGLONG, BTI_UINT64;
   #else
   typedef long long             BTI_LONGLONG,  BTI_INT64;
   typedef unsigned long long    BTI_ULONGLONG, BTI_UINT64;
   #endif

   #if defined(BTI_WIN_64) || defined(BTI_LINUX_64) || defined(BTI_MACOSX_64)
   typedef BTI_LONGLONG          BTI_PTR_CAST;
   #else
   typedef BTI_LONG              BTI_PTR_CAST;
   #endif
#endif /* BTITYPES_USE_STDINT */

   typedef size_t                BTI_SIZE;
   typedef int                   BTI_INT;
   typedef char                  BTI_CHAR;
   typedef unsigned char         BTI_BYTE;
   typedef void                  BTI_VOID;
   typedef BTI_CHAR     BTI_FAR* BTI_CHAR_PTR;
   typedef BTI_BYTE     BTI_FAR* BTI_BUFFER_PTR;
   typedef BTI_SINT     BTI_FAR* BTI_SINT_PTR;
   typedef BTI_INT      BTI_FAR* BTI_INT_PTR;
   typedef BTI_WORD     BTI_FAR* BTI_WORD_PTR;
   typedef BTI_LONG     BTI_FAR* BTI_LONG_PTR;
   typedef BTI_ULONG    BTI_FAR* BTI_ULONG_PTR;
   typedef BTI_VOID     BTI_FAR* BTI_VOID_PTR;
   typedef BTI_SIZE     BTI_FAR* BTI_SIZE_PTR;
   typedef BTI_LONGLONG*         BTI_LONGLONG_PTR;

   typedef BTI_INT16    BTI_FAR* BTI_INT16_PTR;
   typedef BTI_UINT16   BTI_FAR* BTI_UINT16_PTR;
   typedef BTI_INT32    BTI_FAR* BTI_INT32_PTR;
   typedef BTI_UINT32   BTI_FAR* BTI_UINT32_PTR;
   typedef BTI_INT64    BTI_FAR* BTI_INT64_PTR;
   typedef BTI_UINT64   BTI_FAR* BTI_UINT64_PTR;



   #define BTI_API extern BTI_SINT BTI_FAR BTIAPICALLTYPE

   #define _BTITYPES_H_INCLUDED
#endif
