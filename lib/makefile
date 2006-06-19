
# $Id$

DEF_FILES	= advapi32.def cap.def comctl32.def comdlg32.def ctl3d32.def \
	dlcapi.def gdi32.def glu32.def imm32.def kernel32.def \
	lz32.def mapi32.def mfcuia32.def mgmtapi.def mpr.def \
	msacm32.def nddeapi.def netapi32.def odbc32.def ole32.def \
	oleaut32.def oledlg.def olepro32.def opengl32.def penwin32.def \
	pkpd32.def rasapi32.def rpcdce4.def rpcns4.def rpcrt4.def \
	shell32.def svrapi.def tapi32.def th32.def thunk32.def \
	url.def user32.def vdmdbg.def version.def vfw32.def \
	win32spl.def winmm.def winspool.def winstrm.def wow32.def \
	wsock32.def wst.def

LIB_FILES	= $(DEF_FILES:.def=.a)

CFILES	= dump.c stdlib_wrapper.c var.c wrappers.c

OFILES	= $(CFILES:.c=.o)

.def.a:
	dlltool -k --dllname `basename $@ .a`.dll --def $< --output-lib lib$@

all: build_win32ada

build_win32ada: $(OFILES)
	ar cr libwin32ada.a $(OFILES)

clean:
	rm *.o *.a

build_ntlibs: $(LIB_FILES)
