
with Win32;          use Win32;
with Win32.Winbase;  use Win32.Winbase;
with Win32.Winerror; use Win32.Winerror;
with Win32.Winnt;    use Win32.Winnt;
with Win32.Winsvc;   use Win32.Winsvc;

package body Service is

   procedure Handler (dwControl : Win32.DWORD) with Convention => Stdcall;

   Status_Handle : SERVICE_STATUS_HANDLE;
   Status        : aliased SERVICE_STATUS :=
     (dwServiceType             => SERVICE_WIN32_OWN_PROCESS,
      dwCurrentState            => SERVICE_START_PENDING,
      dwControlsAccepted        => 0,
      dwWin32ExitCode           => NO_ERROR,
      dwServiceSpecificExitCode => 0,
      dwCheckPoint              => 0,
      dwWaitHint                => 0);
   Stop_Event    : HANDLE;

   procedure Report_Status (State : Win32.DWORD);

   -------------
   -- Handler --
   -------------

   procedure Handler (dwControl : Win32.DWORD) is
      Dummy : BOOL;

   begin
      case dwControl is
         when SERVICE_CONTROL_STOP =>
            Report_Status (SERVICE_STOP_PENDING);
            Dummy := SetEvent (Stop_Event);

         when others =>
            Report_Status (Status.dwCurrentState);
      end case;
   end Handler;

   -------------------
   -- Report_Status --
   -------------------

   Report_Counter : Natural := 0;

   procedure Report_Status (State : Win32.DWORD) is
      Dummy  : BOOL;

   begin
      Report_Counter := Report_Counter + 1;

      Status.dwCurrentState := state;

      Dummy := SetServiceStatus (Status_Handle, Status'Access);
   end Report_Status;

   ------------------
   -- Service_Main --
   ------------------

   procedure Service_Main
     (dwNumServicesArgs   : Win32.DWORD;
      lpServiceArgVectors : access Win32.PSTR) is
   begin
      Status_Handle :=
        RegisterServiceCtrlHandler
          (Service_Name (Service_Name'First)'Access, Handler'Access);

      Report_Status (SERVICE_START_PENDING);

      Stop_Event := CreateEvent (null, Win32.TRUE, Win32.FALSE, null);

      Status.dwControlsAccepted :=
        SERVICE_ACCEPT_STOP or SERVICE_ACCEPT_SHUTDOWN;
      Report_Status (SERVICE_RUNNING);

      while WaitForSingleObject (Stop_Event, 1_000) /= WAIT_OBJECT_0 loop
         null;
      end loop;

      Report_Status (SERVICE_STOP_PENDING);

      Report_Status (SERVICE_STOPPED);
   end Service_Main;

end Service;
