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
      *:-	     Panel Name: PANEL	     Generated: 27/SEP/2003    *
      *:-	     Panel Ver.: 1	     PanelType: Full-Screen    *
      *:-	     Edited by.: Kevin J. Hansen		       *
      *:-	     Company...: Norcom 			       *
      *:-	     Loader Rev: 29	     Serial#..: 1	       *
      *:-	     Editor Rev: 15	     Machine..: NORCOM-KJH-VAIO*
      *:-	     Packer Rev: 29	     Memory...: 756	       *
      *:-	     RuntimeRev: 8	     Fields...: 	       *
      * 							       *
      *:> GUI ScreenIO Test Base Panel				       *
      * 							       *
      *:+ Generated 09/27/03 AT 10:02:10 BY NORCOM-KJH-VAIO	       *
      ******************************************************************
       01  PANEL-1.
      * 			:---------------------------------------
      * ------------------------: The panel-1 area contains fields
      * 			: used to communicate with the GUI
      * 			: ScreenIO runtime subroutine (GS).
      * 			:---------------------------------------
	   05  PANEL-1-HEADER.
	     10  PANEL-CURRENT-PANELSET.
	       15  PANEL-PANEL-NAME	   PIC X(8) VALUE 'PANEL'.
	       15  FILLER		     PIC S9(4) COMP-5 VALUE 1.
      * 			:---------------------------------------
      * 			: Events returned in response to menus,
      * 			: buttons, key-strokes, etc.	     .
      * 			: Note: Events Higher than 9000 will be
      * 			: handled by 'GS'. Don't code for them.
      * 			:---------------------------------------
	     10  PANEL-EVENT-ID 	    PIC S9(4) COMP-5 VALUE 0.
	       88  PANEL-EVENT-AUTO-RETURN	      VALUE 0.
	       88  PANEL-EVENT-INACTIVATED	      VALUE 8901.
	       88  PANEL-EVENT-ACTIVATED	      VALUE 8900.
	       88  PANEL-EVENT-CLOSE-WINDOW	      VALUE 8003.
	       88  PANEL-EVENT-CLOSE-AND-STOP	      VALUE 8010.
	       88  PANEL-EXIT			      VALUE 2.
      * 			:---------------------------------------
      * 			: Instructions for panel display:
      * 			:---------------------------------------
	     10  PANEL-DISPLAY-OPTION	    PIC S9(4) COMP-5 VALUE 0.
      * 			: This will display & await user input.
	       88  PANEL-DO-DISPLAY		      VALUE 0.
      * 			: All of the following immediately
      * 			: return with an EVENT-AUTO-RETURN.
	       88  PANEL-DO-DISPLAY-AND-RETURN	      VALUE 1.
	       88  PANEL-DO-CLOSE		      VALUE 2.
	       88  PANEL-DO-MINIMIZE		      VALUE 3.
	       88  PANEL-DO-MAXIMIZE		      VALUE 4.
	       88  PANEL-DO-RESTORE		      VALUE 5.
	       88  PANEL-DO-ACTIVATE		      VALUE 6.
	       88  PANEL-DO-UPDATE-MENU-ITEMS	      VALUE 08.
      * 			:---------------------------------------
      * 			: If you use multiple working sets,
      * 			: these indicate the name and set of
      * 			: the panel activated by the user.
      * 			:---------------------------------------
	     10  PANEL-ACTIVATED-PANELSET.
	       15  PANEL-ACTIVATED-PANEL-NAME	PIC X(8).
	       15  PANEL-ACTIVATED-WORKING-SET	PIC S9(4) COMP-5.
      * 			:---------------------------------------
      **			: Provided only for your information.
      * 			:---------------------------------------
	     10  PANEL-HWND		     PIC X(4) VALUE LOW-VALUES.
	     10  PANEL-FIELD-COUNT	  PIC S9(4) COMP-5 VALUE 0.
	     10  FILLER 		     PIC S9(4) COMP-5 VALUE 1.
      *
	     10  FILLER 		    PIC X(4) VALUE LOW-VALUES.
      * 			: Use this to display a message:
	     10  PANEL-MESSAGE-TEXT	  PIC X(120) VALUE SPACE.
      * 			: Where to display the message.
	     10  PANEL-MESSAGE-DESTINATION PIC S9(4) COMP-5 VALUE 0.
	       88  PANEL-MESSAGE-NOT-DISPLAYED	      VALUE 0.
	       88  PANEL-MESSAGE-BAR-BEEP	      VALUE 1.
	       88  PANEL-MESSAGE-BAR-SILENT	      VALUE 2.
	       88  PANEL-MESSAGE-BAR-PERSIST	      VALUE 3.
	       88  PANEL-MESSAGE-IN-MESSAGEBOX	      VALUE 10.
      * 			: Current size and position of the
      * 			: panel.  Updated if user moves it.
	     10  PANEL-SIZE-POSITION.
      * 			: In Pixels
	       15  PANEL-X-POSITION	  PIC S9(9) COMP-5 VALUE  1.
	       15  PANEL-Y-POSITION	  PIC S9(9) COMP-5 VALUE  1.
      * 			: In Dialog Box Units
	       15  PANEL-WIDTH		  PIC S9(9) COMP-5 VALUE 244.
	       15  PANEL-HEIGHT 	  PIC S9(9) COMP-5 VALUE 89.
	   05  PANEL-1-VARIABLE-PORTION.
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
	     10  PANEL-STRINGS-DEFAULT.
	       15  L--DEFAULT.
		 20  FILLER-STRING		     PIC X(48) VALUE
	      'GUI ScreenIO Test Panel&File&ExitHello, Windows!'.
		 20  FILLER-STRING PIC X(4) VALUE X'0D0A0D0A'.
		 20  FILLER			     PIC X(78) VALUE
	      "Congratulations, you've just created a Windows program" &
	      '!Closes this application'.
       01  PANEL-2.
      * 			:---------------------------------------
      * ------------------------: The panel-2 area is proprietary.
      * 			: Never! Never! NEVER! modify this!!
      * 			:---------------------------------------
	   05  FILLER				     PIC X(80) VALUE
	    X'F8FFC2010000E900000001003001000001000000010000000481AE' &
	    X'0381AE0381AE27C632010000380100003E0100004A010000500100' &
	    X'00500100005001000050010000500100005C010000B9010000B9'.
	   05  FILLER				     PIC X(80) VALUE
	    X'01000091010000B9010000BA010000C0010000C0010000C2012A81' &
	    X'0103814A0381010381010383010002078106038106038208020483' &
	    X'8010F403815905844E000001048305000D078502000100012B87'.
	   05  FILLER				     PIC X(73) VALUE
	    X'BA0100000100010383170018038305001D038305002203814A0781' &
	    X'6C03831700071181120381140381CC03812A0384010002500F8230' &
	    X'310481100D8330320212816403810883000000'.
      * 			 : Unused but still required in call.  *
       01  PANEL-3.
	   05  FILLER			      PIC X.
      * 			 : No fields, but required in call.
       01  PANEL-4.
	   05  FILLER			      PIC X.
      *
