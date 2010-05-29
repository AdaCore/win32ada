############################################################################
#                                 Win32Ada                                 #
#                                                                          #
#                    Copyright (C) 2008-2010, AdaCore                      #
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

-include makefile.setup

MKDIR		= mkdir
CP		= cp -p
GPRBUILD	= gprbuild
GPRCLEAN	= gprclean
RM		= rm -f

HOST		= $(shell gcc -dumpmachine)

GMOPTS		= -j$(PROCESSORS) -XPRJ_HOST=$(HOST)

BUILD   	= .build/$(HOST)

ifeq ($(DEBUG), true)
BDIR		= $(BUILD)/debug
GMOPTS		:= $(GMOPTS) -XPRJ_BUILD=Debug
else
BDIR		= $(BUILD)/release
GMOPTS		:= $(GMOPTS) -XPRJ_BUILD=Release
endif

############################################################################

all: build

setup:
	echo "prefix=$(prefix)" > makefile.setup
	echo "ENABLE_SHARED=$(ENABLE_SHARED)" >> makefile.setup
	echo "DEBUG=$(DEBUG)" >> makefile.setup
	echo "PROCESSORS=$(PROCESSORS)" >> makefile.setup

install:
	$(MKDIR) -p $(prefix)/lib/win32ada/static
	$(CP) -pr $(BDIR)/static/lib/* $(prefix)/lib/win32ada/static/
ifeq (${ENABLE_SHARED}, true)
	$(MKDIR) -p $(prefix)/lib/win32ada/relocatable
	$(CP) -pr $(BDIR)/relocatable/lib/* $(prefix)/lib/win32ada/relocatable/
endif
	$(MKDIR) -p $(prefix)/include/win32ada
	$(CP) -pr src/*.ad* $(prefix)/include/win32ada/
	$(MKDIR) -p $(prefix)/lib/gnat
	$(CP) config/projects/win32ada.gpr $(prefix)/lib/gnat/

build:
	$(GPRBUILD) -p $(GMOPTS) -XLIBRARY_TYPE=static -P win32ada
ifeq (${ENABLE_SHARED}, true)
	$(GPRBUILD) -p $(GMOPTS) -XLIBRARY_TYPE=relocatable -P win32ada
endif

clean:
	$(GPRCLEAN) -XLIBRARY_TYPE=static -P win32ada
ifeq (${ENABLE_SHARED}, true)
	$(GPRCLEAN) -XLIBRARY_TYPE=relocatable -P win32ada
endif
	$(RM) -r $(BUILD)
