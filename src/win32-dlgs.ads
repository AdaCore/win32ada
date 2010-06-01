-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"
--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the
--  entire risk as to the accuracy and the use of this file.
--
--  Copyright (C) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
--  This file is now maintained and made available by AdaCore under
--  the same terms.
--
--  Copyright (C) 2000-2010, AdaCore
--
-------------------------------------------------------------------------------

package Win32.Dlgs is

   ctlFirst         : constant := 16#400#;
   ctlLast          : constant := 16#4ff#;
   psh1             : constant := 16#400#;
   psh2             : constant := 16#401#;
   psh3             : constant := 16#402#;
   psh4             : constant := 16#403#;
   psh5             : constant := 16#404#;
   psh6             : constant := 16#405#;
   psh7             : constant := 16#406#;
   psh8             : constant := 16#407#;
   psh9             : constant := 16#408#;
   psh10            : constant := 16#409#;
   psh11            : constant := 16#40a#;
   psh12            : constant := 16#40b#;
   psh13            : constant := 16#40c#;
   psh14            : constant := 16#40d#;
   psh15            : constant := 16#40e#;
   pshHelp          : constant := 16#40e#;
   psh16            : constant := 16#40f#;
   chx1             : constant := 16#410#;
   chx2             : constant := 16#411#;
   chx3             : constant := 16#412#;
   chx4             : constant := 16#413#;
   chx5             : constant := 16#414#;
   chx6             : constant := 16#415#;
   chx7             : constant := 16#416#;
   chx8             : constant := 16#417#;
   chx9             : constant := 16#418#;
   chx10            : constant := 16#419#;
   chx11            : constant := 16#41a#;
   chx12            : constant := 16#41b#;
   chx13            : constant := 16#41c#;
   chx14            : constant := 16#41d#;
   chx15            : constant := 16#41e#;
   chx16            : constant := 16#41d#;
   rad1             : constant := 16#420#;
   rad2             : constant := 16#421#;
   rad3             : constant := 16#422#;
   rad4             : constant := 16#423#;
   rad5             : constant := 16#424#;
   rad6             : constant := 16#425#;
   rad7             : constant := 16#426#;
   rad8             : constant := 16#427#;
   rad9             : constant := 16#428#;
   rad10            : constant := 16#429#;
   rad11            : constant := 16#42a#;
   rad12            : constant := 16#42b#;
   rad13            : constant := 16#42c#;
   rad14            : constant := 16#42d#;
   rad15            : constant := 16#42e#;
   rad16            : constant := 16#42f#;
   grp1             : constant := 16#430#;
   grp2             : constant := 16#431#;
   grp3             : constant := 16#432#;
   grp4             : constant := 16#433#;
   frm1             : constant := 16#434#;
   frm2             : constant := 16#435#;
   frm3             : constant := 16#436#;
   frm4             : constant := 16#437#;
   rct1             : constant := 16#438#;
   rct2             : constant := 16#439#;
   rct3             : constant := 16#43a#;
   rct4             : constant := 16#43b#;
   ico1             : constant := 16#43c#;
   ico2             : constant := 16#43d#;
   ico3             : constant := 16#43e#;
   ico4             : constant := 16#43f#;
   stc1             : constant := 16#440#;
   stc2             : constant := 16#441#;
   stc3             : constant := 16#442#;
   stc4             : constant := 16#443#;
   stc5             : constant := 16#444#;
   stc6             : constant := 16#445#;
   stc7             : constant := 16#446#;
   stc8             : constant := 16#447#;
   stc9             : constant := 16#448#;
   stc10            : constant := 16#449#;
   stc11            : constant := 16#44a#;
   stc12            : constant := 16#44b#;
   stc13            : constant := 16#44c#;
   stc14            : constant := 16#44d#;
   stc15            : constant := 16#44e#;
   stc16            : constant := 16#44f#;
   stc17            : constant := 16#450#;
   stc18            : constant := 16#451#;
   stc19            : constant := 16#452#;
   stc20            : constant := 16#453#;
   stc21            : constant := 16#454#;
   stc22            : constant := 16#455#;
   stc23            : constant := 16#456#;
   stc24            : constant := 16#457#;
   stc25            : constant := 16#458#;
   stc26            : constant := 16#459#;
   stc27            : constant := 16#45a#;
   stc28            : constant := 16#45b#;
   stc29            : constant := 16#45c#;
   stc30            : constant := 16#45d#;
   stc31            : constant := 16#45e#;
   stc32            : constant := 16#45f#;
   lst1             : constant := 16#460#;
   lst2             : constant := 16#461#;
   lst3             : constant := 16#462#;
   lst4             : constant := 16#463#;
   lst5             : constant := 16#464#;
   lst6             : constant := 16#465#;
   lst7             : constant := 16#466#;
   lst8             : constant := 16#467#;
   lst9             : constant := 16#468#;
   lst10            : constant := 16#469#;
   lst11            : constant := 16#46a#;
   lst12            : constant := 16#46b#;
   lst13            : constant := 16#46c#;
   lst14            : constant := 16#46d#;
   lst15            : constant := 16#46e#;
   lst16            : constant := 16#46f#;
   cmb1             : constant := 16#470#;
   cmb2             : constant := 16#471#;
   cmb3             : constant := 16#472#;
   cmb4             : constant := 16#473#;
   cmb5             : constant := 16#474#;
   cmb6             : constant := 16#475#;
   cmb7             : constant := 16#476#;
   cmb8             : constant := 16#477#;
   cmb9             : constant := 16#478#;
   cmb10            : constant := 16#479#;
   cmb11            : constant := 16#47a#;
   cmb12            : constant := 16#47b#;
   cmb13            : constant := 16#47c#;
   cmb14            : constant := 16#47d#;
   cmb15            : constant := 16#47e#;
   cmb16            : constant := 16#47f#;
   edt1             : constant := 16#480#;
   edt2             : constant := 16#481#;
   edt3             : constant := 16#482#;
   edt4             : constant := 16#483#;
   edt5             : constant := 16#484#;
   edt6             : constant := 16#485#;
   edt7             : constant := 16#486#;
   edt8             : constant := 16#487#;
   edt9             : constant := 16#488#;
   edt10            : constant := 16#489#;
   edt11            : constant := 16#48a#;
   edt12            : constant := 16#48b#;
   edt13            : constant := 16#48c#;
   edt14            : constant := 16#48d#;
   edt15            : constant := 16#48e#;
   edt16            : constant := 16#48f#;
   scr1             : constant := 16#490#;
   scr2             : constant := 16#491#;
   scr3             : constant := 16#492#;
   scr4             : constant := 16#493#;
   scr5             : constant := 16#494#;
   scr6             : constant := 16#495#;
   scr7             : constant := 16#496#;
   scr8             : constant := 16#497#;
   FILEOPENORD      : constant := 1536;
   MULTIFILEOPENORD : constant := 1537;
   PRINTDLGORD      : constant := 1538;
   PRNSETUPDLGORD   : constant := 1539;
   FINDDLGORD       : constant := 1540;
   REPLACEDLGORD    : constant := 1541;
   FONTDLGORD       : constant := 1542;
   FORMATDLGORD31   : constant := 1543;
   FORMATDLGORD30   : constant := 1544;

   type CRGB is record
      bRed   : Win32.BYTE;
      bGreen : Win32.BYTE;
      bBlue  : Win32.BYTE;
      bExtra : Win32.BYTE;
   end record;

private

   pragma Convention (C_Pass_By_Copy, CRGB);

end Win32.Dlgs;
