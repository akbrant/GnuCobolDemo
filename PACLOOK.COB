       ID DIVISION.
       PROGRAM-ID.  PACLOOK.
       AUTHOR.  Oliphant .
       DATE-WRITTEN. APRIL  1, 2021.
       DATE-COMPILED.
       REMARKS.  THIS PROGRAM READS THE TARGET YEAR OF PAC.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. COMPAQ-DESKPRO-286.
       OBJECT-COMPUTER. ANY-COMPAQ-COMPATABLE.
       SPECIAL-NAMES.
           CALL-CONVENTION 64 IS WINAPI.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
*      WORKING-STORAGE SECTION.
       01  FILE-STATUS     PIC X(2).
       01  B-OPEN      PIC 9(4) BINARY VALUE 0.
       01  B-CLOSE     PIC 9(4) BINARY VALUE 1.
       01  B-STAT      PIC 9(4) BINARY VALUE 15.
       01  B-INS       PIC 9(4) BINARY VALUE 2.
       01  B-DELETE    PIC 9(4) BINARY VALUE 4.
       01  B-UPDATE    PIC 9(4) BINARY VALUE 3.
       01  B-GET-NEXT  PIC 9(4) BINARY VALUE 6.
       01  B-GET-GREATER  PIC 9(4) BINARY VALUE 9.
       01  B-STOP      PIC 9(4) BINARY VALUE 25.
       01  PAC-RECORD.
           COPY 'PAC.COB'.
       01  OWNER-NAME   PIC X(1) VALUE SPACE.
       
       01  B-PAC-FILE-STUFF.
           05  B-PAC-POSITION          PIC X(128).
           05  B-PAC-LENGTH            PIC 9(4)    BINARY  VALUE 103.
           05  B-PAC-NAME              PIC X(32).
           05  B-PAC-KEY-NUMBER        PIC S9(4)   BINARY.
           05  B-PAC-KEY-BUFFER.
               10  B-PAC-KEY-SERIAL    PIC X(05).
               10  B-PAC-KEY-SEQ       PIC 9(03).

       01  OWNER-LENGTH PIC 9(4) BINARY VALUE 0.
       01  TARGET-CCYY  PIC 9(4) BINARY VALUE 0.


       01  CNT                   PIC 9(8) VALUE 0.
       01  VAL.
           05  V-SPEC            PIC X(1).
           05  V-GEAR            PIC X(2).
           05  V-AREA            PIC X(1).
           05  FILLER            PIC X(26).
       01  NEWVALS.
           05  N-SPEC            PIC X(2).
           05  N-GEAR            PIC X(2).
           05  N-AREA            PIC X(2).
           05  FILLER            PIC X(24).
       LINKAGE SECTION.
       01  PARAMETER.
           05  PARAMETER-LENGTH    PIC S9(4) COMP-4.
           05  PARAMETER-CCYY      PIC 9(04).
           05  FILLER              PIC X(1).
           05  PARAMETER-CHARS     PIC X(26).

       PROCEDURE DIVISION.
       A000-BEGIN.
           MOVE 'pac2013.btr' TO B-PAC-NAME.
           


           DISPLAY 'BEGINNING PAC: PARAMETERS LISTED BELOW'
           DISPLAY B-PAC-NAME.

           MOVE -2 TO B-PAC-KEY-NUMBER.

            CALL WINAPI 'BTRV' USING by value B-OPEN,  
              by reference B-PAC-POSITION,
              OWNER-NAME, OWNER-LENGTH, B-PAC-NAME, 
              by value B-PAC-KEY-NUMBER.
           IF RETURN-CODE NOT = ZERO
              DISPLAY 'MSN OPEN FAILED--> ' RETURN-CODE
              GO TO DONE.

           MOVE 0 TO B-PAC-KEY-NUMBER.

           PERFORM PROCESSIT THRU PROCESS-EXIT.

           CALL WINAPI  'BTRV' USING  by value B-CLOSE, 
             by reference B-PAC-POSITION,
                OWNER-NAME, OWNER-LENGTH, 
                B-PAC-KEY-BUFFER, by value B-PAC-KEY-NUMBER.
           IF RETURN-CODE NOT = ZERO
              DISPLAY 'MSN CLOSE FAILED--> ' RETURN-CODE
              GO TO DONE.
       DONE.
           DISPLAY 'TOTAL RECORDS READ-> '  CNT.
           STOP RUN.

       PROCESSIT.
           MOVE 0 TO B-PAC-KEY-NUMBER.

           CALL WINAPI  'BTRV'  USING by value B-GET-GREATER, 
             by reference B-PAC-POSITION,
                PAC-RECORD, B-PAC-LENGTH, B-PAC-KEY-BUFFER, 
                by value B-PAC-KEY-NUMBER.
           IF RETURN-CODE NOT = ZERO  AND NOT = 9
              DISPLAY 'MSN GET-GR FAILED--> ' RETURN-CODE
              GO TO DONE.

       GET-NEXT.
           IF RETURN-CODE NOT = 0  
              GO TO PROCESS-EXIT.
           ADD 1 TO CNT.
           DISPLAY PAC-RECORD.
           DISPLAY CNT.

           CALL WINAPI  'BTRV' USING by value B-GET-NEXT,  
             by reference B-PAC-POSITION,
                PAC-RECORD, B-PAC-LENGTH, B-PAC-KEY-BUFFER, 
                by value B-PAC-KEY-NUMBER.
           GO TO GET-NEXT.

       PROCESS-EXIT. EXIT.
