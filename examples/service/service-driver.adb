
with Ada.Command_Line; use Ada.Command_Line;

with Win32;            use Win32;
with Win32.Winbase;    use Win32.Winbase;
with Win32.Winerror;   use Win32.Winerror;
with Win32.Winsvc;     use Win32.Winsvc;

procedure Service.Driver is
   Table : array (Positive range <>) of aliased SERVICE_TABLE_ENTRY :=
     ((Service_Name (Service_Name'First)'Access, Service_Main'Access),
      (null, null));

begin
   if StartServiceCtrlDispatcher (Table (Table'First)'Access) /= Win32.FALSE then
      Set_Exit_Status (0);

   elsif GetLastError = ERROR_FAILED_SERVICE_CONTROLLER_CONNECT then
      Set_Exit_Status (1);

   else
      Set_Exit_Status (2);
   end if;
end Service.Driver;
