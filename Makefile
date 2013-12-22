############################################################################
#                                 Win32Ada                                 #
#                                                                          #
#                    Copyright (C) 2008-2014, AdaCore                      #
#                                                                          #
#  This library is free software; you can redistribute it and/or modify    #
#  it under the terms of the GNU General Public License as published by    #
#  the Free Software Foundation; either version 2 of the License, or (at   #
#  your option) any later version.                                         #
#                                                                          #
#  This library is distributed in the hope that it will be useful, but     #
#  WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU       #
#  General Public License for more details.                                #
#                                                                          #
#  You should have received a copy of the GNU General Public License       #
#  along with this library; if not, write to the Free Software Foundation, #
#  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.          #
#                                                                          #
#  As a special exception, if other files instantiate generics from this   #
#  unit, or you link this unit with other files to produce an executable,  #
#  this  unit  does not  by itself cause  the resulting executable to be   #
#  covered by the GNU General Public License. This exception does not      #
#  however invalidate any other reasons why the executable file  might be  #
#  covered by the  GNU Public License.                                     #
############################################################################

.SILENT:

############################################################################
#  Default configuration
prefix	 	= $(dir $(shell which gnatls))..
ENABLE_SHARED 	= true
PROCESSORS	= 2
DEBUG		= false
TARGET		= $(shell gcc -dumpmachine)

-include makefile.setup

MKDIR		= mkdir
CP		= cp -p
GPRBUILD	= gprbuild
GPRCLEAN	= gprclean
GPRINSTALL	= gprinstall
RM		= rm -f

HOST		= $(shell gcc -dumpmachine)

GPROPTS		= -XPRJ_TARGET=$(PRJ_TARGET) -XTARGET=$(TARGET)

BUILD   	= .build/$(TARGET)

ifeq ($(HOST), $(TARGET))
TPREFIX=$(prefix)
else
GPROPTS		+= --target=$(TARGET)
TPREFIX=$(prefix)/$(TARGET)
endif

ifeq ($(strip $(findstring x86_64, $(TARGET))),x86_64)
   PRJ_TARGET=Win64
else
ifeq ($(strip $(findstring i686, $(TARGET))),i686)
   PRJ_TARGET=Win32
else
@error Unrecognized target
endif
endif

ifeq ($(DEBUG), true)
BDIR		= $(BUILD)/debug
GPROPTS		+= -XPRJ_BUILD=Debug
else
BDIR		= $(BUILD)/release
GPROPTS		+= -XPRJ_BUILD=Release
endif

############################################################################

all: build

setup:
	echo "prefix=$(prefix)" > makefile.setup
	echo "ENABLE_SHARED=$(ENABLE_SHARED)" >> makefile.setup
	echo "DEBUG=$(DEBUG)" >> makefile.setup
	echo "PROCESSORS=$(PROCESSORS)" >> makefile.setup
	echo "TARGET=$(TARGET)" >> makefile.setup

install-clean:
ifneq (,$(wildcard $(TPREFIX)/share/gpr/manifests/win32ada))
	-$(GPRINSTALL) $(GPROPTS) --uninstall --prefix=$(TPREFIX) win32ada
endif

install: install-clean
	$(GPRINSTALL) $(GPROPTS) -p -f --prefix=$(TPREFIX) \
		-XLIBRARY_TYPE=static -P win32ada
ifeq (${ENABLE_SHARED}, true)
	$(GPRINSTALL) $(GPROPTS) -p -f --prefix=$(TPREFIX) \
		-XLIBRARY_TYPE=relocatable --build-name=relocatable -P win32ada
endif

build:
	$(GPRBUILD) -p $(GPROPTS) -j$(PROCESSORS) \
		-XLIBRARY_TYPE=static -P win32ada
ifeq (${ENABLE_SHARED}, true)
	$(GPRBUILD) -p $(GPROPTS) -j$(PROCESSORS) \
		-XLIBRARY_TYPE=relocatable -P win32ada
endif

clean:
	$(GPRCLEAN) $(GPROPTS) -XLIBRARY_TYPE=static -P win32ada
ifeq (${ENABLE_SHARED}, true)
	$(GPRCLEAN) $(GPROPTS) -XLIBRARY_TYPE=relocatable -P win32ada
endif
	$(RM) -fr $(BUILD) makefile.setup
