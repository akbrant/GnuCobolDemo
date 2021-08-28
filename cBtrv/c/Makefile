# Makefile for Linux and Mac OS.
# Actian Zen must be installed on the machine.
CC = gcc
CFLAGS = -I../../intf/c

OSNAME = $(shell uname -s)
OSARCH = $(shell uname -m)

ifeq ($(OSNAME),Linux)
	ifeq ($(OSARCH),x86_64)
		CFLAGS += -DBTI_LINUX_64
		LIBDIR = $(ACTIANZEN_ROOT)/lib64
	else
	ifeq ($(OSARCH),aarch64)
		CFLAGS += -DBTI_LINUX_64
		LIBDIR = $(ACTIANZEN_ROOT)/lib64
	else
		CFLAGS += -DBTI_LINUX
		LIBDIR = $(ACTIANZEN_ROOT)/lib
	endif
	endif
else
	CFLAGS += -DBTI_MACOSX_64
	LIBDIR = $(ACTIANZEN_ROOT)/lib64
endif
LDLIBS = -lpsqlmif
ifeq ($(OSNAME),Linux)
    LDFLAGS += -L$(LIBDIR) -Wl,-rpath-link $(LIBDIR) 
else
    LDFLAGS += -L$(LIBDIR) -Wl,-rpath $(LIBDIR) 
endif

VPATH = ../../intf/c
EXECS = btrsamp loginapi
OBJS = btrapi.o btrsamp.o loginapi.o

default:
	@echo --------------------------------------------------------
	@echo  PSQL
	@echo  Btrieve samples
	@echo 
	@echo  Type \"make all\" to make all executables.
	@echo  Type \"make clean\" to remove object files.
	@echo  Type \"make cleanall\" to remove all non-source files.
	@echo --------------------------------------------------------

all: $(EXECS)

btrsamp: btrsamp.o btrapi.o
loginapi: loginapi.o

clean: 
	rm -f $(OBJS)

cleanall:
	rm -f $(OBJS) $(EXECS)
