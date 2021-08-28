#ifndef _BTRAPI_H_INCLUDED
/*************************************************************************
**
**  Copyright 2019 Actian Corporation All Rights Reserved
**
*************************************************************************/
/***************************************************************************
 BTRAPI.H
    This file contains prototypes for MS Windows and Unix Btrieve calls.
    The calling application may be C or C++.

    You must define one of the following to your compiler in order to
    compile for a particular platform:

        BTI_WIN_32     - 32-bit Microsoft Windows             32-bit Apps
        BTI_WIN_64     - 64-bit Microsoft Windows             64-bit Apps
        BTI_LINUX      - 32-bit Linux
        BTI_LINUX_64   - 64-bit Linux 
        BTI_MACOSX     - 32-bit MacOSX
        BTI_MACOSX_64  - 64-bit MacOSX

    If you do not specify one of the above switches to your compiler,
    an error directive will halt the compilation.

    Modules are:
      btrapi.c     - compile and link with all apps except NLMs
      btrsamp.c    - sample program which can be compiled for any platform
      btitypes.h   - platform-independent data types
      btrapi.h     - included by all apps
      btrconst.h   - Btrieve constants
      w3btrv7.lib  - used by Windows 32-bit apps.
      w64btrv7.lib - used by Windows 64-bit apps.

    The Btrieve application developer will also need either an import library
    or linker import statements to identify the imported Btrieve functions
    to the linker.  The imported functions are:

      MS Windows
      -------------
      W3BTRV7.LIB  - BTRCALL, BTRCALLID, BTRVEX, BTRVEXID  (32 bit apps)
      W64BTRV7.LIB - BTRCALL, BTRCALLID, BTRVEX, BTRVEXID  (64 bit apps)

      Unix
      -------
      libpsqlmif.so - BTRCALL, BTRCALLID, BTRVEX, BTRVEXID

      MacOS
      -------
      libpsqlmif.dylib - BTRCALL, BTRCALLID, BTRVEX, BTRVEXID

    You will need to compile and link 'btrapi.c' if you call any of
    the following functions
          BTRV
          BTRVID




***************************************************************************/

#if !defined(BTI_WIN_32)  && !defined(BTI_WIN_64) && \
    !defined(BTI_LINUX)   && !defined(BTI_LINUX_64) && \
    !defined(BTI_MACOSX)  && !defined(BTI_MACOSX_64)
#error You must define one of the following: BTI_WIN_32, BTI_LINUX, BTI_WIN_64, BTI_LINUX_64, BTI_MACOSX, BTI_MACOSX_64
#endif

#include "btitypes.h"

#ifdef __cplusplus
extern "C" {
#endif

BTI_API BTRV(
           BTI_WORD     operation,
           BTI_VOID_PTR posBlock,
           BTI_VOID_PTR dataBuffer,
           BTI_WORD_PTR dataLength,
           BTI_VOID_PTR keyBuffer,
           BTI_SINT     keyNumber );

BTI_API BTRVID(
           BTI_WORD       operation,
           BTI_VOID_PTR   posBlock,
           BTI_VOID_PTR   dataBuffer,
           BTI_WORD_PTR   dataLength,
           BTI_VOID_PTR   keyBuffer,
           BTI_SINT       keyNumber,
           BTI_BUFFER_PTR clientID );


BTI_API BTRCALL(
           BTI_WORD      operation,
           BTI_VOID_PTR  posBlock,
           BTI_VOID_PTR  dataBuffer,
           BTI_ULONG_PTR dataLength,
           BTI_VOID_PTR  keyBuffer,
           BTI_BYTE      keyLength,
           BTI_CHAR      ckeynum );

BTI_API BTRCALLID(
           BTI_WORD       operation,
           BTI_VOID_PTR   posBlock,
           BTI_VOID_PTR   dataBuffer,
           BTI_ULONG_PTR  dataLength,
           BTI_VOID_PTR   keyBuffer,
           BTI_BYTE       keyLength,
           BTI_CHAR       ckeynum,
           BTI_BUFFER_PTR clientID );


#ifdef __cplusplus
}
#endif

#if !defined(__WATCOMC__) && !defined(__BORLANDC__)
#include "btrvexid.h"
#endif

#define _BTRAPI_H_INCLUDED
#endif

