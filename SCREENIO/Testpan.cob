       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTPAN.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-PC.
       OBJECT-COMPUTER. IBM-PC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * ------------------------: Main and the test panel copybooks:
	  COPY mymain.
	  COPY panel.

       PROCEDURE DIVISION.
      * ------------------------: Initialize; create the main window.
	  PERFORM DISPLAY-MAIN.
      * ------------------------: Display the panel
	  CALL 'GS' USING panel-1
			  panel-2
			  panel-3
			  panel-4.
      * ------------------------: Close main window before quitting.
	  SET mymain-DO-CLOSE TO TRUE.
	  PERFORM DISPLAY-MAIN.
	  STOP RUN.

      * ------------------------: Performed routines.
       DISPLAY-MAIN.
	  CALL 'GS' USING mymain-1
			  mymain-2
			  mymain-3
			  mymain-4.

