       IDENTIFICATION DIVISION.
      * ----------------------------------------------------------------
      *  GUI ScreenIO GS stub.
      *
      *  This routine contains the compiler-specific code needed
      *  to call GUI ScreenIO from any COBOL compiler.    To use it:
      *
      *  1. De-comment the statements in the section for your compiler,
      *     as indicated in the comments.
      *
      *  2. Compile this program just as you would compile any other
      *     subroutine you use in your application.
      *
      *  3. Call THIS program (NOT GS32.DLL) from your application when
      *     you want to use GUI ScreenIO.
      *
      *  4. Link your application as you always do.  Include GS just as
      *     you'd link in any other subroutines of yours.
      *
      *     Include the library GS32.LIB when you link your application
      *     (it's provided with GUI ScreenIO).
      *
      *  ** Calling GS dynamically:
      *
      *     If you want to call GS dynamically, you need to LINK it as
      *     a DLL.  You also need to include a definition (.DEF) file
      *     when you link it, in order to export the symbol GSWINAPI.
      *     This is discussed in technical tips in the documentation,
      *     along with some good pointers on using object libraries.
      *
      *     There is little benefit to calling GS dynamically,
      *     unless you make changes to the Mandatory Shutdown section.
      *
      *     GS will always call GS32.DLL dynamically. This is necessary.
      *     The compiler specific SPECIAL-NAMES and CALL statements
      *     that appear below are required to tell your compiler how
      *     to manage calls and linking.  Without these your
      *     application will probably fail at run time.
      *
      * ----------------------------------------------------------------
      *  Compiler-specific notes:
      * ----------------------------------------------------------------
      *
      *  ** AcuCOBOL only:
      *
      *     You need to set the environmental value DLL_CONVENTION=1
      *     so the AcuCOBOL runtime calls GS32 properly.  This is
      *     in your documentation concerning calls to Windows APIs.
      *
      *  ** Micro Focus only:
      *
      *     If you compile GS as a .GNT the link step is unnecessary.
      *
      * ----------------------------------------------------------------
      *  Version notes:
      * ----------------------------------------------------------------
      *  IMPORTANT NOTE:  Early versions of GUI ScreenIO used the entry
      *  point name 'GS_WINAPI' to call our Windows APIs.  Because
      *  some compilers don't support an underscore character in
      *  program names, this has been changed to 'GSWINAPI'.
      *
      *  If you have programs that called the early version 'GS_WINAPI'
      *  you should change your CALLs to use the new name, 'GSWINAPI'.
      *
      *  If it isn't practical to change your programs, you may simply
      *  add the old entry point name to this program, thusly:
      *
      *    ENTRY 'GSWINAPI'         USING W A B C D E F.
      *    ENTRY 'GS_WINAPI'        USING W A B C D E F.
      *    CALL 'GSWAPI'            USING BY REFERENCE W A B C D E F.
      *    GOBACK.
      * ----------------------------------------------------------------
      *
       PROGRAM-ID. GS.
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       ENVIRONMENT DIVISION.
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-PC.
       OBJECT-COMPUTER. IBM-PC.
       SPECIAL-NAMES.
      *
      *--> Decomment following line for:  mbp COBOL <--*
      *     CALL-CONVENTION 10 IS WINAPI.
      *
      *--> Decomment following line for:  GNUCOBOL, OpenCobol, COBOL-IT
      *                   and Micro Focus COBOL.
           CALL-CONVENTION 64 IS WINAPI.
      *
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       DATA DIVISION.
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       LINKAGE SECTION.
       01  W                    PIC X.
       01  A.
       05  FILLER                PIC X(10).
       05  FILLER                PIC S9(4) COMP-5.
           88  CLOSE-AND-STOP-REQUESTED VALUE 8010.
           88  CLOSE-AND-STOP-MANDATORY VALUE -8010.
       01  B                    PIC X.
       01  Cvar                    PIC X.
       01  D                    PIC X.
       01  E                    PIC X.
       01  F                    PIC X.
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       PROCEDURE DIVISION USING A B Cvar D.
      * -====-
       0001-PASSTHROUGH-CALL.
      ***---------------------------------------------------------------
      ***--> AcuCOBOL and IBM VisualAge COBOL <--*
      *    Note:  AcuCOBOL requires the environmental DLL_CONVENTION=1
      *
      *    CALL 'GS32'              USING BY REFERENCE A B C D.
      *    IF CLOSE-AND-STOP-MANDATORY GO TO 0002-SHUTDOWN-MANDATORY.
      *    GOBACK.
      *    ENTRY 'GSWINAPI'         USING W A B C D E F.
      *    CALL 'GSWAPI'            USING BY REFERENCE W A B C D E F.
      *    GOBACK.
      ***---------------------------------------------------------------
      ***--> CA-Realia COBOL <--*

      * CALL 'S_GS32' USING BY REFERENCE A B Cvar D.
      * IF CLOSE-AND-STOP-MANDATORY GO TO 0002-SHUTDOWN-MANDATORY.
      * GOBACK.
      * ENTRY 'GSWINAPI' USING W A B Cvar D E F.
      * CALL 'S_GSWAPI' USING BY REFERENCE W A B Cvar D E F.
      * GOBACK.
      ***---------------------------------------------------------------
      ***--> Fujitsu COBOL <--*
      *
      *    CALL 'GS32' WITH STDCALL USING BY REFERENCE A B C D.
      *    IF CLOSE-AND-STOP-MANDATORY GO TO 0002-SHUTDOWN-MANDATORY.
      *    GOBACK.
      *    ENTRY 'GSWINAPI'         USING W A B C D E F.
      *    CALL 'GSWAPI' WITH STDCALL
      *                 USING BY REFERENCE W A B C D E F.
      *    GOBACK.
      ***---------------------------------------------------------------
      ***--> Micro Focus COBOL and mbp COBOL <--*
      *    Note:  Decomment the appropriate entry in SPECIAL-NAMES
      *       above.
      *
      *    CALL WINAPI 'GS32'       USING BY REFERENCE A B C D.
      *    IF CLOSE-AND-STOP-MANDATORY GO TO 0002-SHUTDOWN-MANDATORY.
      *    GOBACK.
      *    ENTRY 'GSWINAPI'         USING W A B C D E F.
      *    CALL WINAPI 'GSWAPI'     USING BY REFERENCE W A B C D E F.
      *    GOBACK.

      ***---------------------------------------------------------------
      ***--> GNUCOBOL (Formerly OpenCOBOL) OR COBOL-IT <---*
      *    Note:  Decomment the appropriate entry in SPECIAL-NAMES
      *       above.
      *
           CALL WINAPI 'GS32'       USING BY REFERENCE A B Cvar D.
           IF CLOSE-AND-STOP-MANDATORY GO TO 0002-SHUTDOWN-MANDATORY.
           GOBACK.
           ENTRY 'GSWINAPI'         USING W A B Cvar D E F.
           CALL WINAPI 'GSWAPI'     USING BY REFERENCE W A B Cvar D E F.
           GOBACK.

       0002-SHUTDOWN-MANDATORY.
      *             : This Mandatory Shutdown section will
      *             : be invoked  ONLY when your application
      *             : is running under the GUI ScreenIO
      *             : Client/Server layer, when the server
      *             : has lost contact with the client and/
      *             : or continuation is impossible.
      *             : Your program will first recieve three
      *             : consecutive close-and-stop events,
      *             : followed by the Mandatory stop.
      *             :
      *             : If you comment out this section or
      *             : ignore the mandatory stop your program
      *             : WILL be TERMINATED by the server.
      *             :
      *        >>>---------->    : THIS IS YOUR LAST CHANCE FOR GRACEFULL
      *             : SHUTDOWN.  IGNORE IT AT YOUR PERIL.
      *             : THE SERVER WILL KILL YOUR PROGRAM IF
      *             : YOU CALL GS TO DISPLAY ANOTHER PANEL.
      *             :
      *             : This section usually needs to be
      *             : modified to handle your specific needs
      *             : when shutting down your application
      *             : gracefully.
      *             :
      *             : Most compilers automatically shut all
      *             : open files upon a stop run. others
      *             : don't.  Check your compiler docs.
      *             :
      *             : Modify this section as needed to close
      *             : all open files and terminate the task
      *             : gracefully.  Do not be tempted to
      *             : comment this out.
      *             : You may also choose to handle
      *             : CLOSE-AND-STOP-REQUESTED here rather
      *             : than dealing with it in every panel.
       STOP RUN.

       