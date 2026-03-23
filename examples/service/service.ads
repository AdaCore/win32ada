
with Interfaces.C; use Interfaces.C;

with Win32;

package Service is

   Service_Name : Interfaces.C.char_array :=
     "AdaService" & Interfaces.c.nul;

   procedure Service_Main
     (dwNumServicesArgs   : Win32.DWORD;
      lpServiceArgVectors : access Win32.PSTR) with Convention => Stdcall;

end Service;
