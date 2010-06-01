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

with Win32.Winbase;
with Win32.Windef;
with Win32.Winnt;

package Win32.Mmsystem is

   MAXPNAMELEN                             : constant := 32;
   MAXERRORLENGTH                          : constant := 128;
   MM_MICROSOFT                            : constant := 1;
   MM_MIDI_MAPPER                          : constant := 1;
   MM_WAVE_MAPPER                          : constant := 2;
   MM_SNDBLST_MIDIOUT                      : constant := 3;
   MM_SNDBLST_MIDIIN                       : constant := 4;
   MM_SNDBLST_SYNTH                        : constant := 5;
   MM_SNDBLST_WAVEOUT                      : constant := 6;
   MM_SNDBLST_WAVEIN                       : constant := 7;
   MM_ADLIB                                : constant := 9;
   MM_MPU401_MIDIOUT                       : constant := 10;
   MM_MPU401_MIDIIN                        : constant := 11;
   MM_PC_JOYSTICK                          : constant := 12;
   TIME_MS                                 : constant := 16#1#;
   TIME_SAMPLES                            : constant := 16#2#;
   TIME_BYTES                              : constant := 16#4#;
   TIME_SMPTE                              : constant := 16#8#;
   TIME_MIDI                               : constant := 16#10#;
   TIME_TICKS                              : constant := 16#20#;
   MM_JOY1MOVE                             : constant := 16#3a0#;
   MM_JOY2MOVE                             : constant := 16#3a1#;
   MM_JOY1ZMOVE                            : constant := 16#3a2#;
   MM_JOY2ZMOVE                            : constant := 16#3a3#;
   MM_JOY1BUTTONDOWN                       : constant := 16#3b5#;
   MM_JOY2BUTTONDOWN                       : constant := 16#3b6#;
   MM_JOY1BUTTONUP                         : constant := 16#3b7#;
   MM_JOY2BUTTONUP                         : constant := 16#3b8#;
   MM_MCINOTIFY                            : constant := 16#3b9#;
   MM_WOM_OPEN                             : constant := 16#3bb#;
   MM_WOM_CLOSE                            : constant := 16#3bc#;
   MM_WOM_DONE                             : constant := 16#3bd#;
   MM_WIM_OPEN                             : constant := 16#3be#;
   MM_WIM_CLOSE                            : constant := 16#3bf#;
   MM_WIM_DATA                             : constant := 16#3c0#;
   MM_MIM_OPEN                             : constant := 16#3c1#;
   MM_MIM_CLOSE                            : constant := 16#3c2#;
   MM_MIM_DATA                             : constant := 16#3c3#;
   MM_MIM_LONGDATA                         : constant := 16#3c4#;
   MM_MIM_ERROR                            : constant := 16#3c5#;
   MM_MIM_LONGERROR                        : constant := 16#3c6#;
   MM_MOM_OPEN                             : constant := 16#3c7#;
   MM_MOM_CLOSE                            : constant := 16#3c8#;
   MM_MOM_DONE                             : constant := 16#3c9#;
   MM_MCISYSTEM_STRING                     : constant := 16#3ca#;
   MM_MIXM_LINE_CHANGE                     : constant := 16#3d0#;
   MM_MIXM_CONTROL_CHANGE                  : constant := 16#3d1#;
   MMSYSERR_BASE                           : constant := 0;
   WAVERR_BASE                             : constant := 32;
   MIDIERR_BASE                            : constant := 64;
   TIMERR_BASE                             : constant := 96;
   JOYERR_BASE                             : constant := 160;
   MCIERR_BASE                             : constant := 256;
   MCI_STRING_OFFSET                       : constant := 512;
   MIXERR_BASE                             : constant := 1024;
   MCI_VD_OFFSET                           : constant := 1024;
   MCI_CD_OFFSET                           : constant := 1088;
   MCI_WAVE_OFFSET                         : constant := 1152;
   MCI_SEQ_OFFSET                          : constant := 1216;
   MMSYSERR_NOERROR                        : constant := 0;
   MMSYSERR_ERROR                          : constant := 1;
   MMSYSERR_BADDEVICEID                    : constant := 2;
   MMSYSERR_NOTENABLED                     : constant := 3;
   MMSYSERR_ALLOCATED                      : constant := 4;
   MMSYSERR_INVALHANDLE                    : constant := 5;
   MMSYSERR_NODRIVER                       : constant := 6;
   MMSYSERR_NOMEM                          : constant := 7;
   MMSYSERR_NOTSUPPORTED                   : constant := 8;
   MMSYSERR_BADERRNUM                      : constant := 9;
   MMSYSERR_INVALFLAG                      : constant := 10;
   MMSYSERR_INVALPARAM                     : constant := 11;
   MMSYSERR_HANDLEBUSY                     : constant := 12;
   MMSYSERR_INVALIDALIAS                   : constant := 13;
   MMSYSERR_LASTERROR                      : constant := 13;
   DRV_LOAD                                : constant := 16#1#;
   DRV_ENABLE                              : constant := 16#2#;
   DRV_OPEN                                : constant := 16#3#;
   DRV_CLOSE                               : constant := 16#4#;
   DRV_DISABLE                             : constant := 16#5#;
   DRV_FREE                                : constant := 16#6#;
   DRV_CONFIGURE                           : constant := 16#7#;
   DRV_QUERYCONFIGURE                      : constant := 16#8#;
   DRV_INSTALL                             : constant := 16#9#;
   DRV_REMOVE                              : constant := 16#a#;
   DRV_EXITSESSION                         : constant := 16#b#;
   DRV_POWER                               : constant := 16#f#;
   DRV_RESERVED                            : constant := 16#800#;
   DRV_USER                                : constant := 16#4000#;
   DRVCNF_CANCEL                           : constant := 16#0#;
   DRVCNF_OK                               : constant := 16#1#;
   DRVCNF_RESTART                          : constant := 16#2#;
   DRV_CANCEL                              : constant := 16#0#;
   DRV_OK                                  : constant := 16#1#;
   DRV_RESTART                             : constant := 16#2#;
   DRV_MCI_FIRST                           : constant := 16#800#;
   DRV_MCI_LAST                            : constant := 16#17ff#;
   CALLBACK_TYPEMASK                       : constant := 16#70000#;
   CALLBACK_NULL                           : constant := 16#0#;
   CALLBACK_WINDOW                         : constant := 16#10000#;
   CALLBACK_TASK                           : constant := 16#20000#;
   CALLBACK_THREAD                         : constant := 16#20000#;
   CALLBACK_FUNCTION                       : constant := 16#30000#;
   SND_ALIAS                               : constant := 16#10000#;
   SND_FILENAME                            : constant := 16#20000#;
   SND_RESOURCE                            : constant := 16#40004#;
   SND_SYNC                                : constant := 16#0#;
   SND_ASYNC                               : constant := 16#1#;
   SND_NODEFAULT                           : constant := 16#2#;
   SND_MEMORY                              : constant := 16#4#;
   SND_LOOP                                : constant := 16#8#;
   SND_NOSTOP                              : constant := 16#10#;
   SND_NOWAIT                              : constant := 16#2000#;
   SND_VALIDFLAGS                          : constant := 16#17201f#;
   SND_RESERVED                            : constant := 16#ff000000#;
   SND_TYPE_MASK                           : constant := 16#170007#;
   SND_ALIAS_ID                            : constant := 16#110000#;
   SND_ALIAS_START                         : constant := 0;
   WAVERR_BADFORMAT                        : constant := 32;
   WAVERR_STILLPLAYING                     : constant := 33;
   WAVERR_UNPREPARED                       : constant := 34;
   WAVERR_SYNC                             : constant := 35;
   WAVERR_LASTERROR                        : constant := 35;
   WOM_OPEN                                : constant := 16#3bb#;
   WOM_CLOSE                               : constant := 16#3bc#;
   WOM_DONE                                : constant := 16#3bd#;
   WIM_OPEN                                : constant := 16#3be#;
   WIM_CLOSE                               : constant := 16#3bf#;
   WIM_DATA                                : constant := 16#3c0#;
   WAVE_FORMAT_QUERY                       : constant := 16#1#;
   WAVE_ALLOWSYNC                          : constant := 16#2#;
   WHDR_DONE                               : constant := 16#1#;
   WHDR_PREPARED                           : constant := 16#2#;
   WHDR_BEGINLOOP                          : constant := 16#4#;
   WHDR_ENDLOOP                            : constant := 16#8#;
   WHDR_INQUEUE                            : constant := 16#10#;
   WAVECAPS_PITCH                          : constant := 16#1#;
   WAVECAPS_PLAYBACKRATE                   : constant := 16#2#;
   WAVECAPS_VOLUME                         : constant := 16#4#;
   WAVECAPS_LRVOLUME                       : constant := 16#8#;
   WAVECAPS_SYNC                           : constant := 16#10#;
   WAVE_INVALIDFORMAT                      : constant := 16#0#;
   WAVE_FORMAT_1M08                        : constant := 16#1#;
   WAVE_FORMAT_1S08                        : constant := 16#2#;
   WAVE_FORMAT_1M16                        : constant := 16#4#;
   WAVE_FORMAT_1S16                        : constant := 16#8#;
   WAVE_FORMAT_2M08                        : constant := 16#10#;
   WAVE_FORMAT_2S08                        : constant := 16#20#;
   WAVE_FORMAT_2M16                        : constant := 16#40#;
   WAVE_FORMAT_2S16                        : constant := 16#80#;
   WAVE_FORMAT_4M08                        : constant := 16#100#;
   WAVE_FORMAT_4S08                        : constant := 16#200#;
   WAVE_FORMAT_4M16                        : constant := 16#400#;
   WAVE_FORMAT_4S16                        : constant := 16#800#;
   WAVE_FORMAT_PCM                         : constant := 1;
   MIDIERR_UNPREPARED                      : constant := 64;
   MIDIERR_STILLPLAYING                    : constant := 65;
   MIDIERR_NOMAP                           : constant := 66;
   MIDIERR_NOTREADY                        : constant := 67;
   MIDIERR_NODEVICE                        : constant := 68;
   MIDIERR_INVALIDSETUP                    : constant := 69;
   MIDIERR_BADOPENMODE                     : constant := 70;
   MIDIERR_LASTERROR                       : constant := 69;
   MIDIPATCHSIZE                           : constant := 128;
   MIM_OPEN                                : constant := 16#3c1#;
   MIM_CLOSE                               : constant := 16#3c2#;
   MIM_DATA                                : constant := 16#3c3#;
   MIM_LONGDATA                            : constant := 16#3c4#;
   MIM_ERROR                               : constant := 16#3c5#;
   MIM_LONGERROR                           : constant := 16#3c6#;
   MOM_OPEN                                : constant := 16#3c7#;
   MOM_CLOSE                               : constant := 16#3c8#;
   MOM_DONE                                : constant := 16#3c9#;
   MIDIMAPPER                              : constant := -1;
   MIDI_MAPPER                             : constant DWORD := DWORD'Last;
   MIDI_CACHE_ALL                          : constant := 1;
   MIDI_CACHE_BESTFIT                      : constant := 2;
   MIDI_CACHE_QUERY                        : constant := 3;
   MIDI_UNCACHE                            : constant := 4;
   MOD_MIDIPORT                            : constant := 1;
   MOD_SYNTH                               : constant := 2;
   MOD_SQSYNTH                             : constant := 3;
   MOD_FMSYNTH                             : constant := 4;
   MOD_MAPPER                              : constant := 5;
   MIDICAPS_VOLUME                         : constant := 16#1#;
   MIDICAPS_LRVOLUME                       : constant := 16#2#;
   MIDICAPS_CACHE                          : constant := 16#4#;
   MHDR_DONE                               : constant := 16#1#;
   MHDR_PREPARED                           : constant := 16#2#;
   MHDR_INQUEUE                            : constant := 16#4#;
   AUX_MAPPER                              : constant DWORD := DWORD'Last;
   AUXCAPS_CDAUDIO                         : constant := 1;
   AUXCAPS_AUXIN                           : constant := 2;
   AUXCAPS_VOLUME                          : constant := 16#1#;
   AUXCAPS_LRVOLUME                        : constant := 16#2#;
   MIXER_SHORT_NAME_CHARS                  : constant := 16;
   MIXER_LONG_NAME_CHARS                   : constant := 64;
   MIXERR_INVALLINE                        : constant := 1024;
   MIXERR_INVALCONTROL                     : constant := 1025;
   MIXERR_INVALVALUE                       : constant := 1026;
   MIXERR_LASTERROR                        : constant := 1026;
   MIXER_OBJECTF_HANDLE                    : constant := 16#80000000#;
   MIXER_OBJECTF_MIXER                     : constant := 16#0#;
   MIXER_OBJECTF_HMIXER                    : constant := 16#80000000#;
   MIXER_OBJECTF_WAVEOUT                   : constant := 16#10000000#;
   MIXER_OBJECTF_HWAVEOUT                  : constant := 16#90000000#;
   MIXER_OBJECTF_WAVEIN                    : constant := 16#20000000#;
   MIXER_OBJECTF_HWAVEIN                   : constant := 16#a0000000#;
   MIXER_OBJECTF_MIDIOUT                   : constant := 16#30000000#;
   MIXER_OBJECTF_HMIDIOUT                  : constant := 16#b0000000#;
   MIXER_OBJECTF_MIDIIN                    : constant := 16#40000000#;
   MIXER_OBJECTF_HMIDIIN                   : constant := 16#c0000000#;
   MIXER_OBJECTF_AUX                       : constant := 16#50000000#;
   MIXERLINE_LINEF_ACTIVE                  : constant := 16#1#;
   MIXERLINE_LINEF_DISCONNECTED            : constant := 16#8000#;
   MIXERLINE_LINEF_SOURCE                  : constant := 16#80000000#;
   MIXERLINE_COMPONENTTYPE_DST_FIRST       : constant := 16#0#;
   MIXERLINE_COMPONENTTYPE_DST_UNDEFINED   : constant := 16#0#;
   MIXERLINE_COMPONENTTYPE_DST_DIGITAL     : constant := 16#1#;
   MIXERLINE_COMPONENTTYPE_DST_LINE        : constant := 16#2#;
   MIXERLINE_COMPONENTTYPE_DST_MONITOR     : constant := 16#3#;
   MIXERLINE_COMPONENTTYPE_DST_SPEAKERS    : constant := 16#4#;
   MIXERLINE_COMPONENTTYPE_DST_HEADPHONES  : constant := 16#5#;
   MIXERLINE_COMPONENTTYPE_DST_TELEPHONE   : constant := 16#6#;
   MIXERLINE_COMPONENTTYPE_DST_WAVEIN      : constant := 16#7#;
   MIXERLINE_COMPONENTTYPE_DST_VOICEIN     : constant := 16#8#;
   MIXERLINE_COMPONENTTYPE_DST_LAST        : constant := 16#8#;
   MIXERLINE_COMPONENTTYPE_SRC_FIRST       : constant := 16#1000#;
   MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED   : constant := 16#1000#;
   MIXERLINE_COMPONENTTYPE_SRC_DIGITAL     : constant := 16#1001#;
   MIXERLINE_COMPONENTTYPE_SRC_LINE        : constant := 16#1002#;
   MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE  : constant := 16#1003#;
   MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER : constant := 16#1004#;
   MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC : constant := 16#1005#;
   MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE   : constant := 16#1006#;
   MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER   : constant := 16#1007#;
   MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT     : constant := 16#1008#;
   MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY   : constant := 16#1009#;
   MIXERLINE_COMPONENTTYPE_SRC_ANALOG      : constant := 16#100a#;
   MIXERLINE_COMPONENTTYPE_SRC_LAST        : constant := 16#100a#;
   MIXERLINE_TARGETTYPE_UNDEFINED          : constant := 0;
   MIXERLINE_TARGETTYPE_WAVEOUT            : constant := 1;
   MIXERLINE_TARGETTYPE_WAVEIN             : constant := 2;
   MIXERLINE_TARGETTYPE_MIDIOUT            : constant := 3;
   MIXERLINE_TARGETTYPE_MIDIIN             : constant := 4;
   MIXERLINE_TARGETTYPE_AUX                : constant := 5;
   MIXER_GETLINEINFOF_DESTINATION          : constant := 16#0#;
   MIXER_GETLINEINFOF_SOURCE               : constant := 16#1#;
   MIXER_GETLINEINFOF_LINEID               : constant := 16#2#;
   MIXER_GETLINEINFOF_COMPONENTTYPE        : constant := 16#3#;
   MIXER_GETLINEINFOF_TARGETTYPE           : constant := 16#4#;
   MIXER_GETLINEINFOF_QUERYMASK            : constant := 16#f#;
   MIXERCONTROL_CONTROLF_UNIFORM           : constant := 16#1#;
   MIXERCONTROL_CONTROLF_MULTIPLE          : constant := 16#2#;
   MIXERCONTROL_CONTROLF_DISABLED          : constant := 16#80000000#;
   MIXERCONTROL_CT_CLASS_MASK              : constant := 16#f0000000#;
   MIXERCONTROL_CT_CLASS_CUSTOM            : constant := 16#0#;
   MIXERCONTROL_CT_CLASS_METER             : constant := 16#10000000#;
   MIXERCONTROL_CT_CLASS_SWITCH            : constant := 16#20000000#;
   MIXERCONTROL_CT_CLASS_NUMBER            : constant := 16#30000000#;
   MIXERCONTROL_CT_CLASS_SLIDER            : constant := 16#40000000#;
   MIXERCONTROL_CT_CLASS_FADER             : constant := 16#50000000#;
   MIXERCONTROL_CT_CLASS_TIME              : constant := 16#60000000#;
   MIXERCONTROL_CT_CLASS_LIST              : constant := 16#70000000#;
   MIXERCONTROL_CT_SUBCLASS_MASK           : constant := 16#f000000#;
   MIXERCONTROL_CT_SC_SWITCH_BOOLEAN       : constant := 16#0#;
   MIXERCONTROL_CT_SC_SWITCH_BUTTON        : constant := 16#1000000#;
   MIXERCONTROL_CT_SC_METER_POLLED         : constant := 16#0#;
   MIXERCONTROL_CT_SC_TIME_MICROSECS       : constant := 16#0#;
   MIXERCONTROL_CT_SC_TIME_MILLISECS       : constant := 16#1000000#;
   MIXERCONTROL_CT_SC_LIST_SINGLE          : constant := 16#0#;
   MIXERCONTROL_CT_SC_LIST_MULTIPLE        : constant := 16#1000000#;
   MIXERCONTROL_CT_UNITS_MASK              : constant := 16#ff0000#;
   MIXERCONTROL_CT_UNITS_CUSTOM            : constant := 16#0#;
   MIXERCONTROL_CT_UNITS_BOOLEAN           : constant := 16#10000#;
   MIXERCONTROL_CT_UNITS_SIGNED            : constant := 16#20000#;
   MIXERCONTROL_CT_UNITS_UNSIGNED          : constant := 16#30000#;
   MIXERCONTROL_CT_UNITS_DECIBELS          : constant := 16#40000#;
   MIXERCONTROL_CT_UNITS_PERCENT           : constant := 16#50000#;
   MIXERCONTROL_CONTROLTYPE_CUSTOM         : constant := 16#0#;
   MIXERCONTROL_CONTROLTYPE_BOOLEANMETER   : constant := 16#10010000#;
   MIXERCONTROL_CONTROLTYPE_SIGNEDMETER    : constant := 16#10020000#;
   MIXERCONTROL_CONTROLTYPE_PEAKMETER      : constant := 16#10020001#;
   MIXERCONTROL_CONTROLTYPE_UNSIGNEDMETER  : constant := 16#10030000#;
   MIXERCONTROL_CONTROLTYPE_BOOLEAN        : constant := 16#20010000#;
   MIXERCONTROL_CONTROLTYPE_ONOFF          : constant := 16#20010001#;
   MIXERCONTROL_CONTROLTYPE_MUTE           : constant := 16#20010002#;
   MIXERCONTROL_CONTROLTYPE_MONO           : constant := 16#20010003#;
   MIXERCONTROL_CONTROLTYPE_LOUDNESS       : constant := 16#20010004#;
   MIXERCONTROL_CONTROLTYPE_STEREOENH      : constant := 16#20010005#;
   MIXERCONTROL_CONTROLTYPE_BUTTON         : constant := 16#21010000#;
   MIXERCONTROL_CONTROLTYPE_DECIBELS       : constant := 16#30040000#;
   MIXERCONTROL_CONTROLTYPE_SIGNED         : constant := 16#30020000#;
   MIXERCONTROL_CONTROLTYPE_UNSIGNED       : constant := 16#30030000#;
   MIXERCONTROL_CONTROLTYPE_PERCENT        : constant := 16#30050000#;
   MIXERCONTROL_CONTROLTYPE_SLIDER         : constant := 16#40020000#;
   MIXERCONTROL_CONTROLTYPE_PAN            : constant := 16#40020001#;
   MIXERCONTROL_CONTROLTYPE_QSOUNDPAN      : constant := 16#40020002#;
   MIXERCONTROL_CONTROLTYPE_FADER          : constant := 16#50030000#;
   MIXERCONTROL_CONTROLTYPE_VOLUME         : constant := 16#50030001#;
   MIXERCONTROL_CONTROLTYPE_BASS           : constant := 16#50030002#;
   MIXERCONTROL_CONTROLTYPE_TREBLE         : constant := 16#50030003#;
   MIXERCONTROL_CONTROLTYPE_EQUALIZER      : constant := 16#50030004#;
   MIXERCONTROL_CONTROLTYPE_SINGLESELECT   : constant := 16#70010000#;
   MIXERCONTROL_CONTROLTYPE_MUX            : constant := 16#70010001#;
   MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT : constant := 16#71010000#;
   MIXERCONTROL_CONTROLTYPE_MIXER          : constant := 16#71010001#;
   MIXERCONTROL_CONTROLTYPE_MICROTIME      : constant := 16#60030000#;
   MIXERCONTROL_CONTROLTYPE_MILLITIME      : constant := 16#61030000#;
   MIXER_GETLINECONTROLSF_ALL              : constant := 16#0#;
   MIXER_GETLINECONTROLSF_ONEBYID          : constant := 16#1#;
   MIXER_GETLINECONTROLSF_ONEBYTYPE        : constant := 16#2#;
   MIXER_GETLINECONTROLSF_QUERYMASK        : constant := 16#f#;
   MIXER_GETCONTROLDETAILSF_VALUE          : constant := 16#0#;
   MIXER_GETCONTROLDETAILSF_LISTTEXT       : constant := 16#1#;
   MIXER_GETCONTROLDETAILSF_QUERYMASK      : constant := 16#f#;
   MIXER_SETCONTROLDETAILSF_VALUE          : constant := 16#0#;
   MIXER_SETCONTROLDETAILSF_CUSTOM         : constant := 16#1#;
   MIXER_SETCONTROLDETAILSF_QUERYMASK      : constant := 16#f#;
   TIMERR_NOERROR                          : constant := 0;
   TIMERR_NOCANDO                          : constant := 97;
   TIMERR_STRUCT                           : constant := 129;
   TIME_ONESHOT                            : constant := 16#0#;
   TIME_PERIODIC                           : constant := 16#1#;
   TIME_CALLBACK_FUNCTION                  : constant := 16#0#;
   TIME_CALLBACK_EVENT_SET                 : constant := 16#10#;
   TIME_CALLBACK_EVENT_PULSE               : constant := 16#20#;
   JOYERR_NOERROR                          : constant := 0;
   JOYERR_PARMS                            : constant := 165;
   JOYERR_NOCANDO                          : constant := 166;
   JOYERR_UNPLUGGED                        : constant := 167;
   JOY_BUTTON1                             : constant := 16#1#;
   JOY_BUTTON2                             : constant := 16#2#;
   JOY_BUTTON3                             : constant := 16#4#;
   JOY_BUTTON4                             : constant := 16#8#;
   JOY_BUTTON1CHG                          : constant := 16#100#;
   JOY_BUTTON2CHG                          : constant := 16#200#;
   JOY_BUTTON3CHG                          : constant := 16#400#;
   JOY_BUTTON4CHG                          : constant := 16#800#;
   JOYSTICKID1                             : constant := 0;
   JOYSTICKID2                             : constant := 1;
   MMIOERR_BASE                            : constant := 256;
   MMIOERR_FILENOTFOUND                    : constant := 257;
   MMIOERR_OUTOFMEMORY                     : constant := 258;
   MMIOERR_CANNOTOPEN                      : constant := 259;
   MMIOERR_CANNOTCLOSE                     : constant := 260;
   MMIOERR_CANNOTREAD                      : constant := 261;
   MMIOERR_CANNOTWRITE                     : constant := 262;
   MMIOERR_CANNOTSEEK                      : constant := 263;
   MMIOERR_CANNOTEXPAND                    : constant := 264;
   MMIOERR_CHUNKNOTFOUND                   : constant := 265;
   MMIOERR_UNBUFFERED                      : constant := 266;
   MMIOERR_PATHNOTFOUND                    : constant := 267;
   MMIOERR_ACCESSDENIED                    : constant := 268;
   MMIOERR_SHARINGVIOLATION                : constant := 269;
   MMIOERR_NETWORKERROR                    : constant := 270;
   MMIOERR_TOOMANYOPENFILES                : constant := 271;
   MMIOERR_INVALIDFILE                     : constant := 272;
   CFSEPCHAR                               : constant := 43;
   MMIO_RWMODE                             : constant := 16#3#;
   MMIO_SHAREMODE                          : constant := 16#70#;
   MMIO_CREATE                             : constant := 16#1000#;
   MMIO_PARSE                              : constant := 16#100#;
   MMIO_DELETE                             : constant := 16#200#;
   MMIO_EXIST                              : constant := 16#4000#;
   MMIO_ALLOCBUF                           : constant := 16#10000#;
   MMIO_GETTEMP                            : constant := 16#20000#;
   MMIO_DIRTY                              : constant := 16#10000000#;
   MMIO_READ                               : constant := 16#0#;
   MMIO_WRITE                              : constant := 16#1#;
   MMIO_READWRITE                          : constant := 16#2#;
   MMIO_COMPAT                             : constant := 16#0#;
   MMIO_EXCLUSIVE                          : constant := 16#10#;
   MMIO_DENYWRITE                          : constant := 16#20#;
   MMIO_DENYREAD                           : constant := 16#30#;
   MMIO_DENYNONE                           : constant := 16#40#;
   MMIO_FHOPEN                             : constant := 16#10#;
   MMIO_EMPTYBUF                           : constant := 16#10#;
   MMIO_TOUPPER                            : constant := 16#10#;
   MMIO_INSTALLPROC                        : constant := 16#10000#;
   MMIO_GLOBALPROC                         : constant := 16#10000000#;
   MMIO_REMOVEPROC                         : constant := 16#20000#;
   MMIO_UNICODEPROC                        : constant := 16#1000000#;
   MMIO_FINDPROC                           : constant := 16#40000#;
   MMIO_FINDCHUNK                          : constant := 16#10#;
   MMIO_FINDRIFF                           : constant := 16#20#;
   MMIO_FINDLIST                           : constant := 16#40#;
   MMIO_CREATERIFF                         : constant := 16#20#;
   MMIO_CREATELIST                         : constant := 16#40#;
   MMIOM_READ                              : constant := 16#0#;
   MMIOM_WRITE                             : constant := 16#1#;
   MMIOM_SEEK                              : constant := 2;
   MMIOM_OPEN                              : constant := 3;
   MMIOM_CLOSE                             : constant := 4;
   MMIOM_WRITEFLUSH                        : constant := 5;
   MMIOM_RENAME                            : constant := 6;
   MMIOM_USER                              : constant := 16#8000#;
   SEEK_SET                                : constant := 0;
   SEEK_CUR                                : constant := 1;
   SEEK_END                                : constant := 2;
   MMIO_DEFAULTBUFFER                      : constant := 8192;
   MCIERR_INVALID_DEVICE_ID                : constant := 257;
   MCIERR_UNRECOGNIZED_KEYWORD             : constant := 259;
   MCIERR_UNRECOGNIZED_COMMAND             : constant := 261;
   MCIERR_HARDWARE                         : constant := 262;
   MCIERR_INVALID_DEVICE_NAME              : constant := 263;
   MCIERR_OUT_OF_MEMORY                    : constant := 264;
   MCIERR_DEVICE_OPEN                      : constant := 265;
   MCIERR_CANNOT_LOAD_DRIVER               : constant := 266;
   MCIERR_MISSING_COMMAND_STRING           : constant := 267;
   MCIERR_PARAM_OVERFLOW                   : constant := 268;
   MCIERR_MISSING_STRING_ARGUMENT          : constant := 269;
   MCIERR_BAD_INTEGER                      : constant := 270;
   MCIERR_PARSER_INTERNAL                  : constant := 271;
   MCIERR_DRIVER_INTERNAL                  : constant := 272;
   MCIERR_MISSING_PARAMETER                : constant := 273;
   MCIERR_UNSUPPORTED_FUNCTION             : constant := 274;
   MCIERR_FILE_NOT_FOUND                   : constant := 275;
   MCIERR_DEVICE_NOT_READY                 : constant := 276;
   MCIERR_INTERNAL                         : constant := 277;
   MCIERR_DRIVER                           : constant := 278;
   MCIERR_CANNOT_USE_ALL                   : constant := 279;
   MCIERR_MULTIPLE                         : constant := 280;
   MCIERR_EXTENSION_NOT_FOUND              : constant := 281;
   MCIERR_OUTOFRANGE                       : constant := 282;
   MCIERR_FLAGS_NOT_COMPATIBLE             : constant := 284;
   MCIERR_FILE_NOT_SAVED                   : constant := 286;
   MCIERR_DEVICE_TYPE_REQUIRED             : constant := 287;
   MCIERR_DEVICE_LOCKED                    : constant := 288;
   MCIERR_DUPLICATE_ALIAS                  : constant := 289;
   MCIERR_BAD_CONSTANT                     : constant := 290;
   MCIERR_MUST_USE_SHAREABLE               : constant := 291;
   MCIERR_MISSING_DEVICE_NAME              : constant := 292;
   MCIERR_BAD_TIME_FORMAT                  : constant := 293;
   MCIERR_NO_CLOSING_QUOTE                 : constant := 294;
   MCIERR_DUPLICATE_FLAGS                  : constant := 295;
   MCIERR_INVALID_FILE                     : constant := 296;
   MCIERR_NULL_PARAMETER_BLOCK             : constant := 297;
   MCIERR_UNNAMED_RESOURCE                 : constant := 298;
   MCIERR_NEW_REQUIRES_ALIAS               : constant := 299;
   MCIERR_NOTIFY_ON_AUTO_OPEN              : constant := 300;
   MCIERR_NO_ELEMENT_ALLOWED               : constant := 301;
   MCIERR_NONAPPLICABLE_FUNCTION           : constant := 302;
   MCIERR_ILLEGAL_FOR_AUTO_OPEN            : constant := 303;
   MCIERR_FILENAME_REQUIRED                : constant := 304;
   MCIERR_EXTRA_CHARACTERS                 : constant := 305;
   MCIERR_DEVICE_NOT_INSTALLED             : constant := 306;
   MCIERR_GET_CD                           : constant := 307;
   MCIERR_SET_CD                           : constant := 308;
   MCIERR_SET_DRIVE                        : constant := 309;
   MCIERR_DEVICE_LENGTH                    : constant := 310;
   MCIERR_DEVICE_ORD_LENGTH                : constant := 311;
   MCIERR_NO_INTEGER                       : constant := 312;
   MCIERR_WAVE_OUTPUTSINUSE                : constant := 320;
   MCIERR_WAVE_SETOUTPUTINUSE              : constant := 321;
   MCIERR_WAVE_INPUTSINUSE                 : constant := 322;
   MCIERR_WAVE_SETINPUTINUSE               : constant := 323;
   MCIERR_WAVE_OUTPUTUNSPECIFIED           : constant := 324;
   MCIERR_WAVE_INPUTUNSPECIFIED            : constant := 325;
   MCIERR_WAVE_OUTPUTSUNSUITABLE           : constant := 326;
   MCIERR_WAVE_SETOUTPUTUNSUITABLE         : constant := 327;
   MCIERR_WAVE_INPUTSUNSUITABLE            : constant := 328;
   MCIERR_WAVE_SETINPUTUNSUITABLE          : constant := 329;
   MCIERR_SEQ_DIV_INCOMPATIBLE             : constant := 336;
   MCIERR_SEQ_PORT_INUSE                   : constant := 337;
   MCIERR_SEQ_PORT_NONEXISTENT             : constant := 338;
   MCIERR_SEQ_PORT_MAPNODEVICE             : constant := 339;
   MCIERR_SEQ_PORT_MISCERROR               : constant := 340;
   MCIERR_SEQ_TIMER                        : constant := 341;
   MCIERR_SEQ_PORTUNSPECIFIED              : constant := 342;
   MCIERR_SEQ_NOMIDIPRESENT                : constant := 343;
   MCIERR_NO_WINDOW                        : constant := 346;
   MCIERR_CREATEWINDOW                     : constant := 347;
   MCIERR_FILE_READ                        : constant := 348;
   MCIERR_FILE_WRITE                       : constant := 349;
   MCIERR_NO_IDENTITY                      : constant := 350;
   MCIERR_CUSTOM_DRIVER_BASE               : constant := 512;
   MCI_FIRST                               : constant := 16#800#;
   MCI_OPEN                                : constant := 16#803#;
   MCI_CLOSE                               : constant := 16#804#;
   MCI_ESCAPE                              : constant := 16#805#;
   MCI_PLAY                                : constant := 16#806#;
   MCI_SEEK                                : constant := 16#807#;
   MCI_STOP                                : constant := 16#808#;
   MCI_PAUSE                               : constant := 16#809#;
   MCI_INFO                                : constant := 16#80a#;
   MCI_GETDEVCAPS                          : constant := 16#80b#;
   MCI_SPIN                                : constant := 16#80c#;
   MCI_SET                                 : constant := 16#80d#;
   MCI_STEP                                : constant := 16#80e#;
   MCI_RECORD                              : constant := 16#80f#;
   MCI_SYSINFO                             : constant := 16#810#;
   MCI_BREAK                               : constant := 16#811#;
   MCI_SOUND                               : constant := 16#812#;
   MCI_SAVE                                : constant := 16#813#;
   MCI_STATUS                              : constant := 16#814#;
   MCI_CUE                                 : constant := 16#830#;
   MCI_REALIZE                             : constant := 16#840#;
   MCI_WINDOW                              : constant := 16#841#;
   MCI_PUT                                 : constant := 16#842#;
   MCI_WHERE                               : constant := 16#843#;
   MCI_FREEZE                              : constant := 16#844#;
   MCI_UNFREEZE                            : constant := 16#845#;
   MCI_LOAD                                : constant := 16#850#;
   MCI_CUT                                 : constant := 16#851#;
   MCI_COPY                                : constant := 16#852#;
   MCI_PASTE                               : constant := 16#853#;
   MCI_UPDATE                              : constant := 16#854#;
   MCI_RESUME                              : constant := 16#855#;
   MCI_DELETE                              : constant := 16#856#;
   MCI_LAST                                : constant := 16#fff#;
   MCI_USER_MESSAGES                       : constant := 16#c00#;
   MCI_DEVTYPE_VCR                         : constant := 513;
   MCI_DEVTYPE_VIDEODISC                   : constant := 514;
   MCI_DEVTYPE_OVERLAY                     : constant := 515;
   MCI_DEVTYPE_CD_AUDIO                    : constant := 516;
   MCI_DEVTYPE_DAT                         : constant := 517;
   MCI_DEVTYPE_SCANNER                     : constant := 518;
   MCI_DEVTYPE_ANIMATION                   : constant := 519;
   MCI_DEVTYPE_DIGITAL_VIDEO               : constant := 520;
   MCI_DEVTYPE_OTHER                       : constant := 521;
   MCI_DEVTYPE_WAVEFORM_AUDIO              : constant := 522;
   MCI_DEVTYPE_SEQUENCER                   : constant := 523;
   MCI_DEVTYPE_FIRST                       : constant := 513;
   MCI_DEVTYPE_LAST                        : constant := 523;
   MCI_DEVTYPE_FIRST_USER                  : constant := 16#1000#;
   MCI_MODE_NOT_READY                      : constant := 524;
   MCI_MODE_STOP                           : constant := 525;
   MCI_MODE_PLAY                           : constant := 526;
   MCI_MODE_RECORD                         : constant := 527;
   MCI_MODE_SEEK                           : constant := 528;
   MCI_MODE_PAUSE                          : constant := 529;
   MCI_MODE_OPEN                           : constant := 530;
   MCI_FORMAT_MILLISECONDS                 : constant := 0;
   MCI_FORMAT_HMS                          : constant := 1;
   MCI_FORMAT_MSF                          : constant := 2;
   MCI_FORMAT_FRAMES                       : constant := 3;
   MCI_FORMAT_SMPTE_24                     : constant := 4;
   MCI_FORMAT_SMPTE_25                     : constant := 5;
   MCI_FORMAT_SMPTE_30                     : constant := 6;
   MCI_FORMAT_SMPTE_30DROP                 : constant := 7;
   MCI_FORMAT_BYTES                        : constant := 8;
   MCI_FORMAT_SAMPLES                      : constant := 9;
   MCI_FORMAT_TMSF                         : constant := 10;
   MCI_NOTIFY_SUCCESSFUL                   : constant := 16#1#;
   MCI_NOTIFY_SUPERSEDED                   : constant := 16#2#;
   MCI_NOTIFY_ABORTED                      : constant := 16#4#;
   MCI_NOTIFY_FAILURE                      : constant := 16#8#;
   MCI_NOTIFY                              : constant := 16#1#;
   MCI_WAIT                                : constant := 16#2#;
   MCI_FROM                                : constant := 16#4#;
   MCI_TO                                  : constant := 16#8#;
   MCI_TRACK                               : constant := 16#10#;
   MCI_OPEN_SHAREABLE                      : constant := 16#100#;
   MCI_OPEN_ELEMENT                        : constant := 16#200#;
   MCI_OPEN_ALIAS                          : constant := 16#400#;
   MCI_OPEN_ELEMENT_ID                     : constant := 16#800#;
   MCI_OPEN_TYPE_ID                        : constant := 16#1000#;
   MCI_OPEN_TYPE                           : constant := 16#2000#;
   MCI_SEEK_TO_START                       : constant := 16#100#;
   MCI_SEEK_TO_END                         : constant := 16#200#;
   MCI_STATUS_ITEM                         : constant := 16#100#;
   MCI_STATUS_START                        : constant := 16#200#;
   MCI_STATUS_LENGTH                       : constant := 16#1#;
   MCI_STATUS_POSITION                     : constant := 16#2#;
   MCI_STATUS_NUMBER_OF_TRACKS             : constant := 16#3#;
   MCI_STATUS_MODE                         : constant := 16#4#;
   MCI_STATUS_MEDIA_PRESENT                : constant := 16#5#;
   MCI_STATUS_TIME_FORMAT                  : constant := 16#6#;
   MCI_STATUS_READY                        : constant := 16#7#;
   MCI_STATUS_CURRENT_TRACK                : constant := 16#8#;
   MCI_INFO_PRODUCT                        : constant := 16#100#;
   MCI_INFO_FILE                           : constant := 16#200#;
   MCI_INFO_MEDIA_UPC                      : constant := 16#400#;
   MCI_INFO_MEDIA_IDENTITY                 : constant := 16#800#;
   MCI_GETDEVCAPS_ITEM                     : constant := 16#100#;
   MCI_GETDEVCAPS_CAN_RECORD               : constant := 16#1#;
   MCI_GETDEVCAPS_HAS_AUDIO                : constant := 16#2#;
   MCI_GETDEVCAPS_HAS_VIDEO                : constant := 16#3#;
   MCI_GETDEVCAPS_DEVICE_TYPE              : constant := 16#4#;
   MCI_GETDEVCAPS_USES_FILES               : constant := 16#5#;
   MCI_GETDEVCAPS_COMPOUND_DEVICE          : constant := 16#6#;
   MCI_GETDEVCAPS_CAN_EJECT                : constant := 16#7#;
   MCI_GETDEVCAPS_CAN_PLAY                 : constant := 16#8#;
   MCI_GETDEVCAPS_CAN_SAVE                 : constant := 16#9#;
   MCI_SYSINFO_QUANTITY                    : constant := 16#100#;
   MCI_SYSINFO_OPEN                        : constant := 16#200#;
   MCI_SYSINFO_NAME                        : constant := 16#400#;
   MCI_SYSINFO_INSTALLNAME                 : constant := 16#800#;
   MCI_SET_DOOR_OPEN                       : constant := 16#100#;
   MCI_SET_DOOR_CLOSED                     : constant := 16#200#;
   MCI_SET_TIME_FORMAT                     : constant := 16#400#;
   MCI_SET_AUDIO                           : constant := 16#800#;
   MCI_SET_VIDEO                           : constant := 16#1000#;
   MCI_SET_ON                              : constant := 16#2000#;
   MCI_SET_OFF                             : constant := 16#4000#;
   MCI_SET_AUDIO_ALL                       : constant := 16#0#;
   MCI_SET_AUDIO_LEFT                      : constant := 16#1#;
   MCI_SET_AUDIO_RIGHT                     : constant := 16#2#;
   MCI_BREAK_KEY                           : constant := 16#100#;
   MCI_BREAK_HWND                          : constant := 16#200#;
   MCI_BREAK_OFF                           : constant := 16#400#;
   MCI_RECORD_INSERT                       : constant := 16#100#;
   MCI_RECORD_OVERWRITE                    : constant := 16#200#;
   MCI_SOUND_NAME                          : constant := 16#100#;
   MCI_SAVE_FILE                           : constant := 16#100#;
   MCI_LOAD_FILE                           : constant := 16#100#;
   MCI_VD_MODE_PARK                        : constant := 1025;
   MCI_VD_MEDIA_CLV                        : constant := 1026;
   MCI_VD_MEDIA_CAV                        : constant := 1027;
   MCI_VD_MEDIA_OTHER                      : constant := 1028;
   MCI_VD_FORMAT_TRACK                     : constant := 16#4001#;
   MCI_VD_PLAY_REVERSE                     : constant := 16#10000#;
   MCI_VD_PLAY_FAST                        : constant := 16#20000#;
   MCI_VD_PLAY_SPEED                       : constant := 16#40000#;
   MCI_VD_PLAY_SCAN                        : constant := 16#80000#;
   MCI_VD_PLAY_SLOW                        : constant := 16#100000#;
   MCI_VD_SEEK_REVERSE                     : constant := 16#10000#;
   MCI_VD_STATUS_SPEED                     : constant := 16#4002#;
   MCI_VD_STATUS_FORWARD                   : constant := 16#4003#;
   MCI_VD_STATUS_MEDIA_TYPE                : constant := 16#4004#;
   MCI_VD_STATUS_SIDE                      : constant := 16#4005#;
   MCI_VD_STATUS_DISC_SIZE                 : constant := 16#4006#;
   MCI_VD_GETDEVCAPS_CLV                   : constant := 16#10000#;
   MCI_VD_GETDEVCAPS_CAV                   : constant := 16#20000#;
   MCI_VD_SPIN_UP                          : constant := 16#10000#;
   MCI_VD_SPIN_DOWN                        : constant := 16#20000#;
   MCI_VD_GETDEVCAPS_CAN_REVERSE           : constant := 16#4002#;
   MCI_VD_GETDEVCAPS_FAST_RATE             : constant := 16#4003#;
   MCI_VD_GETDEVCAPS_SLOW_RATE             : constant := 16#4004#;
   MCI_VD_GETDEVCAPS_NORMAL_RATE           : constant := 16#4005#;
   MCI_VD_STEP_FRAMES                      : constant := 16#10000#;
   MCI_VD_STEP_REVERSE                     : constant := 16#20000#;
   MCI_VD_ESCAPE_STRING                    : constant := 16#100#;
   MCI_WAVE_PCM                            : constant := 1152;
   MCI_WAVE_MAPPER                         : constant := 1153;
   MCI_WAVE_OPEN_BUFFER                    : constant := 16#10000#;
   MCI_WAVE_SET_FORMATTAG                  : constant := 16#10000#;
   MCI_WAVE_SET_CHANNELS                   : constant := 16#20000#;
   MCI_WAVE_SET_SAMPLESPERSEC              : constant := 16#40000#;
   MCI_WAVE_SET_AVGBYTESPERSEC             : constant := 16#80000#;
   MCI_WAVE_SET_BLOCKALIGN                 : constant := 16#100000#;
   MCI_WAVE_SET_BITSPERSAMPLE              : constant := 16#200000#;
   MCI_WAVE_INPUT                          : constant := 16#400000#;
   MCI_WAVE_OUTPUT                         : constant := 16#800000#;
   MCI_WAVE_STATUS_FORMATTAG               : constant := 16#4001#;
   MCI_WAVE_STATUS_CHANNELS                : constant := 16#4002#;
   MCI_WAVE_STATUS_SAMPLESPERSEC           : constant := 16#4003#;
   MCI_WAVE_STATUS_AVGBYTESPERSEC          : constant := 16#4004#;
   MCI_WAVE_STATUS_BLOCKALIGN              : constant := 16#4005#;
   MCI_WAVE_STATUS_BITSPERSAMPLE           : constant := 16#4006#;
   MCI_WAVE_STATUS_LEVEL                   : constant := 16#4007#;
   MCI_WAVE_SET_ANYINPUT                   : constant := 16#4000000#;
   MCI_WAVE_SET_ANYOUTPUT                  : constant := 16#8000000#;
   MCI_WAVE_GETDEVCAPS_INPUTS              : constant := 16#4001#;
   MCI_WAVE_GETDEVCAPS_OUTPUTS             : constant := 16#4002#;
   MCI_CDA_STATUS_TYPE_TRACK               : constant := 16#4001#;
   MCI_CDA_TRACK_AUDIO                     : constant := 1088;
   MCI_CDA_TRACK_OTHER                     : constant := 1089;
   MCI_SEQ_DIV_PPQN                        : constant := 1216;
   MCI_SEQ_DIV_SMPTE_24                    : constant := 1217;
   MCI_SEQ_DIV_SMPTE_25                    : constant := 1218;
   MCI_SEQ_DIV_SMPTE_30DROP                : constant := 1219;
   MCI_SEQ_DIV_SMPTE_30                    : constant := 1220;
   MCI_SEQ_FORMAT_SONGPTR                  : constant := 16#4001#;
   MCI_SEQ_FILE                            : constant := 16#4002#;
   MCI_SEQ_MIDI                            : constant := 16#4003#;
   MCI_SEQ_SMPTE                           : constant := 16#4004#;
   MCI_SEQ_NONE                            : constant := 65533;
   MCI_SEQ_MAPPER                          : constant := 65535;
   MCI_SEQ_STATUS_TEMPO                    : constant := 16#4002#;
   MCI_SEQ_STATUS_PORT                     : constant := 16#4003#;
   MCI_SEQ_STATUS_SLAVE                    : constant := 16#4007#;
   MCI_SEQ_STATUS_MASTER                   : constant := 16#4008#;
   MCI_SEQ_STATUS_OFFSET                   : constant := 16#4009#;
   MCI_SEQ_STATUS_DIVTYPE                  : constant := 16#400a#;
   MCI_SEQ_SET_TEMPO                       : constant := 16#10000#;
   MCI_SEQ_SET_PORT                        : constant := 16#20000#;
   MCI_SEQ_SET_SLAVE                       : constant := 16#40000#;
   MCI_SEQ_SET_MASTER                      : constant := 16#80000#;
   MCI_SEQ_SET_OFFSET                      : constant := 16#1000000#;
   MCI_ANIM_OPEN_WS                        : constant := 16#10000#;
   MCI_ANIM_OPEN_PARENT                    : constant := 16#20000#;
   MCI_ANIM_OPEN_NOSTATIC                  : constant := 16#40000#;
   MCI_ANIM_PLAY_SPEED                     : constant := 16#10000#;
   MCI_ANIM_PLAY_REVERSE                   : constant := 16#20000#;
   MCI_ANIM_PLAY_FAST                      : constant := 16#40000#;
   MCI_ANIM_PLAY_SLOW                      : constant := 16#80000#;
   MCI_ANIM_PLAY_SCAN                      : constant := 16#100000#;
   MCI_ANIM_STEP_REVERSE                   : constant := 16#10000#;
   MCI_ANIM_STEP_FRAMES                    : constant := 16#20000#;
   MCI_ANIM_STATUS_SPEED                   : constant := 16#4001#;
   MCI_ANIM_STATUS_FORWARD                 : constant := 16#4002#;
   MCI_ANIM_STATUS_HWND                    : constant := 16#4003#;
   MCI_ANIM_STATUS_HPAL                    : constant := 16#4004#;
   MCI_ANIM_STATUS_STRETCH                 : constant := 16#4005#;
   MCI_ANIM_INFO_TEXT                      : constant := 16#10000#;
   MCI_ANIM_GETDEVCAPS_CAN_REVERSE         : constant := 16#4001#;
   MCI_ANIM_GETDEVCAPS_FAST_RATE           : constant := 16#4002#;
   MCI_ANIM_GETDEVCAPS_SLOW_RATE           : constant := 16#4003#;
   MCI_ANIM_GETDEVCAPS_NORMAL_RATE         : constant := 16#4004#;
   MCI_ANIM_GETDEVCAPS_PALETTES            : constant := 16#4006#;
   MCI_ANIM_GETDEVCAPS_CAN_STRETCH         : constant := 16#4007#;
   MCI_ANIM_GETDEVCAPS_MAX_WINDOWS         : constant := 16#4008#;
   MCI_ANIM_REALIZE_NORM                   : constant := 16#10000#;
   MCI_ANIM_REALIZE_BKGD                   : constant := 16#20000#;
   MCI_ANIM_WINDOW_HWND                    : constant := 16#10000#;
   MCI_ANIM_WINDOW_STATE                   : constant := 16#40000#;
   MCI_ANIM_WINDOW_TEXT                    : constant := 16#80000#;
   MCI_ANIM_WINDOW_ENABLE_STRETCH          : constant := 16#100000#;
   MCI_ANIM_WINDOW_DISABLE_STRETCH         : constant := 16#200000#;
   MCI_ANIM_WINDOW_DEFAULT                 : constant := 16#0#;
   MCI_ANIM_RECT                           : constant := 16#10000#;
   MCI_ANIM_PUT_SOURCE                     : constant := 16#20000#;
   MCI_ANIM_PUT_DESTINATION                : constant := 16#40000#;
   MCI_ANIM_WHERE_SOURCE                   : constant := 16#20000#;
   MCI_ANIM_WHERE_DESTINATION              : constant := 16#40000#;
   MCI_ANIM_UPDATE_HDC                     : constant := 16#20000#;
   MCI_OVLY_OPEN_WS                        : constant := 16#10000#;
   MCI_OVLY_OPEN_PARENT                    : constant := 16#20000#;
   MCI_OVLY_STATUS_HWND                    : constant := 16#4001#;
   MCI_OVLY_STATUS_STRETCH                 : constant := 16#4002#;
   MCI_OVLY_INFO_TEXT                      : constant := 16#10000#;
   MCI_OVLY_GETDEVCAPS_CAN_STRETCH         : constant := 16#4001#;
   MCI_OVLY_GETDEVCAPS_CAN_FREEZE          : constant := 16#4002#;
   MCI_OVLY_GETDEVCAPS_MAX_WINDOWS         : constant := 16#4003#;
   MCI_OVLY_WINDOW_HWND                    : constant := 16#10000#;
   MCI_OVLY_WINDOW_STATE                   : constant := 16#40000#;
   MCI_OVLY_WINDOW_TEXT                    : constant := 16#80000#;
   MCI_OVLY_WINDOW_ENABLE_STRETCH          : constant := 16#100000#;
   MCI_OVLY_WINDOW_DISABLE_STRETCH         : constant := 16#200000#;
   MCI_OVLY_WINDOW_DEFAULT                 : constant := 16#0#;
   MCI_OVLY_RECT                           : constant := 16#10000#;
   MCI_OVLY_PUT_SOURCE                     : constant := 16#20000#;
   MCI_OVLY_PUT_DESTINATION                : constant := 16#40000#;
   MCI_OVLY_PUT_FRAME                      : constant := 16#80000#;
   MCI_OVLY_PUT_VIDEO                      : constant := 16#100000#;
   MCI_OVLY_WHERE_SOURCE                   : constant := 16#20000#;
   MCI_OVLY_WHERE_DESTINATION              : constant := 16#40000#;
   MCI_OVLY_WHERE_FRAME                    : constant := 16#80000#;
   MCI_OVLY_WHERE_VIDEO                    : constant := 16#100000#;
   CAPS1                                   : constant := 94;
   C1_TRANSPARENT                          : constant := 16#1#;
   NEWTRANSPARENT                          : constant := 3;
   QUERYROPSUPPORT                         : constant := 40;
   SELECTDIB                               : constant := 41;

   type MMVERSION is new Win32.UINT;
   type MMRESULT is new Win32.UINT;
   type FOURCC is new Win32.DWORD;
   type MCIERROR is new Win32.DWORD;
   type MCIDEVICEID is new Win32.UINT;

   MCI_ALL_DEVICE_ID : constant MCIDEVICEID := -1;

   type LPUINT is access all Win32.UINT;
   subtype HDRVR is Win32.Winnt.HANDLE;
   subtype HWAVE is Win32.Winnt.HANDLE;
   subtype HWAVEIN is Win32.Winnt.HANDLE;
   subtype HWAVEOUT is Win32.Winnt.HANDLE;
   type LPHWAVEIN is access all HWAVEIN;
   type LPHWAVEOUT is access all HWAVEOUT;
   subtype HMIDI is Win32.Winnt.HANDLE;
   subtype HMIDIIN is Win32.Winnt.HANDLE;
   subtype HMIDIOUT is Win32.Winnt.HANDLE;
   type LPHMIDIIN is access all HMIDIIN;
   type LPHMIDIOUT is access all HMIDIOUT;
   type LPPATCHARRAY is access all Win32.WORD;
   type LPKEYARRAY is access all Win32.WORD;
   subtype HMIXEROBJ is Win32.Winnt.HANDLE;
   type LPHMIXEROBJ is access all HMIXEROBJ;
   subtype HMIXER is Win32.Winnt.HANDLE;
   type LPHMIXER is access all HMIXER;
   subtype HPSTR is Win32.LPSTR;
   subtype HPCSTR is Win32.LPCSTR;
   subtype HMMIO is Win32.Winnt.HANDLE;

   type PATCHARRAY is
     array (Integer range 0 .. MIDIPATCHSIZE - 1) of Win32.WORD;

   type KEYARRAY is
     array (Integer range 0 .. MIDIPATCHSIZE - 1) of Win32.WORD;

   type struct_anonymous0_t;
   type struct_anonymous1_t;
   type union_anonymous2_t;
   type MMTIME;
   type DRVCONFIGINFO;
   type WAVEHDR;
   type WAVEOUTCAPSA;
   type WAVEOUTCAPSW;
   type WAVEINCAPSA;
   type WAVEINCAPSW;
   type WAVEFORMAT;
   type PCMWAVEFORMAT;
   type WAVEFORMATEX;
   type MIDIOUTCAPSA;
   type MIDIOUTCAPSW;
   type MIDIINCAPSA;
   type MIDIINCAPSW;
   type MIDIHDR;
   type AUXCAPSA;
   type AUXCAPSW;
   type MIXERCAPSA;
   type MIXERCAPSW;
   type struct_anonymous7_t;
   type MIXERLINEA;
   type struct_anonymous9_t;
   type MIXERLINEW;
   type struct_anonymous10_t;
   type struct_anonymous11_t;
   type union_anonymous13_t;
   type union_anonymous14_t;
   type MIXERCONTROLA;
   type struct_anonymous15_t;
   type struct_anonymous16_t;
   type union_anonymous17_t;
   type union_anonymous18_t;
   type MIXERCONTROLW;
   type union_anonymous19_t;
   type MIXERLINECONTROLSA;
   type union_anonymous20_t;
   type MIXERLINECONTROLSW;
   type union_anonymous21_t;
   type MIXERCONTROLDETAILS;
   type MIXERCONTROLDETAILS_LISTTEXTA;
   type MIXERCONTROLDETAILS_LISTTEXTW;
   type MIXERCONTROLDETAILS_BOOLEAN;
   type MIXERCONTROLDETAILS_SIGNED;
   type MIXERCONTROLDETAILS_UNSIGNED;
   type TIMECAPS;
   type JOYCAPSA;
   type JOYCAPSW;
   type JOYINFO;
   type MMIOINFO;
   type MMCKINFO;
   type MCI_GENERIC_PARMS;
   type MCI_OPEN_PARMSA;
   type MCI_OPEN_PARMSW;
   type MCI_PLAY_PARMS;
   type MCI_SEEK_PARMS;
   type MCI_STATUS_PARMS;
   type MCI_INFO_PARMSA;
   type MCI_INFO_PARMSW;
   type MCI_GETDEVCAPS_PARMS;
   type MCI_SYSINFO_PARMSA;
   type MCI_SYSINFO_PARMSW;
   type MCI_SET_PARMS;
   type MCI_BREAK_PARMS;
   type MCI_SOUND_PARMSA;
   type MCI_SOUND_PARMSW;
   type MCI_SAVE_PARMSA;
   type MCI_SAVE_PARMSW;
   type MCI_LOAD_PARMSA;
   type MCI_LOAD_PARMSW;
   type MCI_RECORD_PARMS;
   type MCI_VD_PLAY_PARMS;
   type MCI_VD_STEP_PARMS;
   type MCI_VD_ESCAPE_PARMSA;
   type MCI_VD_ESCAPE_PARMSW;
   type MCI_WAVE_OPEN_PARMSA;
   type MCI_WAVE_OPEN_PARMSW;
   type MCI_WAVE_DELETE_PARMS;
   type MCI_WAVE_SET_PARMS;
   type MCI_SEQ_SET_PARMS;
   type MCI_ANIM_OPEN_PARMSA;
   type MCI_ANIM_OPEN_PARMSW;
   type MCI_ANIM_PLAY_PARMS;
   type MCI_ANIM_STEP_PARMS;
   type MCI_ANIM_WINDOW_PARMSA;
   type MCI_ANIM_WINDOW_PARMSW;
   type MCI_ANIM_RECT_PARMS;
   type MCI_ANIM_UPDATE_PARMS;
   type MCI_OVLY_OPEN_PARMSA;
   type MCI_OVLY_OPEN_PARMSW;
   type MCI_OVLY_WINDOW_PARMSA;
   type MCI_OVLY_WINDOW_PARMSW;
   type MCI_OVLY_RECT_PARMS;
   type MCI_OVLY_SAVE_PARMSA;
   type MCI_OVLY_SAVE_PARMSW;
   type MCI_OVLY_LOAD_PARMSA;
   type MCI_OVLY_LOAD_PARMSW;

   type PAUXCAPSA is access all AUXCAPSA;
   subtype PAUXCAPS is PAUXCAPSA;
   subtype LPAUXCAPS is PAUXCAPSA;
   subtype LPAUXCAPSA is PAUXCAPSA;
   subtype NPAUXCAPS is PAUXCAPSA;
   subtype NPAUXCAPSA is PAUXCAPSA;

   type PAUXCAPSW is access all AUXCAPSW;
   subtype LPAUXCAPSW is PAUXCAPSW;
   subtype NPAUXCAPSW is PAUXCAPSW;

   type PDRVCONFIGINFO is access all DRVCONFIGINFO;
   subtype LPDRVCONFIGINFO is PDRVCONFIGINFO;
   subtype NPDRVCONFIGINFO is PDRVCONFIGINFO;

   type PJOYCAPSA is access all JOYCAPSA;
   subtype LPJOYCAPS is PJOYCAPSA;
   subtype LPJOYCAPSA is PJOYCAPSA;
   subtype NPJOYCAPS is PJOYCAPSA;
   subtype NPJOYCAPSA is PJOYCAPSA;
   subtype PJOYCAPS is PJOYCAPSA;

   type PJOYCAPSW is access all JOYCAPSW;
   subtype LPJOYCAPSW is PJOYCAPSW;
   subtype NPJOYCAPSW is PJOYCAPSW;

   type PJOYINFO is access all JOYINFO;
   subtype LPJOYINFO is PJOYINFO;
   subtype NPJOYINFO is PJOYINFO;

   type PMCI_ANIM_OPEN_PARMSA is access all MCI_ANIM_OPEN_PARMSA;
   subtype LPMCI_ANIM_OPEN_PARMS is PMCI_ANIM_OPEN_PARMSA;
   subtype LPMCI_ANIM_OPEN_PARMSA is PMCI_ANIM_OPEN_PARMSA;
   subtype PMCI_ANIM_OPEN_PARMS is PMCI_ANIM_OPEN_PARMSA;

   type PMCI_ANIM_OPEN_PARMSW is access all MCI_ANIM_OPEN_PARMSW;
   subtype LPMCI_ANIM_OPEN_PARMSW is PMCI_ANIM_OPEN_PARMSW;

   type PMCI_ANIM_PLAY_PARMS is access all MCI_ANIM_PLAY_PARMS;
   subtype LPMCI_ANIM_PLAY_PARMS is PMCI_ANIM_OPEN_PARMSW;

   type PMCI_ANIM_RECT_PARMS is access all MCI_ANIM_RECT_PARMS;
   subtype LPMCI_ANIM_RECT_PARMS is PMCI_ANIM_RECT_PARMS;

   type PMCI_ANIM_STEP_PARMS is access all MCI_ANIM_STEP_PARMS;
   subtype LPMCI_ANIM_STEP_PARMS is PMCI_ANIM_RECT_PARMS;

   type PMCI_ANIM_UPDATE_PARMS is access all MCI_ANIM_UPDATE_PARMS;
   subtype LPMCI_ANIM_UPDATE_PARMS is PMCI_ANIM_UPDATE_PARMS;

   type PMCI_ANIM_WINDOW_PARMSA is access all MCI_ANIM_WINDOW_PARMSA;
   subtype LPMCI_ANIM_WINDOW_PARMS is PMCI_ANIM_WINDOW_PARMSA;
   subtype LPMCI_ANIM_WINDOW_PARMSA is PMCI_ANIM_WINDOW_PARMSA;
   subtype PMCI_ANIM_WINDOW_PARMS is PMCI_ANIM_WINDOW_PARMSA;

   type PMCI_ANIM_WINDOW_PARMSW is access all MCI_ANIM_WINDOW_PARMSW;
   subtype LPMCI_ANIM_WINDOW_PARMSW is PMCI_ANIM_WINDOW_PARMSW;

   type PMCI_BREAK_PARMS is access all MCI_BREAK_PARMS;
   subtype LPMCI_BREAK_PARMS is PMCI_BREAK_PARMS;

   type PMCI_GENERIC_PARMS is access all MCI_GENERIC_PARMS;
   subtype LPMCI_GENERIC_PARMS is PMCI_GENERIC_PARMS;

   type PMCI_GETDEVCAPS_PARMS is access all MCI_GETDEVCAPS_PARMS;
   subtype LPMCI_GETDEVCAPS_PARMS is PMCI_GETDEVCAPS_PARMS;

   type PMCI_INFO_PARMSA is access all MCI_INFO_PARMSA;
   subtype LPMCI_INFO_PARMS is PMCI_INFO_PARMSA;
   subtype LPMCI_INFO_PARMSA is PMCI_INFO_PARMSA;
   subtype PMCI_INFO_PARMS is PMCI_INFO_PARMSA;

   type PMCI_INFO_PARMSW is access all MCI_INFO_PARMSW;
   subtype LPMCI_INFO_PARMSW is PMCI_INFO_PARMSW;

   type PMCI_LOAD_PARMSA is access all MCI_LOAD_PARMSA;
   subtype LPMCI_LOAD_PARMS is PMCI_LOAD_PARMSA;
   subtype LPMCI_LOAD_PARMSA is PMCI_LOAD_PARMSA;
   subtype PMCI_LOAD_PARMS is PMCI_LOAD_PARMSA;

   type PMCI_LOAD_PARMSW is access all MCI_LOAD_PARMSW;
   subtype LPMCI_LOAD_PARMSW is PMCI_LOAD_PARMSW;

   type PMCI_OPEN_PARMSA is access all MCI_OPEN_PARMSA;
   subtype LPMCI_OPEN_PARMS is PMCI_OPEN_PARMSA;
   subtype LPMCI_OPEN_PARMSA is PMCI_OPEN_PARMSA;
   subtype PMCI_OPEN_PARMS is PMCI_OPEN_PARMSA;

   type PMCI_OPEN_PARMSW is access all MCI_OPEN_PARMSW;
   subtype LPMCI_OPEN_PARMSW is PMCI_OPEN_PARMSW;

   type PMCI_OVLY_LOAD_PARMSA is access all MCI_OVLY_LOAD_PARMSA;
   subtype LPMCI_OVLY_LOAD_PARMS is PMCI_OVLY_LOAD_PARMSA;
   subtype LPMCI_OVLY_LOAD_PARMSA is PMCI_OVLY_LOAD_PARMSA;
   subtype PMCI_OVLY_LOAD_PARMS is PMCI_OVLY_LOAD_PARMSA;

   type PMCI_OVLY_LOAD_PARMSW is access all MCI_OVLY_LOAD_PARMSW;
   subtype LPMCI_OVLY_LOAD_PARMSW is PMCI_OVLY_LOAD_PARMSW;

   type PMCI_OVLY_OPEN_PARMSA is access all MCI_OVLY_OPEN_PARMSA;
   subtype LPMCI_OVLY_OPEN_PARMS is PMCI_OVLY_OPEN_PARMSA;
   subtype LPMCI_OVLY_OPEN_PARMSA is PMCI_OVLY_OPEN_PARMSA;
   subtype PMCI_OVLY_OPEN_PARMS is PMCI_OVLY_OPEN_PARMSA;

   type PMCI_OVLY_OPEN_PARMSW is access all MCI_OVLY_OPEN_PARMSW;
   subtype LPMCI_OVLY_OPEN_PARMSW is PMCI_OVLY_OPEN_PARMSW;

   type PMCI_OVLY_RECT_PARMS is access all MCI_OVLY_RECT_PARMS;
   subtype LPMCI_OVLY_RECT_PARMS is PMCI_OVLY_RECT_PARMS;

   type PMCI_OVLY_SAVE_PARMSA is access all MCI_OVLY_SAVE_PARMSA;
   subtype LPMCI_OVLY_SAVE_PARMS is PMCI_OVLY_SAVE_PARMSA;
   subtype LPMCI_OVLY_SAVE_PARMSA is PMCI_OVLY_SAVE_PARMSA;
   subtype PMCI_OVLY_SAVE_PARMS is PMCI_OVLY_SAVE_PARMSA;

   type PMCI_OVLY_SAVE_PARMSW is access all MCI_OVLY_SAVE_PARMSW;
   subtype LPMCI_OVLY_SAVE_PARMSW is PMCI_OVLY_SAVE_PARMSW;

   type PMCI_OVLY_WINDOW_PARMSA is access all MCI_OVLY_WINDOW_PARMSA;
   subtype LPMCI_OVLY_WINDOW_PARMS is PMCI_OVLY_WINDOW_PARMSA;
   subtype LPMCI_OVLY_WINDOW_PARMSA is PMCI_OVLY_WINDOW_PARMSA;
   subtype PMCI_OVLY_WINDOW_PARMS is PMCI_OVLY_WINDOW_PARMSA;

   type PMCI_OVLY_WINDOW_PARMSW is access all MCI_OVLY_WINDOW_PARMSW;
   subtype LPMCI_OVLY_WINDOW_PARMSW is PMCI_OVLY_WINDOW_PARMSW;

   type PMCI_PLAY_PARMS is access all MCI_PLAY_PARMS;
   subtype LPMCI_PLAY_PARMS is PMCI_PLAY_PARMS;

   type PMCI_RECORD_PARMS is access all MCI_RECORD_PARMS;
   subtype LPMCI_RECORD_PARMS is PMCI_RECORD_PARMS;

   type PMCI_SAVE_PARMSA is access all MCI_SAVE_PARMSA;
   subtype LPMCI_SAVE_PARMS is PMCI_SAVE_PARMSA;
   subtype LPMCI_SAVE_PARMSA is PMCI_SAVE_PARMSA;
   subtype PMCI_SAVE_PARMS is PMCI_SAVE_PARMSA;

   type PMCI_SAVE_PARMSW is access all MCI_SAVE_PARMSW;
   subtype LPMCI_SAVE_PARMSW is PMCI_SAVE_PARMSW;

   type PMCI_SEEK_PARMS is access all MCI_SEEK_PARMS;
   subtype LPMCI_SEEK_PARMS is PMCI_SEEK_PARMS;

   type PMCI_SEQ_SET_PARMS is access all MCI_SEQ_SET_PARMS;
   subtype LPMCI_SEQ_SET_PARMS is PMCI_SEQ_SET_PARMS;

   type PMCI_SET_PARMS is access all MCI_SET_PARMS;
   subtype LPMCI_SET_PARMS is PMCI_SET_PARMS;

   type PMCI_SOUND_PARMSA is access all MCI_SOUND_PARMSA;
   subtype LPMCI_SOUND_PARMS is PMCI_SOUND_PARMSA;
   subtype LPMCI_SOUND_PARMSA is PMCI_SOUND_PARMSA;
   subtype PMCI_SOUND_PARMS is PMCI_SOUND_PARMSA;

   type PMCI_SOUND_PARMSW is access all MCI_SOUND_PARMSW;
   subtype LPMCI_SOUND_PARMSW is PMCI_SOUND_PARMSW;

   type PMCI_STATUS_PARMS is access all MCI_STATUS_PARMS;
   subtype LPMCI_STATUS_PARMS is PMCI_STATUS_PARMS;

   type LPMCI_SYSINFO_PARMS is access all MCI_SYSINFO_PARMSA;
   subtype LPMCI_SYSINFO_PARMSA is LPMCI_SYSINFO_PARMS;
   subtype PMCI_SYSINFO_PARMSA is LPMCI_SYSINFO_PARMS;
   subtype PMCI_SYSINFO_PARMS is LPMCI_SYSINFO_PARMS;

   type PMCI_SYSINFO_PARMSW is access all MCI_SYSINFO_PARMSW;
   subtype LPMCI_SYSINFO_PARMSW is PMCI_SYSINFO_PARMSW;

   type PMCI_VD_ESCAPE_PARMSA is access all MCI_VD_ESCAPE_PARMSA;
   subtype LPMCI_VD_ESCAPE_PARMS is PMCI_VD_ESCAPE_PARMSA;
   subtype LPMCI_VD_ESCAPE_PARMSA is PMCI_VD_ESCAPE_PARMSA;
   subtype PMCI_VD_ESCAPE_PARMS is PMCI_VD_ESCAPE_PARMSA;

   type PMCI_VD_ESCAPE_PARMSW is access all MCI_VD_ESCAPE_PARMSW;
   subtype LPMCI_VD_ESCAPE_PARMSW is PMCI_VD_ESCAPE_PARMSW;

   type PMCI_VD_PLAY_PARMS is access all MCI_VD_PLAY_PARMS;
   subtype LPMCI_VD_PLAY_PARMS is PMCI_VD_PLAY_PARMS;

   type PMCI_VD_STEP_PARMS is access all MCI_VD_STEP_PARMS;
   subtype LPMCI_VD_STEP_PARMS is PMCI_VD_STEP_PARMS;

   type PMCI_WAVE_DELETE_PARMS is access all MCI_WAVE_DELETE_PARMS;
   subtype LPMCI_WAVE_DELETE_PARMS is PMCI_WAVE_DELETE_PARMS;

   type PMCI_WAVE_OPEN_PARMSA is access all MCI_WAVE_OPEN_PARMSA;
   subtype LPMCI_WAVE_OPEN_PARMS is PMCI_WAVE_OPEN_PARMSA;
   subtype LPMCI_WAVE_OPEN_PARMSA is PMCI_WAVE_OPEN_PARMSA;
   subtype PMCI_WAVE_OPEN_PARMS is PMCI_WAVE_OPEN_PARMSA;

   type PMCI_WAVE_OPEN_PARMSW is access all MCI_WAVE_OPEN_PARMSW;
   subtype LPMCI_WAVE_OPEN_PARMSW is PMCI_WAVE_OPEN_PARMSW;

   type PMCI_WAVE_SET_PARMS is access all MCI_WAVE_SET_PARMS;
   subtype LPMCI_WAVE_SET_PARMS is PMCI_WAVE_SET_PARMS;

   type PMIDIHDR is access all MIDIHDR;
   subtype LPMIDIHDR is PMIDIHDR;
   subtype NPMIDIHDR is PMIDIHDR;

   type PMIDIINCAPSA is access all MIDIINCAPSA;
   subtype LPMIDIINCAPS is PMIDIINCAPSA;
   subtype LPMIDIINCAPSA is PMIDIINCAPSA;
   subtype NPMIDIINCAPS is PMIDIINCAPSA;
   subtype NPMIDIINCAPSA is PMIDIINCAPSA;
   subtype PMIDIINCAPS is PMIDIINCAPSA;

   type PMIDIINCAPSW is access all MIDIINCAPSW;
   subtype LPMIDIINCAPSW is PMIDIINCAPSW;
   subtype NPMIDIINCAPSW is PMIDIINCAPSW;

   type PMIDIOUTCAPSA is access all MIDIOUTCAPSA;
   subtype LPMIDIOUTCAPS is PMIDIOUTCAPSA;
   subtype LPMIDIOUTCAPSA is PMIDIOUTCAPSA;
   subtype NPMIDIOUTCAPS is PMIDIOUTCAPSA;
   subtype NPMIDIOUTCAPSA is PMIDIOUTCAPSA;
   subtype PMIDIOUTCAPS is PMIDIOUTCAPSA;

   type PMIDIOUTCAPSW is access all MIDIOUTCAPSW;
   subtype LPMIDIOUTCAPSW is PMIDIOUTCAPSW;
   subtype NPMIDIOUTCAPSW is PMIDIOUTCAPSW;

   type PMIXERCAPSA is access all MIXERCAPSA;
   subtype LPMIXERCAPS is PMIXERCAPSA;
   subtype LPMIXERCAPSA is PMIXERCAPSA;
   subtype PMIXERCAPS is PMIXERCAPSA;

   type PMIXERCAPSW is access all MIXERCAPSW;
   subtype LPMIXERCAPSW is PMIXERCAPSW;

   type PMIXERCONTROLA is access all MIXERCONTROLA;
   subtype LPMIXERCONTROL is PMIXERCONTROLA;
   subtype LPMIXERCONTROLA is PMIXERCONTROLA;
   subtype PMIXERCONTROL is PMIXERCONTROLA;

   type PMIXERCONTROLDETAILS is access all MIXERCONTROLDETAILS;
   subtype LPMIXERCONTROLDETAILS is PMIXERCONTROLDETAILS;

   type PMIXERCONTROLDETAILS_BOOLEAN is access all MIXERCONTROLDETAILS_BOOLEAN;
   subtype LPMIXERCONTROLDETAILS_BOOLEAN is PMIXERCONTROLDETAILS_BOOLEAN;

   type PMIXERCONTROLDETAILS_LISTTEXTA is access all
     MIXERCONTROLDETAILS_LISTTEXTA;
   subtype LPMIXERCONTROLDETAILS_LISTTEXT is PMIXERCONTROLDETAILS_LISTTEXTA;
   subtype LPMIXERCONTROLDETAILS_LISTTEXTA is PMIXERCONTROLDETAILS_LISTTEXTA;
   subtype PMIXERCONTROLDETAILS_LISTTEXT is PMIXERCONTROLDETAILS_LISTTEXTA;

   type PMIXERCONTROLDETAILS_LISTTEXTW is access all
     MIXERCONTROLDETAILS_LISTTEXTW;
   subtype LPMIXERCONTROLDETAILS_LISTTEXTW is PMIXERCONTROLDETAILS_LISTTEXTW;

   type PMIXERCONTROLDETAILS_SIGNED is access all MIXERCONTROLDETAILS_SIGNED;
   subtype LPMIXERCONTROLDETAILS_SIGNED is PMIXERCONTROLDETAILS_SIGNED;

   type PMIXERCONTROLDETAILS_UNSIGNED is access all
     MIXERCONTROLDETAILS_UNSIGNED;
   subtype LPMIXERCONTROLDETAILS_UNSIGNED is PMIXERCONTROLDETAILS_UNSIGNED;

   type PMIXERCONTROLW is access all MIXERCONTROLW;
   subtype LPMIXERCONTROLW is PMIXERCONTROLW;

   type PMIXERLINEA is access all MIXERLINEA;
   subtype LPMIXERLINE is PMIXERLINEA;
   subtype LPMIXERLINEA is PMIXERLINEA;
   subtype PMIXERLINE is PMIXERLINEA;

   type PMIXERLINECONTROLSA is access all MIXERLINECONTROLSA;
   subtype LPMIXERLINECONTROLS is PMIXERLINECONTROLSA;
   subtype LPMIXERLINECONTROLSA is PMIXERLINECONTROLSA;
   subtype PMIXERLINECONTROLS is PMIXERLINECONTROLSA;

   type PMIXERLINECONTROLSW is access all MIXERLINECONTROLSW;
   subtype LPMIXERLINECONTROLSW is PMIXERLINECONTROLSA;

   type PMIXERLINEW is access all MIXERLINEW;
   subtype LPMIXERLINEW is PMIXERLINEW;

   type PMMCKINFO is access all MMCKINFO;
   type LPCMMCKINFO is access all MMCKINFO;
   subtype LPMMCKINFO is PMMCKINFO;
   subtype NPMMCKINFO is PMMCKINFO;

   type PMMIOINFO is access all MMIOINFO;
   type LPCMMIOINFO is access all MMIOINFO;
   subtype LPMMIOINFO is PMMIOINFO;
   subtype NPMMIOINFO is PMMIOINFO;

   type PMMTIME is access all MMTIME;
   subtype LPMMTIME is PMMTIME;
   subtype NPMMTIME is PMMTIME;

   type PPCMWAVEFORMAT is access all PCMWAVEFORMAT;
   subtype LPPCMWAVEFORMAT is PPCMWAVEFORMAT;
   subtype NPPCMWAVEFORMAT is PPCMWAVEFORMAT;

   type PTIMECAPS is access all TIMECAPS;
   subtype LPTIMECAPS is PTIMECAPS;
   subtype NPTIMECAPS is PTIMECAPS;

   type PWAVEFORMAT is access all WAVEFORMAT;
   type LPCWAVEFORMAT is access all WAVEFORMAT;
   subtype LPWAVEFORMAT is PWAVEFORMAT;
   subtype NPWAVEFORMAT is PWAVEFORMAT;

   type PWAVEFORMATEX is access all WAVEFORMATEX;
   type LPCWAVEFORMATEX is access all WAVEFORMATEX;
   subtype LPWAVEFORMATEX is PWAVEFORMATEX;
   subtype NPWAVEFORMATEX is PWAVEFORMATEX;

   type PWAVEHDR is access all WAVEHDR;
   subtype LPWAVEHDR is PWAVEHDR;
   subtype NPWAVEHDR is PWAVEHDR;

   type PWAVEINCAPSA is access all WAVEINCAPSA;
   subtype LPWAVEINCAPS is PWAVEINCAPSA;
   subtype LPWAVEINCAPSA is PWAVEINCAPSA;
   subtype PWAVEINCAPS is PWAVEINCAPSA;

   type PWAVEINCAPSW is access all WAVEINCAPSW;
   subtype LPWAVEINCAPSW is PWAVEINCAPSW;

   type PWAVEOUTCAPSA is access all WAVEOUTCAPSA;
   subtype LPWAVEOUTCAPS is PWAVEOUTCAPSA;
   subtype LPWAVEOUTCAPSA is PWAVEOUTCAPSA;
   subtype NPWAVEOUTCAPS is PWAVEOUTCAPSA;
   subtype NPWAVEOUTCAPSA is PWAVEOUTCAPSA;
   subtype PWAVEOUTCAPS is PWAVEOUTCAPSA;

   type PWAVEOUTCAPSW is access all WAVEOUTCAPSW;
   subtype LPWAVEOUTCAPSW is PWAVEOUTCAPSW;
   subtype NPWAVEOUTCAPSW is PWAVEOUTCAPSW;

   type struct_anonymous0_t is record
      hour  : Win32.BYTE;
      min   : Win32.BYTE;
      sec   : Win32.BYTE;
      frame : Win32.BYTE;
      fps   : Win32.BYTE;
      dummy : Win32.BYTE;
      pad   : Win32.BYTE_Array (0 .. 1);
   end record;

   type struct_anonymous1_t is record
      songptrpos : Win32.DWORD;
   end record;

   type union_anonymous2_t_kind is (
      ms_kind,
      sample_kind,
      cb_kind,
      ticks_kind,
      smpte_kind,
      midi_kind);

   type union_anonymous2_t (Which : union_anonymous2_t_kind := smpte_kind) is
      record
         case Which is
            when ms_kind =>
               ms : Win32.DWORD;
            when sample_kind =>
               sample : Win32.DWORD;
            when cb_kind =>
               cb : Win32.DWORD;
            when ticks_kind =>
               ticks : Win32.DWORD;
            when smpte_kind =>
               smpte : struct_anonymous0_t;
            when midi_kind =>
               midi : struct_anonymous1_t;
         end case;
      end record;

   pragma Convention (C, union_anonymous2_t);

   pragma Unchecked_Union (union_anonymous2_t);

   type MMTIME is record
      wType : Win32.UINT;
      u     : union_anonymous2_t;
   end record;

   type DRVCONFIGINFO is record
      dwDCISize          : Win32.DWORD;
      lpszDCISectionName : Win32.LPCWSTR;
      lpszDCIAliasName   : Win32.LPCWSTR;
   end record;

   type anonymous3_t is access procedure;
   pragma Convention (Stdcall, anonymous3_t);
   type LPDRVCALLBACK is access procedure;
   pragma Convention (Stdcall, LPDRVCALLBACK);
   type PDRVCALLBACK is access procedure;
   pragma Convention (Stdcall, PDRVCALLBACK);
   type LPWAVECALLBACK is access procedure;
   pragma Convention (Stdcall, LPWAVECALLBACK);

   type WAVEHDR is record
      lpData          : Win32.LPBYTE;
      dwBufferLength  : Win32.DWORD;
      dwBytesRecorded : Win32.DWORD;
      dwUser          : Win32.DWORD;
      dwFlags         : Win32.DWORD;
      dwLoops         : Win32.DWORD;
      lpNext          : PWAVEHDR;
      reserved        : Win32.DWORD;
   end record;

   type WAVEOUTCAPSA is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.CHAR_Array (0 .. 31);
      dwFormats      : Win32.DWORD;
      wChannels      : Win32.WORD;
      wReserved1     : Win32.WORD;
      dwSupport      : Win32.DWORD;
   end record;

   type WAVEOUTCAPSW is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);
      dwFormats      : Win32.DWORD;
      wChannels      : Win32.WORD;
      wReserved1     : Win32.WORD;
      dwSupport      : Win32.DWORD;
   end record;

   subtype WAVEOUTCAPS is WAVEOUTCAPSA;

   type WAVEINCAPSA is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.CHAR_Array (0 .. 31);
      dwFormats      : Win32.DWORD;
      wChannels      : Win32.WORD;
      wReserved1     : Win32.WORD;
   end record;

   type WAVEINCAPSW is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);
      dwFormats      : Win32.DWORD;
      wChannels      : Win32.WORD;
      wReserved1     : Win32.WORD;
   end record;

   subtype WAVEINCAPS is WAVEINCAPSA;

   type WAVEFORMAT is record
      wFormatTag      : Win32.WORD;
      nChannels       : Win32.WORD;
      nSamplesPerSec  : Win32.DWORD;
      nAvgBytesPerSec : Win32.DWORD;
      nBlockAlign     : Win32.WORD;
   end record;

   type PCMWAVEFORMAT is record
      wf             : WAVEFORMAT;
      wBitsPerSample : Win32.WORD;
   end record;

   type WAVEFORMATEX is record
      wFormatTag      : Win32.WORD;
      nChannels       : Win32.WORD;
      nSamplesPerSec  : Win32.DWORD;
      nAvgBytesPerSec : Win32.DWORD;
      nBlockAlign     : Win32.WORD;
      wBitsPerSample  : Win32.WORD;
      cbSize          : Win32.WORD;
   end record;

   type LPMIDICALLBACK is access procedure;
   pragma Convention (Stdcall, LPMIDICALLBACK);

   type MIDIOUTCAPSA is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.CHAR_Array (0 .. 31);
      wTechnology    : Win32.WORD;
      wVoices        : Win32.WORD;
      wNotes         : Win32.WORD;
      wChannelMask   : Win32.WORD;
      dwSupport      : Win32.DWORD;
   end record;

   type MIDIOUTCAPSW is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);
      wTechnology    : Win32.WORD;
      wVoices        : Win32.WORD;
      wNotes         : Win32.WORD;
      wChannelMask   : Win32.WORD;
      dwSupport      : Win32.DWORD;
   end record;

   subtype MIDIOUTCAPS is MIDIOUTCAPSA;

   type MIDIINCAPSA is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.CHAR_Array (0 .. 31);
   end record;

   type MIDIINCAPSW is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);
   end record;

   subtype MIDIINCAPS is MIDIINCAPSA;

   type MIDIHDR is record
      lpData          : Win32.LPBYTE;
      dwBufferLength  : Win32.DWORD;
      dwBytesRecorded : Win32.DWORD;
      dwUser          : Win32.DWORD;
      dwFlags         : Win32.DWORD;
      lpNext          : PMIDIHDR;
      reserved        : Win32.DWORD;
   end record;

   type AUXCAPSA is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.CHAR_Array (0 .. 31);
      wTechnology    : Win32.WORD;
      wReserved1     : Win32.WORD;
      dwSupport      : Win32.DWORD;
   end record;

   type AUXCAPSW is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);
      wTechnology    : Win32.WORD;
      wReserved1     : Win32.WORD;
      dwSupport      : Win32.DWORD;
   end record;

   subtype AUXCAPS is AUXCAPSA;

   type MIXERCAPSA is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.CHAR_Array (0 .. 31);
      fdwSupport     : Win32.DWORD;
      cDestinations  : Win32.DWORD;
   end record;

   type MIXERCAPSW is record
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);
      fdwSupport     : Win32.DWORD;
      cDestinations  : Win32.DWORD;
   end record;

   subtype MIXERCAPS is MIXERCAPSA;

   type struct_anonymous7_t is record
      dwType         : Win32.DWORD;
      dwDeviceID     : Win32.DWORD;
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.CHAR_Array (0 .. 31);
   end record;

   type MIXERLINEA is record
      cbStruct        : Win32.DWORD;
      dwDestination   : Win32.DWORD;
      dwSource        : Win32.DWORD;
      dwLineID        : Win32.DWORD;
      fdwLine         : Win32.DWORD;
      dwUser          : Win32.DWORD;
      dwComponentType : Win32.DWORD;
      cChannels       : Win32.DWORD;
      cConnections    : Win32.DWORD;
      cControls       : Win32.DWORD;
      szShortName     : Win32.CHAR_Array (0 .. MIXER_SHORT_NAME_CHARS - 1);
      szName          : Win32.CHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);
      Target          : struct_anonymous7_t;
   end record;

   type struct_anonymous9_t is record
      dwType         : Win32.DWORD;
      dwDeviceID     : Win32.DWORD;
      wMid           : Win32.WORD;
      wPid           : Win32.WORD;
      vDriverVersion : MMVERSION;
      szPname        : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);
   end record;

   type MIXERLINEW is record
      cbStruct        : Win32.DWORD;
      dwDestination   : Win32.DWORD;
      dwSource        : Win32.DWORD;
      dwLineID        : Win32.DWORD;
      fdwLine         : Win32.DWORD;
      dwUser          : Win32.DWORD;
      dwComponentType : Win32.DWORD;
      cChannels       : Win32.DWORD;
      cConnections    : Win32.DWORD;
      cControls       : Win32.DWORD;
      szShortName     : Win32.WCHAR_Array (0 .. MIXER_SHORT_NAME_CHARS - 1);
      szName          : Win32.WCHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);
      Target          : struct_anonymous9_t;
   end record;

   subtype MIXERLINE is MIXERLINEA;

   type struct_anonymous10_t is record
      lMinimum : Win32.LONG;
      lMaximum : Win32.LONG;
   end record;

   type struct_anonymous11_t is record
      dwMinimum : Win32.DWORD;
      dwMaximum : Win32.DWORD;
   end record;

   type union_anonymous13_t_kind is (LL_kind, DD_kind, dwReserved_kind);

   type union_anonymous13_t
     (Which : union_anonymous13_t_kind := dwReserved_kind)
   is
      record
         case Which is
            when LL_kind =>
               LL : struct_anonymous10_t;
            when DD_kind =>
               DD : struct_anonymous11_t;
            when dwReserved_kind =>
               dwReserved : Win32.DWORD_Array (0 .. 5);
         end case;
      end record;

   pragma Unchecked_Union (union_anonymous13_t);

   type union_anonymous14_t_kind is (
      cSteps_kind,
      cbCustomData_kind,
      dwReserved_kind);

   type union_anonymous14_t
     (Which : union_anonymous14_t_kind := dwReserved_kind)
   is
      record
         case Which is
            when cSteps_kind =>
               cSteps : Win32.DWORD;
            when cbCustomData_kind =>
               cbCustomData : Win32.DWORD;
            when dwReserved_kind =>
               dwReserved : Win32.DWORD_Array (0 .. 5);
         end case;
      end record;

   pragma Unchecked_Union (union_anonymous14_t);

   type MIXERCONTROLA is record
      cbStruct       : Win32.DWORD;
      dwControlID    : Win32.DWORD;
      dwControlType  : Win32.DWORD;
      fdwControl     : Win32.DWORD;
      cMultipleItems : Win32.DWORD;
      szShortName    : Win32.CHAR_Array (0 .. MIXER_SHORT_NAME_CHARS - 1);
      szName         : Win32.CHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);
      Bounds         : union_anonymous13_t;
      Metrics        : union_anonymous14_t;
   end record;

   type struct_anonymous15_t is record
      lMinimum : Win32.LONG;
      lMaximum : Win32.LONG;
   end record;

   type struct_anonymous16_t is record
      dwMinimum : Win32.DWORD;
      dwMaximum : Win32.DWORD;
   end record;

   type union_anonymous17_t_kind is (LL_kind, DD_kind, dwReserved_kind);

   type union_anonymous17_t
     (Which : union_anonymous17_t_kind := dwReserved_kind)
   is
      record
         case Which is
            when LL_kind =>
               LL : struct_anonymous15_t;
            when DD_kind =>
               DD : struct_anonymous16_t;
            when dwReserved_kind =>
               dwReserved : Win32.DWORD_Array (0 .. 5);
         end case;
      end record;

   pragma Unchecked_Union (union_anonymous17_t);

   type union_anonymous18_t_kind is (
      cSteps_kind,
      cbCustomData_kind,
      dwReserved_kind);

   type union_anonymous18_t
     (Which : union_anonymous18_t_kind := dwReserved_kind)
   is
      record
         case Which is
            when cSteps_kind =>
               cSteps : Win32.DWORD;
            when cbCustomData_kind =>
               cbCustomData : Win32.DWORD;
            when dwReserved_kind =>
               dwReserved : Win32.DWORD_Array (0 .. 5);
         end case;
      end record;

   pragma Unchecked_Union (union_anonymous18_t);

   type MIXERCONTROLW is record
      cbStruct       : Win32.DWORD;
      dwControlID    : Win32.DWORD;
      dwControlType  : Win32.DWORD;
      fdwControl     : Win32.DWORD;
      cMultipleItems : Win32.DWORD;
      szShortName    : Win32.WCHAR_Array (0 .. MIXER_SHORT_NAME_CHARS - 1);
      szName         : Win32.WCHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);
      Bounds         : union_anonymous17_t;
      Metrics        : union_anonymous18_t;
   end record;

   subtype MIXERCONTROL is MIXERCONTROLA;

   type union_anonymous19_t_kind is (dwControlID_kind, dwControlType_kind);

   type union_anonymous19_t
     (Which : union_anonymous19_t_kind := dwControlID_kind)
   is
      record
         case Which is
            when dwControlID_kind =>
               dwControlID : Win32.DWORD;
            when dwControlType_kind =>
               dwControlType : Win32.DWORD;
         end case;
      end record;

   pragma Convention (C, union_anonymous19_t);

   pragma Unchecked_Union (union_anonymous19_t);

   type MIXERLINECONTROLSA is record
      cbStruct  : Win32.DWORD;
      dwLineID  : Win32.DWORD;
      DW_DW     : union_anonymous19_t;
      cControls : Win32.DWORD;
      cbmxctrl  : Win32.DWORD;
      pamxctrl  : LPMIXERCONTROLA;
   end record;

   type union_anonymous20_t_kind is (dwControlID_kind, dwControlType_kind);

   type union_anonymous20_t
     (Which : union_anonymous20_t_kind := dwControlID_kind)
   is
      record
         case Which is
            when dwControlID_kind =>
               dwControlID : Win32.DWORD;
            when dwControlType_kind =>
               dwControlType : Win32.DWORD;
         end case;
      end record;

   pragma Convention (C, union_anonymous20_t);

   pragma Unchecked_Union (union_anonymous20_t);

   type MIXERLINECONTROLSW is record
      cbStruct  : Win32.DWORD;
      dwLineID  : Win32.DWORD;
      DW_DW     : union_anonymous20_t;
      cControls : Win32.DWORD;
      cbmxctrl  : Win32.DWORD;
      pamxctrl  : LPMIXERCONTROLW;
   end record;

   subtype MIXERLINECONTROLS is MIXERLINECONTROLSA;

   type union_anonymous21_t_kind is (hwndOwner_kind, cMultipleItems_kind);

   type union_anonymous21_t
     (Which : union_anonymous21_t_kind := hwndOwner_kind)
   is
      record
         case Which is
            when hwndOwner_kind =>
               hwndOwner : Win32.Windef.HWND;
            when cMultipleItems_kind =>
               cMultipleItems : Win32.DWORD;
         end case;
      end record;

   pragma Convention (C, union_anonymous21_t);

   pragma Unchecked_Union (union_anonymous21_t);

   type MIXERCONTROLDETAILS is record
      cbStruct    : Win32.DWORD;
      dwControlID : Win32.DWORD;
      cChannels   : Win32.DWORD;
      HW_DW       : union_anonymous21_t;
      cbDetails   : Win32.DWORD;
      paDetails   : Win32.LPVOID;
   end record;

   type MIXERCONTROLDETAILS_LISTTEXTA is record
      dwParam1 : Win32.DWORD;
      dwParam2 : Win32.DWORD;
      szName   : Win32.CHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);
   end record;

   type MIXERCONTROLDETAILS_LISTTEXTW is record
      dwParam1 : Win32.DWORD;
      dwParam2 : Win32.DWORD;
      szName   : Win32.WCHAR_Array (0 .. MIXER_LONG_NAME_CHARS - 1);
   end record;

   subtype MIXERCONTROLDETAILS_LISTTEXT is MIXERCONTROLDETAILS_LISTTEXTA;

   type MIXERCONTROLDETAILS_BOOLEAN is record
      fValue : Win32.LONG;
   end record;

   type MIXERCONTROLDETAILS_SIGNED is record
      lValue : Win32.LONG;
   end record;

   type MIXERCONTROLDETAILS_UNSIGNED is record
      dwValue : Win32.DWORD;
   end record;

   type LPTIMECALLBACK is access procedure;
   pragma Convention (Stdcall, LPTIMECALLBACK);

   type TIMECAPS is record
      wPeriodMin : Win32.UINT;
      wPeriodMax : Win32.UINT;
   end record;

   type JOYCAPSA is record
      wMid        : Win32.WORD;
      wPid        : Win32.WORD;
      szPname     : Win32.CHAR_Array (0 .. 31);
      wXmin       : Win32.UINT;
      wXmax       : Win32.UINT;
      wYmin       : Win32.UINT;
      wYmax       : Win32.UINT;
      wZmin       : Win32.UINT;
      wZmax       : Win32.UINT;
      wNumButtons : Win32.UINT;
      wPeriodMin  : Win32.UINT;
      wPeriodMax  : Win32.UINT;
   end record;

   type JOYCAPSW is record
      wMid        : Win32.WORD;
      wPid        : Win32.WORD;
      szPname     : Win32.WCHAR_Array (0 .. MAXPNAMELEN - 1);
      wXmin       : Win32.UINT;
      wXmax       : Win32.UINT;
      wYmin       : Win32.UINT;
      wYmax       : Win32.UINT;
      wZmin       : Win32.UINT;
      wZmax       : Win32.UINT;
      wNumButtons : Win32.UINT;
      wPeriodMin  : Win32.UINT;
      wPeriodMax  : Win32.UINT;
   end record;

   subtype JOYCAPS is JOYCAPSA;

   type JOYINFO is record
      wXpos    : Win32.UINT;
      wYpos    : Win32.UINT;
      wZpos    : Win32.UINT;
      wButtons : Win32.UINT;
   end record;

   type LPMMIOPROC is access function return Win32.LRESULT;
   pragma Convention (Stdcall, LPMMIOPROC);

   type MMIOINFO is record
      dwFlags     : Win32.DWORD;
      fccIOProc   : FOURCC;
      pIOProc     : LPMMIOPROC;
      wErrorRet   : Win32.UINT;
      htask       : Win32.Windef.HTASK;
      cchBuffer   : Win32.LONG;
      pchBuffer   : HPSTR;
      pchNext     : HPSTR;
      pchEndRead  : HPSTR;
      pchEndWrite : HPSTR;
      lBufOffset  : Win32.LONG;
      lDiskOffset : Win32.LONG;
      adwInfo     : Win32.DWORD_Array (0 .. 2);
      dwReserved1 : Win32.DWORD;
      dwReserved2 : Win32.DWORD;
      hmmio       : Win32.Mmsystem.HMMIO;
   end record;

   type MMCKINFO is record
      ckid         : FOURCC;
      cksize       : Win32.DWORD;
      fccType      : FOURCC;
      dwDataOffset : Win32.DWORD;
      dwFlags      : Win32.DWORD;
   end record;

   type YIELDPROC is access function
     (mciId       : MCIDEVICEID;
      dwYieldData : Win32.DWORD)
      return Win32.UINT;
   pragma Convention (Stdcall, YIELDPROC);

   type MCI_GENERIC_PARMS is record
      dwCallback : Win32.DWORD;
   end record;

   type MCI_OPEN_PARMSA is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : MCIDEVICEID;
      lpstrDeviceType  : Win32.LPCSTR;
      lpstrElementName : Win32.LPCSTR;
      lpstrAlias       : Win32.LPCSTR;
   end record;

   type MCI_OPEN_PARMSW is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : MCIDEVICEID;
      lpstrDeviceType  : Win32.LPCWSTR;
      lpstrElementName : Win32.LPCWSTR;
      lpstrAlias       : Win32.LPCWSTR;
   end record;

   subtype MCI_OPEN_PARMS is MCI_OPEN_PARMSA;

   type MCI_PLAY_PARMS is record
      dwCallback : Win32.DWORD;
      dwFrom     : Win32.DWORD;
      dwTo       : Win32.DWORD;
   end record;

   type MCI_SEEK_PARMS is record
      dwCallback : Win32.DWORD;
      dwTo       : Win32.DWORD;
   end record;

   type MCI_STATUS_PARMS is record
      dwCallback : Win32.DWORD;
      dwReturn   : Win32.DWORD;
      dwItem     : Win32.DWORD;
      dwTrack    : Win32.DWORD;
   end record;

   type MCI_INFO_PARMSA is record
      dwCallback  : Win32.DWORD;
      lpstrReturn : Win32.LPSTR;
      dwRetSize   : Win32.DWORD;
   end record;

   type MCI_INFO_PARMSW is record
      dwCallback  : Win32.DWORD;
      lpstrReturn : Win32.LPWSTR;
      dwRetSize   : Win32.DWORD;
   end record;

   subtype MCI_INFO_PARMS is MCI_INFO_PARMSA;

   type MCI_GETDEVCAPS_PARMS is record
      dwCallback : Win32.DWORD;
      dwReturn   : Win32.DWORD;
      dwItem     : Win32.DWORD;
   end record;

   type MCI_SYSINFO_PARMSA is record
      dwCallback  : Win32.DWORD;
      lpstrReturn : Win32.LPSTR;
      dwRetSize   : Win32.DWORD;
      dwNumber    : Win32.DWORD;
      wDeviceType : Win32.UINT;
   end record;

   type MCI_SYSINFO_PARMSW is record
      dwCallback  : Win32.DWORD;
      lpstrReturn : Win32.LPWSTR;
      dwRetSize   : Win32.DWORD;
      dwNumber    : Win32.DWORD;
      wDeviceType : Win32.UINT;
   end record;

   subtype MCI_SYSINFO_PARMS is MCI_SYSINFO_PARMSA;

   type MCI_SET_PARMS is record
      dwCallback   : Win32.DWORD;
      dwTimeFormat : Win32.DWORD;
      dwAudio      : Win32.DWORD;
   end record;

   type MCI_BREAK_PARMS is record
      dwCallback : Win32.DWORD;
      nVirtKey   : Win32.INT;
      hwndBreak  : Win32.Windef.HWND;
   end record;

   type MCI_SOUND_PARMSA is record
      dwCallback     : Win32.DWORD;
      lpstrSoundName : Win32.LPCSTR;
   end record;

   type MCI_SOUND_PARMSW is record
      dwCallback     : Win32.DWORD;
      lpstrSoundName : Win32.LPCWSTR;
   end record;

   subtype MCI_SOUND_PARMS is MCI_SOUND_PARMSA;

   type MCI_SAVE_PARMSA is record
      dwCallback : Win32.DWORD;
      lpfilename : Win32.LPCSTR;
   end record;

   type MCI_SAVE_PARMSW is record
      dwCallback : Win32.DWORD;
      lpfilename : Win32.LPCWSTR;
   end record;

   subtype MCI_SAVE_PARMS is MCI_SAVE_PARMSA;

   type MCI_LOAD_PARMSA is record
      dwCallback : Win32.DWORD;
      lpfilename : Win32.LPCSTR;
   end record;

   type MCI_LOAD_PARMSW is record
      dwCallback : Win32.DWORD;
      lpfilename : Win32.LPCWSTR;
   end record;

   subtype MCI_LOAD_PARMS is MCI_LOAD_PARMSA;

   type MCI_RECORD_PARMS is record
      dwCallback : Win32.DWORD;
      dwFrom     : Win32.DWORD;
      dwTo       : Win32.DWORD;
   end record;

   type MCI_VD_PLAY_PARMS is record
      dwCallback : Win32.DWORD;
      dwFrom     : Win32.DWORD;
      dwTo       : Win32.DWORD;
      dwSpeed    : Win32.DWORD;
   end record;

   type MCI_VD_STEP_PARMS is record
      dwCallback : Win32.DWORD;
      dwFrames   : Win32.DWORD;
   end record;

   type MCI_VD_ESCAPE_PARMSA is record
      dwCallback   : Win32.DWORD;
      lpstrCommand : Win32.LPCSTR;
   end record;

   type MCI_VD_ESCAPE_PARMSW is record
      dwCallback   : Win32.DWORD;
      lpstrCommand : Win32.LPCWSTR;
   end record;

   subtype MCI_VD_ESCAPE_PARMS is MCI_VD_ESCAPE_PARMSA;

   type MCI_WAVE_OPEN_PARMSA is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : MCIDEVICEID;
      lpstrDeviceType  : Win32.LPCSTR;
      lpstrElementName : Win32.LPCSTR;
      lpstrAlias       : Win32.LPCSTR;
      dwBufferSeconds  : Win32.DWORD;
   end record;

   type MCI_WAVE_OPEN_PARMSW is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : MCIDEVICEID;
      lpstrDeviceType  : Win32.LPCWSTR;
      lpstrElementName : Win32.LPCWSTR;
      lpstrAlias       : Win32.LPCWSTR;
      dwBufferSeconds  : Win32.DWORD;
   end record;

   subtype MCI_WAVE_OPEN_PARMS is MCI_WAVE_OPEN_PARMSA;

   type MCI_WAVE_DELETE_PARMS is record
      dwCallback : Win32.DWORD;
      dwFrom     : Win32.DWORD;
      dwTo       : Win32.DWORD;
   end record;

   type MCI_WAVE_SET_PARMS is record
      dwCallback      : Win32.DWORD;
      dwTimeFormat    : Win32.DWORD;
      dwAudio         : Win32.DWORD;
      wInput          : Win32.UINT;
      wOutput         : Win32.UINT;
      wFormatTag      : Win32.WORD;
      wReserved2      : Win32.WORD;
      nChannels       : Win32.WORD;
      wReserved3      : Win32.WORD;
      nSamplesPerSec  : Win32.DWORD;
      nAvgBytesPerSec : Win32.DWORD;
      nBlockAlign     : Win32.WORD;
      wReserved4      : Win32.WORD;
      wBitsPerSample  : Win32.WORD;
      wReserved5      : Win32.WORD;
   end record;

   type MCI_SEQ_SET_PARMS is record
      dwCallback   : Win32.DWORD;
      dwTimeFormat : Win32.DWORD;
      dwAudio      : Win32.DWORD;
      dwTempo      : Win32.DWORD;
      dwPort       : Win32.DWORD;
      dwSlave      : Win32.DWORD;
      dwMaster     : Win32.DWORD;
      dwOffset     : Win32.DWORD;
   end record;

   type MCI_ANIM_OPEN_PARMSA is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : MCIDEVICEID;
      lpstrDeviceType  : Win32.LPCSTR;
      lpstrElementName : Win32.LPCSTR;
      lpstrAlias       : Win32.LPCSTR;
      dwStyle          : Win32.DWORD;
      hWndParent       : Win32.Windef.HWND;
   end record;

   type MCI_ANIM_OPEN_PARMSW is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : MCIDEVICEID;
      lpstrDeviceType  : Win32.LPCWSTR;
      lpstrElementName : Win32.LPCWSTR;
      lpstrAlias       : Win32.LPCWSTR;
      dwStyle          : Win32.DWORD;
      hWndParent       : Win32.Windef.HWND;
   end record;

   subtype MCI_ANIM_OPEN_PARMS is MCI_ANIM_OPEN_PARMSA;

   type MCI_ANIM_PLAY_PARMS is record
      dwCallback : Win32.DWORD;
      dwFrom     : Win32.DWORD;
      dwTo       : Win32.DWORD;
      dwSpeed    : Win32.DWORD;
   end record;

   type MCI_ANIM_STEP_PARMS is record
      dwCallback : Win32.DWORD;
      dwFrames   : Win32.DWORD;
   end record;

   type MCI_ANIM_WINDOW_PARMSA is record
      dwCallback : Win32.DWORD;
      hWnd       : Win32.Windef.HWND;
      nCmdShow   : Win32.UINT;
      lpstrText  : Win32.LPCSTR;
   end record;

   type MCI_ANIM_WINDOW_PARMSW is record
      dwCallback : Win32.DWORD;
      hWnd       : Win32.Windef.HWND;
      nCmdShow   : Win32.UINT;
      lpstrText  : Win32.LPCWSTR;
   end record;

   subtype MCI_ANIM_WINDOW_PARMS is MCI_ANIM_WINDOW_PARMSA;

   type MCI_ANIM_RECT_PARMS is record
      dwCallback : Win32.DWORD;
      rc         : Win32.Windef.RECT;
   end record;

   type MCI_ANIM_UPDATE_PARMS is record
      dwCallback : Win32.DWORD;
      rc         : Win32.Windef.RECT;
      hDC        : Win32.Windef.HDC;
   end record;

   type MCI_OVLY_OPEN_PARMSA is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : MCIDEVICEID;
      lpstrDeviceType  : Win32.LPCSTR;
      lpstrElementName : Win32.LPCSTR;
      lpstrAlias       : Win32.LPCSTR;
      dwStyle          : Win32.DWORD;
      hWndParent       : Win32.Windef.HWND;
   end record;

   type MCI_OVLY_OPEN_PARMSW is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : MCIDEVICEID;
      lpstrDeviceType  : Win32.LPCWSTR;
      lpstrElementName : Win32.LPCWSTR;
      lpstrAlias       : Win32.LPCWSTR;
      dwStyle          : Win32.DWORD;
      hWndParent       : Win32.Windef.HWND;
   end record;

   subtype MCI_OVLY_OPEN_PARMS is MCI_OVLY_OPEN_PARMSA;

   type MCI_OVLY_WINDOW_PARMSA is record
      dwCallback : Win32.DWORD;
      hWnd       : Win32.Windef.HWND;
      nCmdShow   : Win32.UINT;
      lpstrText  : Win32.LPCSTR;
   end record;

   type MCI_OVLY_WINDOW_PARMSW is record
      dwCallback : Win32.DWORD;
      hWnd       : Win32.Windef.HWND;
      nCmdShow   : Win32.UINT;
      lpstrText  : Win32.LPCWSTR;
   end record;

   subtype MCI_OVLY_WINDOW_PARMS is MCI_OVLY_WINDOW_PARMSA;

   type MCI_OVLY_RECT_PARMS is record
      dwCallback : Win32.DWORD;
      rc         : Win32.Windef.RECT;
   end record;

   type MCI_OVLY_SAVE_PARMSA is record
      dwCallback : Win32.DWORD;
      lpfilename : Win32.LPCSTR;
      rc         : Win32.Windef.RECT;
   end record;

   type MCI_OVLY_SAVE_PARMSW is record
      dwCallback : Win32.DWORD;
      lpfilename : Win32.LPCWSTR;
      rc         : Win32.Windef.RECT;
   end record;

   subtype MCI_OVLY_SAVE_PARMS is MCI_OVLY_SAVE_PARMSA;

   type MCI_OVLY_LOAD_PARMSA is record
      dwCallback : Win32.DWORD;
      lpfilename : Win32.LPCSTR;
      rc         : Win32.Windef.RECT;
   end record;

   type MCI_OVLY_LOAD_PARMSW is record
      dwCallback : Win32.DWORD;
      lpfilename : Win32.LPCWSTR;
      rc         : Win32.Windef.RECT;
   end record;

   subtype MCI_OVLY_LOAD_PARMS is MCI_OVLY_LOAD_PARMSA;

   function CloseDriver
     (hDriver : HDRVR;
      lParam1 : Win32.LONG;
      lParam2 : Win32.LONG)
      return Win32.LRESULT;

   function OpenDriver
     (szDriverName  : Win32.LPCWSTR;
      szSectionName : Win32.LPCWSTR;
      lParam2       : Win32.LONG)
      return HDRVR;

   function SendDriverMessage
     (hDriver : HDRVR;
      uMsg    : Win32.UINT;
      lParam1 : Win32.LONG;
      lParam2 : Win32.LONG)
      return Win32.LRESULT;

   function DrvGetModuleHandle
     (hDriver : HDRVR)
      return Win32.Windef.HMODULE;

   function GetDriverModuleHandle
     (hDriver : HDRVR)
      return Win32.Windef.HMODULE;

   function DefDriverProc
     (dwDriverIdentifier : Win32.DWORD;
      driverID           : HDRVR;
      message            : Win32.UINT;
      lParam1            : Win32.LPARAM;
      lParam2            : Win32.LPARAM)
      return Win32.LRESULT;

   function mmsystemGetVersion return Win32.UINT;

   procedure OutputDebugStr (lpOutputString : Win32.LPCSTR) renames
     Win32.Winbase.OutputDebugString;

   function sndPlaySoundA
     (lpszSoundName : Win32.LPCSTR;
      fuSound       : Win32.UINT)
      return Win32.BOOL;

   function sndPlaySound
     (lpszSoundName : Win32.LPCSTR;
      fuSound       : Win32.UINT)
      return Win32.BOOL renames sndPlaySoundA;

   function sndPlaySoundW
     (lpszSoundName : Win32.LPCWSTR;
      fuSound       : Win32.UINT)
      return Win32.BOOL;

   function PlaySoundA
     (lpszName : Win32.LPCSTR;
      hModule  : Win32.Windef.HMODULE;
      dwFlags  : Win32.DWORD)
      return Win32.BOOL;

   function PlaySound
     (lpszName : Win32.LPCSTR;
      hModule  : Win32.Windef.HMODULE;
      dwFlags  : Win32.DWORD)
      return Win32.BOOL renames PlaySoundA;

   function PlaySoundW
     (lpszName : Win32.LPCWSTR;
      hModule  : Win32.Windef.HMODULE;
      dwFlags  : Win32.DWORD)
      return Win32.BOOL;

   function sndAlias
     (ch0  : Win32.CHAR;
      ch1  : Win32.CHAR)
      return Win32.DWORD;
   pragma Inline (sndAlias);

   function waveOutGetNumDevs return Win32.UINT;

   function waveOutGetDevCapsA
     (uDeviceID : Win32.UINT;
      lpCaps    : LPWAVEOUTCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function waveOutGetDevCaps
     (uDeviceID : Win32.UINT;
      lpCaps    : LPWAVEOUTCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT renames waveOutGetDevCapsA;

   function waveOutGetDevCapsW
     (uDeviceID : Win32.UINT;
      lpCaps    : LPWAVEOUTCAPSW;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function waveOutGetVolume
     (uDeviceID  : Win32.UINT;
      lpdwVolume : Win32.LPDWORD)
      return MMRESULT;

   function waveOutSetVolume
     (uDeviceID : Win32.UINT;
      dwVolume  : Win32.DWORD)
      return MMRESULT;

   function waveOutGetErrorTextA
     (err     : MMRESULT;
      lpText  : Win32.LPSTR;
      cchText : Win32.UINT)
      return MMRESULT;

   function waveOutGetErrorText
     (err     : MMRESULT;
      lpText  : Win32.LPSTR;
      cchText : Win32.UINT)
      return MMRESULT renames waveOutGetErrorTextA;

   function waveOutGetErrorTextW
     (err     : MMRESULT;
      lpText  : Win32.LPWSTR;
      cchText : Win32.UINT)
      return MMRESULT;

   function waveOutOpen
     (lphwo      : LPHWAVEOUT;
      uDeviceID  : Win32.UINT;
      lpFormat   : LPCWAVEFORMATEX;
      dwCallback : Win32.DWORD;
      dwInstance : Win32.DWORD;
      dwFlags    : Win32.DWORD)
      return MMRESULT;

   function waveOutClose (hwo : HWAVEOUT) return MMRESULT;

   function waveOutPrepareHeader
     (hwo  : HWAVEOUT;
      pwh  : LPWAVEHDR;
      cbwh : Win32.UINT)
      return MMRESULT;

   function waveOutUnprepareHeader
     (hwo  : HWAVEOUT;
      pwh  : LPWAVEHDR;
      cbwh : Win32.UINT)
      return MMRESULT;

   function waveOutWrite
     (hwo  : HWAVEOUT;
      pwh  : LPWAVEHDR;
      cbwh : Win32.UINT)
      return MMRESULT;

   function waveOutPause (hwo : HWAVEOUT) return MMRESULT;

   function waveOutRestart (hwo : HWAVEOUT) return MMRESULT;

   function waveOutReset (hwo : HWAVEOUT) return MMRESULT;

   function waveOutBreakLoop (hwo : HWAVEOUT) return MMRESULT;

   function waveOutGetPosition
     (hwo   : HWAVEOUT;
      lpmmt : LPMMTIME;
      cbmmt : Win32.UINT)
      return MMRESULT;

   function waveOutGetPitch
     (hwo      : HWAVEOUT;
      pdwPitch : Win32.LPDWORD)
      return MMRESULT;

   function waveOutSetPitch
     (hwo     : HWAVEOUT;
      dwPitch : Win32.DWORD)
      return MMRESULT;

   function waveOutGetPlaybackRate
     (hwo      : HWAVEOUT;
      lpdwRate : Win32.LPDWORD)
      return MMRESULT;

   function waveOutSetPlaybackRate
     (hwo    : HWAVEOUT;
      dwRate : Win32.DWORD)
      return MMRESULT;

   function waveOutGetID
     (hwo         : HWAVEOUT;
      lpuDeviceID : LPUINT)
      return MMRESULT;

   function waveOutMessage
     (hwo  : HWAVEOUT;
      uMsg : Win32.UINT;
      dw1  : Win32.DWORD;
      dw2  : Win32.DWORD)
      return MMRESULT;

   function waveInGetNumDevs return Win32.UINT;

   function waveInGetDevCapsA
     (uDeviceID : Win32.UINT;
      lpCaps    : LPWAVEINCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function waveInGetDevCaps
     (uDeviceID : Win32.UINT;
      lpCaps    : LPWAVEINCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT renames waveInGetDevCapsA;

   function waveInGetDevCapsW
     (uDeviceID : Win32.UINT;
      lpCaps    : LPWAVEINCAPSW;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function waveInGetErrorTextA
     (mmrError : MMRESULT;
      lpText   : Win32.LPSTR;
      cchText  : Win32.UINT)
      return MMRESULT;

   function waveInGetErrorText
     (mmrError : MMRESULT;
      lpText   : Win32.LPSTR;
      cchText  : Win32.UINT)
      return MMRESULT renames waveInGetErrorTextA;

   function waveInGetErrorTextW
     (mmrError : MMRESULT;
      lpText   : Win32.LPWSTR;
      cchText  : Win32.UINT)
      return MMRESULT;

   function waveInOpen
     (lphwi      : LPHWAVEIN;
      uDeviceID  : Win32.UINT;
      lpwf       : LPCWAVEFORMATEX;
      dwCallback : Win32.DWORD;
      dwInstance : Win32.DWORD;
      fdwOpen    : Win32.DWORD)
      return MMRESULT;

   function waveInClose (hwi : HWAVEIN) return MMRESULT;

   function waveInPrepareHeader
     (hwi  : HWAVEIN;
      lpwh : LPWAVEHDR;
      cbwh : Win32.UINT)
      return MMRESULT;

   function waveInUnprepareHeader
     (hwi  : HWAVEIN;
      lpwh : LPWAVEHDR;
      cbwh : Win32.UINT)
      return MMRESULT;

   function waveInAddBuffer
     (hwi  : HWAVEIN;
      lpwh : LPWAVEHDR;
      cbwh : Win32.UINT)
      return MMRESULT;

   function waveInStart (hwi : HWAVEIN) return MMRESULT;

   function waveInStop (hwi : HWAVEIN) return MMRESULT;

   function waveInReset (hwi : HWAVEIN) return MMRESULT;

   function waveInGetPosition
     (hwi   : HWAVEIN;
      lpmmt : LPMMTIME;
      cbmmt : Win32.UINT)
      return MMRESULT;

   function waveInGetID
     (hwi         : HWAVEIN;
      lpuDeviceID : LPUINT)
      return MMRESULT;

   function waveInMessage
     (hwi  : HWAVEIN;
      uMsg : Win32.UINT;
      dw1  : Win32.DWORD;
      dw2  : Win32.DWORD)
      return MMRESULT;

   function midiOutGetNumDevs return Win32.UINT;

   function midiOutGetDevCapsA
     (uDeviceID : Win32.UINT;
      lpCaps    : LPMIDIOUTCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function midiOutGetDevCaps
     (uDeviceID : Win32.UINT;
      lpCaps    : LPMIDIOUTCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT renames midiOutGetDevCapsA;

   function midiOutGetDevCapsW
     (uDeviceID : Win32.UINT;
      lpCaps    : LPMIDIOUTCAPSW;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function midiOutGetVolume
     (uId        : Win32.UINT;
      lpdwVolume : Win32.LPDWORD)
      return MMRESULT;

   function midiOutSetVolume
     (uId      : Win32.UINT;
      dwVolume : Win32.DWORD)
      return MMRESULT;

   function midiOutGetErrorTextA
     (mmrError : MMRESULT;
      lpText   : Win32.LPSTR;
      cchText  : Win32.UINT)
      return MMRESULT;

   function midiOutGetErrorText
     (mmrError : MMRESULT;
      lpText   : Win32.LPSTR;
      cchText  : Win32.UINT)
      return MMRESULT renames midiOutGetErrorTextA;

   function midiOutGetErrorTextW
     (mmrError : MMRESULT;
      lpText   : Win32.LPWSTR;
      cchText  : Win32.UINT)
      return MMRESULT;

   function midiOutOpen
     (lphmo      : LPHMIDIOUT;
      uDeviceID  : Win32.UINT;
      dwCallback : Win32.DWORD;
      dwInstance : Win32.DWORD;
      fdwOpen    : Win32.DWORD)
      return MMRESULT;

   function midiOutClose (hmo : HMIDIOUT) return MMRESULT;

   function midiOutPrepareHeader
     (hmo  : HMIDIOUT;
      lpmh : LPMIDIHDR;
      cbmh : Win32.UINT)
      return MMRESULT;

   function midiOutUnprepareHeader
     (hmo  : HMIDIOUT;
      lpmh : LPMIDIHDR;
      cbmh : Win32.UINT)
      return MMRESULT;

   function midiOutShortMsg
     (hmo   : HMIDIOUT;
      dwMsg : Win32.DWORD)
      return MMRESULT;

   function midiOutLongMsg
     (hmo  : HMIDIOUT;
      lpmh : LPMIDIHDR;
      cbmh : Win32.UINT)
      return MMRESULT;

   function midiOutReset (hmo : HMIDIOUT) return MMRESULT;

   function midiOutCachePatches
     (hmo     : HMIDIOUT;
      uBank   : Win32.UINT;
      lpwpa   : Win32.LPWORD;
      fuCache : Win32.UINT)
      return MMRESULT;

   function midiOutCacheDrumPatches
     (hmo     : HMIDIOUT;
      uPatch  : Win32.UINT;
      lpwkya  : Win32.LPWORD;
      fuCache : Win32.UINT)
      return MMRESULT;

   function midiOutGetID
     (hmo         : HMIDIOUT;
      lpuDeviceID : LPUINT)
      return MMRESULT;

   function midiOutMessage
     (hmo  : HMIDIOUT;
      uMsg : Win32.UINT;
      dw1  : Win32.DWORD;
      dw2  : Win32.DWORD)
      return MMRESULT;

   function midiInGetNumDevs return Win32.UINT;

   function midiInGetDevCapsA
     (uDeviceID : Win32.UINT;
      lpCaps    : LPMIDIINCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function midiInGetDevCaps
     (uDeviceID : Win32.UINT;
      lpCaps    : LPMIDIINCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT renames midiInGetDevCapsA;

   function midiInGetDevCapsW
     (uDeviceID : Win32.UINT;
      lpCaps    : LPMIDIINCAPSW;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function midiInGetErrorTextA
     (err     : MMRESULT;
      lpText  : Win32.LPSTR;
      cchText : Win32.UINT)
      return MMRESULT;

   function midiInGetErrorText
     (err     : MMRESULT;
      lpText  : Win32.LPSTR;
      cchText : Win32.UINT)
      return MMRESULT renames midiInGetErrorTextA;

   function midiInGetErrorTextW
     (err     : MMRESULT;
      lpText  : Win32.LPWSTR;
      cchText : Win32.UINT)
      return MMRESULT;

   function midiInOpen
     (lphmi      : LPHMIDIIN;
      uDeviceID  : Win32.UINT;
      dwCallback : Win32.DWORD;
      dwInstance : Win32.DWORD;
      fdwOpen    : Win32.DWORD)
      return MMRESULT;

   function midiInClose (hmi : HMIDIIN) return MMRESULT;

   function midiInPrepareHeader
     (hmi  : HMIDIIN;
      lpmh : LPMIDIHDR;
      cbmh : Win32.UINT)
      return MMRESULT;

   function midiInUnprepareHeader
     (hmi  : HMIDIIN;
      lpmh : LPMIDIHDR;
      cbmh : Win32.UINT)
      return MMRESULT;

   function midiInAddBuffer
     (hmi  : HMIDIIN;
      lpmh : LPMIDIHDR;
      cbmh : Win32.UINT)
      return MMRESULT;

   function midiInStart (hmi : HMIDIIN) return MMRESULT;

   function midiInStop (hmi : HMIDIIN) return MMRESULT;

   function midiInReset (hmi : HMIDIIN) return MMRESULT;

   function midiInGetID
     (hmi         : HMIDIIN;
      lpuDeviceID : LPUINT)
      return MMRESULT;

   function midiInMessage
     (hmi  : HMIDIIN;
      uMsg : Win32.UINT;
      dw1  : Win32.DWORD;
      dw2  : Win32.DWORD)
      return MMRESULT;

   function auxGetNumDevs return Win32.UINT;

   function auxGetDevCapsA
     (uDeviceID : Win32.UINT;
      lpCaps    : LPAUXCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function auxGetDevCaps
     (uDeviceID : Win32.UINT;
      lpCaps    : LPAUXCAPSA;
      cbCaps    : Win32.UINT)
      return MMRESULT renames auxGetDevCapsA;

   function auxGetDevCapsW
     (uDeviceID : Win32.UINT;
      lpCaps    : LPAUXCAPSW;
      cbCaps    : Win32.UINT)
      return MMRESULT;

   function auxSetVolume
     (uDeviceID : Win32.UINT;
      dwVolume  : Win32.DWORD)
      return MMRESULT;

   function auxGetVolume
     (uDeviceID  : Win32.UINT;
      lpdwVolume : Win32.LPDWORD)
      return MMRESULT;

   function auxOutMessage
     (uDeviceID : Win32.UINT;
      uMsg      : Win32.UINT;
      dw1       : Win32.DWORD;
      dw2       : Win32.DWORD)
      return MMRESULT;

   function mixerGetNumDevs return Win32.UINT;

   function mixerGetDevCapsA
     (uMxId    : Win32.UINT;
      pmxcaps  : LPMIXERCAPSA;
      cbmxcaps : Win32.UINT)
      return MMRESULT;

   function mixerGetDevCaps
     (uMxId    : Win32.UINT;
      pmxcaps  : LPMIXERCAPSA;
      cbmxcaps : Win32.UINT)
      return MMRESULT renames mixerGetDevCapsA;

   function mixerGetDevCapsW
     (uMxId    : Win32.UINT;
      pmxcaps  : LPMIXERCAPSW;
      cbmxcaps : Win32.UINT)
      return MMRESULT;

   function mixerGetID
     (hmxobj : HMIXEROBJ;
      puMxId : access Win32.UINT;
      fdwId  : Win32.DWORD)
      return MMRESULT;

   function mixerOpen
     (phmx       : LPHMIXER;
      uMxId      : Win32.UINT;
      dwCallback : Win32.DWORD;
      dwInstance : Win32.DWORD;
      fdwOpen    : Win32.DWORD)
      return MMRESULT;

   function mixerClose (hmx : HMIXER) return MMRESULT;

   function mixerMessage
     (hmx      : HMIXER;
      uMsg     : Win32.UINT;
      dwParam1 : Win32.DWORD;
      dwParam2 : Win32.DWORD)
      return Win32.DWORD;

   function mixerGetLineInfoA
     (hmxobj  : HMIXEROBJ;
      pmxl    : LPMIXERLINEA;
      fdwInfo : Win32.DWORD)
      return MMRESULT;

   function mixerGetLineInfo
     (hmxobj  : HMIXEROBJ;
      pmxl    : LPMIXERLINEA;
      fdwInfo : Win32.DWORD)
      return MMRESULT renames mixerGetLineInfoA;

   function mixerGetLineInfoW
     (hmxobj  : HMIXEROBJ;
      pmxl    : LPMIXERLINEW;
      fdwInfo : Win32.DWORD)
      return MMRESULT;

   function mixerGetLineControlsA
     (hmxobj      : HMIXEROBJ;
      pmxlc       : LPMIXERLINECONTROLSA;
      fdwControls : Win32.DWORD)
      return MMRESULT;

   function mixerGetLineControls
     (hmxobj      : HMIXEROBJ;
      pmxlc       : LPMIXERLINECONTROLSA;
      fdwControls : Win32.DWORD)
      return MMRESULT renames mixerGetLineControlsA;

   function mixerGetLineControlsW
     (hmxobj      : HMIXEROBJ;
      pmxlc       : LPMIXERLINECONTROLSW;
      fdwControls : Win32.DWORD)
      return MMRESULT;

   function mixerGetControlDetailsA
     (hmxobj     : HMIXEROBJ;
      pmxcd      : LPMIXERCONTROLDETAILS;
      fdwDetails : Win32.DWORD)
      return MMRESULT;

   function mixerGetControlDetails
     (hmxobj     : HMIXEROBJ;
      pmxcd      : LPMIXERCONTROLDETAILS;
      fdwDetails : Win32.DWORD)
      return MMRESULT renames mixerGetControlDetailsA;

   function mixerGetControlDetailsW
     (hmxobj     : HMIXEROBJ;
      pmxcd      : LPMIXERCONTROLDETAILS;
      fdwDetails : Win32.DWORD)
      return MMRESULT;

   function mixerSetControlDetails
     (hmxobj     : HMIXEROBJ;
      pmxcd      : LPMIXERCONTROLDETAILS;
      fdwDetails : Win32.DWORD)
      return MMRESULT;

   function timeGetSystemTime
     (lpmmt : LPMMTIME;
      cbmmt : Win32.UINT)
      return MMRESULT;

   function timeGetTime return Win32.DWORD;

   function timeSetEvent
     (uDelay      : Win32.UINT;
      uResolution : Win32.UINT;
      lpFunction  : LPTIMECALLBACK;
      dwUser      : Win32.DWORD;
      uFlags      : Win32.UINT)
      return Win32.UINT;

   function timeKillEvent (uTimerID : Win32.UINT) return MMRESULT;

   function timeGetDevCaps
     (lptc : LPTIMECAPS;
      cbtc : Win32.UINT)
      return MMRESULT;

   function timeBeginPeriod (uPeriod : Win32.UINT) return MMRESULT;

   function timeEndPeriod (uPeriod : Win32.UINT) return MMRESULT;

   function joyGetNumDevs return Win32.UINT;

   function joyGetDevCapsA
     (uJoyId : Win32.UINT;
      lpjc   : LPJOYCAPSA;
      cbjc   : Win32.UINT)
      return MMRESULT;

   function joyGetDevCaps
     (uJoyId : Win32.UINT;
      lpjc   : LPJOYCAPSA;
      cbjc   : Win32.UINT)
      return MMRESULT renames joyGetDevCapsA;

   function joyGetDevCapsW
     (uJoyId : Win32.UINT;
      lpjc   : LPJOYCAPSW;
      cbjc   : Win32.UINT)
      return MMRESULT;

   function joyGetPos
     (uJoyID : Win32.UINT;
      lpji   : LPJOYINFO)
      return MMRESULT;

   function joyGetThreshold
     (uJoyID       : Win32.UINT;
      lpuThreshold : LPUINT)
      return MMRESULT;

   function joyReleaseCapture (uJoyID : Win32.UINT) return MMRESULT;

   function joySetCapture
     (hwnd     : Win32.Windef.HWND;
      uJoyID   : Win32.UINT;
      uPeriod  : Win32.UINT;
      fChanged : Win32.BOOL)
      return MMRESULT;

   function joySetThreshold
     (uJoyID     : Win32.UINT;
      uThreshold : Win32.UINT)
      return MMRESULT;

   function mmioFOURCC
     (ch0  : Win32.CHAR;
      ch1  : Win32.CHAR;
      ch2  : Win32.CHAR;
      ch3  : Win32.CHAR)
      return FOURCC;
   pragma Inline (mmioFOURCC);

   function mmioStringToFOURCCA
     (sz     : Win32.LPCSTR;
      uFlags : Win32.UINT)
      return FOURCC;

   function mmioStringToFOURCC
     (sz     : Win32.LPCSTR;
      uFlags : Win32.UINT)
      return FOURCC renames mmioStringToFOURCCA;

   function mmioStringToFOURCCW
     (sz     : Win32.LPCWSTR;
      uFlags : Win32.UINT)
      return FOURCC;

   function mmioInstallIOProcA
     (fccIOProc : FOURCC;
      pIOProc   : LPMMIOPROC;
      dwFlags   : Win32.DWORD)
      return LPMMIOPROC;

   function mmioInstallIOProc
     (fccIOProc : FOURCC;
      pIOProc   : LPMMIOPROC;
      dwFlags   : Win32.DWORD)
      return LPMMIOPROC renames mmioInstallIOProcA;

   function mmioInstallIOProcW
     (fccIOProc : FOURCC;
      pIOProc   : LPMMIOPROC;
      dwFlags   : Win32.DWORD)
      return LPMMIOPROC;

   function mmioOpenA
     (szFileName : Win32.LPSTR;
      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;
      fdwOpen    : Win32.DWORD)
      return HMMIO;

   function mmioOpen
     (szFileName : Win32.LPSTR;
      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;
      fdwOpen    : Win32.DWORD)
      return HMMIO renames mmioOpenA;

   function mmioOpenW
     (szFileName : Win32.LPWSTR;
      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;
      fdwOpen    : Win32.DWORD)
      return HMMIO;

   function mmioRenameA
     (szFileName    : Win32.LPCSTR;
      szNewFileName : Win32.LPCSTR;
      lpmmioinfo    : LPCMMIOINFO;
      fdwRename     : Win32.DWORD)
      return MMRESULT;

   function mmioRename
     (szFileName    : Win32.LPCSTR;
      szNewFileName : Win32.LPCSTR;
      lpmmioinfo    : LPCMMIOINFO;
      fdwRename     : Win32.DWORD)
      return MMRESULT renames mmioRenameA;

   function mmioRenameW
     (szFileName    : Win32.LPCWSTR;
      szNewFileName : Win32.LPCWSTR;
      lpmmioinfo    : LPCMMIOINFO;
      fdwRename     : Win32.DWORD)
      return MMRESULT;

   function mmioClose
     (hmmio   : Win32.Mmsystem.HMMIO;
      fuClose : Win32.UINT)
      return MMRESULT;

   function mmioRead
     (hmmio : Win32.Mmsystem.HMMIO;
      pch   : HPSTR;
      cch   : Win32.LONG)
      return Win32.LRESULT;

   function mmioWrite
     (hmmio : Win32.Mmsystem.HMMIO;
      pch   : HPCSTR;
      cch   : Win32.LONG)
      return Win32.LRESULT;

   function mmioSeek
     (hmmio   : Win32.Mmsystem.HMMIO;
      lOffset : Win32.LONG;
      iOrigin : Win32.INT)
      return Win32.LRESULT;

   function mmioGetInfo
     (hmmio      : Win32.Mmsystem.HMMIO;
      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;
      fuInfo     : Win32.UINT)
      return MMRESULT;

   function mmioSetInfo
     (hmmio      : Win32.Mmsystem.HMMIO;
      lpmmioinfo : LPCMMIOINFO;
      fuInfo     : Win32.UINT)
      return MMRESULT;

   function mmioSetBuffer
     (hmmio     : Win32.Mmsystem.HMMIO;
      pchBuffer : Win32.LPSTR;
      cchBuffer : Win32.LONG;
      fuBuffer  : Win32.UINT)
      return MMRESULT;

   function mmioFlush
     (hmmio   : Win32.Mmsystem.HMMIO;
      fuFlush : Win32.UINT)
      return MMRESULT;

   function mmioAdvance
     (hmmio      : Win32.Mmsystem.HMMIO;
      lpmmioinfo : Win32.Mmsystem.LPMMIOINFO;
      fuAdvance  : Win32.UINT)
      return MMRESULT;

   function mmioSendMessage
     (hmmio   : Win32.Mmsystem.HMMIO;
      uMsg    : Win32.UINT;
      lParam1 : Win32.LPARAM;
      lParam2 : Win32.LPARAM)
      return Win32.LRESULT;

   function mmioDescend
     (hmmio         : Win32.Mmsystem.HMMIO;
      lpmmcki       : LPMMCKINFO;
      lpmmckiParent : LPCMMCKINFO;
      fuDescend     : Win32.UINT)
      return MMRESULT;

   function mmioAscend
     (hmmio    : Win32.Mmsystem.HMMIO;
      lpmmcki  : LPMMCKINFO;
      fuAscend : Win32.UINT)
      return MMRESULT;

   function mmioCreateChunk
     (hmmio    : Win32.Mmsystem.HMMIO;
      lpmmcki  : LPMMCKINFO;
      fuCreate : Win32.UINT)
      return MMRESULT;

   function mciSendCommandA
     (mciId    : MCIDEVICEID;
      uMessage : Win32.UINT;
      dwParam1 : Win32.DWORD;
      dwParam2 : Win32.DWORD)
      return MCIERROR;

   function mciSendCommand
     (mciId    : MCIDEVICEID;
      uMessage : Win32.UINT;
      dwParam1 : Win32.DWORD;
      dwParam2 : Win32.DWORD)
      return MCIERROR renames mciSendCommandA;

   function mciSendCommandW
     (mciId    : MCIDEVICEID;
      uMessage : Win32.UINT;
      dwParam1 : Win32.DWORD;
      dwParam2 : Win32.DWORD)
      return MCIERROR;

   function mciSendStringA
     (lpstrCommand      : Win32.LPCSTR;
      lpstrReturnString : Win32.LPSTR;
      uReturnLength     : Win32.UINT;
      hwndCallback      : Win32.Windef.HWND)
      return MCIERROR;

   function mciSendString
     (lpstrCommand      : Win32.LPCSTR;
      lpstrReturnString : Win32.LPSTR;
      uReturnLength     : Win32.UINT;
      hwndCallback      : Win32.Windef.HWND)
      return MCIERROR renames mciSendStringA;

   function mciSendStringW
     (lpstrCommand      : Win32.LPCWSTR;
      lpstrReturnString : Win32.LPWSTR;
      uReturnLength     : Win32.UINT;
      hwndCallback      : Win32.Windef.HWND)
      return MCIERROR;

   function mciGetDeviceIDA (lpstrName : Win32.LPCSTR) return MCIDEVICEID;

   function mciGetDeviceID (lpstrName : Win32.LPCSTR) return MCIDEVICEID
      renames mciGetDeviceIDA;

   function mciGetDeviceIDW (lpstrName : Win32.LPCWSTR) return MCIDEVICEID;

   function mciGetDeviceIDFromElementIDA
     (dwElementID : Win32.DWORD;
      lpstrType   : Win32.LPCSTR)
      return MCIDEVICEID;

   function mciGetDeviceIDFromElementID
     (dwElementID : Win32.DWORD;
      lpstrType   : Win32.LPCSTR)
      return MCIDEVICEID renames mciGetDeviceIDFromElementIDA;

   function mciGetDeviceIDFromElementIDW
     (dwElementID : Win32.DWORD;
      lpstrType   : Win32.LPCWSTR)
      return MCIDEVICEID;

   function mciGetErrorStringA
     (mcierr      : MCIERROR;
      lpstrBuffer : Win32.LPSTR;
      cchText     : Win32.UINT)
      return Win32.BOOL;

   function mciGetErrorString
     (mcierr      : MCIERROR;
      lpstrBuffer : Win32.LPSTR;
      cchText     : Win32.UINT)
      return Win32.BOOL renames mciGetErrorStringA;

   function mciGetErrorStringW
     (mcierr      : MCIERROR;
      lpstrBuffer : Win32.LPWSTR;
      cchText     : Win32.UINT)
      return Win32.BOOL;

   function mciSetYieldProc
     (mciId       : MCIDEVICEID;
      fpYieldProc : YIELDPROC;
      dwYieldData : Win32.DWORD)
      return Win32.BOOL;

   function mciGetCreatorTask
     (mciId : MCIDEVICEID)
      return Win32.Winnt.HANDLE;

   function mciGetYieldProc
     (mciId        : MCIDEVICEID;
      pdwYieldData : Win32.LPDWORD)
      return YIELDPROC;

   function MCI_MSF_MINUTE (dwMSF : Win32.DWORD) return Win32.BYTE;

   function MCI_MSF_SECOND (dwMSF : Win32.DWORD) return Win32.BYTE;

   function MCI_MSF_FRAME (dwMSF : Win32.DWORD) return Win32.BYTE;
   function MCI_MAKE_MSF
     (minutes : Win32.BYTE;
      seconds : Win32.BYTE;
      frames  : Win32.BYTE)
      return Win32.DWORD;

   function MCI_TMSF_TRACK (dwTMSF : Win32.DWORD) return Win32.BYTE;
   function MCI_TMSF_MINUTE (dwTMSF : Win32.DWORD) return Win32.BYTE;
   function MCI_TMSF_SECOND (dwTMSF : Win32.DWORD) return Win32.BYTE;
   function MCI_TMSF_FRAME (dwTMSF : Win32.DWORD) return Win32.BYTE;
   function MCI_MAKE_TMSF
     (tracks  : Win32.BYTE;
      minutes : Win32.BYTE;
      seconds : Win32.BYTE;
      frames  : Win32.BYTE)
      return Win32.DWORD;

   function MCI_HMS_HOUR (dwHMS : Win32.DWORD) return Win32.BYTE;

   function MCI_HMS_MINUTE (dwHMS : Win32.DWORD) return Win32.BYTE;

   function MCI_HMS_SECOND (dwHMS : Win32.DWORD) return Win32.BYTE;

   function MCI_MAKE_HMS
     (hours   : Win32.BYTE;
      minutes : Win32.BYTE;
      seconds : Win32.BYTE)
      return Win32.DWORD;

   function DIBINDEX (n : Win32.WORD) return Win32.DWORD;

private

   pragma Convention (C, struct_anonymous0_t);
   pragma Convention (C, struct_anonymous1_t);
   pragma Convention (C, MMTIME);
   pragma Convention (C, DRVCONFIGINFO);
   pragma Convention (C, WAVEHDR);
   pragma Convention (C, WAVEOUTCAPSA);
   pragma Convention (C, WAVEOUTCAPSW);
   pragma Convention (C, WAVEINCAPSA);
   pragma Convention (C, WAVEINCAPSW);
   pragma Convention (C, WAVEFORMAT);
   pragma Convention (C, PCMWAVEFORMAT);
   pragma Convention (C, WAVEFORMATEX);
   pragma Convention (C, MIDIOUTCAPSA);
   pragma Convention (C, MIDIOUTCAPSW);
   pragma Convention (C, MIDIINCAPSA);
   pragma Convention (C, MIDIINCAPSW);
   pragma Convention (C, MIDIHDR);
   pragma Convention (C, AUXCAPSA);
   pragma Convention (C, AUXCAPSW);
   pragma Convention (C, MIXERCAPSA);
   pragma Convention (C, MIXERCAPSW);
   pragma Convention (C, struct_anonymous7_t);
   pragma Convention (C, MIXERLINEA);
   pragma Convention (C, struct_anonymous9_t);
   pragma Convention (C, MIXERLINEW);
   pragma Convention (C, struct_anonymous10_t);
   pragma Convention (C, struct_anonymous11_t);
   pragma Convention (C, MIXERCONTROLA);
   pragma Convention (C, struct_anonymous15_t);
   pragma Convention (C, struct_anonymous16_t);
   pragma Convention (C, MIXERCONTROLW);
   pragma Convention (C, MIXERLINECONTROLSA);
   pragma Convention (C, MIXERLINECONTROLSW);
   pragma Convention (C, MIXERCONTROLDETAILS);
   pragma Convention (C, MIXERCONTROLDETAILS_LISTTEXTA);
   pragma Convention (C, MIXERCONTROLDETAILS_LISTTEXTW);
   pragma Convention (C, MIXERCONTROLDETAILS_BOOLEAN);
   pragma Convention (C, MIXERCONTROLDETAILS_SIGNED);
   pragma Convention (C, MIXERCONTROLDETAILS_UNSIGNED);
   pragma Convention (C, TIMECAPS);
   pragma Convention (C, JOYCAPSA);
   pragma Convention (C, JOYCAPSW);
   pragma Convention (C, JOYINFO);
   pragma Convention (C, MMIOINFO);
   pragma Convention (C, MMCKINFO);
   pragma Convention (C, MCI_GENERIC_PARMS);
   pragma Convention (C, MCI_OPEN_PARMSA);
   pragma Convention (C, MCI_OPEN_PARMSW);
   pragma Convention (C, MCI_PLAY_PARMS);
   pragma Convention (C, MCI_SEEK_PARMS);
   pragma Convention (C, MCI_STATUS_PARMS);
   pragma Convention (C, MCI_INFO_PARMSA);
   pragma Convention (C, MCI_INFO_PARMSW);
   pragma Convention (C, MCI_GETDEVCAPS_PARMS);
   pragma Convention (C, MCI_SYSINFO_PARMSA);
   pragma Convention (C, MCI_SYSINFO_PARMSW);
   pragma Convention (C, MCI_SET_PARMS);
   pragma Convention (C, MCI_BREAK_PARMS);
   pragma Convention (C, MCI_SOUND_PARMSA);
   pragma Convention (C, MCI_SOUND_PARMSW);
   pragma Convention (C, MCI_SAVE_PARMSA);
   pragma Convention (C, MCI_SAVE_PARMSW);
   pragma Convention (C, MCI_LOAD_PARMSA);
   pragma Convention (C, MCI_LOAD_PARMSW);
   pragma Convention (C, MCI_RECORD_PARMS);
   pragma Convention (C, MCI_VD_PLAY_PARMS);
   pragma Convention (C, MCI_VD_STEP_PARMS);
   pragma Convention (C, MCI_VD_ESCAPE_PARMSA);
   pragma Convention (C, MCI_VD_ESCAPE_PARMSW);
   pragma Convention (C, MCI_WAVE_OPEN_PARMSA);
   pragma Convention (C, MCI_WAVE_OPEN_PARMSW);
   pragma Convention (C, MCI_WAVE_DELETE_PARMS);
   pragma Convention (C, MCI_WAVE_SET_PARMS);
   pragma Convention (C, MCI_SEQ_SET_PARMS);
   pragma Convention (C, MCI_ANIM_OPEN_PARMSA);
   pragma Convention (C, MCI_ANIM_OPEN_PARMSW);
   pragma Convention (C, MCI_ANIM_PLAY_PARMS);
   pragma Convention (C, MCI_ANIM_STEP_PARMS);
   pragma Convention (C, MCI_ANIM_WINDOW_PARMSA);
   pragma Convention (C, MCI_ANIM_WINDOW_PARMSW);
   pragma Convention (C, MCI_ANIM_RECT_PARMS);
   pragma Convention (C, MCI_ANIM_UPDATE_PARMS);
   pragma Convention (C, MCI_OVLY_OPEN_PARMSA);
   pragma Convention (C, MCI_OVLY_OPEN_PARMSW);
   pragma Convention (C, MCI_OVLY_WINDOW_PARMSA);
   pragma Convention (C, MCI_OVLY_WINDOW_PARMSW);
   pragma Convention (C, MCI_OVLY_RECT_PARMS);
   pragma Convention (C, MCI_OVLY_SAVE_PARMSA);
   pragma Convention (C, MCI_OVLY_SAVE_PARMSW);
   pragma Convention (C, MCI_OVLY_LOAD_PARMSA);
   pragma Convention (C, MCI_OVLY_LOAD_PARMSW);

   pragma Import (Stdcall, CloseDriver, "CloseDriver");
   pragma Import (Stdcall, OpenDriver, "OpenDriver");
   pragma Import (Stdcall, SendDriverMessage, "SendDriverMessage");
   pragma Import (Stdcall, DrvGetModuleHandle, "DrvGetModuleHandle");
   pragma Import (Stdcall, GetDriverModuleHandle, "GetDriverModuleHandle");
   pragma Import (Stdcall, DefDriverProc, "DefDriverProc");
   pragma Import (Stdcall, mmsystemGetVersion, "mmsystemGetVersion");
   pragma Import (Stdcall, sndPlaySoundA, "sndPlaySoundA");
   pragma Import (Stdcall, sndPlaySoundW, "sndPlaySoundW");
   pragma Import (Stdcall, PlaySoundA, "PlaySoundA");
   pragma Import (Stdcall, PlaySoundW, "PlaySoundW");
   pragma Import (Stdcall, waveOutGetNumDevs, "waveOutGetNumDevs");
   pragma Import (Stdcall, waveOutGetDevCapsA, "waveOutGetDevCapsA");
   pragma Import (Stdcall, waveOutGetDevCapsW, "waveOutGetDevCapsW");
   pragma Import (Stdcall, waveOutGetVolume, "waveOutGetVolume");
   pragma Import (Stdcall, waveOutSetVolume, "waveOutSetVolume");
   pragma Import (Stdcall, waveOutGetErrorTextA, "waveOutGetErrorTextA");
   pragma Import (Stdcall, waveOutGetErrorTextW, "waveOutGetErrorTextW");
   pragma Import (Stdcall, waveOutOpen, "waveOutOpen");
   pragma Import (Stdcall, waveOutClose, "waveOutClose");
   pragma Import (Stdcall, waveOutPrepareHeader, "waveOutPrepareHeader");
   pragma Import (Stdcall, waveOutUnprepareHeader, "waveOutUnprepareHeader");
   pragma Import (Stdcall, waveOutWrite, "waveOutWrite");
   pragma Import (Stdcall, waveOutPause, "waveOutPause");
   pragma Import (Stdcall, waveOutRestart, "waveOutRestart");
   pragma Import (Stdcall, waveOutReset, "waveOutReset");
   pragma Import (Stdcall, waveOutBreakLoop, "waveOutBreakLoop");
   pragma Import (Stdcall, waveOutGetPosition, "waveOutGetPosition");
   pragma Import (Stdcall, waveOutGetPitch, "waveOutGetPitch");
   pragma Import (Stdcall, waveOutSetPitch, "waveOutSetPitch");
   pragma Import (Stdcall, waveOutGetPlaybackRate, "waveOutGetPlaybackRate");
   pragma Import (Stdcall, waveOutSetPlaybackRate, "waveOutSetPlaybackRate");
   pragma Import (Stdcall, waveOutGetID, "waveOutGetID");
   pragma Import (Stdcall, waveOutMessage, "waveOutMessage");
   pragma Import (Stdcall, waveInGetNumDevs, "waveInGetNumDevs");
   pragma Import (Stdcall, waveInGetDevCapsA, "waveInGetDevCapsA");
   pragma Import (Stdcall, waveInGetDevCapsW, "waveInGetDevCapsW");
   pragma Import (Stdcall, waveInGetErrorTextA, "waveInGetErrorTextA");
   pragma Import (Stdcall, waveInGetErrorTextW, "waveInGetErrorTextW");
   pragma Import (Stdcall, waveInOpen, "waveInOpen");
   pragma Import (Stdcall, waveInClose, "waveInClose");
   pragma Import (Stdcall, waveInPrepareHeader, "waveInPrepareHeader");
   pragma Import (Stdcall, waveInUnprepareHeader, "waveInUnprepareHeader");
   pragma Import (Stdcall, waveInAddBuffer, "waveInAddBuffer");
   pragma Import (Stdcall, waveInStart, "waveInStart");
   pragma Import (Stdcall, waveInStop, "waveInStop");
   pragma Import (Stdcall, waveInReset, "waveInReset");
   pragma Import (Stdcall, waveInGetPosition, "waveInGetPosition");
   pragma Import (Stdcall, waveInGetID, "waveInGetID");
   pragma Import (Stdcall, waveInMessage, "waveInMessage");
   pragma Import (Stdcall, midiOutGetNumDevs, "midiOutGetNumDevs");
   pragma Import (Stdcall, midiOutGetDevCapsA, "midiOutGetDevCapsA");
   pragma Import (Stdcall, midiOutGetDevCapsW, "midiOutGetDevCapsW");
   pragma Import (Stdcall, midiOutGetVolume, "midiOutGetVolume");
   pragma Import (Stdcall, midiOutSetVolume, "midiOutSetVolume");
   pragma Import (Stdcall, midiOutGetErrorTextA, "midiOutGetErrorTextA");
   pragma Import (Stdcall, midiOutGetErrorTextW, "midiOutGetErrorTextW");
   pragma Import (Stdcall, midiOutOpen, "midiOutOpen");
   pragma Import (Stdcall, midiOutClose, "midiOutClose");
   pragma Import (Stdcall, midiOutPrepareHeader, "midiOutPrepareHeader");
   pragma Import (Stdcall, midiOutUnprepareHeader, "midiOutUnprepareHeader");
   pragma Import (Stdcall, midiOutShortMsg, "midiOutShortMsg");
   pragma Import (Stdcall, midiOutLongMsg, "midiOutLongMsg");
   pragma Import (Stdcall, midiOutReset, "midiOutReset");
   pragma Import (Stdcall, midiOutCachePatches, "midiOutCachePatches");
   pragma Import
     (Stdcall,
      midiOutCacheDrumPatches,
      "midiOutCacheDrumPatches");
   pragma Import (Stdcall, midiOutGetID, "midiOutGetID");
   pragma Import (Stdcall, midiOutMessage, "midiOutMessage");
   pragma Import (Stdcall, midiInGetNumDevs, "midiInGetNumDevs");
   pragma Import (Stdcall, midiInGetDevCapsA, "midiInGetDevCapsA");
   pragma Import (Stdcall, midiInGetDevCapsW, "midiInGetDevCapsW");
   pragma Import (Stdcall, midiInGetErrorTextA, "midiInGetErrorTextA");
   pragma Import (Stdcall, midiInGetErrorTextW, "midiInGetErrorTextW");
   pragma Import (Stdcall, midiInOpen, "midiInOpen");
   pragma Import (Stdcall, midiInClose, "midiInClose");
   pragma Import (Stdcall, midiInPrepareHeader, "midiInPrepareHeader");
   pragma Import (Stdcall, midiInUnprepareHeader, "midiInUnprepareHeader");
   pragma Import (Stdcall, midiInAddBuffer, "midiInAddBuffer");
   pragma Import (Stdcall, midiInStart, "midiInStart");
   pragma Import (Stdcall, midiInStop, "midiInStop");
   pragma Import (Stdcall, midiInReset, "midiInReset");
   pragma Import (Stdcall, midiInGetID, "midiInGetID");
   pragma Import (Stdcall, midiInMessage, "midiInMessage");
   pragma Import (Stdcall, auxGetNumDevs, "auxGetNumDevs");
   pragma Import (Stdcall, auxGetDevCapsA, "auxGetDevCapsA");
   pragma Import (Stdcall, auxGetDevCapsW, "auxGetDevCapsW");
   pragma Import (Stdcall, auxSetVolume, "auxSetVolume");
   pragma Import (Stdcall, auxGetVolume, "auxGetVolume");
   pragma Import (Stdcall, auxOutMessage, "auxOutMessage");
   pragma Import (Stdcall, mixerGetNumDevs, "mixerGetNumDevs");
   pragma Import (Stdcall, mixerGetDevCapsA, "mixerGetDevCapsA");
   pragma Import (Stdcall, mixerGetDevCapsW, "mixerGetDevCapsW");
   pragma Import (Stdcall, mixerGetID, "mixerGetID");
   pragma Import (Stdcall, mixerOpen, "mixerOpen");
   pragma Import (Stdcall, mixerClose, "mixerClose");
   pragma Import (Stdcall, mixerMessage, "mixerMessage");
   pragma Import (Stdcall, mixerGetLineInfoA, "mixerGetLineInfoA");
   pragma Import (Stdcall, mixerGetLineInfoW, "mixerGetLineInfoW");
   pragma Import (Stdcall, mixerGetLineControlsA, "mixerGetLineControlsA");
   pragma Import (Stdcall, mixerGetLineControlsW, "mixerGetLineControlsW");
   pragma Import
     (Stdcall,
      mixerGetControlDetailsA,
      "mixerGetControlDetailsA");
   pragma Import
     (Stdcall,
      mixerGetControlDetailsW,
      "mixerGetControlDetailsW");
   pragma Import (Stdcall, mixerSetControlDetails, "mixerSetControlDetails");
   pragma Import (Stdcall, timeGetSystemTime, "timeGetSystemTime");
   pragma Import (Stdcall, timeGetTime, "timeGetTime");
   pragma Import (Stdcall, timeSetEvent, "timeSetEvent");
   pragma Import (Stdcall, timeKillEvent, "timeKillEvent");
   pragma Import (Stdcall, timeGetDevCaps, "timeGetDevCaps");
   pragma Import (Stdcall, timeBeginPeriod, "timeBeginPeriod");
   pragma Import (Stdcall, timeEndPeriod, "timeEndPeriod");
   pragma Import (Stdcall, joyGetNumDevs, "joyGetNumDevs");
   pragma Import (Stdcall, joyGetDevCapsA, "joyGetDevCapsA");
   pragma Import (Stdcall, joyGetDevCapsW, "joyGetDevCapsW");
   pragma Import (Stdcall, joyGetPos, "joyGetPos");
   pragma Import (Stdcall, joyGetThreshold, "joyGetThreshold");
   pragma Import (Stdcall, joyReleaseCapture, "joyReleaseCapture");
   pragma Import (Stdcall, joySetCapture, "joySetCapture");
   pragma Import (Stdcall, joySetThreshold, "joySetThreshold");
   pragma Import (Stdcall, mmioStringToFOURCCA, "mmioStringToFOURCCA");
   pragma Import (Stdcall, mmioStringToFOURCCW, "mmioStringToFOURCCW");
   pragma Import (Stdcall, mmioInstallIOProcA, "mmioInstallIOProcA");
   pragma Import (Stdcall, mmioInstallIOProcW, "mmioInstallIOProcW");
   pragma Import (Stdcall, mmioOpenA, "mmioOpenA");
   pragma Import (Stdcall, mmioOpenW, "mmioOpenW");
   pragma Import (Stdcall, mmioRenameA, "mmioRenameA");
   pragma Import (Stdcall, mmioRenameW, "mmioRenameW");
   pragma Import (Stdcall, mmioClose, "mmioClose");
   pragma Import (Stdcall, mmioRead, "mmioRead");
   pragma Import (Stdcall, mmioWrite, "mmioWrite");
   pragma Import (Stdcall, mmioSeek, "mmioSeek");
   pragma Import (Stdcall, mmioGetInfo, "mmioGetInfo");
   pragma Import (Stdcall, mmioSetInfo, "mmioSetInfo");
   pragma Import (Stdcall, mmioSetBuffer, "mmioSetBuffer");
   pragma Import (Stdcall, mmioFlush, "mmioFlush");
   pragma Import (Stdcall, mmioAdvance, "mmioAdvance");
   pragma Import (Stdcall, mmioSendMessage, "mmioSendMessage");
   pragma Import (Stdcall, mmioDescend, "mmioDescend");
   pragma Import (Stdcall, mmioAscend, "mmioAscend");
   pragma Import (Stdcall, mmioCreateChunk, "mmioCreateChunk");
   pragma Import (Stdcall, mciSendCommandA, "mciSendCommandA");
   pragma Import (Stdcall, mciSendCommandW, "mciSendCommandW");
   pragma Import (Stdcall, mciSendStringA, "mciSendStringA");
   pragma Import (Stdcall, mciSendStringW, "mciSendStringW");
   pragma Import (Stdcall, mciGetDeviceIDA, "mciGetDeviceIDA");
   pragma Import (Stdcall, mciGetDeviceIDW, "mciGetDeviceIDW");
   pragma Import
     (Stdcall,
      mciGetDeviceIDFromElementIDA,
      "mciGetDeviceIDFromElementIDA");
   pragma Import
     (Stdcall,
      mciGetDeviceIDFromElementIDW,
      "mciGetDeviceIDFromElementIDW");
   pragma Import (Stdcall, mciGetErrorStringA, "mciGetErrorStringA");
   pragma Import (Stdcall, mciGetErrorStringW, "mciGetErrorStringW");
   pragma Import (Stdcall, mciSetYieldProc, "mciSetYieldProc");
   pragma Import (Stdcall, mciGetCreatorTask, "mciGetCreatorTask");
   pragma Import (Stdcall, mciGetYieldProc, "mciGetYieldProc");

end Win32.Mmsystem;
