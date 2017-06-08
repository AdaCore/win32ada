Win32Ada
========

Ada API to the Windows library.

Installation
------------

To configure, compile and install Win32Ada:

```
$ make build
$ make install
```

This will install Win32Ada into the current GNAT compiler standard
location.

Usage
-----

To include Win32Ada into your application you just need to import
the Win32Ada project file.

```
with "win32ada.gpr";
project Proj is
   ...
end Proj;
```
