/*************************************************************************
**
**  Copyright 2018 Actian Corporation All Rights Reserved
**
*************************************************************************/
#ifndef _BTRVEXID_H
#define _BTRVEXID_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef __BTRVEXID_EXPIMP
#ifdef _WIN32
#define __BTRVEXID_EXPIMP __declspec(dllimport)
#else
#define __BTRVEXID_EXPIMP
#endif
#endif

#ifdef _WIN32
#define __BTRVEXID_API __stdcall
#else
#define __BTRVEXID_API
#endif

int32_t __BTRVEXID_EXPIMP __BTRVEXID_API
    BTRVEX(int32_t        operation,
           void*          posblock,
           void*          databuf,
           uint32_t*      datalen,
           void*          keybuf,
           uint32_t       keylen,
           int32_t        keynum);

int32_t __BTRVEXID_EXPIMP __BTRVEXID_API
    BTRVEXID(int32_t        operation,
             void*          posblock,
             void*          databuf,
             uint32_t*      datalen,
             void*          keybuf,
             uint32_t       keylen,
             int32_t        keynum,
             void*          clientID);

#ifdef __cplusplus
}
#endif


#endif /* _BTRVEXID_H */
