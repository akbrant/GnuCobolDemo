
# define some Makefile variables for the compiler and compiler flags
# to use Makefile variables later in the Makefile: $()
#
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
#
# for C++ define  CC = g++
CC = cobc
CFLAGS  =  

#cobol coby books for compiler
COB_COPY_DIR=.\PANELS;.\CFECCOPY


# typing 'make' will invoke the first target entry in the file 
# (in this case the default target entry)
# you can name this target entry anything, but "default" or "all"
# are the most commonly used names by convention
#
default: ALL

# To create the executable file count we need the object files
# 

#

#build small helper functions.  build api for btrv. build interface for ScreenIO

dos_get_date: 
	$(CC) $(CFLAGS) -x dos_get_date.cob 


dos_get_time: 
    $(CC) $(CFLAGS) -c dos_get_time.cob 


btrapi: 
	$(CC) -cgv -static -I .\cBtrv\c .\cBtrv\c\btrapi.c -lw3btrv7 -L.\cBtrv\c\


Gs:
	$(CC) -cgv  -static -I.\SCREENIO\ .\SCREENIO\Gs.cob -lGs32

RESSCR:
	$(CC) -cgv  -static -I.\SCREENIO\ .\SCREENIO\RESSCR.cob -lGs32


#link all obj above into standard CFEC32 lib

libcfec32: dos_get_time btrapi Gs RESSCR
	lib /out:libcfec32.lib /machine:x86 RESSCR.obj btrapi.obj dos_get_time.obj 


Testpan: Gs
	$(CC) -xvg -static  -L.\SCREENIO\ -I.\SCREENIO\ .\SCREENIO\Testpan.cob Gs.obj -lGs32 

PACLOOK: libcfec32
  	cobc $(INC)  -xvg -static  PACLOOK.COB  -llibcfec32 -lw3btrv7 -L.\cBtrv\c\ 

ALL: dos_get_date dos_get_time btrapi Gs RESSCR

# To start over from scratch, type 'make clean'.  This
# removes the executable file, libcfec32.lib, as well as old .obj object
# files and *~ backup files:
#
clean: 
	$(RM) del *.c *.h *.sbr *.pdb *.i *.o *.exp *.obj *~ *.exe l*.dll libcfec32.lib Testpan.lib