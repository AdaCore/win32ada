--  $Source$

--  $Revision$ $Date$ $Author$

-------------------------------------------------------------------------------

--

--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE

--  "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING

--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR

--  FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to

--  the accuracy and the use of this file.  This file may be used, copied,

--  modified and distributed only by licensees of Microsoft Corporation's

--  WIN32 Software Development Kit in accordance with the terms of the

--  licensee's End-User License Agreement for Microsoft Software for the

--  WIN32 Development Kit.

--

--  Copyright (c) Intermetrics, Inc. 1995

--  Portions (c) 1985-1994 Microsoft Corporation with permission.

--  Microsoft is a registered trademark and Windows and Windows NT are

--  trademarks of Microsoft Corporation.

--

-------------------------------------------------------------------------------



with Win32.Winbase;

with Win32.Windef;

with Win32.Winnt;



package Win32.Mmsystem is



   MAXPNAMELEN : constant := 32;        --  mmsystem.h:48

   MAXERRORLENGTH : constant := 128;       --  mmsystem.h:49

   MM_MICROSOFT : constant := 1;         --  mmsystem.h:63

   MM_MIDI_MAPPER : constant := 1;         --  mmsystem.h:68

   MM_WAVE_MAPPER : constant := 2;         --  mmsystem.h:69

   MM_SNDBLST_MIDIOUT : constant := 3;         --  mmsystem.h:71

   MM_SNDBLST_MIDIIN : constant := 4;         --  mmsystem.h:72

   MM_SNDBLST_SYNTH : constant := 5;         --  mmsystem.h:73

   MM_SNDBLST_WAVEOUT : constant := 6;         --  mmsystem.h:74

   MM_SNDBLST_WAVEIN : constant := 7;         --  mmsystem.h:75

   MM_ADLIB : constant := 9;         --  mmsystem.h:77

   MM_MPU401_MIDIOUT : constant := 10;        --  mmsystem.h:79

   MM_MPU401_MIDIIN : constant := 11;        --  mmsystem.h:80

   MM_PC_JOYSTICK : constant := 12;        --  mmsystem.h:82

   TIME_MS : constant := 16#1#;     --  mmsystem.h:133

   TIME_SAMPLES : constant := 16#2#;     --  mmsystem.h:134

   TIME_BYTES : constant := 16#4#;     --  mmsystem.h:135

   TIME_SMPTE : constant := 16#8#;     --  mmsystem.h:136

   TIME_MIDI : constant := 16#10#;    --  mmsystem.h:137

   TIME_TICKS : constant := 16#20#;    --  mmsystem.h:138

   MM_JOY1MOVE : constant := 16#3a0#;   --  mmsystem.h:147

   MM_JOY2MOVE : constant := 16#3a1#;   --  mmsystem.h:148

   MM_JOY1ZMOVE : constant := 16#3a2#;   --  mmsystem.h:149

   MM_JOY2ZMOVE : constant := 16#3a3#;   --  mmsystem.h:150

   MM_JOY1BUTTONDOWN : constant := 16#3b5#;   --  mmsystem.h:151

   MM_JOY2BUTTONDOWN : constant := 16#3b6#;   --  mmsystem.h:152

   MM_JOY1BUTTONUP : constant := 16#3b7#;   --  mmsystem.h:153

   MM_JOY2BUTTONUP : constant := 16#3b8#;   --  mmsystem.h:154

   MM_MCINOTIFY : constant := 16#3b9#;   --  mmsystem.h:156

   MM_WOM_OPEN : constant := 16#3bb#;   --  mmsystem.h:158

   MM_WOM_CLOSE : constant := 16#3bc#;   --  mmsystem.h:159

   MM_WOM_DONE : constant := 16#3bd#;   --  mmsystem.h:160

   MM_WIM_OPEN : constant := 16#3be#;   --  mmsystem.h:162

   MM_WIM_CLOSE : constant := 16#3bf#;   --  mmsystem.h:163

   MM_WIM_DATA : constant := 16#3c0#;   --  mmsystem.h:164

   MM_MIM_OPEN : constant := 16#3c1#;   --  mmsystem.h:166

   MM_MIM_CLOSE : constant := 16#3c2#;   --  mmsystem.h:167

   MM_MIM_DATA : constant := 16#3c3#;   --  mmsystem.h:168

   MM_MIM_LONGDATA : constant := 16#3c4#;   --  mmsystem.h:169

   MM_MIM_ERROR : constant := 16#3c5#;   --  mmsystem.h:170

   MM_MIM_LONGERROR : constant := 16#3c6#;   --  mmsystem.h:171

   MM_MOM_OPEN : constant := 16#3c7#;   --  mmsystem.h:173

   MM_MOM_CLOSE : constant := 16#3c8#;   --  mmsystem.h:174

   MM_MOM_DONE : constant := 16#3c9#;   --  mmsystem.h:175

   MM_MCISYSTEM_STRING : constant := 16#3ca#;   --  mmsystem.h:176

   MM_MIXM_LINE_CHANGE : constant := 16#3d0#;   --  mmsystem.h:178

   MM_MIXM_CONTROL_CHANGE : constant := 16#3d1#;   --  mmsystem.h:179

   MMSYSERR_BASE : constant := 0;         --  mmsystem.h:189

   WAVERR_BASE : constant := 32;        --  mmsystem.h:190

   MIDIERR_BASE : constant := 64;        --  mmsystem.h:191

   TIMERR_BASE : constant := 96;        --  mmsystem.h:192

   JOYERR_BASE : constant := 160;       --  mmsystem.h:193

   MCIERR_BASE : constant := 256;       --  mmsystem.h:194

   MCI_STRING_OFFSET : constant := 512;       --  mmsystem.h:196

   MIXERR_BASE : constant := 1024;      --  mmsystem.h:198

   MCI_VD_OFFSET : constant := 1024;      --  mmsystem.h:200

   MCI_CD_OFFSET : constant := 1088;      --  mmsystem.h:201

   MCI_WAVE_OFFSET : constant := 1152;      --  mmsystem.h:202

   MCI_SEQ_OFFSET : constant := 1216;      --  mmsystem.h:203

   MMSYSERR_NOERROR : constant := 0;         --  mmsystem.h:212

   MMSYSERR_ERROR : constant := 1;         --  mmsystem.h:213

   MMSYSERR_BADDEVICEID : constant := 2;         --  mmsystem.h:214

   MMSYSERR_NOTENABLED : constant := 3;         --  mmsystem.h:215

   MMSYSERR_ALLOCATED : constant := 4;         --  mmsystem.h:216

   MMSYSERR_INVALHANDLE : constant := 5;         --  mmsystem.h:217

   MMSYSERR_NODRIVER : constant := 6;         --  mmsystem.h:218

   MMSYSERR_NOMEM : constant := 7;         --  mmsystem.h:219

   MMSYSERR_NOTSUPPORTED : constant := 8;         --  mmsystem.h:220

   MMSYSERR_BADERRNUM : constant := 9;         --  mmsystem.h:221

   MMSYSERR_INVALFLAG : constant := 10;        --  mmsystem.h:222

   MMSYSERR_INVALPARAM : constant := 11;        --  mmsystem.h:223

   MMSYSERR_HANDLEBUSY : constant := 12;        --  mmsystem.h:224

   MMSYSERR_INVALIDALIAS : constant := 13;        --  mmsystem.h:227

   MMSYSERR_LASTERROR : constant := 13;        --  mmsystem.h:228

   DRV_LOAD : constant := 16#1#;     --  mmsystem.h:244

   DRV_ENABLE : constant := 16#2#;     --  mmsystem.h:245

   DRV_OPEN : constant := 16#3#;     --  mmsystem.h:246

   DRV_CLOSE : constant := 16#4#;     --  mmsystem.h:247

   DRV_DISABLE : constant := 16#5#;     --  mmsystem.h:248

   DRV_FREE : constant := 16#6#;     --  mmsystem.h:249

   DRV_CONFIGURE : constant := 16#7#;     --  mmsystem.h:250

   DRV_QUERYCONFIGURE : constant := 16#8#;     --  mmsystem.h:251

   DRV_INSTALL : constant := 16#9#;     --  mmsystem.h:252

   DRV_REMOVE : constant := 16#a#;     --  mmsystem.h:253

   DRV_EXITSESSION : constant := 16#b#;     --  mmsystem.h:254

   DRV_POWER : constant := 16#f#;     --  mmsystem.h:255

   DRV_RESERVED : constant := 16#800#;   --  mmsystem.h:256

   DRV_USER : constant := 16#4000#;  --  mmsystem.h:257

   DRVCNF_CANCEL : constant := 16#0#;     --  mmsystem.h:270

   DRVCNF_OK : constant := 16#1#;     --  mmsystem.h:271

   DRVCNF_RESTART : constant := 16#2#;     --  mmsystem.h:272

   DRV_CANCEL : constant := 16#0#;     --  mmsystem.h:275

   DRV_OK : constant := 16#1#;     --  mmsystem.h:276

   DRV_RESTART : constant := 16#2#;     --  mmsystem.h:277

   DRV_MCI_FIRST : constant := 16#800#;   --  mmsystem.h:288

   DRV_MCI_LAST : constant := 16#17ff#;  --  mmsystem.h:289

   CALLBACK_TYPEMASK : constant := 16#70000#; --  mmsystem.h:303

   CALLBACK_NULL : constant := 16#0#;     --  mmsystem.h:304

   CALLBACK_WINDOW : constant := 16#10000#; --  mmsystem.h:305

   CALLBACK_TASK : constant := 16#20000#; --  mmsystem.h:306

   CALLBACK_THREAD : constant := 16#20000#; --  mmsystem.h:307

   CALLBACK_FUNCTION : constant := 16#30000#; --  mmsystem.h:308

   SND_ALIAS : constant := 16#10000#; --  mmsystem.h:378

   SND_FILENAME : constant := 16#20000#; --  mmsystem.h:379

   SND_RESOURCE : constant := 16#40004#; --  mmsystem.h:380

   SND_SYNC : constant := 16#0#;     --  mmsystem.h:382

   SND_ASYNC : constant := 16#1#;     --  mmsystem.h:383

   SND_NODEFAULT : constant := 16#2#;     --  mmsystem.h:384

   SND_MEMORY : constant := 16#4#;     --  mmsystem.h:385

   SND_LOOP : constant := 16#8#;     --  mmsystem.h:386

   SND_NOSTOP : constant := 16#10#;    --  mmsystem.h:387

   SND_NOWAIT : constant := 16#2000#;  --  mmsystem.h:389

   SND_VALIDFLAGS : constant := 16#17201f#; --  mmsystem.h:390

   SND_RESERVED : constant := 16#ff000000#;

   --  mmsystem.h:392

   SND_TYPE_MASK : constant := 16#170007#; --  mmsystem.h:393

   SND_ALIAS_ID : constant := 16#110000#; --  mmsystem.h:394

   SND_ALIAS_START : constant := 0;         --  mmsystem.h:395

   WAVERR_BADFORMAT : constant := 32;        --  mmsystem.h:416

   WAVERR_STILLPLAYING : constant := 33;        --  mmsystem.h:417

   WAVERR_UNPREPARED : constant := 34;        --  mmsystem.h:418

   WAVERR_SYNC : constant := 35;        --  mmsystem.h:419

   WAVERR_LASTERROR : constant := 35;        --  mmsystem.h:420

   WOM_OPEN : constant := 16#3bb#;   --  mmsystem.h:434

   WOM_CLOSE : constant := 16#3bc#;   --  mmsystem.h:435

   WOM_DONE : constant := 16#3bd#;   --  mmsystem.h:436

   WIM_OPEN : constant := 16#3be#;   --  mmsystem.h:437

   WIM_CLOSE : constant := 16#3bf#;   --  mmsystem.h:438

   WIM_DATA : constant := 16#3c0#;   --  mmsystem.h:439

   WAVE_FORMAT_QUERY : constant := 16#1#;     --  mmsystem.h:445

   WAVE_ALLOWSYNC : constant := 16#2#;     --  mmsystem.h:446

   WHDR_DONE : constant := 16#1#;     --  mmsystem.h:464

   WHDR_PREPARED : constant := 16#2#;     --  mmsystem.h:465

   WHDR_BEGINLOOP : constant := 16#4#;     --  mmsystem.h:466

   WHDR_ENDLOOP : constant := 16#8#;     --  mmsystem.h:467

   WHDR_INQUEUE : constant := 16#10#;    --  mmsystem.h:468

   WAVECAPS_PITCH : constant := 16#1#;     --  mmsystem.h:520

   WAVECAPS_PLAYBACKRATE : constant := 16#2#;     --  mmsystem.h:521

   WAVECAPS_VOLUME : constant := 16#4#;     --  mmsystem.h:522

   WAVECAPS_LRVOLUME : constant := 16#8#;     --  mmsystem.h:523

   WAVECAPS_SYNC : constant := 16#10#;    --  mmsystem.h:524

   WAVE_INVALIDFORMAT : constant := 16#0#;     --  mmsystem.h:567

   WAVE_FORMAT_1M08 : constant := 16#1#;     --  mmsystem.h:568

   WAVE_FORMAT_1S08 : constant := 16#2#;     --  mmsystem.h:569

   WAVE_FORMAT_1M16 : constant := 16#4#;     --  mmsystem.h:570

   WAVE_FORMAT_1S16 : constant := 16#8#;     --  mmsystem.h:571

   WAVE_FORMAT_2M08 : constant := 16#10#;    --  mmsystem.h:572

   WAVE_FORMAT_2S08 : constant := 16#20#;    --  mmsystem.h:573

   WAVE_FORMAT_2M16 : constant := 16#40#;    --  mmsystem.h:574

   WAVE_FORMAT_2S16 : constant := 16#80#;    --  mmsystem.h:575

   WAVE_FORMAT_4M08 : constant := 16#100#;   --  mmsystem.h:576

   WAVE_FORMAT_4S08 : constant := 16#200#;   --  mmsystem.h:577

   WAVE_FORMAT_4M16 : constant := 16#400#;   --  mmsystem.h:578

   WAVE_FORMAT_4S16 : constant := 16#800#;   --  mmsystem.h:579

   WAVE_FORMAT_PCM : constant := 1;         --  mmsystem.h:598

   MIDIERR_UNPREPARED : constant := 64;        --  mmsystem.h:726

   MIDIERR_STILLPLAYING : constant := 65;        --  mmsystem.h:727

   MIDIERR_NOMAP : constant := 66;        --  mmsystem.h:728

   MIDIERR_NOTREADY : constant := 67;        --  mmsystem.h:729

   MIDIERR_NODEVICE : constant := 68;        --  mmsystem.h:730

   MIDIERR_INVALIDSETUP : constant := 69;        --  mmsystem.h:731

   MIDIERR_BADOPENMODE : constant := 70;        --  mmsystem.h:732

   MIDIERR_LASTERROR : constant := 69;        --  mmsystem.h:733

   MIDIPATCHSIZE : constant := 128;       --  mmsystem.h:744

   MIM_OPEN : constant := 16#3c1#;   --  mmsystem.h:751

   MIM_CLOSE : constant := 16#3c2#;   --  mmsystem.h:752

   MIM_DATA : constant := 16#3c3#;   --  mmsystem.h:753

   MIM_LONGDATA : constant := 16#3c4#;   --  mmsystem.h:754

   MIM_ERROR : constant := 16#3c5#;   --  mmsystem.h:755

   MIM_LONGERROR : constant := 16#3c6#;   --  mmsystem.h:756

   MOM_OPEN : constant := 16#3c7#;   --  mmsystem.h:757

   MOM_CLOSE : constant := 16#3c8#;   --  mmsystem.h:758

   MOM_DONE : constant := 16#3c9#;   --  mmsystem.h:759

   MIDIMAPPER : constant := -1;        --  mmsystem.h:762

   MIDI_MAPPER : constant DWORD := DWORD'Last;

   --  mmsystem.h:763

   MIDI_CACHE_ALL : constant := 1;         --  mmsystem.h:766

   MIDI_CACHE_BESTFIT : constant := 2;         --  mmsystem.h:767

   MIDI_CACHE_QUERY : constant := 3;         --  mmsystem.h:768

   MIDI_UNCACHE : constant := 4;         --  mmsystem.h:769

   MOD_MIDIPORT : constant := 1;         --  mmsystem.h:823

   MOD_SYNTH : constant := 2;         --  mmsystem.h:824

   MOD_SQSYNTH : constant := 3;         --  mmsystem.h:825

   MOD_FMSYNTH : constant := 4;         --  mmsystem.h:826

   MOD_MAPPER : constant := 5;         --  mmsystem.h:827

   MIDICAPS_VOLUME : constant := 16#1#;     --  mmsystem.h:830

   MIDICAPS_LRVOLUME : constant := 16#2#;     --  mmsystem.h:831

   MIDICAPS_CACHE : constant := 16#4#;     --  mmsystem.h:832

   MHDR_DONE : constant := 16#1#;     --  mmsystem.h:890

   MHDR_PREPARED : constant := 16#2#;     --  mmsystem.h:891

   MHDR_INQUEUE : constant := 16#4#;     --  mmsystem.h:892

   AUX_MAPPER : constant DWORD := DWORD'Last;

   --  mmsystem.h:763

   AUXCAPS_CDAUDIO : constant := 1;         --  mmsystem.h:1025

   AUXCAPS_AUXIN : constant := 2;         --  mmsystem.h:1026

   AUXCAPS_VOLUME : constant := 16#1#;     --  mmsystem.h:1029

   AUXCAPS_LRVOLUME : constant := 16#2#;     --  mmsystem.h:1030

   MIXER_SHORT_NAME_CHARS : constant := 16;        --  mmsystem.h:1063

   MIXER_LONG_NAME_CHARS : constant := 64;        --  mmsystem.h:1064

   MIXERR_INVALLINE : constant := 1024;      --  mmsystem.h:1069

   MIXERR_INVALCONTROL : constant := 1025;      --  mmsystem.h:1070

   MIXERR_INVALVALUE : constant := 1026;      --  mmsystem.h:1071

   MIXERR_LASTERROR : constant := 1026;      --  mmsystem.h:1072

   MIXER_OBJECTF_HANDLE : constant := 16#80000000#;

   --  mmsystem.h:1075

   MIXER_OBJECTF_MIXER : constant := 16#0#;     --  mmsystem.h:1076

   MIXER_OBJECTF_HMIXER : constant := 16#80000000#;

   --  mmsystem.h:1077

   MIXER_OBJECTF_WAVEOUT : constant := 16#10000000#;

   --  mmsystem.h:1078

   MIXER_OBJECTF_HWAVEOUT : constant := 16#90000000#;

   --  mmsystem.h:1079

   MIXER_OBJECTF_WAVEIN : constant := 16#20000000#;

   --  mmsystem.h:1080

   MIXER_OBJECTF_HWAVEIN : constant := 16#a0000000#;

   --  mmsystem.h:1081

   MIXER_OBJECTF_MIDIOUT : constant := 16#30000000#;

   --  mmsystem.h:1082

   MIXER_OBJECTF_HMIDIOUT : constant := 16#b0000000#;

   --  mmsystem.h:1083

   MIXER_OBJECTF_MIDIIN : constant := 16#40000000#;

   --  mmsystem.h:1084

   MIXER_OBJECTF_HMIDIIN : constant := 16#c0000000#;

   --  mmsystem.h:1085

   MIXER_OBJECTF_AUX : constant := 16#50000000#;

   --  mmsystem.h:1086

   MIXERLINE_LINEF_ACTIVE : constant := 16#1#;     --  mmsystem.h:1219

   MIXERLINE_LINEF_DISCONNECTED : constant := 16#8000#;  --  mmsystem.h:1220

   MIXERLINE_LINEF_SOURCE : constant := 16#80000000#;

   --  mmsystem.h:1221

   MIXERLINE_COMPONENTTYPE_DST_FIRST : constant := 16#0#;

   --  mmsystem.h:1228

   MIXERLINE_COMPONENTTYPE_DST_UNDEFINED : constant := 16#0#;

   --  mmsystem.h:1229

   MIXERLINE_COMPONENTTYPE_DST_DIGITAL : constant := 16#1#;

   --  mmsystem.h:1230

   MIXERLINE_COMPONENTTYPE_DST_LINE : constant := 16#2#;

   --  mmsystem.h:1231

   MIXERLINE_COMPONENTTYPE_DST_MONITOR : constant := 16#3#;

   --  mmsystem.h:1232

   MIXERLINE_COMPONENTTYPE_DST_SPEAKERS : constant := 16#4#;

   --  mmsystem.h:1233

   MIXERLINE_COMPONENTTYPE_DST_HEADPHONES : constant := 16#5#;

   --  mmsystem.h:1234

   MIXERLINE_COMPONENTTYPE_DST_TELEPHONE : constant := 16#6#;

   --  mmsystem.h:1235

   MIXERLINE_COMPONENTTYPE_DST_WAVEIN : constant := 16#7#;

   --  mmsystem.h:1236

   MIXERLINE_COMPONENTTYPE_DST_VOICEIN : constant := 16#8#;

   --  mmsystem.h:1237

   MIXERLINE_COMPONENTTYPE_DST_LAST : constant := 16#8#;

   --  mmsystem.h:1238

   MIXERLINE_COMPONENTTYPE_SRC_FIRST : constant := 16#1000#;

   --  mmsystem.h:1240

   MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED : constant := 16#1000#;

   --  mmsystem.h:1241

   MIXERLINE_COMPONENTTYPE_SRC_DIGITAL : constant := 16#1001#;

   --  mmsystem.h:1242

   MIXERLINE_COMPONENTTYPE_SRC_LINE : constant := 16#1002#;

   --  mmsystem.h:1243

   MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE : constant := 16#1003#;

   --  mmsystem.h:1244

   MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER : constant := 16#1004#;

   --  mmsystem.h:1245

   MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC : constant := 16#1005#;

   --  mmsystem.h:1246

   MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE : constant := 16#1006#;

   --  mmsystem.h:1247

   MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER : constant := 16#1007#;

   --  mmsystem.h:1248

   MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT : constant := 16#1008#;

   --  mmsystem.h:1249

   MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY : constant := 16#1009#;

   --  mmsystem.h:1250

   MIXERLINE_COMPONENTTYPE_SRC_ANALOG : constant := 16#100a#;

   --  mmsystem.h:1251

   MIXERLINE_COMPONENTTYPE_SRC_LAST : constant := 16#100a#;

   --  mmsystem.h:1252

   MIXERLINE_TARGETTYPE_UNDEFINED : constant := 0;         --  mmsystem.h:1257

   MIXERLINE_TARGETTYPE_WAVEOUT : constant := 1;         --  mmsystem.h:1258

   MIXERLINE_TARGETTYPE_WAVEIN : constant := 2;         --  mmsystem.h:1259

   MIXERLINE_TARGETTYPE_MIDIOUT : constant := 3;         --  mmsystem.h:1260

   MIXERLINE_TARGETTYPE_MIDIIN : constant := 4;         --  mmsystem.h:1261

   MIXERLINE_TARGETTYPE_AUX : constant := 5;         --  mmsystem.h:1262

   MIXER_GETLINEINFOF_DESTINATION : constant := 16#0#;     --  mmsystem.h:1274

   MIXER_GETLINEINFOF_SOURCE : constant := 16#1#;     --  mmsystem.h:1275

   MIXER_GETLINEINFOF_LINEID : constant := 16#2#;     --  mmsystem.h:1276

   MIXER_GETLINEINFOF_COMPONENTTYPE : constant := 16#3#;

   --  mmsystem.h:1277

   MIXER_GETLINEINFOF_TARGETTYPE : constant := 16#4#;     --  mmsystem.h:1278

   MIXER_GETLINEINFOF_QUERYMASK : constant := 16#f#;     --  mmsystem.h:1280

   MIXERCONTROL_CONTROLF_UNIFORM : constant := 16#1#;     --  mmsystem.h:1367

   MIXERCONTROL_CONTROLF_MULTIPLE : constant := 16#2#;     --  mmsystem.h:1368

   MIXERCONTROL_CONTROLF_DISABLED : constant := 16#80000000#;

   --  mmsystem.h:1369

   MIXERCONTROL_CT_CLASS_MASK : constant := 16#f0000000#;

   --  mmsystem.h:1376

   MIXERCONTROL_CT_CLASS_CUSTOM : constant := 16#0#;     --  mmsystem.h:1377

   MIXERCONTROL_CT_CLASS_METER : constant := 16#10000000#;

   --  mmsystem.h:1378

   MIXERCONTROL_CT_CLASS_SWITCH : constant := 16#20000000#;

   --  mmsystem.h:1379

   MIXERCONTROL_CT_CLASS_NUMBER : constant := 16#30000000#;

   --  mmsystem.h:1380

   MIXERCONTROL_CT_CLASS_SLIDER : constant := 16#40000000#;

   --  mmsystem.h:1381

   MIXERCONTROL_CT_CLASS_FADER : constant := 16#50000000#;

   --  mmsystem.h:1382

   MIXERCONTROL_CT_CLASS_TIME : constant := 16#60000000#;

   --  mmsystem.h:1383

   MIXERCONTROL_CT_CLASS_LIST : constant := 16#70000000#;

   --  mmsystem.h:1384

   MIXERCONTROL_CT_SUBCLASS_MASK : constant := 16#f000000#;

   --  mmsystem.h:1385

   MIXERCONTROL_CT_SC_SWITCH_BOOLEAN : constant := 16#0#;

   --  mmsystem.h:1386

   MIXERCONTROL_CT_SC_SWITCH_BUTTON : constant := 16#1000000#;

   --  mmsystem.h:1387

   MIXERCONTROL_CT_SC_METER_POLLED : constant := 16#0#;     --  mmsystem.h:1388

   MIXERCONTROL_CT_SC_TIME_MICROSECS : constant := 16#0#;

   --  mmsystem.h:1389

   MIXERCONTROL_CT_SC_TIME_MILLISECS : constant := 16#1000000#;

   --  mmsystem.h:1390

   MIXERCONTROL_CT_SC_LIST_SINGLE : constant := 16#0#;     --  mmsystem.h:1391

   MIXERCONTROL_CT_SC_LIST_MULTIPLE : constant := 16#1000000#;

   --  mmsystem.h:1392

   MIXERCONTROL_CT_UNITS_MASK : constant := 16#ff0000#; --  mmsystem.h:1393

   MIXERCONTROL_CT_UNITS_CUSTOM : constant := 16#0#;     --  mmsystem.h:1394

   MIXERCONTROL_CT_UNITS_BOOLEAN : constant := 16#10000#; --  mmsystem.h:1395

   MIXERCONTROL_CT_UNITS_SIGNED : constant := 16#20000#; --  mmsystem.h:1396

   MIXERCONTROL_CT_UNITS_UNSIGNED : constant := 16#30000#; --  mmsystem.h:1397

   MIXERCONTROL_CT_UNITS_DECIBELS : constant := 16#40000#; --  mmsystem.h:1398

   MIXERCONTROL_CT_UNITS_PERCENT : constant := 16#50000#; --  mmsystem.h:1399

   MIXERCONTROL_CONTROLTYPE_CUSTOM : constant := 16#0#;     --  mmsystem.h:1400

   MIXERCONTROL_CONTROLTYPE_BOOLEANMETER : constant := 16#10010000#;

   --  mmsystem.h:1401

   MIXERCONTROL_CONTROLTYPE_SIGNEDMETER : constant := 16#10020000#;

   --  mmsystem.h:1402

   MIXERCONTROL_CONTROLTYPE_PEAKMETER : constant := 16#10020001#;

   --  mmsystem.h:1403

   MIXERCONTROL_CONTROLTYPE_UNSIGNEDMETER : constant := 16#10030000#;

   --  mmsystem.h:1404

   MIXERCONTROL_CONTROLTYPE_BOOLEAN : constant := 16#20010000#;

   --  mmsystem.h:1405

   MIXERCONTROL_CONTROLTYPE_ONOFF : constant := 16#20010001#;

   --  mmsystem.h:1406

   MIXERCONTROL_CONTROLTYPE_MUTE : constant := 16#20010002#;

   --  mmsystem.h:1407

   MIXERCONTROL_CONTROLTYPE_MONO : constant := 16#20010003#;

   --  mmsystem.h:1408

   MIXERCONTROL_CONTROLTYPE_LOUDNESS : constant := 16#20010004#;

   --  mmsystem.h:1409

   MIXERCONTROL_CONTROLTYPE_STEREOENH : constant := 16#20010005#;

   --  mmsystem.h:1410

   MIXERCONTROL_CONTROLTYPE_BUTTON : constant := 16#21010000#;

   --  mmsystem.h:1411

   MIXERCONTROL_CONTROLTYPE_DECIBELS : constant := 16#30040000#;

   --  mmsystem.h:1412

   MIXERCONTROL_CONTROLTYPE_SIGNED : constant := 16#30020000#;

   --  mmsystem.h:1413

   MIXERCONTROL_CONTROLTYPE_UNSIGNED : constant := 16#30030000#;

   --  mmsystem.h:1414

   MIXERCONTROL_CONTROLTYPE_PERCENT : constant := 16#30050000#;

   --  mmsystem.h:1415

   MIXERCONTROL_CONTROLTYPE_SLIDER : constant := 16#40020000#;

   --  mmsystem.h:1416

   MIXERCONTROL_CONTROLTYPE_PAN : constant := 16#40020001#;

   --  mmsystem.h:1417

   MIXERCONTROL_CONTROLTYPE_QSOUNDPAN : constant := 16#40020002#;

   --  mmsystem.h:1418

   MIXERCONTROL_CONTROLTYPE_FADER : constant := 16#50030000#;

   --  mmsystem.h:1419

   MIXERCONTROL_CONTROLTYPE_VOLUME : constant := 16#50030001#;

   --  mmsystem.h:1420

   MIXERCONTROL_CONTROLTYPE_BASS : constant := 16#50030002#;

   --  mmsystem.h:1421

   MIXERCONTROL_CONTROLTYPE_TREBLE : constant := 16#50030003#;

   --  mmsystem.h:1422

   MIXERCONTROL_CONTROLTYPE_EQUALIZER : constant := 16#50030004#;

   --  mmsystem.h:1423

   MIXERCONTROL_CONTROLTYPE_SINGLESELECT : constant := 16#70010000#;

   --  mmsystem.h:1424

   MIXERCONTROL_CONTROLTYPE_MUX : constant := 16#70010001#;

   --  mmsystem.h:1425

   MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT : constant := 16#71010000#;

   --  mmsystem.h:1426

   MIXERCONTROL_CONTROLTYPE_MIXER : constant := 16#71010001#;

   --  mmsystem.h:1427

   MIXERCONTROL_CONTROLTYPE_MICROTIME : constant := 16#60030000#;

   --  mmsystem.h:1428

   MIXERCONTROL_CONTROLTYPE_MILLITIME : constant := 16#61030000#;

   --  mmsystem.h:1429

   MIXER_GETLINECONTROLSF_ALL : constant := 16#0#;     --  mmsystem.h:1500

   MIXER_GETLINECONTROLSF_ONEBYID : constant := 16#1#;     --  mmsystem.h:1501

   MIXER_GETLINECONTROLSF_ONEBYTYPE : constant := 16#2#;

   --  mmsystem.h:1502

   MIXER_GETLINECONTROLSF_QUERYMASK : constant := 16#f#;

   --  mmsystem.h:1504

   MIXER_GETCONTROLDETAILSF_VALUE : constant := 16#0#;     --  mmsystem.h:1602

   MIXER_GETCONTROLDETAILSF_LISTTEXT : constant := 16#1#;

   --  mmsystem.h:1603

   MIXER_GETCONTROLDETAILSF_QUERYMASK : constant := 16#f#;

   --  mmsystem.h:1605

   MIXER_SETCONTROLDETAILSF_VALUE : constant := 16#0#;     --  mmsystem.h:1610

   MIXER_SETCONTROLDETAILSF_CUSTOM : constant := 16#1#;     --  mmsystem.h:1611

   MIXER_SETCONTROLDETAILSF_QUERYMASK : constant := 16#f#;

   --  mmsystem.h:1613

   TIMERR_NOERROR : constant := 0;         --  mmsystem.h:1627

   TIMERR_NOCANDO : constant := 97;        --  mmsystem.h:1628

   TIMERR_STRUCT : constant := 129;       --  mmsystem.h:1629

   TIME_ONESHOT : constant := 16#0#;     --  mmsystem.h:1637

   TIME_PERIODIC : constant := 16#1#;     --  mmsystem.h:1638

   TIME_CALLBACK_FUNCTION : constant := 16#0#;     --  mmsystem.h:1640

   TIME_CALLBACK_EVENT_SET : constant := 16#10#;    --  mmsystem.h:1641

   TIME_CALLBACK_EVENT_PULSE : constant := 16#20#;    --  mmsystem.h:1642

   JOYERR_NOERROR : constant := 0;         --  mmsystem.h:1674

   JOYERR_PARMS : constant := 165;       --  mmsystem.h:1675

   JOYERR_NOCANDO : constant := 166;       --  mmsystem.h:1676

   JOYERR_UNPLUGGED : constant := 167;       --  mmsystem.h:1677

   JOY_BUTTON1 : constant := 16#1#;     --  mmsystem.h:1680

   JOY_BUTTON2 : constant := 16#2#;     --  mmsystem.h:1681

   JOY_BUTTON3 : constant := 16#4#;     --  mmsystem.h:1682

   JOY_BUTTON4 : constant := 16#8#;     --  mmsystem.h:1683

   JOY_BUTTON1CHG : constant := 16#100#;   --  mmsystem.h:1684

   JOY_BUTTON2CHG : constant := 16#200#;   --  mmsystem.h:1685

   JOY_BUTTON3CHG : constant := 16#400#;   --  mmsystem.h:1686

   JOY_BUTTON4CHG : constant := 16#800#;   --  mmsystem.h:1687

   JOYSTICKID1 : constant := 0;         --  mmsystem.h:1690

   JOYSTICKID2 : constant := 1;         --  mmsystem.h:1691

   MMIOERR_BASE : constant := 256;       --  mmsystem.h:1788

   MMIOERR_FILENOTFOUND : constant := 257;       --  mmsystem.h:1789

   MMIOERR_OUTOFMEMORY : constant := 258;       --  mmsystem.h:1790

   MMIOERR_CANNOTOPEN : constant := 259;       --  mmsystem.h:1791

   MMIOERR_CANNOTCLOSE : constant := 260;       --  mmsystem.h:1792

   MMIOERR_CANNOTREAD : constant := 261;       --  mmsystem.h:1793

   MMIOERR_CANNOTWRITE : constant := 262;       --  mmsystem.h:1794

   MMIOERR_CANNOTSEEK : constant := 263;       --  mmsystem.h:1795

   MMIOERR_CANNOTEXPAND : constant := 264;       --  mmsystem.h:1796

   MMIOERR_CHUNKNOTFOUND : constant := 265;       --  mmsystem.h:1797

   MMIOERR_UNBUFFERED : constant := 266;       --  mmsystem.h:1798

   MMIOERR_PATHNOTFOUND : constant := 267;       --  mmsystem.h:1799

   MMIOERR_ACCESSDENIED : constant := 268;       --  mmsystem.h:1800

   MMIOERR_SHARINGVIOLATION : constant := 269;       --  mmsystem.h:1801

   MMIOERR_NETWORKERROR : constant := 270;       --  mmsystem.h:1802

   MMIOERR_TOOMANYOPENFILES : constant := 271;       --  mmsystem.h:1803

   MMIOERR_INVALIDFILE : constant := 272;       --  mmsystem.h:1804

   CFSEPCHAR : constant := 43;        --  mmsystem.h:1807

   MMIO_RWMODE : constant := 16#3#;     --  mmsystem.h:1869

   MMIO_SHAREMODE : constant := 16#70#;    --  mmsystem.h:1871

   MMIO_CREATE : constant := 16#1000#;  --  mmsystem.h:1874

   MMIO_PARSE : constant := 16#100#;   --  mmsystem.h:1875

   MMIO_DELETE : constant := 16#200#;   --  mmsystem.h:1876

   MMIO_EXIST : constant := 16#4000#;  --  mmsystem.h:1877

   MMIO_ALLOCBUF : constant := 16#10000#; --  mmsystem.h:1878

   MMIO_GETTEMP : constant := 16#20000#; --  mmsystem.h:1879

   MMIO_DIRTY : constant := 16#10000000#;

   --  mmsystem.h:1881

   MMIO_READ : constant := 16#0#;     --  mmsystem.h:1886

   MMIO_WRITE : constant := 16#1#;     --  mmsystem.h:1887

   MMIO_READWRITE : constant := 16#2#;     --  mmsystem.h:1888

   MMIO_COMPAT : constant := 16#0#;     --  mmsystem.h:1891

   MMIO_EXCLUSIVE : constant := 16#10#;    --  mmsystem.h:1892

   MMIO_DENYWRITE : constant := 16#20#;    --  mmsystem.h:1893

   MMIO_DENYREAD : constant := 16#30#;    --  mmsystem.h:1894

   MMIO_DENYNONE : constant := 16#40#;    --  mmsystem.h:1895

   MMIO_FHOPEN : constant := 16#10#;    --  mmsystem.h:1898

   MMIO_EMPTYBUF : constant := 16#10#;    --  mmsystem.h:1899

   MMIO_TOUPPER : constant := 16#10#;    --  mmsystem.h:1900

   MMIO_INSTALLPROC : constant := 16#10000#; --  mmsystem.h:1901

   MMIO_GLOBALPROC : constant := 16#10000000#;

   --  mmsystem.h:1902

   MMIO_REMOVEPROC : constant := 16#20000#; --  mmsystem.h:1903

   MMIO_UNICODEPROC : constant := 16#1000000#;

   --  mmsystem.h:1904

   MMIO_FINDPROC : constant := 16#40000#; --  mmsystem.h:1906

   MMIO_FINDCHUNK : constant := 16#10#;    --  mmsystem.h:1907

   MMIO_FINDRIFF : constant := 16#20#;    --  mmsystem.h:1908

   MMIO_FINDLIST : constant := 16#40#;    --  mmsystem.h:1909

   MMIO_CREATERIFF : constant := 16#20#;    --  mmsystem.h:1910

   MMIO_CREATELIST : constant := 16#40#;    --  mmsystem.h:1911

   MMIOM_READ : constant := 16#0#;     --  mmsystem.h:1915

   MMIOM_WRITE : constant := 16#1#;     --  mmsystem.h:1916

   MMIOM_SEEK : constant := 2;         --  mmsystem.h:1917

   MMIOM_OPEN : constant := 3;         --  mmsystem.h:1918

   MMIOM_CLOSE : constant := 4;         --  mmsystem.h:1919

   MMIOM_WRITEFLUSH : constant := 5;         --  mmsystem.h:1920

   MMIOM_RENAME : constant := 6;         --  mmsystem.h:1921

   MMIOM_USER : constant := 16#8000#;  --  mmsystem.h:1923

   SEEK_SET : constant := 0;         --  mmsystem.h:1935

   SEEK_CUR : constant := 1;         --  mmsystem.h:1936

   SEEK_END : constant := 2;         --  mmsystem.h:1937

   MMIO_DEFAULTBUFFER : constant := 8192;      --  mmsystem.h:1941

   MCIERR_INVALID_DEVICE_ID : constant := 257;       --  mmsystem.h:2110

   MCIERR_UNRECOGNIZED_KEYWORD : constant := 259;       --  mmsystem.h:2111

   MCIERR_UNRECOGNIZED_COMMAND : constant := 261;       --  mmsystem.h:2112

   MCIERR_HARDWARE : constant := 262;       --  mmsystem.h:2113

   MCIERR_INVALID_DEVICE_NAME : constant := 263;       --  mmsystem.h:2114

   MCIERR_OUT_OF_MEMORY : constant := 264;       --  mmsystem.h:2115

   MCIERR_DEVICE_OPEN : constant := 265;       --  mmsystem.h:2116

   MCIERR_CANNOT_LOAD_DRIVER : constant := 266;       --  mmsystem.h:2117

   MCIERR_MISSING_COMMAND_STRING : constant := 267;       --  mmsystem.h:2118

   MCIERR_PARAM_OVERFLOW : constant := 268;       --  mmsystem.h:2119

   MCIERR_MISSING_STRING_ARGUMENT : constant := 269;       --  mmsystem.h:2120

   MCIERR_BAD_INTEGER : constant := 270;       --  mmsystem.h:2121

   MCIERR_PARSER_INTERNAL : constant := 271;       --  mmsystem.h:2122

   MCIERR_DRIVER_INTERNAL : constant := 272;       --  mmsystem.h:2123

   MCIERR_MISSING_PARAMETER : constant := 273;       --  mmsystem.h:2124

   MCIERR_UNSUPPORTED_FUNCTION : constant := 274;       --  mmsystem.h:2125

   MCIERR_FILE_NOT_FOUND : constant := 275;       --  mmsystem.h:2126

   MCIERR_DEVICE_NOT_READY : constant := 276;       --  mmsystem.h:2127

   MCIERR_INTERNAL : constant := 277;       --  mmsystem.h:2128

   MCIERR_DRIVER : constant := 278;       --  mmsystem.h:2129

   MCIERR_CANNOT_USE_ALL : constant := 279;       --  mmsystem.h:2130

   MCIERR_MULTIPLE : constant := 280;       --  mmsystem.h:2131

   MCIERR_EXTENSION_NOT_FOUND : constant := 281;       --  mmsystem.h:2132

   MCIERR_OUTOFRANGE : constant := 282;       --  mmsystem.h:2133

   MCIERR_FLAGS_NOT_COMPATIBLE : constant := 284;       --  mmsystem.h:2134

   MCIERR_FILE_NOT_SAVED : constant := 286;       --  mmsystem.h:2135

   MCIERR_DEVICE_TYPE_REQUIRED : constant := 287;       --  mmsystem.h:2136

   MCIERR_DEVICE_LOCKED : constant := 288;       --  mmsystem.h:2137

   MCIERR_DUPLICATE_ALIAS : constant := 289;       --  mmsystem.h:2138

   MCIERR_BAD_CONSTANT : constant := 290;       --  mmsystem.h:2139

   MCIERR_MUST_USE_SHAREABLE : constant := 291;       --  mmsystem.h:2140

   MCIERR_MISSING_DEVICE_NAME : constant := 292;       --  mmsystem.h:2141

   MCIERR_BAD_TIME_FORMAT : constant := 293;       --  mmsystem.h:2142

   MCIERR_NO_CLOSING_QUOTE : constant := 294;       --  mmsystem.h:2143

   MCIERR_DUPLICATE_FLAGS : constant := 295;       --  mmsystem.h:2144

   MCIERR_INVALID_FILE : constant := 296;       --  mmsystem.h:2145

   MCIERR_NULL_PARAMETER_BLOCK : constant := 297;       --  mmsystem.h:2146

   MCIERR_UNNAMED_RESOURCE : constant := 298;       --  mmsystem.h:2147

   MCIERR_NEW_REQUIRES_ALIAS : constant := 299;       --  mmsystem.h:2148

   MCIERR_NOTIFY_ON_AUTO_OPEN : constant := 300;       --  mmsystem.h:2149

   MCIERR_NO_ELEMENT_ALLOWED : constant := 301;       --  mmsystem.h:2150

   MCIERR_NONAPPLICABLE_FUNCTION : constant := 302;       --  mmsystem.h:2151

   MCIERR_ILLEGAL_FOR_AUTO_OPEN : constant := 303;       --  mmsystem.h:2152

   MCIERR_FILENAME_REQUIRED : constant := 304;       --  mmsystem.h:2153

   MCIERR_EXTRA_CHARACTERS : constant := 305;       --  mmsystem.h:2154

   MCIERR_DEVICE_NOT_INSTALLED : constant := 306;       --  mmsystem.h:2155

   MCIERR_GET_CD : constant := 307;       --  mmsystem.h:2156

   MCIERR_SET_CD : constant := 308;       --  mmsystem.h:2157

   MCIERR_SET_DRIVE : constant := 309;       --  mmsystem.h:2158

   MCIERR_DEVICE_LENGTH : constant := 310;       --  mmsystem.h:2159

   MCIERR_DEVICE_ORD_LENGTH : constant := 311;       --  mmsystem.h:2160

   MCIERR_NO_INTEGER : constant := 312;       --  mmsystem.h:2161

   MCIERR_WAVE_OUTPUTSINUSE : constant := 320;       --  mmsystem.h:2163

   MCIERR_WAVE_SETOUTPUTINUSE : constant := 321;       --  mmsystem.h:2164

   MCIERR_WAVE_INPUTSINUSE : constant := 322;       --  mmsystem.h:2165

   MCIERR_WAVE_SETINPUTINUSE : constant := 323;       --  mmsystem.h:2166

   MCIERR_WAVE_OUTPUTUNSPECIFIED : constant := 324;       --  mmsystem.h:2167

   MCIERR_WAVE_INPUTUNSPECIFIED : constant := 325;       --  mmsystem.h:2168

   MCIERR_WAVE_OUTPUTSUNSUITABLE : constant := 326;       --  mmsystem.h:2169

   MCIERR_WAVE_SETOUTPUTUNSUITABLE : constant := 327;       --  mmsystem.h:2170

   MCIERR_WAVE_INPUTSUNSUITABLE : constant := 328;       --  mmsystem.h:2171

   MCIERR_WAVE_SETINPUTUNSUITABLE : constant := 329;       --  mmsystem.h:2172

   MCIERR_SEQ_DIV_INCOMPATIBLE : constant := 336;       --  mmsystem.h:2174

   MCIERR_SEQ_PORT_INUSE : constant := 337;       --  mmsystem.h:2175

   MCIERR_SEQ_PORT_NONEXISTENT : constant := 338;       --  mmsystem.h:2176

   MCIERR_SEQ_PORT_MAPNODEVICE : constant := 339;       --  mmsystem.h:2177

   MCIERR_SEQ_PORT_MISCERROR : constant := 340;       --  mmsystem.h:2178

   MCIERR_SEQ_TIMER : constant := 341;       --  mmsystem.h:2179

   MCIERR_SEQ_PORTUNSPECIFIED : constant := 342;       --  mmsystem.h:2180

   MCIERR_SEQ_NOMIDIPRESENT : constant := 343;       --  mmsystem.h:2181

   MCIERR_NO_WINDOW : constant := 346;       --  mmsystem.h:2183

   MCIERR_CREATEWINDOW : constant := 347;       --  mmsystem.h:2184

   MCIERR_FILE_READ : constant := 348;       --  mmsystem.h:2185

   MCIERR_FILE_WRITE : constant := 349;       --  mmsystem.h:2186

   MCIERR_NO_IDENTITY : constant := 350;       --  mmsystem.h:2188

   MCIERR_CUSTOM_DRIVER_BASE : constant := 512;       --  mmsystem.h:2191

   MCI_FIRST : constant := 16#800#;   --  mmsystem.h:2201

   MCI_OPEN : constant := 16#803#;   --  mmsystem.h:2203

   MCI_CLOSE : constant := 16#804#;   --  mmsystem.h:2204

   MCI_ESCAPE : constant := 16#805#;   --  mmsystem.h:2205

   MCI_PLAY : constant := 16#806#;   --  mmsystem.h:2206

   MCI_SEEK : constant := 16#807#;   --  mmsystem.h:2207

   MCI_STOP : constant := 16#808#;   --  mmsystem.h:2208

   MCI_PAUSE : constant := 16#809#;   --  mmsystem.h:2209

   MCI_INFO : constant := 16#80a#;   --  mmsystem.h:2210

   MCI_GETDEVCAPS : constant := 16#80b#;   --  mmsystem.h:2211

   MCI_SPIN : constant := 16#80c#;   --  mmsystem.h:2212

   MCI_SET : constant := 16#80d#;   --  mmsystem.h:2213

   MCI_STEP : constant := 16#80e#;   --  mmsystem.h:2214

   MCI_RECORD : constant := 16#80f#;   --  mmsystem.h:2215

   MCI_SYSINFO : constant := 16#810#;   --  mmsystem.h:2216

   MCI_BREAK : constant := 16#811#;   --  mmsystem.h:2217

   MCI_SOUND : constant := 16#812#;   --  mmsystem.h:2218

   MCI_SAVE : constant := 16#813#;   --  mmsystem.h:2219

   MCI_STATUS : constant := 16#814#;   --  mmsystem.h:2220

   MCI_CUE : constant := 16#830#;   --  mmsystem.h:2222

   MCI_REALIZE : constant := 16#840#;   --  mmsystem.h:2224

   MCI_WINDOW : constant := 16#841#;   --  mmsystem.h:2225

   MCI_PUT : constant := 16#842#;   --  mmsystem.h:2226

   MCI_WHERE : constant := 16#843#;   --  mmsystem.h:2227

   MCI_FREEZE : constant := 16#844#;   --  mmsystem.h:2228

   MCI_UNFREEZE : constant := 16#845#;   --  mmsystem.h:2229

   MCI_LOAD : constant := 16#850#;   --  mmsystem.h:2231

   MCI_CUT : constant := 16#851#;   --  mmsystem.h:2232

   MCI_COPY : constant := 16#852#;   --  mmsystem.h:2233

   MCI_PASTE : constant := 16#853#;   --  mmsystem.h:2234

   MCI_UPDATE : constant := 16#854#;   --  mmsystem.h:2235

   MCI_RESUME : constant := 16#855#;   --  mmsystem.h:2236

   MCI_DELETE : constant := 16#856#;   --  mmsystem.h:2237

   MCI_LAST : constant := 16#fff#;   --  mmsystem.h:2239

   MCI_USER_MESSAGES : constant := 16#c00#;   --  mmsystem.h:2242

   MCI_DEVTYPE_VCR : constant := 513;       --  mmsystem.h:2257

   MCI_DEVTYPE_VIDEODISC : constant := 514;       --  mmsystem.h:2258

   MCI_DEVTYPE_OVERLAY : constant := 515;       --  mmsystem.h:2259

   MCI_DEVTYPE_CD_AUDIO : constant := 516;       --  mmsystem.h:2260

   MCI_DEVTYPE_DAT : constant := 517;       --  mmsystem.h:2261

   MCI_DEVTYPE_SCANNER : constant := 518;       --  mmsystem.h:2262

   MCI_DEVTYPE_ANIMATION : constant := 519;       --  mmsystem.h:2263

   MCI_DEVTYPE_DIGITAL_VIDEO : constant := 520;       --  mmsystem.h:2264

   MCI_DEVTYPE_OTHER : constant := 521;       --  mmsystem.h:2265

   MCI_DEVTYPE_WAVEFORM_AUDIO : constant := 522;       --  mmsystem.h:2266

   MCI_DEVTYPE_SEQUENCER : constant := 523;       --  mmsystem.h:2267

   MCI_DEVTYPE_FIRST : constant := 513;       --  mmsystem.h:2269

   MCI_DEVTYPE_LAST : constant := 523;       --  mmsystem.h:2270

   MCI_DEVTYPE_FIRST_USER : constant := 16#1000#;  --  mmsystem.h:2273

   MCI_MODE_NOT_READY : constant := 524;       --  mmsystem.h:2276

   MCI_MODE_STOP : constant := 525;       --  mmsystem.h:2277

   MCI_MODE_PLAY : constant := 526;       --  mmsystem.h:2278

   MCI_MODE_RECORD : constant := 527;       --  mmsystem.h:2279

   MCI_MODE_SEEK : constant := 528;       --  mmsystem.h:2280

   MCI_MODE_PAUSE : constant := 529;       --  mmsystem.h:2281

   MCI_MODE_OPEN : constant := 530;       --  mmsystem.h:2282

   MCI_FORMAT_MILLISECONDS : constant := 0;         --  mmsystem.h:2287

   MCI_FORMAT_HMS : constant := 1;         --  mmsystem.h:2288

   MCI_FORMAT_MSF : constant := 2;         --  mmsystem.h:2289

   MCI_FORMAT_FRAMES : constant := 3;         --  mmsystem.h:2290

   MCI_FORMAT_SMPTE_24 : constant := 4;         --  mmsystem.h:2291

   MCI_FORMAT_SMPTE_25 : constant := 5;         --  mmsystem.h:2292

   MCI_FORMAT_SMPTE_30 : constant := 6;         --  mmsystem.h:2293

   MCI_FORMAT_SMPTE_30DROP : constant := 7;         --  mmsystem.h:2294

   MCI_FORMAT_BYTES : constant := 8;         --  mmsystem.h:2295

   MCI_FORMAT_SAMPLES : constant := 9;         --  mmsystem.h:2296

   MCI_FORMAT_TMSF : constant := 10;        --  mmsystem.h:2297

   MCI_NOTIFY_SUCCESSFUL : constant := 16#1#;     --  mmsystem.h:2341

   MCI_NOTIFY_SUPERSEDED : constant := 16#2#;     --  mmsystem.h:2342

   MCI_NOTIFY_ABORTED : constant := 16#4#;     --  mmsystem.h:2343

   MCI_NOTIFY_FAILURE : constant := 16#8#;     --  mmsystem.h:2344

   MCI_NOTIFY : constant := 16#1#;     --  mmsystem.h:2350

   MCI_WAIT : constant := 16#2#;     --  mmsystem.h:2351

   MCI_FROM : constant := 16#4#;     --  mmsystem.h:2352

   MCI_TO : constant := 16#8#;     --  mmsystem.h:2353

   MCI_TRACK : constant := 16#10#;    --  mmsystem.h:2354

   MCI_OPEN_SHAREABLE : constant := 16#100#;   --  mmsystem.h:2357

   MCI_OPEN_ELEMENT : constant := 16#200#;   --  mmsystem.h:2358

   MCI_OPEN_ALIAS : constant := 16#400#;   --  mmsystem.h:2359

   MCI_OPEN_ELEMENT_ID : constant := 16#800#;   --  mmsystem.h:2360

   MCI_OPEN_TYPE_ID : constant := 16#1000#;  --  mmsystem.h:2361

   MCI_OPEN_TYPE : constant := 16#2000#;  --  mmsystem.h:2362

   MCI_SEEK_TO_START : constant := 16#100#;   --  mmsystem.h:2365

   MCI_SEEK_TO_END : constant := 16#200#;   --  mmsystem.h:2366

   MCI_STATUS_ITEM : constant := 16#100#;   --  mmsystem.h:2369

   MCI_STATUS_START : constant := 16#200#;   --  mmsystem.h:2370

   MCI_STATUS_LENGTH : constant := 16#1#;     --  mmsystem.h:2373

   MCI_STATUS_POSITION : constant := 16#2#;     --  mmsystem.h:2374

   MCI_STATUS_NUMBER_OF_TRACKS : constant := 16#3#;     --  mmsystem.h:2375

   MCI_STATUS_MODE : constant := 16#4#;     --  mmsystem.h:2376

   MCI_STATUS_MEDIA_PRESENT : constant := 16#5#;     --  mmsystem.h:2377

   MCI_STATUS_TIME_FORMAT : constant := 16#6#;     --  mmsystem.h:2378

   MCI_STATUS_READY : constant := 16#7#;     --  mmsystem.h:2379

   MCI_STATUS_CURRENT_TRACK : constant := 16#8#;     --  mmsystem.h:2380

   MCI_INFO_PRODUCT : constant := 16#100#;   --  mmsystem.h:2384

   MCI_INFO_FILE : constant := 16#200#;   --  mmsystem.h:2385

   MCI_INFO_MEDIA_UPC : constant := 16#400#;   --  mmsystem.h:2386

   MCI_INFO_MEDIA_IDENTITY : constant := 16#800#;   --  mmsystem.h:2387

   MCI_GETDEVCAPS_ITEM : constant := 16#100#;   --  mmsystem.h:2390

   MCI_GETDEVCAPS_CAN_RECORD : constant := 16#1#;     --  mmsystem.h:2393

   MCI_GETDEVCAPS_HAS_AUDIO : constant := 16#2#;     --  mmsystem.h:2394

   MCI_GETDEVCAPS_HAS_VIDEO : constant := 16#3#;     --  mmsystem.h:2395

   MCI_GETDEVCAPS_DEVICE_TYPE : constant := 16#4#;     --  mmsystem.h:2396

   MCI_GETDEVCAPS_USES_FILES : constant := 16#5#;     --  mmsystem.h:2397

   MCI_GETDEVCAPS_COMPOUND_DEVICE : constant := 16#6#;     --  mmsystem.h:2398

   MCI_GETDEVCAPS_CAN_EJECT : constant := 16#7#;     --  mmsystem.h:2399

   MCI_GETDEVCAPS_CAN_PLAY : constant := 16#8#;     --  mmsystem.h:2400

   MCI_GETDEVCAPS_CAN_SAVE : constant := 16#9#;     --  mmsystem.h:2401

   MCI_SYSINFO_QUANTITY : constant := 16#100#;   --  mmsystem.h:2404

   MCI_SYSINFO_OPEN : constant := 16#200#;   --  mmsystem.h:2405

   MCI_SYSINFO_NAME : constant := 16#400#;   --  mmsystem.h:2406

   MCI_SYSINFO_INSTALLNAME : constant := 16#800#;   --  mmsystem.h:2407

   MCI_SET_DOOR_OPEN : constant := 16#100#;   --  mmsystem.h:2410

   MCI_SET_DOOR_CLOSED : constant := 16#200#;   --  mmsystem.h:2411

   MCI_SET_TIME_FORMAT : constant := 16#400#;   --  mmsystem.h:2412

   MCI_SET_AUDIO : constant := 16#800#;   --  mmsystem.h:2413

   MCI_SET_VIDEO : constant := 16#1000#;  --  mmsystem.h:2414

   MCI_SET_ON : constant := 16#2000#;  --  mmsystem.h:2415

   MCI_SET_OFF : constant := 16#4000#;  --  mmsystem.h:2416

   MCI_SET_AUDIO_ALL : constant := 16#0#;     --  mmsystem.h:2419

   MCI_SET_AUDIO_LEFT : constant := 16#1#;     --  mmsystem.h:2420

   MCI_SET_AUDIO_RIGHT : constant := 16#2#;     --  mmsystem.h:2421

   MCI_BREAK_KEY : constant := 16#100#;   --  mmsystem.h:2424

   MCI_BREAK_HWND : constant := 16#200#;   --  mmsystem.h:2425

   MCI_BREAK_OFF : constant := 16#400#;   --  mmsystem.h:2426

   MCI_RECORD_INSERT : constant := 16#100#;   --  mmsystem.h:2429

   MCI_RECORD_OVERWRITE : constant := 16#200#;   --  mmsystem.h:2430

   MCI_SOUND_NAME : constant := 16#100#;   --  mmsystem.h:2433

   MCI_SAVE_FILE : constant := 16#100#;   --  mmsystem.h:2436

   MCI_LOAD_FILE : constant := 16#100#;   --  mmsystem.h:2439

   MCI_VD_MODE_PARK : constant := 1025;      --  mmsystem.h:2723

   MCI_VD_MEDIA_CLV : constant := 1026;      --  mmsystem.h:2727

   MCI_VD_MEDIA_CAV : constant := 1027;      --  mmsystem.h:2728

   MCI_VD_MEDIA_OTHER : constant := 1028;      --  mmsystem.h:2729

   MCI_VD_FORMAT_TRACK : constant := 16#4001#;  --  mmsystem.h:2731

   MCI_VD_PLAY_REVERSE : constant := 16#10000#; --  mmsystem.h:2734

   MCI_VD_PLAY_FAST : constant := 16#20000#; --  mmsystem.h:2735

   MCI_VD_PLAY_SPEED : constant := 16#40000#; --  mmsystem.h:2736

   MCI_VD_PLAY_SCAN : constant := 16#80000#; --  mmsystem.h:2737

   MCI_VD_PLAY_SLOW : constant := 16#100000#; --  mmsystem.h:2738

   MCI_VD_SEEK_REVERSE : constant := 16#10000#; --  mmsystem.h:2741

   MCI_VD_STATUS_SPEED : constant := 16#4002#;  --  mmsystem.h:2744

   MCI_VD_STATUS_FORWARD : constant := 16#4003#;  --  mmsystem.h:2745

   MCI_VD_STATUS_MEDIA_TYPE : constant := 16#4004#;  --  mmsystem.h:2746

   MCI_VD_STATUS_SIDE : constant := 16#4005#;  --  mmsystem.h:2747

   MCI_VD_STATUS_DISC_SIZE : constant := 16#4006#;  --  mmsystem.h:2748

   MCI_VD_GETDEVCAPS_CLV : constant := 16#10000#; --  mmsystem.h:2751

   MCI_VD_GETDEVCAPS_CAV : constant := 16#20000#; --  mmsystem.h:2752

   MCI_VD_SPIN_UP : constant := 16#10000#; --  mmsystem.h:2754

   MCI_VD_SPIN_DOWN : constant := 16#20000#; --  mmsystem.h:2755

   MCI_VD_GETDEVCAPS_CAN_REVERSE : constant := 16#4002#;  --  mmsystem.h:2758

   MCI_VD_GETDEVCAPS_FAST_RATE : constant := 16#4003#;  --  mmsystem.h:2759

   MCI_VD_GETDEVCAPS_SLOW_RATE : constant := 16#4004#;  --  mmsystem.h:2760

   MCI_VD_GETDEVCAPS_NORMAL_RATE : constant := 16#4005#;  --  mmsystem.h:2761

   MCI_VD_STEP_FRAMES : constant := 16#10000#; --  mmsystem.h:2764

   MCI_VD_STEP_REVERSE : constant := 16#20000#; --  mmsystem.h:2765

   MCI_VD_ESCAPE_STRING : constant := 16#100#;   --  mmsystem.h:2768

   MCI_WAVE_PCM : constant := 1152;      --  mmsystem.h:2824

   MCI_WAVE_MAPPER : constant := 1153;      --  mmsystem.h:2825

   MCI_WAVE_OPEN_BUFFER : constant := 16#10000#; --  mmsystem.h:2828

   MCI_WAVE_SET_FORMATTAG : constant := 16#10000#; --  mmsystem.h:2831

   MCI_WAVE_SET_CHANNELS : constant := 16#20000#; --  mmsystem.h:2832

   MCI_WAVE_SET_SAMPLESPERSEC : constant := 16#40000#; --  mmsystem.h:2833

   MCI_WAVE_SET_AVGBYTESPERSEC : constant := 16#80000#; --  mmsystem.h:2834

   MCI_WAVE_SET_BLOCKALIGN : constant := 16#100000#; --  mmsystem.h:2835

   MCI_WAVE_SET_BITSPERSAMPLE : constant := 16#200000#; --  mmsystem.h:2836

   MCI_WAVE_INPUT : constant := 16#400000#; --  mmsystem.h:2839

   MCI_WAVE_OUTPUT : constant := 16#800000#; --  mmsystem.h:2840

   MCI_WAVE_STATUS_FORMATTAG : constant := 16#4001#;  --  mmsystem.h:2843

   MCI_WAVE_STATUS_CHANNELS : constant := 16#4002#;  --  mmsystem.h:2844

   MCI_WAVE_STATUS_SAMPLESPERSEC : constant := 16#4003#;  --  mmsystem.h:2845

   MCI_WAVE_STATUS_AVGBYTESPERSEC : constant := 16#4004#;  --  mmsystem.h:2846

   MCI_WAVE_STATUS_BLOCKALIGN : constant := 16#4005#;  --  mmsystem.h:2847

   MCI_WAVE_STATUS_BITSPERSAMPLE : constant := 16#4006#;  --  mmsystem.h:2848

   MCI_WAVE_STATUS_LEVEL : constant := 16#4007#;  --  mmsystem.h:2849

   MCI_WAVE_SET_ANYINPUT : constant := 16#4000000#;

   --  mmsystem.h:2852

   MCI_WAVE_SET_ANYOUTPUT : constant := 16#8000000#;

   --  mmsystem.h:2853

   MCI_WAVE_GETDEVCAPS_INPUTS : constant := 16#4001#;  --  mmsystem.h:2856

   MCI_WAVE_GETDEVCAPS_OUTPUTS : constant := 16#4002#;  --  mmsystem.h:2857

   MCI_CDA_STATUS_TYPE_TRACK : constant := 16#4001#;  --  mmsystem.h:2932

   MCI_CDA_TRACK_AUDIO : constant := 1088;      --  mmsystem.h:2936

   MCI_CDA_TRACK_OTHER : constant := 1089;      --  mmsystem.h:2937

   MCI_SEQ_DIV_PPQN : constant := 1216;      --  mmsystem.h:2949

   MCI_SEQ_DIV_SMPTE_24 : constant := 1217;      --  mmsystem.h:2950

   MCI_SEQ_DIV_SMPTE_25 : constant := 1218;      --  mmsystem.h:2951

   MCI_SEQ_DIV_SMPTE_30DROP : constant := 1219;      --  mmsystem.h:2952

   MCI_SEQ_DIV_SMPTE_30 : constant := 1220;      --  mmsystem.h:2953

   MCI_SEQ_FORMAT_SONGPTR : constant := 16#4001#;  --  mmsystem.h:2957

   MCI_SEQ_FILE : constant := 16#4002#;  --  mmsystem.h:2958

   MCI_SEQ_MIDI : constant := 16#4003#;  --  mmsystem.h:2959

   MCI_SEQ_SMPTE : constant := 16#4004#;  --  mmsystem.h:2960

   MCI_SEQ_NONE : constant := 65533;     --  mmsystem.h:2961

   MCI_SEQ_MAPPER : constant := 65535;     --  mmsystem.h:2963

   MCI_SEQ_STATUS_TEMPO : constant := 16#4002#;  --  mmsystem.h:2966

   MCI_SEQ_STATUS_PORT : constant := 16#4003#;  --  mmsystem.h:2967

   MCI_SEQ_STATUS_SLAVE : constant := 16#4007#;  --  mmsystem.h:2968

   MCI_SEQ_STATUS_MASTER : constant := 16#4008#;  --  mmsystem.h:2969

   MCI_SEQ_STATUS_OFFSET : constant := 16#4009#;  --  mmsystem.h:2970

   MCI_SEQ_STATUS_DIVTYPE : constant := 16#400a#;  --  mmsystem.h:2971

   MCI_SEQ_SET_TEMPO : constant := 16#10000#; --  mmsystem.h:2974

   MCI_SEQ_SET_PORT : constant := 16#20000#; --  mmsystem.h:2975

   MCI_SEQ_SET_SLAVE : constant := 16#40000#; --  mmsystem.h:2976

   MCI_SEQ_SET_MASTER : constant := 16#80000#; --  mmsystem.h:2977

   MCI_SEQ_SET_OFFSET : constant := 16#1000000#;

   --  mmsystem.h:2978

   MCI_ANIM_OPEN_WS : constant := 16#10000#; --  mmsystem.h:3001

   MCI_ANIM_OPEN_PARENT : constant := 16#20000#; --  mmsystem.h:3002

   MCI_ANIM_OPEN_NOSTATIC : constant := 16#40000#; --  mmsystem.h:3003

   MCI_ANIM_PLAY_SPEED : constant := 16#10000#; --  mmsystem.h:3006

   MCI_ANIM_PLAY_REVERSE : constant := 16#20000#; --  mmsystem.h:3007

   MCI_ANIM_PLAY_FAST : constant := 16#40000#; --  mmsystem.h:3008

   MCI_ANIM_PLAY_SLOW : constant := 16#80000#; --  mmsystem.h:3009

   MCI_ANIM_PLAY_SCAN : constant := 16#100000#; --  mmsystem.h:3010

   MCI_ANIM_STEP_REVERSE : constant := 16#10000#; --  mmsystem.h:3013

   MCI_ANIM_STEP_FRAMES : constant := 16#20000#; --  mmsystem.h:3014

   MCI_ANIM_STATUS_SPEED : constant := 16#4001#;  --  mmsystem.h:3017

   MCI_ANIM_STATUS_FORWARD : constant := 16#4002#;  --  mmsystem.h:3018

   MCI_ANIM_STATUS_HWND : constant := 16#4003#;  --  mmsystem.h:3019

   MCI_ANIM_STATUS_HPAL : constant := 16#4004#;  --  mmsystem.h:3020

   MCI_ANIM_STATUS_STRETCH : constant := 16#4005#;  --  mmsystem.h:3021

   MCI_ANIM_INFO_TEXT : constant := 16#10000#; --  mmsystem.h:3024

   MCI_ANIM_GETDEVCAPS_CAN_REVERSE : constant := 16#4001#;  --  mmsystem.h:3027

   MCI_ANIM_GETDEVCAPS_FAST_RATE : constant := 16#4002#;  --  mmsystem.h:3028

   MCI_ANIM_GETDEVCAPS_SLOW_RATE : constant := 16#4003#;  --  mmsystem.h:3029

   MCI_ANIM_GETDEVCAPS_NORMAL_RATE : constant := 16#4004#;  --  mmsystem.h:3030

   MCI_ANIM_GETDEVCAPS_PALETTES : constant := 16#4006#;  --  mmsystem.h:3031

   MCI_ANIM_GETDEVCAPS_CAN_STRETCH : constant := 16#4007#;  --  mmsystem.h:3032

   MCI_ANIM_GETDEVCAPS_MAX_WINDOWS : constant := 16#4008#;  --  mmsystem.h:3033

   MCI_ANIM_REALIZE_NORM : constant := 16#10000#; --  mmsystem.h:3036

   MCI_ANIM_REALIZE_BKGD : constant := 16#20000#; --  mmsystem.h:3037

   MCI_ANIM_WINDOW_HWND : constant := 16#10000#; --  mmsystem.h:3040

   MCI_ANIM_WINDOW_STATE : constant := 16#40000#; --  mmsystem.h:3041

   MCI_ANIM_WINDOW_TEXT : constant := 16#80000#; --  mmsystem.h:3042

   MCI_ANIM_WINDOW_ENABLE_STRETCH : constant := 16#100000#; --  mmsystem.h:3043

   MCI_ANIM_WINDOW_DISABLE_STRETCH : constant := 16#200000#;

   --  mmsystem.h:3044

   MCI_ANIM_WINDOW_DEFAULT : constant := 16#0#;     --  mmsystem.h:3048

   MCI_ANIM_RECT : constant := 16#10000#; --  mmsystem.h:3051

   MCI_ANIM_PUT_SOURCE : constant := 16#20000#; --  mmsystem.h:3052

   MCI_ANIM_PUT_DESTINATION : constant := 16#40000#; --  mmsystem.h:3053

   MCI_ANIM_WHERE_SOURCE : constant := 16#20000#; --  mmsystem.h:3056

   MCI_ANIM_WHERE_DESTINATION : constant := 16#40000#; --  mmsystem.h:3057

   MCI_ANIM_UPDATE_HDC : constant := 16#20000#; --  mmsystem.h:3060

   MCI_OVLY_OPEN_WS : constant := 16#10000#; --  mmsystem.h:3183

   MCI_OVLY_OPEN_PARENT : constant := 16#20000#; --  mmsystem.h:3184

   MCI_OVLY_STATUS_HWND : constant := 16#4001#;  --  mmsystem.h:3187

   MCI_OVLY_STATUS_STRETCH : constant := 16#4002#;  --  mmsystem.h:3188

   MCI_OVLY_INFO_TEXT : constant := 16#10000#; --  mmsystem.h:3191

   MCI_OVLY_GETDEVCAPS_CAN_STRETCH : constant := 16#4001#;  --  mmsystem.h:3194

   MCI_OVLY_GETDEVCAPS_CAN_FREEZE : constant := 16#4002#;  --  mmsystem.h:3195

   MCI_OVLY_GETDEVCAPS_MAX_WINDOWS : constant := 16#4003#;  --  mmsystem.h:3196

   MCI_OVLY_WINDOW_HWND : constant := 16#10000#; --  mmsystem.h:3199

   MCI_OVLY_WINDOW_STATE : constant := 16#40000#; --  mmsystem.h:3200

   MCI_OVLY_WINDOW_TEXT : constant := 16#80000#; --  mmsystem.h:3201

   MCI_OVLY_WINDOW_ENABLE_STRETCH : constant := 16#100000#; --  mmsystem.h:3202

   MCI_OVLY_WINDOW_DISABLE_STRETCH : constant := 16#200000#;

   --  mmsystem.h:3203

   MCI_OVLY_WINDOW_DEFAULT : constant := 16#0#;     --  mmsystem.h:3206

   MCI_OVLY_RECT : constant := 16#10000#; --  mmsystem.h:3209

   MCI_OVLY_PUT_SOURCE : constant := 16#20000#; --  mmsystem.h:3210

   MCI_OVLY_PUT_DESTINATION : constant := 16#40000#; --  mmsystem.h:3211

   MCI_OVLY_PUT_FRAME : constant := 16#80000#; --  mmsystem.h:3212

   MCI_OVLY_PUT_VIDEO : constant := 16#100000#; --  mmsystem.h:3213

   MCI_OVLY_WHERE_SOURCE : constant := 16#20000#; --  mmsystem.h:3216

   MCI_OVLY_WHERE_DESTINATION : constant := 16#40000#; --  mmsystem.h:3217

   MCI_OVLY_WHERE_FRAME : constant := 16#80000#; --  mmsystem.h:3218

   MCI_OVLY_WHERE_VIDEO : constant := 16#100000#; --  mmsystem.h:3219

   CAPS1 : constant := 94;        --  mmsystem.h:3383

   C1_TRANSPARENT : constant := 16#1#;     --  mmsystem.h:3384

   NEWTRANSPARENT : constant := 3;         --  mmsystem.h:3385

   QUERYROPSUPPORT : constant := 40;        --  mmsystem.h:3387

   SELECTDIB : constant := 41;        --  mmsystem.h:3396



   type MMVERSION is new Win32.UINT;                       --  mmsystem.h:87

   type MMRESULT is new Win32.UINT;                        --  mmsystem.h:89

   type FOURCC is new Win32.DWORD;                         --  mmsystem.h:1810

   type MCIERROR is new Win32.DWORD;                       --  mmsystem.h:2020

   type MCIDEVICEID is new Win32.UINT;                     --  mmsystem.h:2025



   MCI_ALL_DEVICE_ID : constant MCIDEVICEID := -1;

   --  mmsystem.h:2245



   type LPUINT is access all Win32.UINT;                   --  mmsystem.h:94

   subtype HDRVR is Win32.Winnt.HANDLE;                   --  mmsystem.h:238

   subtype HWAVE is Win32.Winnt.HANDLE;                   --  mmsystem.h:423

   subtype HWAVEIN is Win32.Winnt.HANDLE;                 --  mmsystem.h:424

   subtype HWAVEOUT is Win32.Winnt.HANDLE;                --  mmsystem.h:425

   type LPHWAVEIN is access all HWAVEIN;                   --  mmsystem.h:427

   type LPHWAVEOUT is access all HWAVEOUT;                 --  mmsystem.h:428

   subtype HMIDI is Win32.Winnt.HANDLE;                   --  mmsystem.h:736

   subtype HMIDIIN is Win32.Winnt.HANDLE;                 --  mmsystem.h:737

   subtype HMIDIOUT is Win32.Winnt.HANDLE;                --  mmsystem.h:738

   type LPHMIDIIN is access all HMIDIIN;                   --  mmsystem.h:740

   type LPHMIDIOUT is access all HMIDIOUT;                 --  mmsystem.h:741

   type LPPATCHARRAY is access all Win32.WORD;             --  mmsystem.h:746

   type LPKEYARRAY is access all Win32.WORD;               --  mmsystem.h:748

   subtype HMIXEROBJ is Win32.Winnt.HANDLE;               --  mmsystem.h:1057

   type LPHMIXEROBJ is access all HMIXEROBJ;               --  mmsystem.h:1058

   subtype HMIXER is Win32.Winnt.HANDLE;                  --  mmsystem.h:1060

   type LPHMIXER is access all HMIXER;                     --  mmsystem.h:1061

   subtype HPSTR is Win32.LPSTR;                           --  mmsystem.h:1811

   subtype HPCSTR is Win32.LPCSTR;                         --  mmsystem.h:1812

   subtype HMMIO is Win32.Winnt.HANDLE;                   --  mmsystem.h:1813



   type PATCHARRAY is                                      --  mmsystem.h:745

     array (Integer range 0 .. MIDIPATCHSIZE - 1)

     of Win32.WORD;



   type KEYARRAY is                                        --  mmsystem.h:747

     array (Integer range 0 .. MIDIPATCHSIZE - 1)

     of Win32.WORD;



   type struct_anonymous0_t;                               --  mmsystem.h:120

   type struct_anonymous1_t;                               --  mmsystem.h:125

   type union_anonymous2_t;                                --  mmsystem.h:126

   type MMTIME;                                            --  mmsystem.h:100

   type DRVCONFIGINFO;                                     --  mmsystem.h:260

   type WAVEHDR;                                           --  mmsystem.h:456

   type WAVEOUTCAPSA;                                      --  mmsystem.h:471

   type WAVEOUTCAPSW;                                      --  mmsystem.h:482

   type WAVEINCAPSA;                                       --  mmsystem.h:527

   type WAVEINCAPSW;                                       --  mmsystem.h:537

   type WAVEFORMAT;                                        --  mmsystem.h:589

   type PCMWAVEFORMAT;                                     --  mmsystem.h:604

   type WAVEFORMATEX;                                      --  mmsystem.h:619

   type MIDIOUTCAPSA;                                      --  mmsystem.h:772

   type MIDIOUTCAPSW;                                      --  mmsystem.h:784

   type MIDIINCAPSA;                                       --  mmsystem.h:835

   type MIDIINCAPSW;                                       --  mmsystem.h:842

   type MIDIHDR;                                           --  mmsystem.h:882

   type AUXCAPSA;                                          --  mmsystem.h:978

   type AUXCAPSW;                                          --  mmsystem.h:988

   type MIXERCAPSA;                                        --  mmsystem.h:1091

   type MIXERCAPSW;                                        --  mmsystem.h:1100

   type struct_anonymous7_t;                               --  mmsystem.h:1170

   type MIXERLINEA;                                        --  mmsystem.h:1148

   type struct_anonymous9_t;                               --  mmsystem.h:1194

   type MIXERLINEW;                                        --  mmsystem.h:1172

   type struct_anonymous10_t;                              --  mmsystem.h:1299

   type struct_anonymous11_t;                              --  mmsystem.h:1304

   type union_anonymous13_t;                               --  mmsystem.h:1306

   type union_anonymous14_t;                               --  mmsystem.h:1312

   type MIXERCONTROLA;                                     --  mmsystem.h:1284

   type struct_anonymous15_t;                              --  mmsystem.h:1329

   type struct_anonymous16_t;                              --  mmsystem.h:1334

   type union_anonymous17_t;                               --  mmsystem.h:1336

   type union_anonymous18_t;                               --  mmsystem.h:1342

   type MIXERCONTROLW;                                     --  mmsystem.h:1314

   type union_anonymous19_t;                               --  mmsystem.h:1446

   type MIXERLINECONTROLSA;                                --  mmsystem.h:1438

   type union_anonymous20_t;                               --  mmsystem.h:1464

   type MIXERLINECONTROLSW;                                --  mmsystem.h:1456

   type union_anonymous21_t;                               --  mmsystem.h:1518

   type MIXERCONTROLDETAILS;                               --  mmsystem.h:1507

   type MIXERCONTROLDETAILS_LISTTEXTA;                     --  mmsystem.h:1530

   type MIXERCONTROLDETAILS_LISTTEXTW;                     --  mmsystem.h:1540

   type MIXERCONTROLDETAILS_BOOLEAN;                       --  mmsystem.h:1571

   type MIXERCONTROLDETAILS_SIGNED;                        --  mmsystem.h:1578

   type MIXERCONTROLDETAILS_UNSIGNED;                      --  mmsystem.h:1586

   type TIMECAPS;                                          --  mmsystem.h:1645

   type JOYCAPSA;                                          --  mmsystem.h:1694

   type JOYCAPSW;                                          --  mmsystem.h:1709

   type JOYINFO;                                           --  mmsystem.h:1751

   type MMIOINFO;                                          --  mmsystem.h:1819

   type MMCKINFO;                                          --  mmsystem.h:1852

   type MCI_GENERIC_PARMS;                                 --  mmsystem.h:2432

   type MCI_OPEN_PARMSA;                                   --  mmsystem.h:2439

   type MCI_OPEN_PARMSW;                                   --  mmsystem.h:2447

   type MCI_PLAY_PARMS;                                    --  mmsystem.h:2493

   type MCI_SEEK_PARMS;                                    --  mmsystem.h:2502

   type MCI_STATUS_PARMS;                                  --  mmsystem.h:2510

   type MCI_INFO_PARMSA;                                   --  mmsystem.h:2520

   type MCI_INFO_PARMSW;                                   --  mmsystem.h:2526

   type MCI_GETDEVCAPS_PARMS;                              --  mmsystem.h:2552

   type MCI_SYSINFO_PARMSA;                                --  mmsystem.h:2561

   type MCI_SYSINFO_PARMSW;                                --  mmsystem.h:2569

   type MCI_SET_PARMS;                                     --  mmsystem.h:2597

   type MCI_BREAK_PARMS;                                   --  mmsystem.h:2606

   type MCI_SOUND_PARMSA;                                  --  mmsystem.h:2615

   type MCI_SOUND_PARMSW;                                  --  mmsystem.h:2620

   type MCI_SAVE_PARMSA;                                   --  mmsystem.h:2645

   type MCI_SAVE_PARMSW;                                   --  mmsystem.h:2650

   type MCI_LOAD_PARMSA;                                   --  mmsystem.h:2675

   type MCI_LOAD_PARMSW;                                   --  mmsystem.h:2680

   type MCI_RECORD_PARMS;                                  --  mmsystem.h:2705

   type MCI_VD_PLAY_PARMS;                                 --  mmsystem.h:2771

   type MCI_VD_STEP_PARMS;                                 --  mmsystem.h:2781

   type MCI_VD_ESCAPE_PARMSA;                              --  mmsystem.h:2789

   type MCI_VD_ESCAPE_PARMSW;                              --  mmsystem.h:2794

   type MCI_WAVE_OPEN_PARMSA;                              --  mmsystem.h:2860

   type MCI_WAVE_OPEN_PARMSW;                              --  mmsystem.h:2869

   type MCI_WAVE_DELETE_PARMS;                             --  mmsystem.h:2898

   type MCI_WAVE_SET_PARMS;                                --  mmsystem.h:2907

   type MCI_SEQ_SET_PARMS;                                 --  mmsystem.h:2981

   type MCI_ANIM_OPEN_PARMSA;                              --  mmsystem.h:3063

   type MCI_ANIM_OPEN_PARMSW;                              --  mmsystem.h:3073

   type MCI_ANIM_PLAY_PARMS;                               --  mmsystem.h:3103

   type MCI_ANIM_STEP_PARMS;                               --  mmsystem.h:3113

   type MCI_ANIM_WINDOW_PARMSA;                            --  mmsystem.h:3121

   type MCI_ANIM_WINDOW_PARMSW;                            --  mmsystem.h:3128

   type MCI_ANIM_RECT_PARMS;                               --  mmsystem.h:3155

   type MCI_ANIM_UPDATE_PARMS;                             --  mmsystem.h:3168

   type MCI_OVLY_OPEN_PARMSA;                              --  mmsystem.h:3223

   type MCI_OVLY_OPEN_PARMSW;                              --  mmsystem.h:3233

   type MCI_OVLY_WINDOW_PARMSA;                            --  mmsystem.h:3263

   type MCI_OVLY_WINDOW_PARMSW;                            --  mmsystem.h:3270

   type MCI_OVLY_RECT_PARMS;                               --  mmsystem.h:3297

   type MCI_OVLY_SAVE_PARMSA;                              --  mmsystem.h:3310

   type MCI_OVLY_SAVE_PARMSW;                              --  mmsystem.h:3316

   type MCI_OVLY_LOAD_PARMSA;                              --  mmsystem.h:3342

   type MCI_OVLY_LOAD_PARMSW;                              --  mmsystem.h:3348



   type PAUXCAPSA is access all AUXCAPSA;                  --  mmsystem.h:1002

   subtype PAUXCAPS is PAUXCAPSA;                          --  mmsystem.h:1007

   subtype LPAUXCAPS is PAUXCAPSA;                         --  mmsystem.h:1021

   subtype LPAUXCAPSA is PAUXCAPSA;                        --  mmsystem.h:1016

   subtype NPAUXCAPS is PAUXCAPSA;                         --  mmsystem.h:1014

   subtype NPAUXCAPSA is PAUXCAPSA;                        --  mmsystem.h:1009



   type PAUXCAPSW is access all AUXCAPSW;                  --  mmsystem.h:1003

   subtype LPAUXCAPSW is PAUXCAPSW;                        --  mmsystem.h:1017

   subtype NPAUXCAPSW is PAUXCAPSW;                        --  mmsystem.h:1010



   type PDRVCONFIGINFO is access all DRVCONFIGINFO;        --  mmsystem.h:265

   subtype LPDRVCONFIGINFO is PDRVCONFIGINFO;              --  mmsystem.h:267

   subtype NPDRVCONFIGINFO is PDRVCONFIGINFO;              --  mmsystem.h:266



   type PJOYCAPSA is access all JOYCAPSA;                  --  mmsystem.h:1728

   subtype LPJOYCAPS is PJOYCAPSA;                         --  mmsystem.h:1747

   subtype LPJOYCAPSA is PJOYCAPSA;                        --  mmsystem.h:1742

   subtype NPJOYCAPS is PJOYCAPSA;                         --  mmsystem.h:1740

   subtype NPJOYCAPSA is PJOYCAPSA;                        --  mmsystem.h:1735

   subtype PJOYCAPS is PJOYCAPSA;                          --  mmsystem.h:1733



   type PJOYCAPSW is access all JOYCAPSW;                  --  mmsystem.h:1729

   subtype LPJOYCAPSW is PJOYCAPSW;                        --  mmsystem.h:1743

   subtype NPJOYCAPSW is PJOYCAPSW;                        --  mmsystem.h:1736



   type PJOYINFO is access all JOYINFO;                    --  mmsystem.h:1757

   subtype LPJOYINFO is PJOYINFO;                          --  mmsystem.h:1759

   subtype NPJOYINFO is PJOYINFO;                          --  mmsystem.h:1758



   type PMCI_ANIM_OPEN_PARMSA is access all MCI_ANIM_OPEN_PARMSA;

   --  mmsystem.h:3087

   subtype LPMCI_ANIM_OPEN_PARMS is PMCI_ANIM_OPEN_PARMSA; --  mmsystem.h:3099

   subtype LPMCI_ANIM_OPEN_PARMSA is PMCI_ANIM_OPEN_PARMSA; --  mmsystem.h:3094

   subtype PMCI_ANIM_OPEN_PARMS is PMCI_ANIM_OPEN_PARMSA;  --  mmsystem.h:3092



   type PMCI_ANIM_OPEN_PARMSW is access all MCI_ANIM_OPEN_PARMSW;

   --  mmsystem.h:3088

   subtype LPMCI_ANIM_OPEN_PARMSW is PMCI_ANIM_OPEN_PARMSW; --  mmsystem.h:3095



   type PMCI_ANIM_PLAY_PARMS is access all MCI_ANIM_PLAY_PARMS;

   --  mmsystem.h:3109

   subtype LPMCI_ANIM_PLAY_PARMS is PMCI_ANIM_OPEN_PARMSW; --  mmsystem.h:3110



   type PMCI_ANIM_RECT_PARMS is access all MCI_ANIM_RECT_PARMS;

   --  mmsystem.h:3164

   subtype LPMCI_ANIM_RECT_PARMS is PMCI_ANIM_RECT_PARMS;  --  mmsystem.h:3165



   type PMCI_ANIM_STEP_PARMS is access all MCI_ANIM_STEP_PARMS;

   --  mmsystem.h:3117

   subtype LPMCI_ANIM_STEP_PARMS is PMCI_ANIM_RECT_PARMS;  --  mmsystem.h:3118



   type PMCI_ANIM_UPDATE_PARMS is access all MCI_ANIM_UPDATE_PARMS;

   --  mmsystem.h:3173

   subtype LPMCI_ANIM_UPDATE_PARMS is PMCI_ANIM_UPDATE_PARMS;

   --  mmsystem.h:3174



   type PMCI_ANIM_WINDOW_PARMSA is access all MCI_ANIM_WINDOW_PARMSA;

   --  mmsystem.h:3139

   subtype LPMCI_ANIM_WINDOW_PARMS is PMCI_ANIM_WINDOW_PARMSA;

   --  mmsystem.h:3151

   subtype LPMCI_ANIM_WINDOW_PARMSA is PMCI_ANIM_WINDOW_PARMSA;

   --  mmsystem.h:3146

   subtype PMCI_ANIM_WINDOW_PARMS is PMCI_ANIM_WINDOW_PARMSA;

   --  mmsystem.h:3144



   type PMCI_ANIM_WINDOW_PARMSW is access all MCI_ANIM_WINDOW_PARMSW;

   --  mmsystem.h:3140

   subtype LPMCI_ANIM_WINDOW_PARMSW is PMCI_ANIM_WINDOW_PARMSW;

   --  mmsystem.h:3147



   type PMCI_BREAK_PARMS is access all MCI_BREAK_PARMS;    --  mmsystem.h:2611

   subtype LPMCI_BREAK_PARMS is PMCI_BREAK_PARMS;          --  mmsystem.h:2612



   type PMCI_GENERIC_PARMS is access all MCI_GENERIC_PARMS; --  mmsystem.h:2435

   subtype LPMCI_GENERIC_PARMS is PMCI_GENERIC_PARMS;      --  mmsystem.h:2436



   type PMCI_GETDEVCAPS_PARMS is access all MCI_GETDEVCAPS_PARMS;

   --  mmsystem.h:2557

   subtype LPMCI_GETDEVCAPS_PARMS is PMCI_GETDEVCAPS_PARMS; --  mmsystem.h:2558



   type PMCI_INFO_PARMSA is access all MCI_INFO_PARMSA;    --  mmsystem.h:2536

   subtype LPMCI_INFO_PARMS is PMCI_INFO_PARMSA;           --  mmsystem.h:2548

   subtype LPMCI_INFO_PARMSA is PMCI_INFO_PARMSA;          --  mmsystem.h:2543

   subtype PMCI_INFO_PARMS is PMCI_INFO_PARMSA;            --  mmsystem.h:2541



   type PMCI_INFO_PARMSW is access all MCI_INFO_PARMSW;    --  mmsystem.h:2537

   subtype LPMCI_INFO_PARMSW is PMCI_INFO_PARMSW;          --  mmsystem.h:2544



   type PMCI_LOAD_PARMSA is access all MCI_LOAD_PARMSA;    --  mmsystem.h:2689

   subtype LPMCI_LOAD_PARMS is PMCI_LOAD_PARMSA;           --  mmsystem.h:2701

   subtype LPMCI_LOAD_PARMSA is PMCI_LOAD_PARMSA;          --  mmsystem.h:2696

   subtype PMCI_LOAD_PARMS is PMCI_LOAD_PARMSA;            --  mmsystem.h:2694



   type PMCI_LOAD_PARMSW is access all MCI_LOAD_PARMSW;    --  mmsystem.h:2690

   subtype LPMCI_LOAD_PARMSW is PMCI_LOAD_PARMSW;          --  mmsystem.h:2697



   type PMCI_OPEN_PARMSA is access all MCI_OPEN_PARMSA;    --  mmsystem.h:2477

   subtype LPMCI_OPEN_PARMS is PMCI_OPEN_PARMSA;           --  mmsystem.h:2489

   subtype LPMCI_OPEN_PARMSA is PMCI_OPEN_PARMSA;          --  mmsystem.h:2484

   subtype PMCI_OPEN_PARMS is PMCI_OPEN_PARMSA;            --  mmsystem.h:2482



   type PMCI_OPEN_PARMSW is access all MCI_OPEN_PARMSW;    --  mmsystem.h:2478

   subtype LPMCI_OPEN_PARMSW is PMCI_OPEN_PARMSW;          --  mmsystem.h:2485



   type PMCI_OVLY_LOAD_PARMSA is access all MCI_OVLY_LOAD_PARMSA;

   --  mmsystem.h:3358

   subtype LPMCI_OVLY_LOAD_PARMS is PMCI_OVLY_LOAD_PARMSA; --  mmsystem.h:3370

   subtype LPMCI_OVLY_LOAD_PARMSA is PMCI_OVLY_LOAD_PARMSA; --  mmsystem.h:3365

   subtype PMCI_OVLY_LOAD_PARMS is PMCI_OVLY_LOAD_PARMSA;  --  mmsystem.h:3363



   type PMCI_OVLY_LOAD_PARMSW is access all MCI_OVLY_LOAD_PARMSW;

   --  mmsystem.h:3359

   subtype LPMCI_OVLY_LOAD_PARMSW is PMCI_OVLY_LOAD_PARMSW; --  mmsystem.h:3366



   type PMCI_OVLY_OPEN_PARMSA is access all MCI_OVLY_OPEN_PARMSA;

   --  mmsystem.h:3247

   subtype LPMCI_OVLY_OPEN_PARMS is PMCI_OVLY_OPEN_PARMSA; --  mmsystem.h:3259

   subtype LPMCI_OVLY_OPEN_PARMSA is PMCI_OVLY_OPEN_PARMSA; --  mmsystem.h:3254

   subtype PMCI_OVLY_OPEN_PARMS is PMCI_OVLY_OPEN_PARMSA;  --  mmsystem.h:3252



   type PMCI_OVLY_OPEN_PARMSW is access all MCI_OVLY_OPEN_PARMSW;

   --  mmsystem.h:3248

   subtype LPMCI_OVLY_OPEN_PARMSW is PMCI_OVLY_OPEN_PARMSW; --  mmsystem.h:3255



   type PMCI_OVLY_RECT_PARMS is access all MCI_OVLY_RECT_PARMS;

   --  mmsystem.h:3306

   subtype LPMCI_OVLY_RECT_PARMS is PMCI_OVLY_RECT_PARMS;  --  mmsystem.h:3307



   type PMCI_OVLY_SAVE_PARMSA is access all MCI_OVLY_SAVE_PARMSA;

   --  mmsystem.h:3326

   subtype LPMCI_OVLY_SAVE_PARMS is PMCI_OVLY_SAVE_PARMSA; --  mmsystem.h:3338

   subtype LPMCI_OVLY_SAVE_PARMSA is PMCI_OVLY_SAVE_PARMSA; --  mmsystem.h:3333

   subtype PMCI_OVLY_SAVE_PARMS is PMCI_OVLY_SAVE_PARMSA;  --  mmsystem.h:3331



   type PMCI_OVLY_SAVE_PARMSW is access all MCI_OVLY_SAVE_PARMSW;

   --  mmsystem.h:3327

   subtype LPMCI_OVLY_SAVE_PARMSW is PMCI_OVLY_SAVE_PARMSW; --  mmsystem.h:3334



   type PMCI_OVLY_WINDOW_PARMSA is access all MCI_OVLY_WINDOW_PARMSA;

   --  mmsystem.h:3281

   subtype LPMCI_OVLY_WINDOW_PARMS is PMCI_OVLY_WINDOW_PARMSA;

   --  mmsystem.h:3293

   subtype LPMCI_OVLY_WINDOW_PARMSA is PMCI_OVLY_WINDOW_PARMSA;

   --  mmsystem.h:3288

   subtype PMCI_OVLY_WINDOW_PARMS is PMCI_OVLY_WINDOW_PARMSA;

   --  mmsystem.h:3286



   type PMCI_OVLY_WINDOW_PARMSW is access all MCI_OVLY_WINDOW_PARMSW;

   --  mmsystem.h:3282

   subtype LPMCI_OVLY_WINDOW_PARMSW is PMCI_OVLY_WINDOW_PARMSW;

   --  mmsystem.h:3289



   type PMCI_PLAY_PARMS is access all MCI_PLAY_PARMS;      --  mmsystem.h:2498

   subtype LPMCI_PLAY_PARMS is PMCI_PLAY_PARMS;            --  mmsystem.h:2499



   type PMCI_RECORD_PARMS is access all MCI_RECORD_PARMS;  --  mmsystem.h:2711

   subtype LPMCI_RECORD_PARMS is PMCI_RECORD_PARMS;        --  mmsystem.h:2712



   type PMCI_SAVE_PARMSA is access all MCI_SAVE_PARMSA;    --  mmsystem.h:2659

   subtype LPMCI_SAVE_PARMS is PMCI_SAVE_PARMSA;           --  mmsystem.h:2671

   subtype LPMCI_SAVE_PARMSA is PMCI_SAVE_PARMSA;          --  mmsystem.h:2666

   subtype PMCI_SAVE_PARMS is PMCI_SAVE_PARMSA;            --  mmsystem.h:2664



   type PMCI_SAVE_PARMSW is access all MCI_SAVE_PARMSW;    --  mmsystem.h:2660

   subtype LPMCI_SAVE_PARMSW is PMCI_SAVE_PARMSW;          --  mmsystem.h:2667



   type PMCI_SEEK_PARMS is access all MCI_SEEK_PARMS;      --  mmsystem.h:2506

   subtype LPMCI_SEEK_PARMS is PMCI_SEEK_PARMS;            --  mmsystem.h:2507



   type PMCI_SEQ_SET_PARMS is access all MCI_SEQ_SET_PARMS; --  mmsystem.h:2991

   subtype LPMCI_SEQ_SET_PARMS is PMCI_SEQ_SET_PARMS;      --  mmsystem.h:2992



   type PMCI_SET_PARMS is access all MCI_SET_PARMS;        --  mmsystem.h:2602

   subtype LPMCI_SET_PARMS is PMCI_SET_PARMS;              --  mmsystem.h:2603



   type PMCI_SOUND_PARMSA is access all MCI_SOUND_PARMSA;  --  mmsystem.h:2629

   subtype LPMCI_SOUND_PARMS is PMCI_SOUND_PARMSA;         --  mmsystem.h:2641

   subtype LPMCI_SOUND_PARMSA is PMCI_SOUND_PARMSA;        --  mmsystem.h:2636

   subtype PMCI_SOUND_PARMS is PMCI_SOUND_PARMSA;          --  mmsystem.h:2634



   type PMCI_SOUND_PARMSW is access all MCI_SOUND_PARMSW;  --  mmsystem.h:2630

   subtype LPMCI_SOUND_PARMSW is PMCI_SOUND_PARMSW;        --  mmsystem.h:2637



   type PMCI_STATUS_PARMS is access all MCI_STATUS_PARMS;  --  mmsystem.h:2516

   subtype LPMCI_STATUS_PARMS is PMCI_STATUS_PARMS;        --  mmsystem.h:2517



   type LPMCI_SYSINFO_PARMS is access all MCI_SYSINFO_PARMSA;

   --  mmsystem.h:2593

   subtype LPMCI_SYSINFO_PARMSA is LPMCI_SYSINFO_PARMS;    --  mmsystem.h:2588

   subtype PMCI_SYSINFO_PARMSA is LPMCI_SYSINFO_PARMS;     --  mmsystem.h:2581

   subtype PMCI_SYSINFO_PARMS is LPMCI_SYSINFO_PARMS;      --  mmsystem.h:2586



   type PMCI_SYSINFO_PARMSW is access all MCI_SYSINFO_PARMSW;

   --  mmsystem.h:2582

   subtype LPMCI_SYSINFO_PARMSW is PMCI_SYSINFO_PARMSW;    --  mmsystem.h:2589



   type PMCI_VD_ESCAPE_PARMSA is access all MCI_VD_ESCAPE_PARMSA;

   --  mmsystem.h:2803

   subtype LPMCI_VD_ESCAPE_PARMS is PMCI_VD_ESCAPE_PARMSA; --  mmsystem.h:2815

   subtype LPMCI_VD_ESCAPE_PARMSA is PMCI_VD_ESCAPE_PARMSA; --  mmsystem.h:2810

   subtype PMCI_VD_ESCAPE_PARMS is PMCI_VD_ESCAPE_PARMSA;  --  mmsystem.h:2808



   type PMCI_VD_ESCAPE_PARMSW is access all MCI_VD_ESCAPE_PARMSW;

   --  mmsystem.h:2804

   subtype LPMCI_VD_ESCAPE_PARMSW is PMCI_VD_ESCAPE_PARMSW; --  mmsystem.h:2811



   type PMCI_VD_PLAY_PARMS is access all MCI_VD_PLAY_PARMS; --  mmsystem.h:2777

   subtype LPMCI_VD_PLAY_PARMS is PMCI_VD_PLAY_PARMS;      --  mmsystem.h:2778



   type PMCI_VD_STEP_PARMS is access all MCI_VD_STEP_PARMS; --  mmsystem.h:2785

   subtype LPMCI_VD_STEP_PARMS is PMCI_VD_STEP_PARMS;      --  mmsystem.h:2786



   type PMCI_WAVE_DELETE_PARMS is access all MCI_WAVE_DELETE_PARMS;

   --  mmsystem.h:2903

   subtype LPMCI_WAVE_DELETE_PARMS is PMCI_WAVE_DELETE_PARMS;

   --  mmsystem.h:2904



   type PMCI_WAVE_OPEN_PARMSA is access all MCI_WAVE_OPEN_PARMSA;

   --  mmsystem.h:2882

   subtype LPMCI_WAVE_OPEN_PARMS is PMCI_WAVE_OPEN_PARMSA; --  mmsystem.h:2894

   subtype LPMCI_WAVE_OPEN_PARMSA is PMCI_WAVE_OPEN_PARMSA; --  mmsystem.h:2889

   subtype PMCI_WAVE_OPEN_PARMS is PMCI_WAVE_OPEN_PARMSA;  --  mmsystem.h:2887



   type PMCI_WAVE_OPEN_PARMSW is access all MCI_WAVE_OPEN_PARMSW;

   --  mmsystem.h:2883

   subtype LPMCI_WAVE_OPEN_PARMSW is PMCI_WAVE_OPEN_PARMSW; --  mmsystem.h:2890



   type PMCI_WAVE_SET_PARMS is access all MCI_WAVE_SET_PARMS;

   --  mmsystem.h:2924

   subtype LPMCI_WAVE_SET_PARMS is PMCI_WAVE_SET_PARMS;    --  mmsystem.h:2925



   type PMIDIHDR is access all MIDIHDR;                    --  mmsystem.h:885

   subtype LPMIDIHDR is PMIDIHDR;                          --  mmsystem.h:887

   subtype NPMIDIHDR is PMIDIHDR;                          --  mmsystem.h:886



   type PMIDIINCAPSA is access all MIDIINCAPSA;            --  mmsystem.h:853

   subtype LPMIDIINCAPS is PMIDIINCAPSA;                   --  mmsystem.h:872

   subtype LPMIDIINCAPSA is PMIDIINCAPSA;                  --  mmsystem.h:867

   subtype NPMIDIINCAPS is PMIDIINCAPSA;                   --  mmsystem.h:865

   subtype NPMIDIINCAPSA is PMIDIINCAPSA;                  --  mmsystem.h:860

   subtype PMIDIINCAPS is PMIDIINCAPSA;                    --  mmsystem.h:858



   type PMIDIINCAPSW is access all MIDIINCAPSW;            --  mmsystem.h:854

   subtype LPMIDIINCAPSW is PMIDIINCAPSW;                  --  mmsystem.h:868

   subtype NPMIDIINCAPSW is PMIDIINCAPSW;                  --  mmsystem.h:861



   type PMIDIOUTCAPSA is access all MIDIOUTCAPSA;          --  mmsystem.h:800

   subtype LPMIDIOUTCAPS is PMIDIOUTCAPSA;                 --  mmsystem.h:819

   subtype LPMIDIOUTCAPSA is PMIDIOUTCAPSA;                --  mmsystem.h:814

   subtype NPMIDIOUTCAPS is PMIDIOUTCAPSA;                 --  mmsystem.h:812

   subtype NPMIDIOUTCAPSA is PMIDIOUTCAPSA;                --  mmsystem.h:807

   subtype PMIDIOUTCAPS is PMIDIOUTCAPSA;                  --  mmsystem.h:805



   type PMIDIOUTCAPSW is access all MIDIOUTCAPSW;          --  mmsystem.h:801

   subtype LPMIDIOUTCAPSW is PMIDIOUTCAPSW;                --  mmsystem.h:815

   subtype NPMIDIOUTCAPSW is PMIDIOUTCAPSW;                --  mmsystem.h:808



   type PMIXERCAPSA is access all MIXERCAPSA;              --  mmsystem.h:1114

   subtype LPMIXERCAPS is PMIXERCAPSA;                     --  mmsystem.h:1126

   subtype LPMIXERCAPSA is PMIXERCAPSA;                    --  mmsystem.h:1121

   subtype PMIXERCAPS is PMIXERCAPSA;                      --  mmsystem.h:1119



   type PMIXERCAPSW is access all MIXERCAPSW;              --  mmsystem.h:1115

   subtype LPMIXERCAPSW is PMIXERCAPSW;                    --  mmsystem.h:1122



   type PMIXERCONTROLA is access all MIXERCONTROLA;        --  mmsystem.h:1349

   subtype LPMIXERCONTROL is PMIXERCONTROLA;               --  mmsystem.h:1361

   subtype LPMIXERCONTROLA is PMIXERCONTROLA;              --  mmsystem.h:1356

   subtype PMIXERCONTROL is PMIXERCONTROLA;                --  mmsystem.h:1354



   type PMIXERCONTROLDETAILS is access all MIXERCONTROLDETAILS;

   --  mmsystem.h:1523

   subtype LPMIXERCONTROLDETAILS is PMIXERCONTROLDETAILS;  --  mmsystem.h:1523



   type PMIXERCONTROLDETAILS_BOOLEAN is access all MIXERCONTROLDETAILS_BOOLEAN;

   --  mmsystem.h:1575

   subtype LPMIXERCONTROLDETAILS_BOOLEAN is PMIXERCONTROLDETAILS_BOOLEAN;

   --  mmsystem.h:1576



   type PMIXERCONTROLDETAILS_LISTTEXTA is access all

     MIXERCONTROLDETAILS_LISTTEXTA;                   --  mmsystem.h:1551

   subtype LPMIXERCONTROLDETAILS_LISTTEXT is PMIXERCONTROLDETAILS_LISTTEXTA;

   --  mmsystem.h:1563

   subtype LPMIXERCONTROLDETAILS_LISTTEXTA is PMIXERCONTROLDETAILS_LISTTEXTA;

   --  mmsystem.h:1558

   subtype PMIXERCONTROLDETAILS_LISTTEXT is PMIXERCONTROLDETAILS_LISTTEXTA;

   --  mmsystem.h:1556



   type PMIXERCONTROLDETAILS_LISTTEXTW is access all

     MIXERCONTROLDETAILS_LISTTEXTW;                   --  mmsystem.h:1552

   subtype LPMIXERCONTROLDETAILS_LISTTEXTW is PMIXERCONTROLDETAILS_LISTTEXTW;

   --  mmsystem.h:1559



   type PMIXERCONTROLDETAILS_SIGNED is access all MIXERCONTROLDETAILS_SIGNED;

   --  mmsystem.h:1582

   subtype LPMIXERCONTROLDETAILS_SIGNED is PMIXERCONTROLDETAILS_SIGNED;

   --  mmsystem.h:1583



   type PMIXERCONTROLDETAILS_UNSIGNED is access all

     MIXERCONTROLDETAILS_UNSIGNED;                    --  mmsystem.h:1590

   subtype LPMIXERCONTROLDETAILS_UNSIGNED is PMIXERCONTROLDETAILS_UNSIGNED;

   --  mmsystem.h:1591



   type PMIXERCONTROLW is access all MIXERCONTROLW;        --  mmsystem.h:1350

   subtype LPMIXERCONTROLW is PMIXERCONTROLW;              --  mmsystem.h:1357



   type PMIXERLINEA is access all MIXERLINEA;              --  mmsystem.h:1201

   subtype LPMIXERLINE is PMIXERLINEA;                     --  mmsystem.h:1213

   subtype LPMIXERLINEA is PMIXERLINEA;                    --  mmsystem.h:1208

   subtype PMIXERLINE is PMIXERLINEA;                      --  mmsystem.h:1206



   type PMIXERLINECONTROLSA is access all MIXERLINECONTROLSA;

   --  mmsystem.h:1474

   subtype LPMIXERLINECONTROLS is PMIXERLINECONTROLSA;     --  mmsystem.h:1486

   subtype LPMIXERLINECONTROLSA is PMIXERLINECONTROLSA;    --  mmsystem.h:1481

   subtype PMIXERLINECONTROLS is PMIXERLINECONTROLSA;      --  mmsystem.h:1479



   type PMIXERLINECONTROLSW is access all MIXERLINECONTROLSW;

   --  mmsystem.h:1475

   subtype LPMIXERLINECONTROLSW is PMIXERLINECONTROLSA;    --  mmsystem.h:1482



   type PMIXERLINEW is access all MIXERLINEW;              --  mmsystem.h:1202

   subtype LPMIXERLINEW is PMIXERLINEW;                    --  mmsystem.h:1209



   type PMMCKINFO is access all MMCKINFO;                  --  mmsystem.h:1860

   type LPCMMCKINFO is access all MMCKINFO;           --  mmsystem.h:1863

   subtype LPMMCKINFO is PMMCKINFO;                        --  mmsystem.h:1862

   subtype NPMMCKINFO is PMMCKINFO;                        --  mmsystem.h:1861



   type PMMIOINFO is access all MMIOINFO;                  --  mmsystem.h:1846

   type LPCMMIOINFO is access all MMIOINFO;           --  mmsystem.h:1849

   subtype LPMMIOINFO is PMMIOINFO;                        --  mmsystem.h:1848

   subtype NPMMIOINFO is PMMIOINFO;                        --  mmsystem.h:1847



   type PMMTIME is access all MMTIME;                      --  mmsystem.h:128

   subtype LPMMTIME is PMMTIME;                            --  mmsystem.h:130

   subtype NPMMTIME is PMMTIME;                            --  mmsystem.h:129



   type PPCMWAVEFORMAT is access all PCMWAVEFORMAT;        --  mmsystem.h:608

   subtype LPPCMWAVEFORMAT is PPCMWAVEFORMAT;              --  mmsystem.h:610

   subtype NPPCMWAVEFORMAT is PPCMWAVEFORMAT;              --  mmsystem.h:609



   type PTIMECAPS is access all TIMECAPS;                  --  mmsystem.h:1649

   subtype LPTIMECAPS is PTIMECAPS;                        --  mmsystem.h:1651

   subtype NPTIMECAPS is PTIMECAPS;                        --  mmsystem.h:1650



   type PWAVEFORMAT is access all WAVEFORMAT;              --  mmsystem.h:590

   type LPCWAVEFORMAT is access all WAVEFORMAT;       --  mmsystem.h:593

   subtype LPWAVEFORMAT is PWAVEFORMAT;                    --  mmsystem.h:592

   subtype NPWAVEFORMAT is PWAVEFORMAT;                    --  mmsystem.h:591



   type PWAVEFORMATEX is access all WAVEFORMATEX;          --  mmsystem.h:629

   type LPCWAVEFORMATEX is access all WAVEFORMATEX;   --  mmsystem.h:630

   subtype LPWAVEFORMATEX is PWAVEFORMATEX;                --  mmsystem.h:629

   subtype NPWAVEFORMATEX is PWAVEFORMATEX;                --  mmsystem.h:629



   type PWAVEHDR is access all WAVEHDR;                    --  mmsystem.h:459

   subtype LPWAVEHDR is PWAVEHDR;                          --  mmsystem.h:461

   subtype NPWAVEHDR is PWAVEHDR;                          --  mmsystem.h:460



   type PWAVEINCAPSA is access all WAVEINCAPSA;            --  mmsystem.h:551

   subtype LPWAVEINCAPS is PWAVEINCAPSA;                   --  mmsystem.h:563

   subtype LPWAVEINCAPSA is PWAVEINCAPSA;                  --  mmsystem.h:558

   subtype PWAVEINCAPS is PWAVEINCAPSA;                    --  mmsystem.h:556



   type PWAVEINCAPSW is access all WAVEINCAPSW;            --  mmsystem.h:552

   subtype LPWAVEINCAPSW is PWAVEINCAPSW;                  --  mmsystem.h:559



   type PWAVEOUTCAPSA is access all WAVEOUTCAPSA;          --  mmsystem.h:497

   subtype LPWAVEOUTCAPS is PWAVEOUTCAPSA;                 --  mmsystem.h:516

   subtype LPWAVEOUTCAPSA is PWAVEOUTCAPSA;                --  mmsystem.h:511

   subtype NPWAVEOUTCAPS is PWAVEOUTCAPSA;                 --  mmsystem.h:509

   subtype NPWAVEOUTCAPSA is PWAVEOUTCAPSA;                --  mmsystem.h:504

   subtype PWAVEOUTCAPS is PWAVEOUTCAPSA;                  --  mmsystem.h:502



   type PWAVEOUTCAPSW is access all WAVEOUTCAPSW;          --  mmsystem.h:498

   subtype LPWAVEOUTCAPSW is PWAVEOUTCAPSW;                --  mmsystem.h:512

   subtype NPWAVEOUTCAPSW is PWAVEOUTCAPSW;                --  mmsystem.h:505



   type struct_anonymous0_t is                             --  mmsystem.h:120

      record

         hour : Win32.BYTE;                              --  mmsystem.h:113

         min : Win32.BYTE;                              --  mmsystem.h:114

         sec : Win32.BYTE;                              --  mmsystem.h:115

         frame : Win32.BYTE;                              --  mmsystem.h:116

         fps : Win32.BYTE;                              --  mmsystem.h:117

         dummy : Win32.BYTE;                              --  mmsystem.h:118

         pad : Win32.BYTE_Array (0 .. 1);                  --  mmsystem.h:119

      end record;



   type struct_anonymous1_t is                             --  mmsystem.h:125

      record

         songptrpos : Win32.DWORD;                        --  mmsystem.h:124

      end record;



   type union_anonymous2_t_kind is ( --  mmsystem.h:126

     ms_kind,

     sample_kind,

     cb_kind,

     ticks_kind,

     smpte_kind,

     midi_kind

                                   );



   type union_anonymous2_t (Which : union_anonymous2_t_kind := smpte_kind) is

      --  mmsystem.h:126

      record

         case Which is

            when ms_kind =>

               ms : Win32.DWORD;                        --  mmsystem.h:105

            when sample_kind =>

               sample : Win32.DWORD;                    --  mmsystem.h:106

            when cb_kind =>

               cb : Win32.DWORD;                        --  mmsystem.h:107

            when ticks_kind =>

               ticks : Win32.DWORD;                     --  mmsystem.h:108

            when smpte_kind =>

               smpte : struct_anonymous0_t;             --  mmsystem.h:120

            when midi_kind =>

               midi : struct_anonymous1_t;              --  mmsystem.h:125

         end case;

      end record;



   pragma Convention (C, union_anonymous2_t);



   pragma Unchecked_Union (union_anonymous2_t);



   type MMTIME is                                          --  mmsystem.h:100

      record

         wType : Win32.UINT;                              --  mmsystem.h:102

         u : union_anonymous2_t;                      --  mmsystem.h:126

      end record;



   type DRVCONFIGINFO is                                   --  mmsystem.h:260

      record

         dwDCISize : Win32.DWORD;                --  mmsystem.h:261

         lpszDCISectionName : Win32.LPCWSTR;              --  mmsystem.h:262

         lpszDCIAliasName : Win32.LPCWSTR;              --  mmsystem.h:263

      end record;



   type anonymous3_t is access procedure;                 --  mmsystem.h:316

   pragma Convention (Stdcall, anonymous3_t);

   type LPDRVCALLBACK is access procedure;                --  mmsystem.h:316

   pragma Convention (Stdcall, LPDRVCALLBACK);

   type PDRVCALLBACK is access procedure;                 --  mmsystem.h:317

   pragma Convention (Stdcall, PDRVCALLBACK);

   type LPWAVECALLBACK is access procedure;               --  mmsystem.h:431

   pragma Convention (Stdcall, LPWAVECALLBACK);



   type WAVEHDR is                                         --  mmsystem.h:456

      record

         lpData : Win32.LPBYTE;                  --  mmsystem.h:450

         dwBufferLength : Win32.DWORD;                   --  mmsystem.h:451

         dwBytesRecorded : Win32.DWORD;                   --  mmsystem.h:452

         dwUser : Win32.DWORD;                   --  mmsystem.h:453

         dwFlags : Win32.DWORD;                   --  mmsystem.h:454

         dwLoops : Win32.DWORD;                   --  mmsystem.h:455

         lpNext : PWAVEHDR;                      --  mmsystem.h:456

         reserved : Win32.DWORD;                   --  mmsystem.h:457

      end record;



   type WAVEOUTCAPSA is                                    --  mmsystem.h:471

      record

         wMid : Win32.WORD;                     --  mmsystem.h:472

         wPid : Win32.WORD;                     --  mmsystem.h:473

         vDriverVersion : MMVERSION;                      --  mmsystem.h:474

         szPname : Win32.CHAR_Array (0 .. 31);        --  mmsystem.h:475

         dwFormats : Win32.DWORD;                    --  mmsystem.h:476

         wChannels : Win32.WORD;                     --  mmsystem.h:477

         wReserved1 : Win32.WORD;                     --  mmsystem.h:478

         dwSupport : Win32.DWORD;                    --  mmsystem.h:479

      end record;



   type WAVEOUTCAPSW is                                    --  mmsystem.h:482

      record

         wMid : Win32.WORD;                     --  mmsystem.h:483

         wPid : Win32.WORD;                     --  mmsystem.h:484

         vDriverVersion : MMVERSION;                      --  mmsystem.h:485

         szPname : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);

         --  mmsystem.h:486

         dwFormats : Win32.DWORD;                    --  mmsystem.h:487

         wChannels : Win32.WORD;                     --  mmsystem.h:488

         wReserved1 : Win32.WORD;                     --  mmsystem.h:489

         dwSupport : Win32.DWORD;                    --  mmsystem.h:490

      end record;



   subtype WAVEOUTCAPS is WAVEOUTCAPSA;                    --  mmsystem.h:495



   type WAVEINCAPSA is                                     --  mmsystem.h:527

      record

         wMid : Win32.WORD;                     --  mmsystem.h:528

         wPid : Win32.WORD;                     --  mmsystem.h:529

         vDriverVersion : MMVERSION;                      --  mmsystem.h:530

         szPname : Win32.CHAR_Array (0 .. 31);        --  mmsystem.h:531

         dwFormats : Win32.DWORD;                    --  mmsystem.h:532

         wChannels : Win32.WORD;                     --  mmsystem.h:533

         wReserved1 : Win32.WORD;                     --  mmsystem.h:534

      end record;



   type WAVEINCAPSW is                                     --  mmsystem.h:537

      record

         wMid : Win32.WORD;                     --  mmsystem.h:538

         wPid : Win32.WORD;                     --  mmsystem.h:539

         vDriverVersion : MMVERSION;                      --  mmsystem.h:540

         szPname : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);

         --  mmsystem.h:541

         dwFormats : Win32.DWORD;                    --  mmsystem.h:542

         wChannels : Win32.WORD;                     --  mmsystem.h:543

         wReserved1 : Win32.WORD;                     --  mmsystem.h:544

      end record;



   subtype WAVEINCAPS is WAVEINCAPSA;                      --  mmsystem.h:549



   type WAVEFORMAT is                                      --  mmsystem.h:589

      record

         wFormatTag : Win32.WORD;                    --  mmsystem.h:584

         nChannels : Win32.WORD;                    --  mmsystem.h:585

         nSamplesPerSec : Win32.DWORD;                   --  mmsystem.h:586

         nAvgBytesPerSec : Win32.DWORD;                   --  mmsystem.h:587

         nBlockAlign : Win32.WORD;                    --  mmsystem.h:588

      end record;



   type PCMWAVEFORMAT is                                   --  mmsystem.h:604

      record

         wf : WAVEFORMAT;                     --  mmsystem.h:605

         wBitsPerSample : Win32.WORD;                     --  mmsystem.h:606

      end record;



   type WAVEFORMATEX is                                    --  mmsystem.h:619

      record

         wFormatTag : Win32.WORD;                    --  mmsystem.h:621

         nChannels : Win32.WORD;                    --  mmsystem.h:622

         nSamplesPerSec : Win32.DWORD;                   --  mmsystem.h:623

         nAvgBytesPerSec : Win32.DWORD;                   --  mmsystem.h:624

         nBlockAlign : Win32.WORD;                    --  mmsystem.h:625

         wBitsPerSample : Win32.WORD;                    --  mmsystem.h:626

         cbSize : Win32.WORD;                    --  mmsystem.h:627

      end record;



   type LPMIDICALLBACK is access procedure;               --  mmsystem.h:743

   pragma Convention (Stdcall, LPMIDICALLBACK);



   type MIDIOUTCAPSA is                                    --  mmsystem.h:772

      record

         wMid : Win32.WORD;                     --  mmsystem.h:773

         wPid : Win32.WORD;                     --  mmsystem.h:774

         vDriverVersion : MMVERSION;                      --  mmsystem.h:775

         szPname : Win32.CHAR_Array (0 .. 31);        --  mmsystem.h:776

         wTechnology : Win32.WORD;                     --  mmsystem.h:777

         wVoices : Win32.WORD;                     --  mmsystem.h:778

         wNotes : Win32.WORD;                     --  mmsystem.h:779

         wChannelMask : Win32.WORD;                     --  mmsystem.h:780

         dwSupport : Win32.DWORD;                    --  mmsystem.h:781

      end record;



   type MIDIOUTCAPSW is                                    --  mmsystem.h:784

      record

         wMid : Win32.WORD;                     --  mmsystem.h:785

         wPid : Win32.WORD;                     --  mmsystem.h:786

         vDriverVersion : MMVERSION;                      --  mmsystem.h:787

         szPname : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);

         --  mmsystem.h:788

         wTechnology : Win32.WORD;                     --  mmsystem.h:789

         wVoices : Win32.WORD;                     --  mmsystem.h:790

         wNotes : Win32.WORD;                     --  mmsystem.h:791

         wChannelMask : Win32.WORD;                     --  mmsystem.h:792

         dwSupport : Win32.DWORD;                    --  mmsystem.h:793

      end record;



   subtype MIDIOUTCAPS is MIDIOUTCAPSA;                    --  mmsystem.h:798



   type MIDIINCAPSA is                                     --  mmsystem.h:835

      record

         wMid : Win32.WORD;                     --  mmsystem.h:836

         wPid : Win32.WORD;                     --  mmsystem.h:837

         vDriverVersion : MMVERSION;                      --  mmsystem.h:838

         szPname : Win32.CHAR_Array (0 .. 31);        --  mmsystem.h:839

      end record;



   type MIDIINCAPSW is                                     --  mmsystem.h:842

      record

         wMid : Win32.WORD;                     --  mmsystem.h:843

         wPid : Win32.WORD;                     --  mmsystem.h:844

         vDriverVersion : MMVERSION;                      --  mmsystem.h:845

         szPname : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);

         --  mmsystem.h:846

      end record;



   subtype MIDIINCAPS is MIDIINCAPSA;                      --  mmsystem.h:851



   type MIDIHDR is                                         --  mmsystem.h:882

      record

         lpData : Win32.LPBYTE;                  --  mmsystem.h:877

         dwBufferLength : Win32.DWORD;                   --  mmsystem.h:878

         dwBytesRecorded : Win32.DWORD;                   --  mmsystem.h:879

         dwUser : Win32.DWORD;                   --  mmsystem.h:880

         dwFlags : Win32.DWORD;                   --  mmsystem.h:881

         lpNext : PMIDIHDR;                      --  mmsystem.h:882

         reserved : Win32.DWORD;                   --  mmsystem.h:883

      end record;



   type AUXCAPSA is                                        --  mmsystem.h:978

      record

         wMid : Win32.WORD;                     --  mmsystem.h:979

         wPid : Win32.WORD;                     --  mmsystem.h:980

         vDriverVersion : MMVERSION;                      --  mmsystem.h:981

         szPname : Win32.CHAR_Array (0 .. 31);        --  mmsystem.h:982

         wTechnology : Win32.WORD;                     --  mmsystem.h:983

         wReserved1 : Win32.WORD;                     --  mmsystem.h:984

         dwSupport : Win32.DWORD;                    --  mmsystem.h:985

      end record;



   type AUXCAPSW is                                        --  mmsystem.h:988

      record

         wMid : Win32.WORD;                     --  mmsystem.h:989

         wPid : Win32.WORD;                     --  mmsystem.h:990

         vDriverVersion : MMVERSION;                      --  mmsystem.h:991

         szPname : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);

         --  mmsystem.h:992

         wTechnology : Win32.WORD;                     --  mmsystem.h:993

         wReserved1 : Win32.WORD;                     --  mmsystem.h:994

         dwSupport : Win32.DWORD;                    --  mmsystem.h:995

      end record;



   subtype AUXCAPS is AUXCAPSA;                            --  mmsystem.h:1000



   type MIXERCAPSA is                                      --  mmsystem.h:1091

      record

         wMid : Win32.WORD;                     --  mmsystem.h:1093

         wPid : Win32.WORD;                     --  mmsystem.h:1094

         vDriverVersion : MMVERSION;                      --  mmsystem.h:1095

         szPname : Win32.CHAR_Array (0 .. 31);        --  mmsystem.h:1096

         fdwSupport : Win32.DWORD;                    --  mmsystem.h:1097

         cDestinations : Win32.DWORD;                    --  mmsystem.h:1098

      end record;



   type MIXERCAPSW is                                      --  mmsystem.h:1100

      record

         wMid : Win32.WORD;                     --  mmsystem.h:1102

         wPid : Win32.WORD;                     --  mmsystem.h:1103

         vDriverVersion : MMVERSION;                      --  mmsystem.h:1104

         szPname : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);

         --  mmsystem.h:1105

         fdwSupport : Win32.DWORD;                    --  mmsystem.h:1106

         cDestinations : Win32.DWORD;                    --  mmsystem.h:1107

      end record;



   subtype MIXERCAPS is MIXERCAPSA;                        --  mmsystem.h:1112



   type struct_anonymous7_t is                             --  mmsystem.h:1170

      record

         dwType : Win32.DWORD;                    --  mmsystem.h:1164

         dwDeviceID : Win32.DWORD;                    --  mmsystem.h:1165

         wMid : Win32.WORD;                     --  mmsystem.h:1166

         wPid : Win32.WORD;                     --  mmsystem.h:1167

         vDriverVersion : MMVERSION;                      --  mmsystem.h:1168

         szPname : Win32.CHAR_Array (0 .. 31);        --  mmsystem.h:1169

      end record;



   type MIXERLINEA is                                      --  mmsystem.h:1148

      record

         cbStruct : Win32.DWORD;                   --  mmsystem.h:1150

         dwDestination : Win32.DWORD;                   --  mmsystem.h:1151

         dwSource : Win32.DWORD;                   --  mmsystem.h:1152

         dwLineID : Win32.DWORD;                   --  mmsystem.h:1153

         fdwLine : Win32.DWORD;                   --  mmsystem.h:1154

         dwUser : Win32.DWORD;                   --  mmsystem.h:1155

         dwComponentType : Win32.DWORD;                   --  mmsystem.h:1156

         cChannels : Win32.DWORD;                   --  mmsystem.h:1157

         cConnections : Win32.DWORD;                   --  mmsystem.h:1158

         cControls : Win32.DWORD;                   --  mmsystem.h:1159

         szShortName : Win32.CHAR_Array (0 .. MIXER_SHORT_NAME_CHARS - 1);

         --  mmsystem.h:1160

         szName : Win32.CHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);

         --  mmsystem.h:1161

         Target : struct_anonymous7_t;           --  mmsystem.h:1170

      end record;



   type struct_anonymous9_t is                             --  mmsystem.h:1194

      record

         dwType : Win32.DWORD;                    --  mmsystem.h:1188

         dwDeviceID : Win32.DWORD;                    --  mmsystem.h:1189

         wMid : Win32.WORD;                     --  mmsystem.h:1190

         wPid : Win32.WORD;                     --  mmsystem.h:1191

         vDriverVersion : MMVERSION;                      --  mmsystem.h:1192

         szPname : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);

         --  mmsystem.h:1193

      end record;



   type MIXERLINEW is                                      --  mmsystem.h:1172

      record

         cbStruct : Win32.DWORD;                   --  mmsystem.h:1174

         dwDestination : Win32.DWORD;                   --  mmsystem.h:1175

         dwSource : Win32.DWORD;                   --  mmsystem.h:1176

         dwLineID : Win32.DWORD;                   --  mmsystem.h:1177

         fdwLine : Win32.DWORD;                   --  mmsystem.h:1178

         dwUser : Win32.DWORD;                   --  mmsystem.h:1179

         dwComponentType : Win32.DWORD;                   --  mmsystem.h:1180

         cChannels : Win32.DWORD;                   --  mmsystem.h:1181

         cConnections : Win32.DWORD;                   --  mmsystem.h:1182

         cControls : Win32.DWORD;                   --  mmsystem.h:1183

         szShortName : Win32.WCHAR_Array (0 .. MIXER_SHORT_NAME_CHARS - 1);

         --  mmsystem.h:1184

         szName : Win32.WCHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);

         --  mmsystem.h:1185

         Target : struct_anonymous9_t;           --  mmsystem.h:1194

      end record;



   subtype MIXERLINE is MIXERLINEA;                        --  mmsystem.h:1199



   type struct_anonymous10_t is                            --  mmsystem.h:1299

      record

         lMinimum : Win32.LONG;                           --  mmsystem.h:1297

         lMaximum : Win32.LONG;                           --  mmsystem.h:1298

      end record;



   type struct_anonymous11_t is                            --  mmsystem.h:1304

      record

         dwMinimum : Win32.DWORD;                         --  mmsystem.h:1302

         dwMaximum : Win32.DWORD;                         --  mmsystem.h:1303

      end record;



   type union_anonymous13_t_kind is ( --  mmsystem.h:1306

     LL_kind,

     DD_kind,

     dwReserved_kind

                                    );



   type union_anonymous13_t

     (Which : union_anonymous13_t_kind := dwReserved_kind) is

      --  mmsystem.h:1306

      record

         case Which is

            when LL_kind =>

               LL : struct_anonymous10_t;               --  mmsystem.h:1299

            when DD_kind =>

               DD : struct_anonymous11_t;               --  mmsystem.h:1304

            when dwReserved_kind =>

               dwReserved : Win32.DWORD_Array (0 .. 5);    --  mmsystem.h:1305

         end case;

      end record;



   pragma Unchecked_Union (union_anonymous13_t);



   type union_anonymous14_t_kind is ( --  mmsystem.h:1312

     cSteps_kind,

     cbCustomData_kind,

     dwReserved_kind

                                    );



   type union_anonymous14_t

     (Which : union_anonymous14_t_kind := dwReserved_kind) is

      --  mmsystem.h:1312

      record

         case Which is

            when cSteps_kind =>

               cSteps : Win32.DWORD;                    --  mmsystem.h:1309

            when cbCustomData_kind =>

               cbCustomData : Win32.DWORD;              --  mmsystem.h:1310

            when dwReserved_kind =>

               dwReserved : Win32.DWORD_Array (0 .. 5);    --  mmsystem.h:1311

         end case;

      end record;



   pragma Unchecked_Union (union_anonymous14_t);



   type MIXERCONTROLA is                                   --  mmsystem.h:1284

      record

         cbStruct : Win32.DWORD;                    --  mmsystem.h:1286

         dwControlID : Win32.DWORD;                    --  mmsystem.h:1287

         dwControlType : Win32.DWORD;                    --  mmsystem.h:1288

         fdwControl : Win32.DWORD;                    --  mmsystem.h:1289

         cMultipleItems : Win32.DWORD;                    --  mmsystem.h:1290

         szShortName : Win32.CHAR_Array (0 .. MIXER_SHORT_NAME_CHARS - 1);

         --  mmsystem.h:1291

         szName : Win32.CHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);

         --  mmsystem.h:1292

         Bounds : union_anonymous13_t;            --  mmsystem.h:1306

         Metrics : union_anonymous14_t;            --  mmsystem.h:1312

      end record;



   type struct_anonymous15_t is                            --  mmsystem.h:1329

      record

         lMinimum : Win32.LONG;                           --  mmsystem.h:1327

         lMaximum : Win32.LONG;                           --  mmsystem.h:1328

      end record;



   type struct_anonymous16_t is                            --  mmsystem.h:1334

      record

         dwMinimum : Win32.DWORD;                         --  mmsystem.h:1332

         dwMaximum : Win32.DWORD;                         --  mmsystem.h:1333

      end record;



   type union_anonymous17_t_kind is ( --  mmsystem.h:1336

     LL_kind,

     DD_kind,

     dwReserved_kind

                                    );



   type union_anonymous17_t

     (Which : union_anonymous17_t_kind := dwReserved_kind) is

      --  mmsystem.h:1336

      record

         case Which is

            when LL_kind =>

               LL : struct_anonymous15_t;               --  mmsystem.h:1329

            when DD_kind =>

               DD : struct_anonymous16_t;               --  mmsystem.h:1334

            when dwReserved_kind =>

               dwReserved : Win32.DWORD_Array (0 .. 5);    --  mmsystem.h:1335

         end case;

      end record;



   pragma Unchecked_Union (union_anonymous17_t);



   type union_anonymous18_t_kind is ( --  mmsystem.h:1342

     cSteps_kind,

     cbCustomData_kind,

     dwReserved_kind

                                    );



   type union_anonymous18_t

     (Which : union_anonymous18_t_kind := dwReserved_kind) is

      --  mmsystem.h:1342

      record

         case Which is

            when cSteps_kind =>

               cSteps : Win32.DWORD;                    --  mmsystem.h:1339

            when cbCustomData_kind =>

               cbCustomData : Win32.DWORD;              --  mmsystem.h:1340

            when dwReserved_kind =>

               dwReserved : Win32.DWORD_Array (0 .. 5);    --  mmsystem.h:1341

         end case;

      end record;



   pragma Unchecked_Union (union_anonymous18_t);



   type MIXERCONTROLW is                                   --  mmsystem.h:1314

      record

         cbStruct : Win32.DWORD;                    --  mmsystem.h:1316

         dwControlID : Win32.DWORD;                    --  mmsystem.h:1317

         dwControlType : Win32.DWORD;                    --  mmsystem.h:1318

         fdwControl : Win32.DWORD;                    --  mmsystem.h:1319

         cMultipleItems : Win32.DWORD;                    --  mmsystem.h:1320

         szShortName : Win32.WCHAR_Array (0 .. MIXER_SHORT_NAME_CHARS - 1);

         --  mmsystem.h:1321

         szName : Win32.WCHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);

         --  mmsystem.h:1322

         Bounds : union_anonymous17_t;            --  mmsystem.h:1336

         Metrics : union_anonymous18_t;            --  mmsystem.h:1342

      end record;



   subtype MIXERCONTROL is MIXERCONTROLA;                  --  mmsystem.h:1347



   type union_anonymous19_t_kind is ( --  mmsystem.h:1446

     dwControlID_kind,

     dwControlType_kind

                                    );



   type union_anonymous19_t

     (Which : union_anonymous19_t_kind := dwControlID_kind) is

      --  mmsystem.h:1446

      record

         case Which is

            when dwControlID_kind =>

               dwControlID : Win32.DWORD;               --  mmsystem.h:1444

            when dwControlType_kind =>

               dwControlType : Win32.DWORD;             --  mmsystem.h:1445

         end case;

      end record;



   pragma Convention (C, union_anonymous19_t);



   pragma Unchecked_Union (union_anonymous19_t);



   type MIXERLINECONTROLSA is                              --  mmsystem.h:1438

      record

         cbStruct : Win32.DWORD;                         --  mmsystem.h:1440

         dwLineID : Win32.DWORD;                         --  mmsystem.h:1441

         DW_DW : union_anonymous19_t;                 --  mmsystem.h:1446

         cControls : Win32.DWORD;                         --  mmsystem.h:1447

         cbmxctrl : Win32.DWORD;                         --  mmsystem.h:1448

         pamxctrl : LPMIXERCONTROLA;                     --  mmsystem.h:1449

      end record;



   type union_anonymous20_t_kind is ( --  mmsystem.h:1464

     dwControlID_kind,

     dwControlType_kind

                                    );



   type union_anonymous20_t

     (Which : union_anonymous20_t_kind := dwControlID_kind) is

      --  mmsystem.h:1464

      record

         case Which is

            when dwControlID_kind =>

               dwControlID : Win32.DWORD;               --  mmsystem.h:1462

            when dwControlType_kind =>

               dwControlType : Win32.DWORD;             --  mmsystem.h:1463

         end case;

      end record;



   pragma Convention (C, union_anonymous20_t);



   pragma Unchecked_Union (union_anonymous20_t);



   type MIXERLINECONTROLSW is                              --  mmsystem.h:1456

      record

         cbStruct : Win32.DWORD;                         --  mmsystem.h:1458

         dwLineID : Win32.DWORD;                         --  mmsystem.h:1459

         DW_DW : union_anonymous20_t;                 --  mmsystem.h:1464

         cControls : Win32.DWORD;                         --  mmsystem.h:1465

         cbmxctrl : Win32.DWORD;                         --  mmsystem.h:1466

         pamxctrl : LPMIXERCONTROLW;                     --  mmsystem.h:1467

      end record;



   subtype MIXERLINECONTROLS is MIXERLINECONTROLSA;        --  mmsystem.h:1472



   type union_anonymous21_t_kind is ( --  mmsystem.h:1518

     hwndOwner_kind,

     cMultipleItems_kind

                                    );



   type union_anonymous21_t

     (Which : union_anonymous21_t_kind := hwndOwner_kind) is

      --  mmsystem.h:1518

      record

         case Which is

            when hwndOwner_kind =>

               hwndOwner : Win32.Windef.HWND;           --  mmsystem.h:1516

            when cMultipleItems_kind =>

               cMultipleItems : Win32.DWORD;            --  mmsystem.h:1517

         end case;

      end record;



   pragma Convention (C, union_anonymous21_t);



   pragma Unchecked_Union (union_anonymous21_t);



   type MIXERCONTROLDETAILS is                             --  mmsystem.h:1507

      record

         cbStruct : Win32.DWORD;                       --  mmsystem.h:1509

         dwControlID : Win32.DWORD;                       --  mmsystem.h:1510

         cChannels : Win32.DWORD;                       --  mmsystem.h:1512

         HW_DW : union_anonymous21_t;               --  mmsystem.h:1518

         cbDetails : Win32.DWORD;                       --  mmsystem.h:1520

         paDetails : Win32.LPVOID;                      --  mmsystem.h:1521

      end record;



   type MIXERCONTROLDETAILS_LISTTEXTA is                   --  mmsystem.h:1530

      record

         dwParam1 : Win32.DWORD;                          --  mmsystem.h:1532

         dwParam2 : Win32.DWORD;                          --  mmsystem.h:1533

         szName : Win32.CHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);

         --  mmsystem.h:1534

      end record;



   type MIXERCONTROLDETAILS_LISTTEXTW is                   --  mmsystem.h:1540

      record

         dwParam1 : Win32.DWORD;                          --  mmsystem.h:1542

         dwParam2 : Win32.DWORD;                          --  mmsystem.h:1543

         szName : Win32.WCHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);

         --  mmsystem.h:1544

      end record;



   subtype MIXERCONTROLDETAILS_LISTTEXT is MIXERCONTROLDETAILS_LISTTEXTA;

   --  mmsystem.h:1549



   type MIXERCONTROLDETAILS_BOOLEAN is                     --  mmsystem.h:1571

      record

         fValue : Win32.LONG;                             --  mmsystem.h:1573

      end record;



   type MIXERCONTROLDETAILS_SIGNED is                      --  mmsystem.h:1578

      record

         lValue : Win32.LONG;                             --  mmsystem.h:1580

      end record;



   type MIXERCONTROLDETAILS_UNSIGNED is                    --  mmsystem.h:1586

      record

         dwValue : Win32.DWORD;                           --  mmsystem.h:1588

      end record;



   type LPTIMECALLBACK is access procedure;               --  mmsystem.h:1633

   pragma Convention (Stdcall, LPTIMECALLBACK);



   type TIMECAPS is                                        --  mmsystem.h:1645

      record

         wPeriodMin : Win32.UINT;                         --  mmsystem.h:1646

         wPeriodMax : Win32.UINT;                         --  mmsystem.h:1647

      end record;



   type JOYCAPSA is                                        --  mmsystem.h:1694

      record

         wMid : Win32.WORD;                        --  mmsystem.h:1695

         wPid : Win32.WORD;                        --  mmsystem.h:1696

         szPname : Win32.CHAR_Array (0 .. 31);           --  mmsystem.h:1697

         wXmin : Win32.UINT;                        --  mmsystem.h:1698

         wXmax : Win32.UINT;                        --  mmsystem.h:1699

         wYmin : Win32.UINT;                        --  mmsystem.h:1700

         wYmax : Win32.UINT;                        --  mmsystem.h:1701

         wZmin : Win32.UINT;                        --  mmsystem.h:1702

         wZmax : Win32.UINT;                        --  mmsystem.h:1703

         wNumButtons : Win32.UINT;                        --  mmsystem.h:1704

         wPeriodMin : Win32.UINT;                        --  mmsystem.h:1705

         wPeriodMax : Win32.UINT;                        --  mmsystem.h:1706

      end record;



   type JOYCAPSW is                                        --  mmsystem.h:1709

      record

         wMid : Win32.WORD;                        --  mmsystem.h:1710

         wPid : Win32.WORD;                        --  mmsystem.h:1711

         szPname : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);

         --  mmsystem.h:1712

         wXmin : Win32.UINT;                        --  mmsystem.h:1713

         wXmax : Win32.UINT;                        --  mmsystem.h:1714

         wYmin : Win32.UINT;                        --  mmsystem.h:1715

         wYmax : Win32.UINT;                        --  mmsystem.h:1716

         wZmin : Win32.UINT;                        --  mmsystem.h:1717

         wZmax : Win32.UINT;                        --  mmsystem.h:1718

         wNumButtons : Win32.UINT;                        --  mmsystem.h:1719

         wPeriodMin : Win32.UINT;                        --  mmsystem.h:1720

         wPeriodMax : Win32.UINT;                        --  mmsystem.h:1721

      end record;



   subtype JOYCAPS is JOYCAPSA;                            --  mmsystem.h:1726



   type JOYINFO is                                         --  mmsystem.h:1751

      record

         wXpos : Win32.UINT;                           --  mmsystem.h:1752

         wYpos : Win32.UINT;                           --  mmsystem.h:1753

         wZpos : Win32.UINT;                           --  mmsystem.h:1754

         wButtons : Win32.UINT;                           --  mmsystem.h:1755

      end record;



   type LPMMIOPROC is access function  return Win32.LRESULT;

   pragma Convention (Stdcall, LPMMIOPROC);

   --  mmsystem.h:1816



   type MMIOINFO is                                        --  mmsystem.h:1819

      record

         dwFlags : Win32.DWORD;                       --  mmsystem.h:1822

         fccIOProc : FOURCC;                            --  mmsystem.h:1823

         pIOProc : LPMMIOPROC;                        --  mmsystem.h:1824

         wErrorRet : Win32.UINT;                        --  mmsystem.h:1825

         htask : Win32.Windef.HTASK;                --  mmsystem.h:1826

         cchBuffer : Win32.LONG;                        --  mmsystem.h:1829

         pchBuffer : HPSTR;                             --  mmsystem.h:1830

         pchNext : HPSTR;                             --  mmsystem.h:1831

         pchEndRead : HPSTR;                             --  mmsystem.h:1832

         pchEndWrite : HPSTR;                             --  mmsystem.h:1833

         lBufOffset : Win32.LONG;                        --  mmsystem.h:1834

         lDiskOffset : Win32.LONG;                        --  mmsystem.h:1837

         adwInfo : Win32.DWORD_Array (0 .. 2);           --  mmsystem.h:1838

         dwReserved1 : Win32.DWORD;                       --  mmsystem.h:1841

         dwReserved2 : Win32.DWORD;                       --  mmsystem.h:1842

         hmmio : Win32.Mmsystem.HMMIO;              --  mmsystem.h:1843

      end record;



   type MMCKINFO is                                        --  mmsystem.h:1852

      record

         ckid : FOURCC;                           --  mmsystem.h:1854

         cksize : Win32.DWORD;                      --  mmsystem.h:1855

         fccType : FOURCC;                           --  mmsystem.h:1856

         dwDataOffset : Win32.DWORD;                      --  mmsystem.h:1857

         dwFlags : Win32.DWORD;                      --  mmsystem.h:1858

      end record;



   type YIELDPROC is access function (

                                      mciId : MCIDEVICEID;

                                      dwYieldData : Win32.DWORD)

                                     return Win32.UINT;     --  mmsystem.h:2031

   pragma Convention (Stdcall, YIELDPROC);



   type MCI_GENERIC_PARMS is                               --  mmsystem.h:2432

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2433

      end record;



   type MCI_OPEN_PARMSA is                                 --  mmsystem.h:2439

      record

         dwCallback : Win32.DWORD;                  --  mmsystem.h:2440

         wDeviceID : MCIDEVICEID;                  --  mmsystem.h:2441

         lpstrDeviceType : Win32.LPCSTR;                 --  mmsystem.h:2442

         lpstrElementName : Win32.LPCSTR;                 --  mmsystem.h:2443

         lpstrAlias : Win32.LPCSTR;                 --  mmsystem.h:2444

      end record;



   type MCI_OPEN_PARMSW is                                 --  mmsystem.h:2447

      record

         dwCallback : Win32.DWORD;                  --  mmsystem.h:2448

         wDeviceID : MCIDEVICEID;                  --  mmsystem.h:2449

         lpstrDeviceType : Win32.LPCWSTR;                --  mmsystem.h:2450

         lpstrElementName : Win32.LPCWSTR;                --  mmsystem.h:2451

         lpstrAlias : Win32.LPCWSTR;                --  mmsystem.h:2452

      end record;



   subtype MCI_OPEN_PARMS is MCI_OPEN_PARMSA;              --  mmsystem.h:2475



   type MCI_PLAY_PARMS is                                  --  mmsystem.h:2493

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2494

         dwFrom : Win32.DWORD;                        --  mmsystem.h:2495

         dwTo : Win32.DWORD;                        --  mmsystem.h:2496

      end record;



   type MCI_SEEK_PARMS is                                  --  mmsystem.h:2502

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2503

         dwTo : Win32.DWORD;                        --  mmsystem.h:2504

      end record;



   type MCI_STATUS_PARMS is                                --  mmsystem.h:2510

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2511

         dwReturn : Win32.DWORD;                        --  mmsystem.h:2512

         dwItem : Win32.DWORD;                        --  mmsystem.h:2513

         dwTrack : Win32.DWORD;                        --  mmsystem.h:2514

      end record;



   type MCI_INFO_PARMSA is                                 --  mmsystem.h:2520

      record

         dwCallback : Win32.DWORD;                       --  mmsystem.h:2521

         lpstrReturn : Win32.LPSTR;                       --  mmsystem.h:2522

         dwRetSize : Win32.DWORD;                       --  mmsystem.h:2523

      end record;



   type MCI_INFO_PARMSW is                                 --  mmsystem.h:2526

      record

         dwCallback : Win32.DWORD;                       --  mmsystem.h:2527

         lpstrReturn : Win32.LPWSTR;                      --  mmsystem.h:2528

         dwRetSize : Win32.DWORD;                       --  mmsystem.h:2529

      end record;



   subtype MCI_INFO_PARMS is MCI_INFO_PARMSA;              --  mmsystem.h:2534



   type MCI_GETDEVCAPS_PARMS is                            --  mmsystem.h:2552

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2553

         dwReturn : Win32.DWORD;                        --  mmsystem.h:2554

         dwItem : Win32.DWORD;                        --  mmsystem.h:2555

      end record;



   type MCI_SYSINFO_PARMSA is                              --  mmsystem.h:2561

      record

         dwCallback : Win32.DWORD;                       --  mmsystem.h:2562

         lpstrReturn : Win32.LPSTR;                       --  mmsystem.h:2563

         dwRetSize : Win32.DWORD;                       --  mmsystem.h:2564

         dwNumber : Win32.DWORD;                       --  mmsystem.h:2565

         wDeviceType : Win32.UINT;                        --  mmsystem.h:2566

      end record;



   type MCI_SYSINFO_PARMSW is                              --  mmsystem.h:2569

      record

         dwCallback : Win32.DWORD;                       --  mmsystem.h:2570

         lpstrReturn : Win32.LPWSTR;                      --  mmsystem.h:2571

         dwRetSize : Win32.DWORD;                       --  mmsystem.h:2572

         dwNumber : Win32.DWORD;                       --  mmsystem.h:2573

         wDeviceType : Win32.UINT;                        --  mmsystem.h:2574

      end record;



   subtype MCI_SYSINFO_PARMS is MCI_SYSINFO_PARMSA;        --  mmsystem.h:2579



   type MCI_SET_PARMS is                                   --  mmsystem.h:2597

      record

         dwCallback : Win32.DWORD;                      --  mmsystem.h:2598

         dwTimeFormat : Win32.DWORD;                      --  mmsystem.h:2599

         dwAudio : Win32.DWORD;                      --  mmsystem.h:2600

      end record;



   type MCI_BREAK_PARMS is                                 --  mmsystem.h:2606

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2607

         nVirtKey : Win32.INT;                          --  mmsystem.h:2608

         hwndBreak : Win32.Windef.HWND;                  --  mmsystem.h:2609

      end record;



   type MCI_SOUND_PARMSA is                                --  mmsystem.h:2615

      record

         dwCallback : Win32.DWORD;                    --  mmsystem.h:2616

         lpstrSoundName : Win32.LPCSTR;                   --  mmsystem.h:2617

      end record;



   type MCI_SOUND_PARMSW is                                --  mmsystem.h:2620

      record

         dwCallback : Win32.DWORD;                    --  mmsystem.h:2621

         lpstrSoundName : Win32.LPCWSTR;                  --  mmsystem.h:2622

      end record;



   subtype MCI_SOUND_PARMS is MCI_SOUND_PARMSA;            --  mmsystem.h:2627



   type MCI_SAVE_PARMSA is                                 --  mmsystem.h:2645

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2646

         lpfilename : Win32.LPCSTR;                       --  mmsystem.h:2647

      end record;



   type MCI_SAVE_PARMSW is                                 --  mmsystem.h:2650

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2651

         lpfilename : Win32.LPCWSTR;                      --  mmsystem.h:2652

      end record;



   subtype MCI_SAVE_PARMS is MCI_SAVE_PARMSA;              --  mmsystem.h:2657



   type MCI_LOAD_PARMSA is                                 --  mmsystem.h:2675

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2676

         lpfilename : Win32.LPCSTR;                       --  mmsystem.h:2677

      end record;



   type MCI_LOAD_PARMSW is                                 --  mmsystem.h:2680

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2681

         lpfilename : Win32.LPCWSTR;                      --  mmsystem.h:2682

      end record;



   subtype MCI_LOAD_PARMS is MCI_LOAD_PARMSA;              --  mmsystem.h:2687



   type MCI_RECORD_PARMS is                                --  mmsystem.h:2705

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2706

         dwFrom : Win32.DWORD;                        --  mmsystem.h:2707

         dwTo : Win32.DWORD;                        --  mmsystem.h:2708

      end record;



   type MCI_VD_PLAY_PARMS is                               --  mmsystem.h:2771

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2772

         dwFrom : Win32.DWORD;                        --  mmsystem.h:2773

         dwTo : Win32.DWORD;                        --  mmsystem.h:2774

         dwSpeed : Win32.DWORD;                        --  mmsystem.h:2775

      end record;



   type MCI_VD_STEP_PARMS is                               --  mmsystem.h:2781

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2782

         dwFrames : Win32.DWORD;                        --  mmsystem.h:2783

      end record;



   type MCI_VD_ESCAPE_PARMSA is                            --  mmsystem.h:2789

      record

         dwCallback : Win32.DWORD;                      --  mmsystem.h:2790

         lpstrCommand : Win32.LPCSTR;                     --  mmsystem.h:2791

      end record;



   type MCI_VD_ESCAPE_PARMSW is                            --  mmsystem.h:2794

      record

         dwCallback : Win32.DWORD;                      --  mmsystem.h:2795

         lpstrCommand : Win32.LPCWSTR;                    --  mmsystem.h:2796

      end record;



   subtype MCI_VD_ESCAPE_PARMS is MCI_VD_ESCAPE_PARMSA;    --  mmsystem.h:2801



   type MCI_WAVE_OPEN_PARMSA is                            --  mmsystem.h:2860

      record

         dwCallback : Win32.DWORD;                  --  mmsystem.h:2861

         wDeviceID : MCIDEVICEID;                  --  mmsystem.h:2862

         lpstrDeviceType : Win32.LPCSTR;                 --  mmsystem.h:2863

         lpstrElementName : Win32.LPCSTR;                 --  mmsystem.h:2864

         lpstrAlias : Win32.LPCSTR;                 --  mmsystem.h:2865

         dwBufferSeconds : Win32.DWORD;                  --  mmsystem.h:2866

      end record;



   type MCI_WAVE_OPEN_PARMSW is                            --  mmsystem.h:2869

      record

         dwCallback : Win32.DWORD;                  --  mmsystem.h:2870

         wDeviceID : MCIDEVICEID;                  --  mmsystem.h:2871

         lpstrDeviceType : Win32.LPCWSTR;                --  mmsystem.h:2872

         lpstrElementName : Win32.LPCWSTR;                --  mmsystem.h:2873

         lpstrAlias : Win32.LPCWSTR;                --  mmsystem.h:2874

         dwBufferSeconds : Win32.DWORD;                  --  mmsystem.h:2875

      end record;



   subtype MCI_WAVE_OPEN_PARMS is MCI_WAVE_OPEN_PARMSA;    --  mmsystem.h:2880



   type MCI_WAVE_DELETE_PARMS is                           --  mmsystem.h:2898

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:2899

         dwFrom : Win32.DWORD;                        --  mmsystem.h:2900

         dwTo : Win32.DWORD;                        --  mmsystem.h:2901

      end record;



   type MCI_WAVE_SET_PARMS is                              --  mmsystem.h:2907

      record

         dwCallback : Win32.DWORD;                   --  mmsystem.h:2908

         dwTimeFormat : Win32.DWORD;                   --  mmsystem.h:2909

         dwAudio : Win32.DWORD;                   --  mmsystem.h:2910

         wInput : Win32.UINT;                    --  mmsystem.h:2911

         wOutput : Win32.UINT;                    --  mmsystem.h:2912

         wFormatTag : Win32.WORD;                    --  mmsystem.h:2913

         wReserved2 : Win32.WORD;                    --  mmsystem.h:2914

         nChannels : Win32.WORD;                    --  mmsystem.h:2915

         wReserved3 : Win32.WORD;                    --  mmsystem.h:2916

         nSamplesPerSec : Win32.DWORD;                   --  mmsystem.h:2917

         nAvgBytesPerSec : Win32.DWORD;                   --  mmsystem.h:2918

         nBlockAlign : Win32.WORD;                    --  mmsystem.h:2919

         wReserved4 : Win32.WORD;                    --  mmsystem.h:2920

         wBitsPerSample : Win32.WORD;                    --  mmsystem.h:2921

         wReserved5 : Win32.WORD;                    --  mmsystem.h:2922

      end record;



   type MCI_SEQ_SET_PARMS is                               --  mmsystem.h:2981

      record

         dwCallback : Win32.DWORD;                      --  mmsystem.h:2982

         dwTimeFormat : Win32.DWORD;                      --  mmsystem.h:2983

         dwAudio : Win32.DWORD;                      --  mmsystem.h:2984

         dwTempo : Win32.DWORD;                      --  mmsystem.h:2985

         dwPort : Win32.DWORD;                      --  mmsystem.h:2986

         dwSlave : Win32.DWORD;                      --  mmsystem.h:2987

         dwMaster : Win32.DWORD;                      --  mmsystem.h:2988

         dwOffset : Win32.DWORD;                      --  mmsystem.h:2989

      end record;



   type MCI_ANIM_OPEN_PARMSA is                            --  mmsystem.h:3063

      record

         dwCallback : Win32.DWORD;                  --  mmsystem.h:3064

         wDeviceID : MCIDEVICEID;                  --  mmsystem.h:3065

         lpstrDeviceType : Win32.LPCSTR;                 --  mmsystem.h:3066

         lpstrElementName : Win32.LPCSTR;                 --  mmsystem.h:3067

         lpstrAlias : Win32.LPCSTR;                 --  mmsystem.h:3068

         dwStyle : Win32.DWORD;                  --  mmsystem.h:3069

         hWndParent : Win32.Windef.HWND;            --  mmsystem.h:3070

      end record;



   type MCI_ANIM_OPEN_PARMSW is                            --  mmsystem.h:3073

      record

         dwCallback : Win32.DWORD;                  --  mmsystem.h:3074

         wDeviceID : MCIDEVICEID;                  --  mmsystem.h:3075

         lpstrDeviceType : Win32.LPCWSTR;                --  mmsystem.h:3076

         lpstrElementName : Win32.LPCWSTR;                --  mmsystem.h:3077

         lpstrAlias : Win32.LPCWSTR;                --  mmsystem.h:3078

         dwStyle : Win32.DWORD;                  --  mmsystem.h:3079

         hWndParent : Win32.Windef.HWND;            --  mmsystem.h:3080

      end record;



   subtype MCI_ANIM_OPEN_PARMS is MCI_ANIM_OPEN_PARMSA;    --  mmsystem.h:3085



   type MCI_ANIM_PLAY_PARMS is                             --  mmsystem.h:3103

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3104

         dwFrom : Win32.DWORD;                        --  mmsystem.h:3105

         dwTo : Win32.DWORD;                        --  mmsystem.h:3106

         dwSpeed : Win32.DWORD;                        --  mmsystem.h:3107

      end record;



   type MCI_ANIM_STEP_PARMS is                             --  mmsystem.h:3113

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3114

         dwFrames : Win32.DWORD;                        --  mmsystem.h:3115

      end record;



   type MCI_ANIM_WINDOW_PARMSA is                          --  mmsystem.h:3121

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3122

         hWnd : Win32.Windef.HWND;                  --  mmsystem.h:3123

         nCmdShow : Win32.UINT;                         --  mmsystem.h:3124

         lpstrText : Win32.LPCSTR;                       --  mmsystem.h:3125

      end record;



   type MCI_ANIM_WINDOW_PARMSW is                          --  mmsystem.h:3128

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3129

         hWnd : Win32.Windef.HWND;                  --  mmsystem.h:3130

         nCmdShow : Win32.UINT;                         --  mmsystem.h:3131

         lpstrText : Win32.LPCWSTR;                      --  mmsystem.h:3132

      end record;



   subtype MCI_ANIM_WINDOW_PARMS is MCI_ANIM_WINDOW_PARMSA; --  mmsystem.h:3137



   type MCI_ANIM_RECT_PARMS is                             --  mmsystem.h:3155

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3156

         rc : Win32.Windef.RECT;                  --  mmsystem.h:3161

      end record;



   type MCI_ANIM_UPDATE_PARMS is                           --  mmsystem.h:3168

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3169

         rc : Win32.Windef.RECT;                  --  mmsystem.h:3170

         hDC : Win32.Windef.HDC;                   --  mmsystem.h:3171

      end record;



   type MCI_OVLY_OPEN_PARMSA is                            --  mmsystem.h:3223

      record

         dwCallback : Win32.DWORD;                  --  mmsystem.h:3224

         wDeviceID : MCIDEVICEID;                  --  mmsystem.h:3225

         lpstrDeviceType : Win32.LPCSTR;                 --  mmsystem.h:3226

         lpstrElementName : Win32.LPCSTR;                 --  mmsystem.h:3227

         lpstrAlias : Win32.LPCSTR;                 --  mmsystem.h:3228

         dwStyle : Win32.DWORD;                  --  mmsystem.h:3229

         hWndParent : Win32.Windef.HWND;            --  mmsystem.h:3230

      end record;



   type MCI_OVLY_OPEN_PARMSW is                            --  mmsystem.h:3233

      record

         dwCallback : Win32.DWORD;                  --  mmsystem.h:3234

         wDeviceID : MCIDEVICEID;                  --  mmsystem.h:3235

         lpstrDeviceType : Win32.LPCWSTR;                --  mmsystem.h:3236

         lpstrElementName : Win32.LPCWSTR;                --  mmsystem.h:3237

         lpstrAlias : Win32.LPCWSTR;                --  mmsystem.h:3238

         dwStyle : Win32.DWORD;                  --  mmsystem.h:3239

         hWndParent : Win32.Windef.HWND;            --  mmsystem.h:3240

      end record;



   subtype MCI_OVLY_OPEN_PARMS is MCI_OVLY_OPEN_PARMSA;    --  mmsystem.h:3245



   type MCI_OVLY_WINDOW_PARMSA is                          --  mmsystem.h:3263

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3264

         hWnd : Win32.Windef.HWND;                  --  mmsystem.h:3265

         nCmdShow : Win32.UINT;                         --  mmsystem.h:3266

         lpstrText : Win32.LPCSTR;                       --  mmsystem.h:3267

      end record;



   type MCI_OVLY_WINDOW_PARMSW is                          --  mmsystem.h:3270

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3271

         hWnd : Win32.Windef.HWND;                  --  mmsystem.h:3272

         nCmdShow : Win32.UINT;                         --  mmsystem.h:3273

         lpstrText : Win32.LPCWSTR;                      --  mmsystem.h:3274

      end record;



   subtype MCI_OVLY_WINDOW_PARMS is MCI_OVLY_WINDOW_PARMSA; --  mmsystem.h:3279



   type MCI_OVLY_RECT_PARMS is                             --  mmsystem.h:3297

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3298

         rc : Win32.Windef.RECT;                  --  mmsystem.h:3303

      end record;



   type MCI_OVLY_SAVE_PARMSA is                            --  mmsystem.h:3310

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3311

         lpfilename : Win32.LPCSTR;                       --  mmsystem.h:3312

         rc : Win32.Windef.RECT;                  --  mmsystem.h:3313

      end record;



   type MCI_OVLY_SAVE_PARMSW is                            --  mmsystem.h:3316

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3317

         lpfilename : Win32.LPCWSTR;                      --  mmsystem.h:3318

         rc : Win32.Windef.RECT;                  --  mmsystem.h:3319

      end record;



   subtype MCI_OVLY_SAVE_PARMS is MCI_OVLY_SAVE_PARMSA;    --  mmsystem.h:3324



   type MCI_OVLY_LOAD_PARMSA is                            --  mmsystem.h:3342

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3343

         lpfilename : Win32.LPCSTR;                       --  mmsystem.h:3344

         rc : Win32.Windef.RECT;                  --  mmsystem.h:3345

      end record;



   type MCI_OVLY_LOAD_PARMSW is                            --  mmsystem.h:3348

      record

         dwCallback : Win32.DWORD;                        --  mmsystem.h:3349

         lpfilename : Win32.LPCWSTR;                      --  mmsystem.h:3350

         rc : Win32.Windef.RECT;                  --  mmsystem.h:3351

      end record;



   subtype MCI_OVLY_LOAD_PARMS is MCI_OVLY_LOAD_PARMSA;    --  mmsystem.h:3356



   function CloseDriver

     (hDriver : HDRVR;

      lParam1 : Win32.LONG;

      lParam2 : Win32.LONG)

     return Win32.LRESULT;                        --  mmsystem.h:281



   function OpenDriver

     (szDriverName : Win32.LPCWSTR;

      szSectionName : Win32.LPCWSTR;

      lParam2 : Win32.LONG)

     return HDRVR;                                --  mmsystem.h:282



   function SendDriverMessage

     (hDriver : HDRVR;

      uMsg : Win32.UINT;

      lParam1 : Win32.LONG;

      lParam2 : Win32.LONG)

     return Win32.LRESULT;                        --  mmsystem.h:283



   function DrvGetModuleHandle

     (hDriver : HDRVR)

     return Win32.Windef.HMODULE;                 --  mmsystem.h:284



   function GetDriverModuleHandle

     (hDriver : HDRVR)

     return Win32.Windef.HMODULE;                 --  mmsystem.h:285



   function DefDriverProc

     (dwDriverIdentifier : Win32.DWORD;

      driverID : HDRVR;

      message : Win32.UINT;

      lParam1 : Win32.LPARAM;

      lParam2 : Win32.LPARAM)

     return Win32.LRESULT;                        --  mmsystem.h:286



   function mmsystemGetVersion return Win32.UINT;          --  mmsystem.h:329



   procedure OutputDebugStr (lpOutputString : Win32.LPCSTR)  --  mmsystem.h:332

     renames Win32.Winbase.OutputDebugString;



   function sndPlaySoundA

     (lpszSoundName : Win32.LPCSTR;

      fuSound : Win32.UINT)

     return Win32.BOOL;                           --  mmsystem.h:346



   function sndPlaySound

     (lpszSoundName : Win32.LPCSTR;

      fuSound : Win32.UINT)

     return Win32.BOOL

     renames sndPlaySoundA;                       --  mmsystem.h:346



   function sndPlaySoundW

     (lpszSoundName : Win32.LPCWSTR;

      fuSound : Win32.UINT)

     return Win32.BOOL;                           --  mmsystem.h:347



   function PlaySoundA

     (lpszName : Win32.LPCSTR;

      hModule : Win32.Windef.HMODULE;

      dwFlags : Win32.DWORD)

     return Win32.BOOL;                           --  mmsystem.h:353



   function PlaySound

     (lpszName : Win32.LPCSTR;

      hModule : Win32.Windef.HMODULE;

      dwFlags : Win32.DWORD)

     return Win32.BOOL

     renames PlaySoundA;                          --  mmsystem.h:353



   function PlaySoundW

     (lpszName : Win32.LPCWSTR;

      hModule : Win32.Windef.HMODULE;

      dwFlags : Win32.DWORD)

     return Win32.BOOL;                           --  mmsystem.h:354



   function sndAlias (ch0 : Win32.CHAR;

                      ch1 : Win32.CHAR)

                     return Win32.DWORD;                   --  mmsystem.h:366

   pragma Inline (sndAlias);







   function waveOutGetNumDevs return Win32.UINT;           --  mmsystem.h:635



   function waveOutGetDevCapsA

     (uDeviceID : Win32.UINT;

      lpCaps : LPWAVEOUTCAPSA;

      cbCaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:636



   function waveOutGetDevCaps (

                               uDeviceID : Win32.UINT;

                               lpCaps : LPWAVEOUTCAPSA;

                               cbCaps : Win32.UINT)

                              return MMRESULT

     renames waveOutGetDevCapsA;                  --  mmsystem.h:636



   function waveOutGetDevCapsW (

                                uDeviceID : Win32.UINT;

                                lpCaps : LPWAVEOUTCAPSW;

                                cbCaps : Win32.UINT)

                               return MMRESULT;              --  mmsystem.h:638



   function waveOutGetVolume (

                              uDeviceID : Win32.UINT;

                              lpdwVolume : Win32.LPDWORD)

                             return MMRESULT;                --  mmsystem.h:646



   function waveOutSetVolume (

                              uDeviceID : Win32.UINT;

                              dwVolume : Win32.DWORD)

                             return MMRESULT;                --  mmsystem.h:647



   function waveOutGetErrorTextA

     (err : MMRESULT;

      lpText : Win32.LPSTR;

      cchText : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:649



   function waveOutGetErrorText

     (err : MMRESULT;

      lpText : Win32.LPSTR;

      cchText : Win32.UINT)

     return MMRESULT

     renames waveOutGetErrorTextA;                --  mmsystem.h:649



   function waveOutGetErrorTextW

     (err : MMRESULT;

      lpText : Win32.LPWSTR;

      cchText : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:650



   function waveOutOpen

     (lphwo : LPHWAVEOUT;

      uDeviceID : Win32.UINT;

      lpFormat : LPCWAVEFORMAT;

      dwCallback : Win32.DWORD;

      dwInstance : Win32.DWORD;

      dwFlags : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:657



   function waveOutClose

     (hwo : HWAVEOUT)

     return MMRESULT;                             --  mmsystem.h:660



   function waveOutPrepareHeader

     (hwo : HWAVEOUT;

      pwh : LPWAVEHDR;

      cbwh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:661



   function waveOutUnprepareHeader

     (hwo : HWAVEOUT;

      pwh : LPWAVEHDR;

      cbwh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:662



   function waveOutWrite

     (hwo : HWAVEOUT;

      pwh : LPWAVEHDR;

      cbwh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:663



   function waveOutPause

     (hwo : HWAVEOUT)

     return MMRESULT;                             --  mmsystem.h:664



   function waveOutRestart

     (hwo : HWAVEOUT)

     return MMRESULT;                             --  mmsystem.h:665



   function waveOutReset

     (hwo : HWAVEOUT)

     return MMRESULT;                             --  mmsystem.h:666



   function waveOutBreakLoop

     (hwo : HWAVEOUT)

     return MMRESULT;                             --  mmsystem.h:667



   function waveOutGetPosition

     (hwo : HWAVEOUT;

      lpmmt : LPMMTIME;

      cbmmt : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:668



   function waveOutGetPitch

     (hwo : HWAVEOUT;

      pdwPitch : Win32.LPDWORD)

     return MMRESULT;                             --  mmsystem.h:669



   function waveOutSetPitch

     (hwo : HWAVEOUT;

      dwPitch : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:670



   function waveOutGetPlaybackRate

     (hwo : HWAVEOUT;

      lpdwRate : Win32.LPDWORD)

     return MMRESULT;                             --  mmsystem.h:671



   function waveOutSetPlaybackRate

     (hwo : HWAVEOUT;

      dwRate : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:672



   function waveOutGetID

     (hwo : HWAVEOUT;

      lpuDeviceID : LPUINT)

     return MMRESULT;                             --  mmsystem.h:674



   function waveOutMessage

     (hwo : HWAVEOUT;

      uMsg : Win32.UINT;

      dw1 : Win32.DWORD;

      dw2 : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:676



   function waveInGetNumDevs return Win32.UINT;            --  mmsystem.h:678



   function waveInGetDevCapsA

     (uDeviceID : Win32.UINT;

      lpCaps : LPWAVEINCAPSA;

      cbCaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:680



   function waveInGetDevCaps

     (uDeviceID : Win32.UINT;

      lpCaps : LPWAVEINCAPSA;

      cbCaps : Win32.UINT)

     return MMRESULT

     renames waveInGetDevCapsA;                   --  mmsystem.h:680



   function waveInGetDevCapsW

     (uDeviceID : Win32.UINT;

      lpCaps : LPWAVEINCAPSW;

      cbCaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:682



   function waveInGetErrorTextA

     (mmrError : MMRESULT;

      lpText : Win32.LPSTR;

      cchText : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:690



   function waveInGetErrorText

     (mmrError : MMRESULT;

      lpText : Win32.LPSTR;

      cchText : Win32.UINT)

     return MMRESULT

     renames waveInGetErrorTextA;                 --  mmsystem.h:690



   function waveInGetErrorTextW

     (mmrError : MMRESULT;

      lpText : Win32.LPWSTR;

      cchText : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:691



   function waveInOpen

     (lphwi : LPHWAVEIN;

      uDeviceID : Win32.UINT;

      lpwf : LPCWAVEFORMAT;

      dwCallback : Win32.DWORD;

      dwInstance : Win32.DWORD;

      fdwOpen : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:698



   function waveInClose

     (hwi : HWAVEIN)

     return MMRESULT;                             --  mmsystem.h:700



   function waveInPrepareHeader

     (hwi : HWAVEIN;

      lpwh : LPWAVEHDR;

      cbwh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:701



   function waveInUnprepareHeader

     (hwi : HWAVEIN;

      lpwh : LPWAVEHDR;

      cbwh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:702



   function waveInAddBuffer

     (hwi : HWAVEIN;

      lpwh : LPWAVEHDR;

      cbwh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:703



   function waveInStart

     (hwi : HWAVEIN)

     return MMRESULT;                             --  mmsystem.h:704



   function waveInStop

     (hwi : HWAVEIN)

     return MMRESULT;                             --  mmsystem.h:705



   function waveInReset

     (hwi : HWAVEIN)

     return MMRESULT;                             --  mmsystem.h:706



   function waveInGetPosition

     (hwi : HWAVEIN;

      lpmmt : LPMMTIME;

      cbmmt : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:707



   function waveInGetID

     (hwi : HWAVEIN;

      lpuDeviceID : LPUINT)

     return MMRESULT;                             --  mmsystem.h:708



   function waveInMessage

     (hwi : HWAVEIN;

      uMsg : Win32.UINT;

      dw1 : Win32.DWORD;

      dw2 : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:710



   function midiOutGetNumDevs return Win32.UINT;           --  mmsystem.h:896



   function midiOutGetDevCapsA

     (uDeviceID : Win32.UINT;

      lpCaps : LPMIDIOUTCAPSA;

      cbCaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:898



   function midiOutGetDevCaps

     (uDeviceID : Win32.UINT;

      lpCaps : LPMIDIOUTCAPSA;

      cbCaps : Win32.UINT)

     return MMRESULT

     renames midiOutGetDevCapsA;                  --  mmsystem.h:898



   function midiOutGetDevCapsW

     (uDeviceID : Win32.UINT;

      lpCaps : LPMIDIOUTCAPSW;

      cbCaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:899



   function midiOutGetVolume

     (uId : Win32.UINT;

      lpdwVolume : Win32.LPDWORD)

     return MMRESULT;                             --  mmsystem.h:906



   function midiOutSetVolume

     (uId : Win32.UINT;

      dwVolume : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:907



   function midiOutGetErrorTextA

     (mmrError : MMRESULT;

      lpText : Win32.LPSTR;

      cchText : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:909



   function midiOutGetErrorText

     (mmrError : MMRESULT;

      lpText : Win32.LPSTR;

      cchText : Win32.UINT)

     return MMRESULT

     renames midiOutGetErrorTextA;                --  mmsystem.h:909



   function midiOutGetErrorTextW

     (mmrError : MMRESULT;

      lpText : Win32.LPWSTR;

      cchText : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:910



   function midiOutOpen

     (lphmo : LPHMIDIOUT;

      uDeviceID : Win32.UINT;

      dwCallback : Win32.DWORD;

      dwInstance : Win32.DWORD;

      fdwOpen : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:917



   function midiOutClose

     (hmo : HMIDIOUT)

     return MMRESULT;                             --  mmsystem.h:919



   function midiOutPrepareHeader

     (hmo : HMIDIOUT;

      lpmh : LPMIDIHDR;

      cbmh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:920



   function midiOutUnprepareHeader

     (hmo : HMIDIOUT;

      lpmh : LPMIDIHDR;

      cbmh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:921



   function midiOutShortMsg

     (hmo : HMIDIOUT;

      dwMsg : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:923



   function midiOutLongMsg

     (hmo : HMIDIOUT;

      lpmh : LPMIDIHDR;

      cbmh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:924



   function midiOutReset

     (hmo : HMIDIOUT)

     return MMRESULT;                             --  mmsystem.h:925



   function midiOutCachePatches

     (hmo : HMIDIOUT;

      uBank : Win32.UINT;

      lpwpa : Win32.LPWORD;

      fuCache : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:926



   function midiOutCacheDrumPatches

     (hmo : HMIDIOUT;

      uPatch : Win32.UINT;

      lpwkya : Win32.LPWORD;

      fuCache : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:927



   function midiOutGetID

     (hmo : HMIDIOUT;

      lpuDeviceID : LPUINT)

     return MMRESULT;                             --  mmsystem.h:929



   function midiOutMessage

     (hmo : HMIDIOUT;

      uMsg : Win32.UINT;

      dw1 : Win32.DWORD;

      dw2 : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:931



   function midiInGetNumDevs return Win32.UINT;            --  mmsystem.h:933



   function midiInGetDevCapsA

     (uDeviceID : Win32.UINT;

      lpCaps : LPMIDIINCAPSA;

      cbCaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:934



   function midiInGetDevCaps

     (uDeviceID : Win32.UINT;

      lpCaps : LPMIDIINCAPSA;

      cbCaps : Win32.UINT)

     return MMRESULT

     renames midiInGetDevCapsA;                   --  mmsystem.h:934



   function midiInGetDevCapsW

     (uDeviceID : Win32.UINT;

      lpCaps : LPMIDIINCAPSW;

      cbCaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:935



   function midiInGetErrorTextA

     (err : MMRESULT;

      lpText : Win32.LPSTR;

      cchText : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:942



   function midiInGetErrorText

     (err : MMRESULT;

      lpText : Win32.LPSTR;

      cchText : Win32.UINT)

     return MMRESULT

     renames midiInGetErrorTextA;                 --  mmsystem.h:942



   function midiInGetErrorTextW

     (err : MMRESULT;

      lpText : Win32.LPWSTR;

      cchText : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:943



   function midiInOpen

     (lphmi : LPHMIDIIN;

      uDeviceID : Win32.UINT;

      dwCallback : Win32.DWORD;

      dwInstance : Win32.DWORD;

      fdwOpen : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:950



   function midiInClose

     (hmi : HMIDIIN)

     return MMRESULT;                             --  mmsystem.h:952



   function midiInPrepareHeader

     (hmi : HMIDIIN;

      lpmh : LPMIDIHDR;

      cbmh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:953



   function midiInUnprepareHeader

     (hmi : HMIDIIN;

      lpmh : LPMIDIHDR;

      cbmh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:954



   function midiInAddBuffer

     (hmi : HMIDIIN;

      lpmh : LPMIDIHDR;

      cbmh : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:955



   function midiInStart

     (hmi : HMIDIIN)

     return MMRESULT;                             --  mmsystem.h:956



   function midiInStop

     (hmi : HMIDIIN)

     return MMRESULT;                             --  mmsystem.h:957



   function midiInReset

     (hmi : HMIDIIN)

     return MMRESULT;                             --  mmsystem.h:958



   function midiInGetID

     (hmi : HMIDIIN;

      lpuDeviceID : LPUINT)

     return MMRESULT;                             --  mmsystem.h:959



   function midiInMessage

     (hmi : HMIDIIN;

      uMsg : Win32.UINT;

      dw1 : Win32.DWORD;

      dw2 : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:961



   function auxGetNumDevs return Win32.UINT;               --  mmsystem.h:1033



   function auxGetDevCapsA

     (uDeviceID : Win32.UINT;

      lpCaps : LPAUXCAPSA;

      cbCaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1034



   function auxGetDevCaps

     (uDeviceID : Win32.UINT;

      lpCaps : LPAUXCAPSA;

      cbCaps : Win32.UINT)

     return MMRESULT

     renames auxGetDevCapsA;                      --  mmsystem.h:1034



   function auxGetDevCapsW

     (uDeviceID : Win32.UINT;

      lpCaps : LPAUXCAPSW;

      cbCaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1035



   function auxSetVolume

     (uDeviceID : Win32.UINT;

      dwVolume : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1041



   function auxGetVolume

     (uDeviceID : Win32.UINT;

      lpdwVolume : Win32.LPDWORD)

     return MMRESULT;                             --  mmsystem.h:1042



   function auxOutMessage

     (uDeviceID : Win32.UINT;

      uMsg : Win32.UINT;

      dw1 : Win32.DWORD;

      dw2 : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1044



   function mixerGetNumDevs return Win32.UINT;             --  mmsystem.h:1089



   function mixerGetDevCapsA

     (uMxId : Win32.UINT;

      pmxcaps : LPMIXERCAPSA;

      cbmxcaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1131



   function mixerGetDevCaps

     (uMxId : Win32.UINT;

      pmxcaps : LPMIXERCAPSA;

      cbmxcaps : Win32.UINT)

     return MMRESULT

     renames mixerGetDevCapsA;                    --  mmsystem.h:1131



   function mixerGetDevCapsW

     (uMxId : Win32.UINT;

      pmxcaps : LPMIXERCAPSW;

      cbmxcaps : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1132



   function mixerGetID

     (hmxobj : HMIXEROBJ;

      puMxId : access Win32.UINT;

      fdwId : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1138



   function mixerOpen

     (phmx : LPHMIXER;

      uMxId : Win32.UINT;

      dwCallback : Win32.DWORD;

      dwInstance : Win32.DWORD;

      fdwOpen : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1141



   function mixerClose

     (hmx : HMIXER)

     return MMRESULT;                             --  mmsystem.h:1144



   function mixerMessage

     (hmx : HMIXER;

      uMsg : Win32.UINT;

      dwParam1 : Win32.DWORD;

      dwParam2 : Win32.DWORD)

     return Win32.DWORD;                          --  mmsystem.h:1146



   function mixerGetLineInfoA

     (hmxobj : HMIXEROBJ;

      pmxl : LPMIXERLINEA;

      fdwInfo : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1266



   function mixerGetLineInfo

     (hmxobj : HMIXEROBJ;

      pmxl : LPMIXERLINEA;

      fdwInfo : Win32.DWORD)

     return MMRESULT

     renames mixerGetLineInfoA;                   --  mmsystem.h:1266



   function mixerGetLineInfoW

     (hmxobj : HMIXEROBJ;

      pmxl : LPMIXERLINEW;

      fdwInfo : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1267



   function mixerGetLineControlsA

     (hmxobj : HMIXEROBJ;

      pmxlc : LPMIXERLINECONTROLSA;

      fdwControls : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1490



   function mixerGetLineControls

     (hmxobj : HMIXEROBJ;

      pmxlc : LPMIXERLINECONTROLSA;

      fdwControls : Win32.DWORD)

     return MMRESULT

     renames mixerGetLineControlsA;               --  mmsystem.h:1490



   function mixerGetLineControlsW

     (hmxobj : HMIXEROBJ;

      pmxlc : LPMIXERLINECONTROLSW;

      fdwControls : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1491



   function mixerGetControlDetailsA

     (hmxobj : HMIXEROBJ;

      pmxcd : LPMIXERCONTROLDETAILS;

      fdwDetails : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1594



   function mixerGetControlDetails

     (hmxobj : HMIXEROBJ;

      pmxcd : LPMIXERCONTROLDETAILS;

      fdwDetails : Win32.DWORD)

     return MMRESULT

     renames mixerGetControlDetailsA;             --  mmsystem.h:1594



   function mixerGetControlDetailsW

     (hmxobj : HMIXEROBJ;

      pmxcd : LPMIXERCONTROLDETAILS;

      fdwDetails : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1595



   function mixerSetControlDetails

     (hmxobj : HMIXEROBJ;

      pmxcd : LPMIXERCONTROLDETAILS;

      fdwDetails : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1608



   function timeGetSystemTime

     (lpmmt : LPMMTIME;

      cbmmt : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1654



   function timeGetTime return Win32.DWORD;                --  mmsystem.h:1655



   function timeSetEvent

     (uDelay : Win32.UINT;

      uResolution : Win32.UINT;

      lpFunction : LPTIMECALLBACK;

      dwUser : Win32.DWORD;

      uFlags : Win32.UINT)

     return Win32.UINT;                           --  mmsystem.h:1656



   function timeKillEvent

     (uTimerID : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1658



   function timeGetDevCaps

     (lptc : LPTIMECAPS;

      cbtc : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1659



   function timeBeginPeriod

     (uPeriod : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1660



   function timeEndPeriod

     (uPeriod : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1661



   function joyGetNumDevs return Win32.UINT;               --  mmsystem.h:1762



   function joyGetDevCapsA

     (uJoyId : Win32.UINT;

      lpjc : LPJOYCAPSA;

      cbjc : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1763



   function joyGetDevCaps

     (uJoyId : Win32.UINT;

      lpjc : LPJOYCAPSA;

      cbjc : Win32.UINT)

     return MMRESULT

     renames joyGetDevCapsA;                      --  mmsystem.h:1763



   function joyGetDevCapsW

     (uJoyId : Win32.UINT;

      lpjc : LPJOYCAPSW;

      cbjc : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1764



   function joyGetPos

     (uJoyID : Win32.UINT;

      lpji : LPJOYINFO)

     return MMRESULT;                             --  mmsystem.h:1770



   function joyGetThreshold

     (uJoyID : Win32.UINT;

      lpuThreshold : LPUINT)

     return MMRESULT;                             --  mmsystem.h:1771



   function joyReleaseCapture

     (uJoyID : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1772



   function joySetCapture

     (hwnd : Win32.Windef.HWND;

      uJoyID : Win32.UINT;

      uPeriod : Win32.UINT;

      fChanged : Win32.BOOL)

     return MMRESULT;                             --  mmsystem.h:1773



   function joySetThreshold

     (uJoyID : Win32.UINT;

      uThreshold : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1775



   function mmioFOURCC (ch0 : Win32.CHAR;

                        ch1 : Win32.CHAR;

                        ch2 : Win32.CHAR;

                        ch3 : Win32.CHAR)

                       return FOURCC;                      --  mmsystem.h:1945

   pragma Inline (mmioFOURCC);





   function mmioStringToFOURCCA

     (sz : Win32.LPCSTR;

      uFlags : Win32.UINT)

     return FOURCC;                               --  mmsystem.h:1950



   function mmioStringToFOURCC

     (sz : Win32.LPCSTR;

      uFlags : Win32.UINT)

     return FOURCC

     renames mmioStringToFOURCCA;                 --  mmsystem.h:1950



   function mmioStringToFOURCCW

     (sz : Win32.LPCWSTR;

      uFlags : Win32.UINT)

     return FOURCC;                               --  mmsystem.h:1952



   function mmioInstallIOProcA

     (fccIOProc : FOURCC;

      pIOProc : LPMMIOPROC;

      dwFlags : Win32.DWORD)

     return LPMMIOPROC;                           --  mmsystem.h:1961



   function mmioInstallIOProc

     (fccIOProc : FOURCC;

      pIOProc : LPMMIOPROC;

      dwFlags : Win32.DWORD)

     return LPMMIOPROC

     renames mmioInstallIOProcA;                  --  mmsystem.h:1961



   function mmioInstallIOProcW

     (fccIOProc : FOURCC;

      pIOProc : LPMMIOPROC;

      dwFlags : Win32.DWORD)

     return LPMMIOPROC;                           --  mmsystem.h:1963



   function mmioOpenA

     (szFileName : Win32.LPSTR;

      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;

      fdwOpen : Win32.DWORD)

     return HMMIO;                                --  mmsystem.h:1971



   function mmioOpen

     (szFileName : Win32.LPSTR;

      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;

      fdwOpen : Win32.DWORD)

     return HMMIO

     renames mmioOpenA;                           --  mmsystem.h:1971



   function mmioOpenW

     (szFileName : Win32.LPWSTR;

      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;

      fdwOpen : Win32.DWORD)

     return HMMIO;                                --  mmsystem.h:1972



   function mmioRenameA

     (szFileName : Win32.LPCSTR;

      szNewFileName : Win32.LPCSTR;

      lpmmioinfo : LPCMMIOINFO;

      fdwRename : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1979



   function mmioRename

     (szFileName : Win32.LPCSTR;

      szNewFileName : Win32.LPCSTR;

      lpmmioinfo : LPCMMIOINFO;

      fdwRename : Win32.DWORD)

     return MMRESULT

     renames mmioRenameA;                         --  mmsystem.h:1979



   function mmioRenameW

     (szFileName : Win32.LPCWSTR;

      szNewFileName : Win32.LPCWSTR;

      lpmmioinfo : LPCMMIOINFO;

      fdwRename : Win32.DWORD)

     return MMRESULT;                             --  mmsystem.h:1981



   function mmioClose

     (hmmio : Win32.Mmsystem.HMMIO;

      fuClose : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1989



   function mmioRead

     (hmmio : Win32.Mmsystem.HMMIO;

      pch : HPSTR;

      cch : Win32.LONG)

     return Win32.LRESULT;                        --  mmsystem.h:1990



   function mmioWrite (

                       hmmio : Win32.Mmsystem.HMMIO;

                       pch : HPCSTR;

                       cch : Win32.LONG)

                      return Win32.LRESULT;             --  mmsystem.h:1991



   function mmioSeek (

                      hmmio : Win32.Mmsystem.HMMIO;

                      lOffset : Win32.LONG;

                      iOrigin : Win32.INT)

                     return Win32.LRESULT;              --  mmsystem.h:1992



   function mmioGetInfo

     (hmmio : Win32.Mmsystem.HMMIO;

      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;

      fuInfo : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1993



   function mmioSetInfo

     (hmmio : Win32.Mmsystem.HMMIO;

      lpmmioinfo : LPCMMIOINFO;

      fuInfo : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1994



   function mmioSetBuffer

     (hmmio : Win32.Mmsystem.HMMIO;

      pchBuffer : Win32.LPSTR;

      cchBuffer : Win32.LONG;

      fuBuffer : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1995



   function mmioFlush

     (hmmio : Win32.Mmsystem.HMMIO;

      fuFlush : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1997



   function mmioAdvance

     (hmmio : Win32.Mmsystem.HMMIO;

      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;

      fuAdvance : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:1998



   function mmioSendMessage

     (hmmio : Win32.Mmsystem.HMMIO;

      uMsg : Win32.UINT;

      lParam1 : Win32.LPARAM;

      lParam2 : Win32.LPARAM)

     return Win32.LRESULT;                        --  mmsystem.h:2000



   function mmioDescend

     (hmmio : Win32.Mmsystem.HMMIO;

      lpmmcki : LPMMCKINFO;

      lpmmckiParent : LPCMMCKINFO;

      fuDescend : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:2003



   function mmioAscend

     (hmmio : Win32.Mmsystem.HMMIO;

      lpmmcki : LPMMCKINFO;

      fuAscend : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:2005



   function mmioCreateChunk

     (hmmio : Win32.Mmsystem.HMMIO;

      lpmmcki : LPMMCKINFO;

      fuCreate : Win32.UINT)

     return MMRESULT;                             --  mmsystem.h:2006



   function mciSendCommandA

     (mciId : MCIDEVICEID;

      uMessage : Win32.UINT;

      dwParam1 : Win32.DWORD;

      dwParam2 : Win32.DWORD)

     return MCIERROR;                             --  mmsystem.h:2037



   function mciSendCommand

     (mciId : MCIDEVICEID;

      uMessage : Win32.UINT;

      dwParam1 : Win32.DWORD;

      dwParam2 : Win32.DWORD)

     return MCIERROR

     renames mciSendCommandA;                     --  mmsystem.h:2037



   function mciSendCommandW

     (mciId : MCIDEVICEID;

      uMessage : Win32.UINT;

      dwParam1 : Win32.DWORD;

      dwParam2 : Win32.DWORD)

     return MCIERROR;                             --  mmsystem.h:2042



   function mciSendStringA

     (lpstrCommand : Win32.LPCSTR;

      lpstrReturnString : Win32.LPSTR;

      uReturnLength : Win32.UINT;

      hwndCallback : Win32.Windef.HWND)

     return MCIERROR;                             --  mmsystem.h:2053



   function mciSendString

     (lpstrCommand : Win32.LPCSTR;

      lpstrReturnString : Win32.LPSTR;

      uReturnLength : Win32.UINT;

      hwndCallback : Win32.Windef.HWND)

     return MCIERROR

     renames mciSendStringA;                      --  mmsystem.h:2053



   function mciSendStringW

     (lpstrCommand : Win32.LPCWSTR;

      lpstrReturnString : Win32.LPWSTR;

      uReturnLength : Win32.UINT;

      hwndCallback : Win32.Windef.HWND)

     return MCIERROR;                             --  mmsystem.h:2058



   function mciGetDeviceIDA

     (lpstrName : Win32.LPCSTR)

     return MCIDEVICEID;                          --  mmsystem.h:2069



   function mciGetDeviceID

     (lpstrName : Win32.LPCSTR)

     return MCIDEVICEID

     renames mciGetDeviceIDA;                     --  mmsystem.h:2069



   function mciGetDeviceIDW

     (lpstrName : Win32.LPCWSTR)

     return MCIDEVICEID;                          --  mmsystem.h:2070



   function mciGetDeviceIDFromElementIDA

     (dwElementID : Win32.DWORD;

      lpstrType : Win32.LPCSTR)

     return MCIDEVICEID;                          --  mmsystem.h:2077



   function mciGetDeviceIDFromElementID

     (dwElementID : Win32.DWORD;

      lpstrType : Win32.LPCSTR)

     return MCIDEVICEID

     renames mciGetDeviceIDFromElementIDA;        --  mmsystem.h:2077



   function mciGetDeviceIDFromElementIDW

     (dwElementID : Win32.DWORD;

      lpstrType : Win32.LPCWSTR)

     return MCIDEVICEID;                          --  mmsystem.h:2080



   function mciGetErrorStringA

     (mcierr : MCIERROR;

      lpstrBuffer : Win32.LPSTR;

      cchText : Win32.UINT)

     return Win32.BOOL;                           --  mmsystem.h:2089



   function mciGetErrorString

     (mcierr : MCIERROR;

      lpstrBuffer : Win32.LPSTR;

      cchText : Win32.UINT)

     return Win32.BOOL

     renames mciGetErrorStringA;                  --  mmsystem.h:2089



   function mciGetErrorStringW

     (mcierr : MCIERROR;

      lpstrBuffer : Win32.LPWSTR;

      cchText : Win32.UINT)

     return Win32.BOOL;                           --  mmsystem.h:2093



   function mciSetYieldProc

     (mciId : MCIDEVICEID;

      fpYieldProc : YIELDPROC;

      dwYieldData : Win32.DWORD)

     return Win32.BOOL;                           --  mmsystem.h:2103



   function mciGetCreatorTask

     (mciId : MCIDEVICEID)

     return Win32.Winnt.HANDLE;                   --  mmsystem.h:2106



   function mciGetYieldProc

     (mciId : MCIDEVICEID;

      pdwYieldData : Win32.LPDWORD)

     return YIELDPROC;                            --  mmsystem.h:2107



   function MCI_MSF_MINUTE (dwMSF : Win32.DWORD) return Win32.BYTE;

   --  mmsystem.h: 2302



   function MCI_MSF_SECOND (dwMSF : Win32.DWORD) return Win32.BYTE;

   --  mmsystem.h: 2303



   function MCI_MSF_FRAME (dwMSF : Win32.DWORD) return Win32.BYTE;

   --  mmsystem.h: 2304

   function MCI_MAKE_MSF (minutes : Win32.BYTE;

                          seconds : Win32.BYTE;

                          frames : Win32.BYTE)

                         return Win32.DWORD;               --  mmsystem.h:2306



   function MCI_TMSF_TRACK (dwTMSF : Win32.DWORD) return Win32.BYTE;

   --  mmsystem.h: 2310

   function MCI_TMSF_MINUTE (dwTMSF : Win32.DWORD) return Win32.BYTE;

   --  mmsystem.h: 2311

   function MCI_TMSF_SECOND (dwTMSF : Win32.DWORD) return Win32.BYTE;

   --  mmsystem.h: 2312

   function MCI_TMSF_FRAME (dwTMSF : Win32.DWORD) return Win32.BYTE;

   --  mmsystem.h: 2313

   function MCI_MAKE_TMSF (tracks : Win32.BYTE;

                           minutes : Win32.BYTE;

                           seconds : Win32.BYTE;

                           frames : Win32.BYTE)

                          return Win32.DWORD;              --  mmsystem.h: 2315



   function MCI_HMS_HOUR (dwHMS : Win32.DWORD)

                         return Win32.BYTE;                --  mmsystem.h: 2326



   function MCI_HMS_MINUTE (dwHMS : Win32.DWORD)

                           return Win32.BYTE;              --  mmsystem.h: 2327



   function MCI_HMS_SECOND (dwHMS : Win32.DWORD)

                           return Win32.BYTE;              --  mmsystem.h: 2328



   function MCI_MAKE_HMS (hours : Win32.BYTE;

                          minutes : Win32.BYTE;

                          seconds : Win32.BYTE)

                         return Win32.DWORD;               --  mmsystem.h: 2330



private



   pragma Convention (C, struct_anonymous0_t);              --  mmsystem.h:120

   pragma Convention (C, struct_anonymous1_t);              --  mmsystem.h:125

   pragma Convention (C, MMTIME);                           --  mmsystem.h:100

   pragma Convention (C, DRVCONFIGINFO);                    --  mmsystem.h:260

   pragma Convention (C, WAVEHDR);                          --  mmsystem.h:456

   pragma Convention (C, WAVEOUTCAPSA);                     --  mmsystem.h:471

   pragma Convention (C, WAVEOUTCAPSW);                     --  mmsystem.h:482

   pragma Convention (C, WAVEINCAPSA);                      --  mmsystem.h:527

   pragma Convention (C, WAVEINCAPSW);                      --  mmsystem.h:537

   pragma Convention (C, WAVEFORMAT);                       --  mmsystem.h:589

   pragma Convention (C, PCMWAVEFORMAT);                    --  mmsystem.h:604

   pragma Convention (C, WAVEFORMATEX);                     --  mmsystem.h:619

   pragma Convention (C, MIDIOUTCAPSA);                     --  mmsystem.h:772

   pragma Convention (C, MIDIOUTCAPSW);                     --  mmsystem.h:784

   pragma Convention (C, MIDIINCAPSA);                      --  mmsystem.h:835

   pragma Convention (C, MIDIINCAPSW);                      --  mmsystem.h:842

   pragma Convention (C, MIDIHDR);                          --  mmsystem.h:882

   pragma Convention (C, AUXCAPSA);                         --  mmsystem.h:978

   pragma Convention (C, AUXCAPSW);                         --  mmsystem.h:988

   pragma Convention (C, MIXERCAPSA);                       --  mmsystem.h:1091

   pragma Convention (C, MIXERCAPSW);                       --  mmsystem.h:1100

   pragma Convention (C, struct_anonymous7_t);              --  mmsystem.h:1170

   pragma Convention (C, MIXERLINEA);                       --  mmsystem.h:1148

   pragma Convention (C, struct_anonymous9_t);              --  mmsystem.h:1194

   pragma Convention (C, MIXERLINEW);                       --  mmsystem.h:1172

   pragma Convention (C, struct_anonymous10_t);             --  mmsystem.h:1299

   pragma Convention (C, struct_anonymous11_t);             --  mmsystem.h:1304

   pragma Convention (C, MIXERCONTROLA);                    --  mmsystem.h:1284

   pragma Convention (C, struct_anonymous15_t);             --  mmsystem.h:1329

   pragma Convention (C, struct_anonymous16_t);             --  mmsystem.h:1334

   pragma Convention (C, MIXERCONTROLW);                    --  mmsystem.h:1314

   pragma Convention (C, MIXERLINECONTROLSA);               --  mmsystem.h:1438

   pragma Convention (C, MIXERLINECONTROLSW);               --  mmsystem.h:1456

   pragma Convention (C, MIXERCONTROLDETAILS);              --  mmsystem.h:1507

   pragma Convention (C, MIXERCONTROLDETAILS_LISTTEXTA);    --  mmsystem.h:1530

   pragma Convention (C, MIXERCONTROLDETAILS_LISTTEXTW);    --  mmsystem.h:1540

   pragma Convention (C, MIXERCONTROLDETAILS_BOOLEAN);      --  mmsystem.h:1571

   pragma Convention (C, MIXERCONTROLDETAILS_SIGNED);       --  mmsystem.h:1578

   pragma Convention (C, MIXERCONTROLDETAILS_UNSIGNED);     --  mmsystem.h:1586

   pragma Convention (C, TIMECAPS);                         --  mmsystem.h:1645

   pragma Convention (C, JOYCAPSA);                         --  mmsystem.h:1694

   pragma Convention (C, JOYCAPSW);                         --  mmsystem.h:1709

   pragma Convention (C, JOYINFO);                          --  mmsystem.h:1751

   pragma Convention (C, MMIOINFO);                         --  mmsystem.h:1819

   pragma Convention (C, MMCKINFO);                         --  mmsystem.h:1852

   pragma Convention (C, MCI_GENERIC_PARMS);                --  mmsystem.h:2432

   pragma Convention (C, MCI_OPEN_PARMSA);                  --  mmsystem.h:2439

   pragma Convention (C, MCI_OPEN_PARMSW);                  --  mmsystem.h:2447

   pragma Convention (C, MCI_PLAY_PARMS);                   --  mmsystem.h:2493

   pragma Convention (C, MCI_SEEK_PARMS);                   --  mmsystem.h:2502

   pragma Convention (C, MCI_STATUS_PARMS);                 --  mmsystem.h:2510

   pragma Convention (C, MCI_INFO_PARMSA);                  --  mmsystem.h:2520

   pragma Convention (C, MCI_INFO_PARMSW);                  --  mmsystem.h:2526

   pragma Convention (C, MCI_GETDEVCAPS_PARMS);             --  mmsystem.h:2552

   pragma Convention (C, MCI_SYSINFO_PARMSA);               --  mmsystem.h:2561

   pragma Convention (C, MCI_SYSINFO_PARMSW);               --  mmsystem.h:2569

   pragma Convention (C, MCI_SET_PARMS);                    --  mmsystem.h:2597

   pragma Convention (C, MCI_BREAK_PARMS);                  --  mmsystem.h:2606

   pragma Convention (C, MCI_SOUND_PARMSA);                 --  mmsystem.h:2615

   pragma Convention (C, MCI_SOUND_PARMSW);                 --  mmsystem.h:2620

   pragma Convention (C, MCI_SAVE_PARMSA);                  --  mmsystem.h:2645

   pragma Convention (C, MCI_SAVE_PARMSW);                  --  mmsystem.h:2650

   pragma Convention (C, MCI_LOAD_PARMSA);                  --  mmsystem.h:2675

   pragma Convention (C, MCI_LOAD_PARMSW);                  --  mmsystem.h:2680

   pragma Convention (C, MCI_RECORD_PARMS);                 --  mmsystem.h:2705

   pragma Convention (C, MCI_VD_PLAY_PARMS);                --  mmsystem.h:2771

   pragma Convention (C, MCI_VD_STEP_PARMS);                --  mmsystem.h:2781

   pragma Convention (C, MCI_VD_ESCAPE_PARMSA);             --  mmsystem.h:2789

   pragma Convention (C, MCI_VD_ESCAPE_PARMSW);             --  mmsystem.h:2794

   pragma Convention (C, MCI_WAVE_OPEN_PARMSA);             --  mmsystem.h:2860

   pragma Convention (C, MCI_WAVE_OPEN_PARMSW);             --  mmsystem.h:2869

   pragma Convention (C, MCI_WAVE_DELETE_PARMS);            --  mmsystem.h:2898

   pragma Convention (C, MCI_WAVE_SET_PARMS);               --  mmsystem.h:2907

   pragma Convention (C, MCI_SEQ_SET_PARMS);                --  mmsystem.h:2981

   pragma Convention (C, MCI_ANIM_OPEN_PARMSA);             --  mmsystem.h:3063

   pragma Convention (C, MCI_ANIM_OPEN_PARMSW);             --  mmsystem.h:3073

   pragma Convention (C, MCI_ANIM_PLAY_PARMS);              --  mmsystem.h:3103

   pragma Convention (C, MCI_ANIM_STEP_PARMS);              --  mmsystem.h:3113

   pragma Convention (C, MCI_ANIM_WINDOW_PARMSA);           --  mmsystem.h:3121

   pragma Convention (C, MCI_ANIM_WINDOW_PARMSW);           --  mmsystem.h:3128

   pragma Convention (C, MCI_ANIM_RECT_PARMS);              --  mmsystem.h:3155

   pragma Convention (C, MCI_ANIM_UPDATE_PARMS);            --  mmsystem.h:3168

   pragma Convention (C, MCI_OVLY_OPEN_PARMSA);             --  mmsystem.h:3223

   pragma Convention (C, MCI_OVLY_OPEN_PARMSW);             --  mmsystem.h:3233

   pragma Convention (C, MCI_OVLY_WINDOW_PARMSA);           --  mmsystem.h:3263

   pragma Convention (C, MCI_OVLY_WINDOW_PARMSW);           --  mmsystem.h:3270

   pragma Convention (C, MCI_OVLY_RECT_PARMS);              --  mmsystem.h:3297

   pragma Convention (C, MCI_OVLY_SAVE_PARMSA);             --  mmsystem.h:3310

   pragma Convention (C, MCI_OVLY_SAVE_PARMSW);             --  mmsystem.h:3316

   pragma Convention (C, MCI_OVLY_LOAD_PARMSA);             --  mmsystem.h:3342

   pragma Convention (C, MCI_OVLY_LOAD_PARMSW);             --  mmsystem.h:3348



   pragma Import (Stdcall, CloseDriver, "CloseDriver");     --  mmsystem.h:281

   pragma Import (Stdcall, OpenDriver, "OpenDriver");       --  mmsystem.h:282

   pragma Import (Stdcall, SendDriverMessage, "SendDriverMessage");

   --  mmsystem.h:283

   pragma Import (Stdcall, DrvGetModuleHandle, "DrvGetModuleHandle");

   --  mmsystem.h:284

   pragma Import (Stdcall, GetDriverModuleHandle, "GetDriverModuleHandle");

   --  mmsystem.h:285

   pragma Import (Stdcall, DefDriverProc, "DefDriverProc"); --  mmsystem.h:286

   pragma Import (Stdcall, mmsystemGetVersion, "mmsystemGetVersion");

   --  mmsystem.h:329

   pragma Import (Stdcall, sndPlaySoundA, "sndPlaySoundA"); --  mmsystem.h:346

   pragma Import (Stdcall, sndPlaySoundW, "sndPlaySoundW"); --  mmsystem.h:347

   pragma Import (Stdcall, PlaySoundA, "PlaySoundA");       --  mmsystem.h:353

   pragma Import (Stdcall, PlaySoundW, "PlaySoundW");       --  mmsystem.h:354

   pragma Import (Stdcall, waveOutGetNumDevs, "waveOutGetNumDevs");

   --  mmsystem.h:635

   pragma Import (Stdcall, waveOutGetDevCapsA, "waveOutGetDevCapsA");

   --  mmsystem.h:636

   pragma Import (Stdcall, waveOutGetDevCapsW, "waveOutGetDevCapsW");

   --  mmsystem.h:638

   pragma Import (Stdcall, waveOutGetVolume, "waveOutGetVolume");

   --  mmsystem.h:646

   pragma Import (Stdcall, waveOutSetVolume, "waveOutSetVolume");

   --  mmsystem.h:647

   pragma Import (Stdcall, waveOutGetErrorTextA, "waveOutGetErrorTextA");

   --  mmsystem.h:649

   pragma Import (Stdcall, waveOutGetErrorTextW, "waveOutGetErrorTextW");

   --  mmsystem.h:650

   pragma Import (Stdcall, waveOutOpen, "waveOutOpen");      --  mmsystem.h:657

   pragma Import (Stdcall, waveOutClose, "waveOutClose");    --  mmsystem.h:660

   pragma Import (Stdcall, waveOutPrepareHeader, "waveOutPrepareHeader");

   --  mmsystem.h:661

   pragma Import (Stdcall, waveOutUnprepareHeader, "waveOutUnprepareHeader");

   --  mmsystem.h:662

   pragma Import (Stdcall, waveOutWrite, "waveOutWrite");    --  mmsystem.h:663

   pragma Import (Stdcall, waveOutPause, "waveOutPause");    --  mmsystem.h:664

   pragma Import (Stdcall, waveOutRestart, "waveOutRestart");

   --  mmsystem.h:665

   pragma Import (Stdcall, waveOutReset, "waveOutReset");    --  mmsystem.h:666

   pragma Import (Stdcall, waveOutBreakLoop, "waveOutBreakLoop");

   --  mmsystem.h:667

   pragma Import (Stdcall, waveOutGetPosition, "waveOutGetPosition");

   --  mmsystem.h:668

   pragma Import (Stdcall, waveOutGetPitch, "waveOutGetPitch");

   --  mmsystem.h:669

   pragma Import (Stdcall, waveOutSetPitch, "waveOutSetPitch");

   --  mmsystem.h:670

   pragma Import (Stdcall, waveOutGetPlaybackRate, "waveOutGetPlaybackRate");

   --  mmsystem.h:671

   pragma Import (Stdcall, waveOutSetPlaybackRate, "waveOutSetPlaybackRate");

   --  mmsystem.h:672

   pragma Import (Stdcall, waveOutGetID, "waveOutGetID");

   --  mmsystem.h:674

   pragma Import (Stdcall, waveOutMessage, "waveOutMessage");

   --  mmsystem.h:676

   pragma Import (Stdcall, waveInGetNumDevs, "waveInGetNumDevs");

   --  mmsystem.h:678

   pragma Import (Stdcall, waveInGetDevCapsA, "waveInGetDevCapsA");

   --  mmsystem.h:680

   pragma Import (Stdcall, waveInGetDevCapsW, "waveInGetDevCapsW");

   --  mmsystem.h:682

   pragma Import (Stdcall, waveInGetErrorTextA, "waveInGetErrorTextA");

   --  mmsystem.h:690

   pragma Import (Stdcall, waveInGetErrorTextW, "waveInGetErrorTextW");

   --  mmsystem.h:691

   pragma Import (Stdcall, waveInOpen, "waveInOpen");        --  mmsystem.h:698

   pragma Import (Stdcall, waveInClose, "waveInClose");      --  mmsystem.h:700

   pragma Import (Stdcall, waveInPrepareHeader, "waveInPrepareHeader");

   --  mmsystem.h:701

   pragma Import (Stdcall, waveInUnprepareHeader, "waveInUnprepareHeader");

   --  mmsystem.h:702

   pragma Import (Stdcall, waveInAddBuffer, "waveInAddBuffer");

   --  mmsystem.h:703

   pragma Import (Stdcall, waveInStart, "waveInStart");      --  mmsystem.h:704

   pragma Import (Stdcall, waveInStop, "waveInStop");        --  mmsystem.h:705

   pragma Import (Stdcall, waveInReset, "waveInReset");      --  mmsystem.h:706

   pragma Import (Stdcall, waveInGetPosition, "waveInGetPosition");

   --  mmsystem.h:707

   pragma Import (Stdcall, waveInGetID, "waveInGetID");      --  mmsystem.h:708

   pragma Import (Stdcall, waveInMessage, "waveInMessage");  --  mmsystem.h:710

   pragma Import (Stdcall, midiOutGetNumDevs, "midiOutGetNumDevs");

   --  mmsystem.h:896

   pragma Import (Stdcall, midiOutGetDevCapsA, "midiOutGetDevCapsA");

   --  mmsystem.h:898

   pragma Import (Stdcall, midiOutGetDevCapsW, "midiOutGetDevCapsW");

   --  mmsystem.h:899

   pragma Import (Stdcall, midiOutGetVolume, "midiOutGetVolume");

   --  mmsystem.h:906

   pragma Import (Stdcall, midiOutSetVolume, "midiOutSetVolume");

   --  mmsystem.h:907

   pragma Import (Stdcall, midiOutGetErrorTextA, "midiOutGetErrorTextA");

   --  mmsystem.h:909

   pragma Import (Stdcall, midiOutGetErrorTextW, "midiOutGetErrorTextW");

   --  mmsystem.h:910

   pragma Import (Stdcall, midiOutOpen, "midiOutOpen");      --  mmsystem.h:917

   pragma Import (Stdcall, midiOutClose, "midiOutClose");    --  mmsystem.h:919

   pragma Import (Stdcall, midiOutPrepareHeader, "midiOutPrepareHeader");

   --  mmsystem.h:920

   pragma Import (Stdcall, midiOutUnprepareHeader, "midiOutUnprepareHeader");

   --  mmsystem.h:921

   pragma Import (Stdcall, midiOutShortMsg, "midiOutShortMsg");

   --  mmsystem.h:923

   pragma Import (Stdcall, midiOutLongMsg, "midiOutLongMsg");

   --  mmsystem.h:924

   pragma Import (Stdcall, midiOutReset, "midiOutReset");    --  mmsystem.h:925

   pragma Import (Stdcall, midiOutCachePatches, "midiOutCachePatches");

   --  mmsystem.h:926

   pragma Import (Stdcall, midiOutCacheDrumPatches, "midiOutCacheDrumPatches");

   --  mmsystem.h:927

   pragma Import (Stdcall, midiOutGetID, "midiOutGetID");    --  mmsystem.h:929

   pragma Import (Stdcall, midiOutMessage, "midiOutMessage");

   --  mmsystem.h:931

   pragma Import (Stdcall, midiInGetNumDevs, "midiInGetNumDevs");

   --  mmsystem.h:933

   pragma Import (Stdcall, midiInGetDevCapsA, "midiInGetDevCapsA");

   --  mmsystem.h:934

   pragma Import (Stdcall, midiInGetDevCapsW, "midiInGetDevCapsW");

   --  mmsystem.h:935

   pragma Import (Stdcall, midiInGetErrorTextA, "midiInGetErrorTextA");

   --  mmsystem.h:942

   pragma Import (Stdcall, midiInGetErrorTextW, "midiInGetErrorTextW");

   --  mmsystem.h:943

   pragma Import (Stdcall, midiInOpen, "midiInOpen");        --  mmsystem.h:950

   pragma Import (Stdcall, midiInClose, "midiInClose");      --  mmsystem.h:952

   pragma Import (Stdcall, midiInPrepareHeader, "midiInPrepareHeader");

   --  mmsystem.h:953

   pragma Import (Stdcall, midiInUnprepareHeader, "midiInUnprepareHeader");

   --  mmsystem.h:954

   pragma Import (Stdcall, midiInAddBuffer, "midiInAddBuffer");

   --  mmsystem.h:955

   pragma Import (Stdcall, midiInStart, "midiInStart");      --  mmsystem.h:956

   pragma Import (Stdcall, midiInStop, "midiInStop");        --  mmsystem.h:957

   pragma Import (Stdcall, midiInReset, "midiInReset");      --  mmsystem.h:958

   pragma Import (Stdcall, midiInGetID, "midiInGetID");      --  mmsystem.h:959

   pragma Import (Stdcall, midiInMessage, "midiInMessage");  --  mmsystem.h:961

   pragma Import (Stdcall, auxGetNumDevs, "auxGetNumDevs"); --  mmsystem.h:1033

   pragma Import (Stdcall, auxGetDevCapsA, "auxGetDevCapsA");

   --  mmsystem.h:1034

   pragma Import (Stdcall, auxGetDevCapsW, "auxGetDevCapsW");

   --  mmsystem.h:1035

   pragma Import (Stdcall, auxSetVolume, "auxSetVolume");

   --  mmsystem.h:1041

   pragma Import (Stdcall, auxGetVolume, "auxGetVolume");

   --  mmsystem.h:1042

   pragma Import (Stdcall, auxOutMessage, "auxOutMessage");

   --  mmsystem.h:1044

   pragma Import (Stdcall, mixerGetNumDevs, "mixerGetNumDevs");

   --  mmsystem.h:1089

   pragma Import (Stdcall, mixerGetDevCapsA, "mixerGetDevCapsA");

   --  mmsystem.h:1131

   pragma Import (Stdcall, mixerGetDevCapsW, "mixerGetDevCapsW");

   --  mmsystem.h:1132

   pragma Import (Stdcall, mixerGetID, "mixerGetID");       --  mmsystem.h:1138

   pragma Import (Stdcall, mixerOpen, "mixerOpen");         --  mmsystem.h:1141

   pragma Import (Stdcall, mixerClose, "mixerClose");       --  mmsystem.h:1144

   pragma Import (Stdcall, mixerMessage, "mixerMessage");   --  mmsystem.h:1146

   pragma Import (Stdcall, mixerGetLineInfoA, "mixerGetLineInfoA");

   --  mmsystem.h:1266

   pragma Import (Stdcall, mixerGetLineInfoW, "mixerGetLineInfoW");

   --  mmsystem.h:1267

   pragma Import (Stdcall, mixerGetLineControlsA, "mixerGetLineControlsA");

   --  mmsystem.h:1490

   pragma Import (Stdcall, mixerGetLineControlsW, "mixerGetLineControlsW");

   --  mmsystem.h:1491

   pragma Import (Stdcall, mixerGetControlDetailsA, "mixerGetControlDetailsA");

   --  mmsystem.h:1594

   pragma Import (Stdcall, mixerGetControlDetailsW, "mixerGetControlDetailsW");

   --  mmsystem.h:1595

   pragma Import (Stdcall, mixerSetControlDetails, "mixerSetControlDetails");

   --  mmsystem.h:1608

   pragma Import (Stdcall, timeGetSystemTime, "timeGetSystemTime");

   --  mmsystem.h:1654

   pragma Import (Stdcall, timeGetTime, "timeGetTime");

   --  mmsystem.h:1655

   pragma Import (Stdcall, timeSetEvent, "timeSetEvent");

   --  mmsystem.h:1656

   pragma Import (Stdcall, timeKillEvent, "timeKillEvent");

   --  mmsystem.h:1658

   pragma Import (Stdcall, timeGetDevCaps, "timeGetDevCaps");

   --  mmsystem.h:1659

   pragma Import (Stdcall, timeBeginPeriod, "timeBeginPeriod");

   --  mmsystem.h:1660

   pragma Import (Stdcall, timeEndPeriod, "timeEndPeriod");

   --  mmsystem.h:1661

   pragma Import (Stdcall, joyGetNumDevs, "joyGetNumDevs");

   --  mmsystem.h:1762

   pragma Import (Stdcall, joyGetDevCapsA, "joyGetDevCapsA");

   --  mmsystem.h:1763

   pragma Import (Stdcall, joyGetDevCapsW, "joyGetDevCapsW");

   --  mmsystem.h:1764

   pragma Import (Stdcall, joyGetPos, "joyGetPos");

   --  mmsystem.h:1770

   pragma Import (Stdcall, joyGetThreshold, "joyGetThreshold");

   --  mmsystem.h:1771

   pragma Import (Stdcall, joyReleaseCapture, "joyReleaseCapture");

   --  mmsystem.h:1772

   pragma Import (Stdcall, joySetCapture, "joySetCapture");

   --  mmsystem.h:1773

   pragma Import (Stdcall, joySetThreshold, "joySetThreshold");

   --  mmsystem.h:1775

   pragma Import (Stdcall, mmioStringToFOURCCA, "mmioStringToFOURCCA");

   --  mmsystem.h:1950

   pragma Import (Stdcall, mmioStringToFOURCCW, "mmioStringToFOURCCW");

   --  mmsystem.h:1952

   pragma Import (Stdcall, mmioInstallIOProcA, "mmioInstallIOProcA");

   --  mmsystem.h:1961

   pragma Import (Stdcall, mmioInstallIOProcW, "mmioInstallIOProcW");

   --  mmsystem.h:1963

   pragma Import (Stdcall, mmioOpenA, "mmioOpenA");

   --  mmsystem.h:1971

   pragma Import (Stdcall, mmioOpenW, "mmioOpenW");

   --  mmsystem.h:1972

   pragma Import (Stdcall, mmioRenameA, "mmioRenameA");

   --  mmsystem.h:1979

   pragma Import (Stdcall, mmioRenameW, "mmioRenameW");

   --  mmsystem.h:1981

   pragma Import (Stdcall, mmioClose, "mmioClose");

   --  mmsystem.h:1989

   pragma Import (Stdcall, mmioRead, "mmioRead");

   --  mmsystem.h:1990

   pragma Import (Stdcall, mmioWrite, "mmioWrite");

   --  mmsystem.h:1991

   pragma Import (Stdcall, mmioSeek, "mmioSeek");

   --  mmsystem.h:1992

   pragma Import (Stdcall, mmioGetInfo, "mmioGetInfo");

   --  mmsystem.h:1993

   pragma Import (Stdcall, mmioSetInfo, "mmioSetInfo");

   --  mmsystem.h:1994

   pragma Import (Stdcall, mmioSetBuffer, "mmioSetBuffer");

   --  mmsystem.h:1995

   pragma Import (Stdcall, mmioFlush, "mmioFlush");

   --  mmsystem.h:1997

   pragma Import (Stdcall, mmioAdvance, "mmioAdvance");

   --  mmsystem.h:1998

   pragma Import (Stdcall, mmioSendMessage, "mmioSendMessage");

   --  mmsystem.h:2000

   pragma Import (Stdcall, mmioDescend, "mmioDescend");

   --  mmsystem.h:2003

   pragma Import (Stdcall, mmioAscend, "mmioAscend");

   --  mmsystem.h:2005

   pragma Import (Stdcall, mmioCreateChunk, "mmioCreateChunk");

   --  mmsystem.h:2006

   pragma Import (Stdcall, mciSendCommandA, "mciSendCommandA");

   --  mmsystem.h:2037

   pragma Import (Stdcall, mciSendCommandW, "mciSendCommandW");

   --  mmsystem.h:2042

   pragma Import (Stdcall, mciSendStringA, "mciSendStringA");

   --  mmsystem.h:2053

   pragma Import (Stdcall, mciSendStringW, "mciSendStringW");

   --  mmsystem.h:2058

   pragma Import (Stdcall, mciGetDeviceIDA, "mciGetDeviceIDA");

   --  mmsystem.h:2069

   pragma Import (Stdcall, mciGetDeviceIDW, "mciGetDeviceIDW");

   --  mmsystem.h:2070

   pragma Import (Stdcall, mciGetDeviceIDFromElementIDA,

                    "mciGetDeviceIDFromElementIDA");       --  mmsystem.h:2077

   pragma Import (Stdcall, mciGetDeviceIDFromElementIDW,

                    "mciGetDeviceIDFromElementIDW");       --  mmsystem.h:2080

   pragma Import (Stdcall, mciGetErrorStringA, "mciGetErrorStringA");

   --  mmsystem.h:2089

   pragma Import (Stdcall, mciGetErrorStringW, "mciGetErrorStringW");

   --  mmsystem.h:2093

   pragma Import (Stdcall, mciSetYieldProc, "mciSetYieldProc");

   --  mmsystem.h:2103

   pragma Import (Stdcall, mciGetCreatorTask, "mciGetCreatorTask");

   --  mmsystem.h:2106

   pragma Import (Stdcall, mciGetYieldProc, "mciGetYieldProc");

   --  mmsystem.h:2107



end Win32.Mmsystem;





