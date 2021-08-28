#ifndef _BTISTRUCT_H_INCLUDED
#define _BTISTRUCT_H_INCLUDED
/*
**============================================================================
**  Copyright (C) 2019 by Actian Corporation. All rights reserved
**  BTISTRUCT.H - Btrieve Structures
**    
**  This file contains various structure definitions which can be used
**  with various Btrieve operations
**
**===========================================================================
*/

#include <btrconst.h>

// Client Id structure definition
#pragma pack(1)
typedef struct
{
    BTI_BYTE   netAddress[10];
    BTI_UINT16 ProcessID;
    BTI_UINT16 ServiceAgentID;
    BTI_UINT16 TaskNumber;
} BTI_T_CLIENT_ID, *BTI_T_CLIENT_ID_PTR;
#pragma pack()

#define BERR_UNAME_SIZE 30
#pragma pack(1)
typedef struct
{
    BTI_T_CLIENT_ID stdClient;
    BTI_BYTE        uName[BERR_UNAME_SIZE + 1];
} BTI_T_EXT_CLIENTID, *BTI_T_EXT_CLIENTID_PTR;
#pragma pack()

/*
** BTI_FILE_SPEC used for BTRV
*/
#pragma pack(1)
typedef struct
{
   BTI_UINT16 recLen;
   BTI_UINT16 pageSize;
   BTI_BYTE   numKeys;
   BTI_BYTE   fileVersion;
   BTI_UINT32 numRecs;
   BTI_UINT16 fileFlags;
   BTI_BYTE   unusedDupPtrs;
   BTI_BYTE   physPageSize;
   BTI_UINT16 unusedPages;
} BTI_T_FILE_SPEC, *BTI_T_FILE_SPEC_PTR;
#pragma pack()

/*
** BTI_FILE_SPEC_WIDE used for BTRVEX
*/
#pragma pack(1)
typedef struct
{
    BTI_UINT16 recLen;                 // [0x00]
    BTI_UINT16 pageSize;               // [0x02]
    BTI_UINT16 fileFlags;              // [0x04]
    BTI_UINT16 Reserved1;              // [0x06] Must be 0
    BTI_UINT64 numRecs;                // [0x08]
    BTI_INT16  numKeys;                // [0x10] -1 for keyonly files.
    BTI_UINT16 fileVersion;            // [0x12]
    BTI_BYTE   unusedDupPtrs;          // [0x14]
    BTI_BYTE   physPageSize;           // [0x15] 9.5 and newer
    BTI_UINT16 unusedPages;            // [0x16]
    BTI_UINT32 Reserved2[2];           // [0x18] Must be 0
} BTI_T_FILE_SPEC_WIDE, *BTI_T_FILE_SPEC_WIDE_PTR; // [0x20]
#pragma pack()

/*
** Key Spec used for BTRV
*/
#pragma pack(1)
typedef struct
{
   BTI_UINT16 keyPos;
   BTI_UINT16 keyLen;
   BTI_UINT16 keyFlags;
   BTI_UINT32 numUniqueKeys;
   BTI_BYTE   keyType;
   BTI_BYTE   nullValue;
   BTI_UINT16 reserved;
   BTI_BYTE   keyNumber;
   BTI_BYTE   aCSNumber;
} BTI_T_KEY_SPEC, *BTI_T_KEY_SPEC_PTR;
#pragma pack()

/*
** BTI_KEY_SPEC_WIDE used for BTRVEX
*/
#pragma pack(1)
typedef struct
{
    BTI_UINT16 keyPos;                // [0x00] 1 relative
    BTI_UINT16 keyLen;                // [0x02]
    BTI_UINT16 keyFlags;              // [0x04]
    BTI_UINT16 Reserved1;             // [0x06] Must be 0.
    BTI_UINT64 numUniqueKeys;         // [0x08]
    BTI_UINT16 keyType;               // [0x10]
    BTI_BYTE   nullValue;             // [0x12]
    BTI_BYTE   Reserved2;             // [0x13] Must be 0.
    BTI_UINT16 keyNumber;             // [0x14]
    BTI_BYTE   aCSNumber;             // [0x16]
    BTI_BYTE   Reserved3;             // [0x17] Must be 0.
} BTI_T_KEY_SPEC_WIDE, *BTI_T_KEY_SPEC_WIDE_PTR; // [0x18]
#pragma pack()

/*
** Code page name Spec
** 'filler' is needed because all ACS structures must be ACS_SIZE.
*/
#pragma pack(1)
typedef struct /* 0xAB CODE_PAGE_ID - supported code page Name */
{
   BTI_CHAR codePageName[ ISR_TABLE_NAME_SIZE ];
   BTI_BYTE filler[ ISR_FILLER_SIZE ];
} BTI_T_ACS_PAGE_SPEC, *BTI_T_ACS_PAGE_SPEC_PTR;
#pragma pack()

/*
** ACS Name Spec
*/
#pragma pack(1)
typedef struct /* ALT_ID 0xAC ACS_ID - classic ACS, ACS Table Name */
{
   BTI_CHAR internalName[ ACS_NAME_SIZE ];
   BTI_BYTE sequence[ ACS_BYTE_MAP_SIZE ];
} BTI_T_ACS_NAME_SPEC, *BTI_T_ACS_NAME_SPEC_PTR;
#pragma pack()

/*
** ACS Country / CodePage ID Spec
** 'filler' is needed because all ACS structures must be ACS_SIZE.
*/
#pragma pack(1)
typedef struct /* COUNTRY_CODE_PAGE_ID 0xAD LOCALE_ACS_ID, CountryID, Code Page ID */
{
   BTI_INT16 countryID;
   BTI_INT16 codepageID;
   BTI_BYTE filler[ ACS_FILLER_SIZE ];
} BTI_T_ACS_CODE_SPEC, *BTI_T_ACS_CODE_SPEC_PTR;
#pragma pack()

/*
** ISR (International Sorting Rules) Spec
** 'filler' is needed because all ACS structures must be ACS_SIZE.
*/
#pragma pack(1)
typedef struct /* ISR_ID 0xAE ISR_ACS_ID - ISR or ICU Collation, ISR table Name */
{
   BTI_CHAR isrName[ ISR_TABLE_NAME_SIZE ];
   BTI_BYTE filler[ ISR_FILLER_SIZE ];
} BTI_T_ACS_ISR_SPEC, *BTI_T_ACS_ISR_SPEC_PTR;
#pragma pack()

/*
** ACS Spec
*/
#pragma pack(1)
typedef struct
{
   BTI_BYTE signature;
   union
   {
       BTI_T_ACS_PAGE_SPEC page;
       BTI_T_ACS_NAME_SPEC name;
       BTI_T_ACS_CODE_SPEC countryCode;
       BTI_T_ACS_ISR_SPEC  isr;
   };
} BTI_T_ACS_SPEC, *BTI_T_ACS_SPEC_PTR;
#pragma pack()

/*
** BTI_DATABUF used for BTRV
*/
#pragma pack(1)
typedef struct
{
   BTI_T_FILE_SPEC fileSpec;
   BTI_T_KEY_SPEC  keySpec[ MAX_KEY_SEG ];
} BTI_T_DATABUF, *BTI_T_DATABUF_PTR;
#pragma pack()

/*
** BTI_DATABUF_WIDE used for BTRVEX
*/
#pragma pack(1)
typedef struct
{
    BTI_T_FILE_SPEC_WIDE fileSpec;
    BTI_T_KEY_SPEC_WIDE  keySpec[MAX_KEY_SEG];
} BTI_T_DATABUF_WIDE, *BTI_T_DATABUF_WIDE_PTR;
#pragma pack()

#define BTI_MAX_DATABUF_SIZE  57000L

/*
** Extended Stat Extended File Input Spec
*/
#pragma pack(1)
typedef struct
{
   BTI_UINT32 signature;
   BTI_UINT32 subfunction;
   BTI_UINT32 Namespace;
   BTI_UINT32 maxFilenamesToReturn;
   BTI_UINT32 sequenceStartNumber;
} BTI_T_EXTSTAT_EXTFILE_ISPEC, *BTI_T_EXTSTAT_EXTFILE_ISPEC_PTR;
#pragma pack()

/*
** Extended Stat Extended File Return Spec For One Extension
*/
#pragma pack(1)
typedef struct
{
   BTI_UINT32 numOsFiles;
   BTI_UINT32 numExtensions;
   BTI_UINT32 extensionLength;
   BTI_BYTE   extensionFilename[1]; /* placeholder */
} BTI_T_EXTSTAT_EXTFILE_RSPEC, *BTI_T_EXTSTAT_EXTFILE_RSPEC_PTR;
#pragma pack()

/*
** Structure to Store Extension Info.
*/
#pragma pack(1)
typedef struct
{
   BTI_UINT32     extensionLength;
   BTI_BUFFER_PTR extensionFilename; 
} BTI_T_EXTFILE_STORAGE_SPEC, *BTI_T_EXTFILE_STORAGE_SPEC_PTR;
#pragma pack()

/*
** Extended Stat Log Key Input Spec
*/
#pragma pack(1)
typedef struct
{
   BTI_UINT32 signature;
   BTI_UINT32 subfunction;
} BTI_T_EXTSTAT_LOGKEY_ISPEC, *BTI_T_EXTSTAT_LOGKEY_ISPEC_PTR;
#pragma pack()

/*
** Extended Stat Log Key Return Spec
*/
#pragma pack(1)
typedef struct
{
   BTI_BYTE   hasSysData; 
   BTI_BYTE   isLogKey;
   BTI_BYTE   isLoggable;
   BTI_BYTE   logKeyNumber;
   BTI_UINT16 sizeofSystemData;
   BTI_UINT16 systemDataVersion;
} BTI_T_EXTSTAT_LOGKEY_RSPEC, *BTI_T_EXTSTAT_LOGKEY_RSPEC_PTR;
#pragma pack()

/*
** Chunk Structures
*/
#pragma pack(1)
typedef struct
{
   BTI_UINT32 ChunkOffset;
   BTI_UINT32 ChunkLen;
   BTI_BUFFER_PTR UsersData;
} CHUNK;
#pragma pack()

#pragma pack(1)
typedef struct
{
   BTI_UINT32 Signature;                              /* XTRACTR_DIRECT_SIGN */
   BTI_UINT32 NumChunks;
   CHUNK      Chunk[ 1 ];
}  CHUNK_XTRACTR, *CHUNK_XTRACTR_PTR;
#pragma pack()

#pragma pack(1)
typedef struct
{
   BTI_UINT32     Signature;                       /* RECTANGLE_DIRECT_SIGN */
   BTI_UINT32     NumRows;
   BTI_UINT32     Offset;
   BTI_UINT32     BytesPerRow;
   BTI_UINT32     BtrDistanceBetweenRows;           /* Btrieve's byte count */
   BTI_BUFFER_PTR UsersData;
   BTI_UINT32     AppDistanceBetweenRows;       /* Application's byte count */
} RECTANGLE;
#pragma pack()

#pragma pack(1)
typedef struct
{
   BTI_UINT32 Signature;                                       /* TRUNC_SIGN */
   BTI_UINT32 ChunkOffset;   
}  PUT_TRUNC;
#pragma pack()

#pragma pack(1)
typedef struct
{
   BTI_UINT32    RecordAddress;
   CHUNK_XTRACTR Xtr;
}  GET_XTRACTR, *GET_XTRACTR_PTR;
#pragma pack()

#pragma pack(1)
typedef struct
{
    BTI_UINT64    RecordAddress;
    CHUNK_XTRACTR Xtr;
}  GET_XTRACTR_WIDE, *GET_XTRACTR_WIDE_PTR;
#pragma pack()

#pragma pack(1)
typedef struct
{
   BTI_UINT32 RecordAddress;
   RECTANGLE  Rect;
} GET_RECTANGLE;
#pragma pack()

#pragma pack(1)
typedef struct
{
    BTI_UINT64 RecordAddress;
    RECTANGLE  Rect;
} GET_RECTANGLE_WIDE;
#pragma pack()

#endif /* _BTISTRUCT_H_INCLUDED */
