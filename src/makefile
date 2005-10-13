
#  $Id$

INSTALL = /usr/local

I_INC	= $(INSTALL)/include/win32ada
I_LIB	= $(INSTALL)/lib/win32ada
I_GPR	= $(INSTALL)/lib/gnat

build:
	mkdir -p lib
	gnatmake -Pwin32ada_bld

install:
	rm -fr $(I_INC) $(I_LIB)
	mkdir -p $(I_INC)
	mkdir -p $(I_LIB)
	cp *.ad* $(I_INC)
	cp *.ali $(I_LIB)
	chmod uog-w $(I_LIB)/*.ali
	cp lib/*.a $(I_LIB)
	cp win32ada.gpr $(I_GPR)

clean:
	rm -fr *.ali *.o lib
