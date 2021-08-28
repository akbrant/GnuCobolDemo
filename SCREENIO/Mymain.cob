      ******************************************************************
      * 							       *
      *  DO NOT EDIT!  : Created by GUI ScreenIO panel editor.	       *
      * 							       *
      *  DO NOT EDIT!  : Use the GUI ScreenIO panel editor to	       *
      * 	       : maintain this file.  NEVER use a text	       *
      * 	       : editor to modify it!!! 		       *
      * 							       *
      * 	       : This file is your panel source code.	       *
      * 	       : Store it in a safe place with the	       *
      * 	       : rest of your application source code.	       *
      * 	       : If lost, there is no means of recovery.       *
      * 							       *
      ******************************************************************
      *:-	     Panel Name: MYMAIN      Generated: 27/SEP/2003    *
      *:-	     Panel Ver.: 5	     PanelType: Main	       *
      *:-	     Edited by.: Kevin J. Hansen		       *
      *:-	     Company...: Norcom 			       *
      *:-	     Loader Rev: 29	     Serial#..: 1	       *
      *:-	     Editor Rev: 15	     Machine..: NORCOM-KJH-VAIO*
      *:-	     Packer Rev: 29	     Memory...: 915	       *
      *:-	     RuntimeRev: 8	     Fields...: 	       *
      * 							       *
      *:> Sample Main Panel					       *
      * 							       *
      *:+ Generated 09/27/03 AT 10:01:38 BY NORCOM-KJH-VAIO	       *
      ******************************************************************
       01  MYMAIN-1.
      * 			:---------------------------------------
      * ------------------------: The panel-1 area contains fields
      * 			: used to communicate with the GUI
      * 			: ScreenIO runtime subroutine (GS).
      * 			:---------------------------------------
	   05  MYMAIN-1-HEADER.
	     10  MYMAIN-CURRENT-PANELSET.
	       15  MYMAIN-PANEL-NAME	    PIC X(8) VALUE 'MYMAIN'.
	       15  FILLER		     PIC S9(4) COMP-5 VALUE 1.
      * 			:---------------------------------------
      * 			: Events returned in response to menus,
      * 			: buttons, key-strokes, etc.	     .
      * 			: Note: Events Higher than 9000 will be
      * 			: handled by 'GS'. Don't code for them.
      * 			:---------------------------------------
	     10  MYMAIN-EVENT-ID	    PIC S9(4) COMP-5 VALUE 0.
	       88  MYMAIN-EVENT-AUTO-RETURN	       VALUE 0.
	       88  MYMAIN-EVENT-INACTIVATED	     VALUES 8901 8903.
	       88  MYMAIN-EVENT-MINIMIZED	       VALUE 8903.
	       88  MYMAIN-EVENT-ACTIVATED	       VALUE 8900.
	       88  MYMAIN-EVENT-CLOSE-WINDOW	       VALUE 8003.
	       88  MYMAIN-EVENT-CLOSE-AND-STOP	       VALUE 8010.
      * 			:---------------------------------------
      * 			: Instructions for panel display:
      * 			:---------------------------------------
	     10  MYMAIN-DISPLAY-OPTION	    PIC S9(4) COMP-5 VALUE 1.
      * 			: This will display & await user input.
	       88  MYMAIN-DO-DISPLAY		       VALUE 0.
      * 			: All of the following immediately
      * 			: return with an EVENT-AUTO-RETURN.
	       88  MYMAIN-DO-DISPLAY-AND-RETURN        VALUE 1.
	       88  MYMAIN-DO-CLOSE		       VALUE 2.
	       88  MYMAIN-DO-MINIMIZE		       VALUE 3.
	       88  MYMAIN-DO-MAXIMIZE		       VALUE 4.
	       88  MYMAIN-DO-RESTORE		       VALUE 5.
	       88  MYMAIN-DO-ACTIVATE		       VALUE 6.
	       88  MYMAIN-DO-UPDATE-MENU-ITEMS	       VALUE 08.
      * 			:---------------------------------------
      * 			: If you use multiple working sets,
      * 			: these indicate the name and set of
      * 			: the panel activated by the user.
      * 			:---------------------------------------
	     10  MYMAIN-ACTIVATED-PANELSET.
	       15  MYMAIN-ACTIVATED-PANEL-NAME	 PIC X(8).
	       15  MYMAIN-ACTIVATED-WORKING-SET  PIC S9(4) COMP-5.
      * 			:---------------------------------------
      **			: Provided only for your information.
      * 			:---------------------------------------
	     10  MYMAIN-HWNDMAIN	     PIC X(4) VALUE LOW-VALUES.
	     10  MYMAIN-FIELD-COUNT	   PIC S9(4) COMP-5 VALUE 0.
	     10  FILLER 		     PIC S9(4) COMP-5 VALUE 1.
      *
	     10  FILLER 		    PIC X(4) VALUE LOW-VALUES.
      * 			: Use this to display a message:
	     10  MYMAIN-MESSAGE-TEXT	   PIC X(120) VALUE SPACE.
      * 			: Where to display the message.
	     10  MYMAIN-MESSAGE-DESTINATION PIC S9(4) COMP-5 VALUE 0.
	       88  MYMAIN-MESSAGE-NOT-DISPLAYED        VALUE 0.
	       88  MYMAIN-MESSAGE-BAR-BEEP	       VALUE 1.
	       88  MYMAIN-MESSAGE-BAR-SILENT	       VALUE 2.
	       88  MYMAIN-MESSAGE-BAR-PERSIST	       VALUE 3.
	       88  MYMAIN-MESSAGE-IN-MESSAGEBOX        VALUE 10.
      * 			: Current size and position of the
      * 			: panel.  Updated if user moves it.
	     10  MYMAIN-SIZE-POSITION.
      * 			: In Pixels
	       15  MYMAIN-X-POSITION	   PIC S9(9) COMP-5 VALUE  1.
	       15  MYMAIN-Y-POSITION	   PIC S9(9) COMP-5 VALUE  1.
      * 			: In Dialog Box Units
	       15  MYMAIN-WIDTH 	   PIC S9(9) COMP-5 VALUE 350.
	       15  MYMAIN-HEIGHT	   PIC S9(9) COMP-5 VALUE 200.
	   05  MYMAIN-1-VARIABLE-PORTION.
      *
      * 			:---------------------------------------
      * 			: Text Strings:
      * 			:  These strings are multi-lingual
      * 			:  text for the various parts of your
      * 			:  panel.  Values may be changed at
      * 			:  run time. Layout and size may not.
      * 			:
      * 			:  References to these fields must
      * 			:  be qualified if more than one
      * 			:  language is supported.  Example:
      * 			:      MOVE 'Oui' TO H--YESNO OF
      * 			:		     PANEL-FRENCH.
      * 			:---------------------------------------
	     10  MYMAIN-STRINGS-DEFAULT.
	       15  L--DEFAULT			     PIC X(23) VALUE
	      'GUI ScreenIO Test Panel'.
       01  MYMAIN-2.
      * 			:---------------------------------------
      * ------------------------: The panel-2 area is proprietary.
      * 			: Never! Never! NEVER! modify this!!
      * 			:---------------------------------------
	   05  FILLER				     PIC X(80) VALUE
	    X'F8FF47010000A90000000600C500000006000000810100000481AE' &
	    X'0381AE0381AE27C632010000380100003E0100003E0100003E0100' &
	    X'003E0100003E0100003E0100003E0100003E0100003E0100003E'.
	   05  FILLER				     PIC X(80) VALUE
	    X'0100003E0100003E0100003F010000450100004501000047012A85' &
	    X'05002000170381010781010981010381010987CF105E010000C805' &
	    X'844E000001048305000D0981012D873F01000001000103841700'.
	   05  FILLER				     PIC X(9) VALUE
	    X'006403810883000000'.
      * 			: DO NOT MODIFY this section.	       *
       01  MYMAIN-3.
	   05  FILLER			      PIC S99 VALUE -10.
	   05  FILLER			      PIC S9  VALUE -9.
	   05  FILLER			      PIC S99 VALUE +10.
	   05  FILLER			      PIC S9  VALUE +9.
       01  MYMAIN-4.
      * ------------------------: Instance handle assigned to
      * 			: your application by Windows.
      * 			: Provided for information only.
	   05  MYMAIN-HINSTANCE 	      PIC X(4).
      * ------------------------: Specifies whether multiple instances
      * 			: of your application may be run
      * 			: concurrently.  If not, an
      * 			: attempt to launch a second copy
      * 			: will activate the first instance.
	   05  FILLER			      PIC X VALUE 'N'.
	     88  MYMAIN-MULTIPLE-INSTANCE-YES VALUE 'Y'.
	     88  MYMAIN-MULTIPLE-INSTANCE-NO  VALUE 'N'.
      * ------------------------: Registry keys GUI ScreenIO uses
      * 			: if storing data in the registry.
	   05  MYMAIN-COMPANY-NAME-KEY	      PIC X(50) VALUE
		   'Testpan Application'.
	   05  MYMAIN-APPLICATION-NAME-KEY    PIC X(30) VALUE
		   'Testpan Application'.
      * ------------------------: GUI ScreenIO version information
	   05  MYMAIN-RUNTIME-VERSION.
	     10  MYMAIN-RUNTIME-VERSION-MAJOR	PIC 9 VALUE ZERO.
	     10  MYMAIN-RUNTIME-VERSION-MINOR	PIC 9 VALUE ZERO.
	     10  MYMAIN-RUNTIME-VERSION-LEVEL	PIC 9(3) VALUE ZERO.
      * ------------------------: Help Subsystem type to use
	   05  MYMAIN-HELP-SUBSYSTEM.
	     10  MYMAIN-HELP-SUBSYSTEM-TYPE  PIC XXX VALUE SPACE.
	       88  MYMAIN-HELP-NOT-USED 	  VALUE SPACE.
	       88  MYMAIN-HELP-WINDOWS-HTMLHELP   VALUE 'CHM'.
	       88  MYMAIN-HELP-WINDOWS-WINHELP	  VALUE 'HLP'.
	       88  MYMAIN-HELP-SCREENIO-HTML	  VALUE 'HTM'.
	       88  MYMAIN-HELP-INTERNET-HTML	  VALUE 'URL'.
      * ------------------------: Location/URL of help files
      * 			: Examples http://www.mydocs.com/
      * 			:	   C:\HELPDOCS\
	     10  MYMAIN-HELP-ROOT	PIC X(121) VALUE LOW-VALUES.
      * 			: If this is set (it is the default)
      * 			: help subsystem will expect to find
      * 			: help in the HELP subdirectory within
      * 			: the directory from which the program
      * 			: was loaded.
	       88  MYMAIN-DEFAULT-HELP-ROOT  VALUE LOW-VALUES.
	   05  FILLER		     PIC X(171) VALUE LOW-VALUES.
      *
