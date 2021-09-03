# GnuCobolDemo

See GunCobolWin10Howto.doc for pictures

Starting with a fresh install of windows 10 Pro. 

Download the following tools:
Git – source control, use to download sample cobol programs.
Gix-IDE – A IDE package that downloads and install the needed widows SDK and tool chain to compile windows version of Gnucobol.
GUIScreenIO – NORCOM screenIO, install to set system path to ScreenIO libs
VSCode – An editor with a weak cobol debugger, use any editor you want
Zen Workgroup 14 – Tools and drivers for database access to Btrieve database. 


Install tools into windows:
Install Git, using all the defaults.
Install Gix-Ide using all the defaults.  Install Visual Studio 2019 tools, about 2GB download. 
Install GUIscreenIO all defaults
Install VS code all defaults
Install Zen v14 SP2 Workgroup edition.  Use all defaults.

At this point my VM is 23GB 


Open a Console with tools and paths installed:
My Visual Studio compiled GNUcompiler was installed here: 
C:\Users\brant\AppData\Local\Gix\compiler-pkgs\gnucobol_3.1.2_vs_all_all

We are interested in 32bit tools so run this bat file and place short cut on desktop 
C:\Users\brant\AppData\Local\Gix\compiler-pkgs\gnucobol_3.1.2_vs_all_all\ set_env_vs_x86.bat

open the above shortcut to open an command prompt

change dir to:
c:\softeware\GnuCobolDemp

In command window type:
nmake -f makefile.make testpan

should build an testpan.exe, run it from command line 

to open vs code in project directory type:
code . 

good luck!

my dogs love me.
