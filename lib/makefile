
# $Id$

CFILES	= dump.c stdlib_wrapper.c var.c wrappers.c

OFILES	= $(CFILES:.c=.o)

CFLAGS	= -nostdinc -Ic:/winapps/msdev/include

all: build_archive

build_archive: $(OFILES)
	ar cr libwin32ada.a $(OFILES)

clean:
	rm *.o *.a
