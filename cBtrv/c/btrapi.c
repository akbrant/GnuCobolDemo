/*************************************************************************
**
**  Copyright 2019 Actian Corporation All Rights Reserved
**
*************************************************************************/
/*************************************************************************
   BTRAPI.C
     This module implements the Btrieve Interface for C/C++ applications
     using MS Windows, Linux and MacOS. 

     You must select a target platform switch.  See the prologue inside
     'btrapi.h' for a list of platform switches.

     IMPORTANT
     ---------
     Actian Corporation invites you to modify this file
     if you find it necessary for your particular situation.  However,
     we cannot provide technical support for this module if you
     do modify it.

*************************************************************************/
#define BTI_WIN_32
#if   !defined(BTI_WIN_32) && !defined(BTI_WIN_64) \
   && !defined(BTI_LINUX)  && !defined(BTI_LINUX_64) \
   && !defined(BTI_MACOSX) && !defined(BTI_MACOSX_64)
#error You must define one of the following: BTI_WIN_32, BTI_WIN_64, BTI_LINUX, BTI_LINUX_64, BTI_MACOSX, BTI_MACOSX_64
#endif

#include "btrconst.h"
#include "btrapi.h"
#include <string.h>
#include <stdio.h>


#ifdef __cplusplus
extern "C" {
#endif


typedef struct
{

  BTI_CHAR  timestamp[7];
  //BTI_LONG  timestampsid;
  BTI_CHAR  PAC_YEAR[4];
  BTI_CHAR  PAC_SERIAL[5];
  BTI_CHAR  PAC_PMT_SEQ[2];
  BTI_CHAR  PAC_ACT_SEQ[3];
  BTI_CHAR  PAC_ACT_DATE[8];
  BTI_CHAR  PAC_ACT_STOP_DATE[8];
  BTI_CHAR  PAC_ACT[2];
  BTI_CHAR  PAC_ACT_DETAILS[8];
  BTI_CHAR  PAC_ADFG[5];
  BTI_CHAR  PAC_exrtra[12];  
} PERSON_STRUCT;

typedef struct
{
  BTI_CHAR  keybuffer[255];  
} KEYBUFFER_STRUCT;

/****************************************************************************
   BTRV() Function 
***************************************************************************/

BTI_API BTRV(
           BTI_WORD     operation,
           BTI_VOID_PTR posBlock,
           BTI_VOID_PTR dataBuffer,
           BTI_WORD_PTR dataLength,
           BTI_VOID_PTR keyBuffer,
           BTI_SINT     keyNumber )
{
 /*
   printf("%s\n","\n");
   printf("%s\n", "in lib BTRCALL");
   printf("%s%d\n", "operation: ",operation);
   printf("%s%s\n", "keybuf: ",keyBuffer);
*/
   BTI_BYTE keyLength  = MAX_KEY_SIZE;
   BTI_CHAR ckeynum    = (BTI_CHAR)keyNumber;
   BTI_ULONG dataLen32 = 0;
   BTI_SINT status;
   PERSON_STRUCT   *personRecord;
   personRecord = dataBuffer;

   KEYBUFFER_STRUCT *keybuff;
   keybuff = keyBuffer;

   KEYBUFFER_STRUCT *databuff;
   databuff = dataBuffer;

   if ( dataLength != NULL )
      dataLen32 = *dataLength;

  // printf("%s\n","just above BTRCALL");

   status = BTRCALL (
              operation,
              posBlock,
              dataBuffer,
              &dataLen32,
              keyBuffer,
              keyLength,
              ckeynum );

   if ( dataLength != NULL )
      *dataLength = (BTI_WORD)dataLen32;
   
   /*
   printf("Year: %s\n", personRecord->PAC_YEAR);
   printf("Serial: %s\n", personRecord->PAC_SERIAL);

   printf("%s%d\n", "Exit status: ",status);
   */
   //printf("%s\n\n","out lib BTRVALL");
   return status;
}


/****************************************************************************
   BTRVID() Function 
***************************************************************************/

BTI_API BTRVID(
           BTI_WORD       operation,
           BTI_VOID_PTR   posBlock,
           BTI_VOID_PTR   dataBuffer,
           BTI_WORD_PTR   dataLength,
           BTI_VOID_PTR   keyBuffer,
           BTI_SINT       keyNumber,
           BTI_BUFFER_PTR clientID )
{
   BTI_BYTE keyLength  = MAX_KEY_SIZE;
   BTI_CHAR ckeynum    = (BTI_CHAR)keyNumber;
   BTI_ULONG dataLen32 = 0;
   BTI_SINT status;

   PERSON_STRUCT   *personRecord;
  
   if ( dataLength != NULL )
      dataLen32 = *dataLength;

   status = BTRCALLID (
              operation,
              posBlock,
              dataBuffer,
              &dataLen32,
              keyBuffer,
              keyLength,
              ckeynum,
              clientID );

   if ( dataLength != NULL ) {
      *dataLength = (BTI_WORD)dataLen32;
   }

   personRecord = dataBuffer;

//   printf("Year: %s\n", personRecord->PAC_YEAR);
//   printf("Serial: %s\n", personRecord->PAC_SERIAL);

   

   return status;
}


#ifdef __cplusplus
}
#endif

