       IDENTIFICATION DIVISION.
       PROGRAM-ID. "DOS_GET_TIME".

       DATA DIVISION.
       WORKING-STORAGE SECTION.
         01 WS-CURRENT-DATE-DATA.
           05  WS-CURRENT-DATE.
               10  WS-CURRENT-YEAR         PIC 9(04).
               10  WS-CURRENT-MONTH        PIC 9(02).
               10  WS-CURRENT-DAY          PIC 9(02).
           05  WS-CURRENT-TIME.
               10  WS-CURRENT-HOURS        PIC 9(02).
               10  WS-CURRENT-MINUTE       PIC 9(02).
               10  WS-CURRENT-SECOND       PIC 9(02).
               10  WS-CURRENT-MILLISECONDS PIC 9(02).
       LINKAGE SECTION.
       01  DOS-TIME.
               10  DOS-HOUR            PIC S9(2)   BINARY.
               10  FILLER              PIC X(1).
               10  DOS-MINUTE          PIC S9(2)   BINARY.
               10  FILLER              PIC X(1).
               10  DOS-SECOND          PIC S9(2)   BINARY.
               10  FILLER              PIC X(1).
               10  DOS-HUNDREDTH       PIC S9(2)   BINARY.
               10  FILLER              PIC X(1).
           
       PROCEDURE DIVISION USING DOS-TIME.
       MAIN.
           
           MOVE FUNCTION CURRENT-DATE to WS-CURRENT-DATE-DATA
           MOVE WS-CURRENT-HOURS TO DOS-HOUR.
           MOVE WS-CURRENT-MINUTE TO DOS-MINUTE.
           MOVE WS-CURRENT-SECOND TO DOS-SECOND.
           MOVE WS-CURRENT-MILLISECONDS TO DOS-HUNDREDTH.
           
           EXIT PROGRAM.
       MAIN-END.