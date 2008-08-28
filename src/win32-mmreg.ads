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

with Win32.Mmsystem;
with Win32.Wingdi;

package Win32.Mmreg is

   INC_MMREG : constant := 144;        --  mmreg.h:38
   MM_CREATIVE : constant := 2;          --  mmreg.h:57
   MM_MEDIAVISION : constant := 3;          --  mmreg.h:58
   MM_FUJITSU : constant := 4;          --  mmreg.h:59
   MM_ARTISOFT : constant := 20;         --  mmreg.h:60
   MM_TURTLE_BEACH : constant := 21;         --  mmreg.h:61
   MM_IBM : constant := 22;         --  mmreg.h:62
   MM_VOCALTEC : constant := 23;         --  mmreg.h:63
   MM_ROLAND : constant := 24;         --  mmreg.h:64
   MM_DSP_SOLUTIONS : constant := 25;         --  mmreg.h:65
   MM_NEC : constant := 26;         --  mmreg.h:66
   MM_ATI : constant := 27;         --  mmreg.h:67
   MM_WANGLABS : constant := 28;         --  mmreg.h:68
   MM_TANDY : constant := 29;         --  mmreg.h:69
   MM_VOYETRA : constant := 30;         --  mmreg.h:70
   MM_ANTEX : constant := 31;         --  mmreg.h:71
   MM_ICL_PS : constant := 32;         --  mmreg.h:72
   MM_INTEL : constant := 33;         --  mmreg.h:73
   MM_GRAVIS : constant := 34;         --  mmreg.h:74
   MM_VAL : constant := 35;         --  mmreg.h:75
   MM_INTERACTIVE : constant := 36;         --  mmreg.h:76
   MM_YAMAHA : constant := 37;         --  mmreg.h:77
   MM_EVEREX : constant := 38;         --  mmreg.h:78
   MM_ECHO : constant := 39;         --  mmreg.h:79
   MM_SIERRA : constant := 40;         --  mmreg.h:80
   MM_CAT : constant := 41;         --  mmreg.h:81
   MM_APPS : constant := 42;         --  mmreg.h:82
   MM_DSP_GROUP : constant := 43;         --  mmreg.h:83
   MM_MELABS : constant := 44;         --  mmreg.h:84
   MM_COMPUTER_FRIENDS : constant := 45;         --  mmreg.h:85
   MM_ESS : constant := 46;         --  mmreg.h:86
   MM_AUDIOFILE : constant := 47;         --  mmreg.h:87
   MM_MOTOROLA : constant := 48;         --  mmreg.h:88
   MM_CANOPUS : constant := 49;         --  mmreg.h:89
   MM_EPSON : constant := 50;         --  mmreg.h:90
   MM_TRUEVISION : constant := 51;         --  mmreg.h:91
   MM_AZTECH : constant := 52;         --  mmreg.h:92
   MM_VIDEOLOGIC : constant := 53;         --  mmreg.h:93
   MM_SCALACS : constant := 54;         --  mmreg.h:94
   MM_KORG : constant := 55;         --  mmreg.h:95
   MM_APT : constant := 56;         --  mmreg.h:96
   MM_ICS : constant := 57;         --  mmreg.h:97
   MM_ITERATEDSYS : constant := 58;         --  mmreg.h:98
   MM_METHEUS : constant := 59;         --  mmreg.h:99
   MM_LOGITECH : constant := 60;         --  mmreg.h:100
   MM_WINNOV : constant := 61;         --  mmreg.h:101
   MM_NCR : constant := 62;         --  mmreg.h:102
   MM_EXAN : constant := 63;         --  mmreg.h:103
   MM_AST : constant := 64;         --  mmreg.h:104
   MM_WILLOWPOND : constant := 65;         --  mmreg.h:105
   MM_SONICFOUNDRY : constant := 66;         --  mmreg.h:106
   MM_VITEC : constant := 67;         --  mmreg.h:107
   MM_MOSCOM : constant := 68;         --  mmreg.h:108
   MM_SILICONSOFT : constant := 69;         --  mmreg.h:109
   MM_SUPERMAC : constant := 73;         --  mmreg.h:110
   MM_AUDIOPT : constant := 74;         --  mmreg.h:111
   MM_SPEECHCOMP : constant := 76;         --  mmreg.h:112
   MM_DOLBY : constant := 78;         --  mmreg.h:113
   MM_OKI : constant := 79;         --  mmreg.h:114
   MM_AURAVISION : constant := 80;         --  mmreg.h:115
   MM_OLIVETTI : constant := 81;         --  mmreg.h:116
   MM_IOMAGIC : constant := 82;         --  mmreg.h:117
   MM_MATSUSHITA : constant := 83;         --  mmreg.h:118
   MM_CONTROLRES : constant := 84;         --  mmreg.h:119
   MM_XEBEC : constant := 85;         --  mmreg.h:120
   MM_NEWMEDIA : constant := 86;         --  mmreg.h:121
   MM_NMS : constant := 87;         --  mmreg.h:122
   MM_LYRRUS : constant := 88;         --  mmreg.h:123
   MM_COMPUSIC : constant := 89;         --  mmreg.h:124
   MM_OPTI : constant := 90;         --  mmreg.h:125
   MM_DIALOGIC : constant := 93;         --  mmreg.h:126
   MM_PCSPEAKER_WAVEOUT : constant := 13;         --  mmreg.h:146
   MM_MSFT_WSS_WAVEIN : constant := 14;         --  mmreg.h:147
   MM_MSFT_WSS_WAVEOUT : constant := 15;         --  mmreg.h:148
   MM_MSFT_WSS_FMSYNTH_STEREO : constant := 16;         --  mmreg.h:149
   MM_MSFT_WSS_MIXER : constant := 17;         --  mmreg.h:150
   MM_MSFT_WSS_OEM_WAVEIN : constant := 18;         --  mmreg.h:151
   MM_MSFT_WSS_OEM_WAVEOUT : constant := 19;         --  mmreg.h:152
   MM_MSFT_WSS_OEM_FMSYNTH_STEREO : constant := 20;         --  mmreg.h:153
   MM_MSFT_WSS_AUX : constant := 21;         --  mmreg.h:154
   MM_MSFT_WSS_OEM_AUX : constant := 22;         --  mmreg.h:155
   MM_MSFT_GENERIC_WAVEIN : constant := 23;         --  mmreg.h:156
   MM_MSFT_GENERIC_WAVEOUT : constant := 24;         --  mmreg.h:157
   MM_MSFT_GENERIC_MIDIIN : constant := 25;         --  mmreg.h:158
   MM_MSFT_GENERIC_MIDIOUT : constant := 26;         --  mmreg.h:159
   MM_MSFT_GENERIC_MIDISYNTH : constant := 27;         --  mmreg.h:160
   MM_MSFT_GENERIC_AUX_LINE : constant := 28;         --  mmreg.h:161
   MM_MSFT_GENERIC_AUX_MIC : constant := 29;         --  mmreg.h:162
   MM_MSFT_GENERIC_AUX_CD : constant := 30;         --  mmreg.h:163
   MM_MSFT_WSS_OEM_MIXER : constant := 31;         --  mmreg.h:164
   MM_MSFT_MSACM : constant := 32;         --  mmreg.h:165
   MM_MSFT_ACM_MSADPCM : constant := 33;         --  mmreg.h:166
   MM_MSFT_ACM_IMAADPCM : constant := 34;         --  mmreg.h:167
   MM_MSFT_ACM_MSFILTER : constant := 35;         --  mmreg.h:168
   MM_MSFT_ACM_GSM610 : constant := 36;         --  mmreg.h:169
   MM_MSFT_ACM_G711 : constant := 37;         --  mmreg.h:170
   MM_MSFT_ACM_PCM : constant := 38;         --  mmreg.h:171
   MM_WSS_SB16_WAVEIN : constant := 39;         --  mmreg.h:175
   MM_WSS_SB16_WAVEOUT : constant := 40;         --  mmreg.h:176
   MM_WSS_SB16_MIDIIN : constant := 41;         --  mmreg.h:177
   MM_WSS_SB16_MIDIOUT : constant := 42;         --  mmreg.h:178
   MM_WSS_SB16_SYNTH : constant := 43;         --  mmreg.h:179
   MM_WSS_SB16_AUX_LINE : constant := 44;         --  mmreg.h:180
   MM_WSS_SB16_AUX_CD : constant := 45;         --  mmreg.h:181
   MM_WSS_SB16_MIXER : constant := 46;         --  mmreg.h:182
   MM_WSS_SBPRO_WAVEIN : constant := 47;         --  mmreg.h:183
   MM_WSS_SBPRO_WAVEOUT : constant := 48;         --  mmreg.h:184
   MM_WSS_SBPRO_MIDIIN : constant := 49;         --  mmreg.h:185
   MM_WSS_SBPRO_MIDIOUT : constant := 50;         --  mmreg.h:186
   MM_WSS_SBPRO_SYNTH : constant := 51;         --  mmreg.h:187
   MM_WSS_SBPRO_AUX_LINE : constant := 52;         --  mmreg.h:188
   MM_WSS_SBPRO_AUX_CD : constant := 53;         --  mmreg.h:189
   MM_WSS_SBPRO_MIXER : constant := 54;         --  mmreg.h:190
   MM_MSFT_WSS_NT_WAVEIN : constant := 55;         --  mmreg.h:192
   MM_MSFT_WSS_NT_WAVEOUT : constant := 56;         --  mmreg.h:193
   MM_MSFT_WSS_NT_FMSYNTH_STEREO : constant := 57;         --  mmreg.h:194
   MM_MSFT_WSS_NT_MIXER : constant := 58;         --  mmreg.h:195
   MM_MSFT_WSS_NT_AUX : constant := 59;         --  mmreg.h:196
   MM_MSFT_SB16_WAVEIN : constant := 60;         --  mmreg.h:198
   MM_MSFT_SB16_WAVEOUT : constant := 61;         --  mmreg.h:199
   MM_MSFT_SB16_MIDIIN : constant := 62;         --  mmreg.h:200
   MM_MSFT_SB16_MIDIOUT : constant := 63;         --  mmreg.h:201
   MM_MSFT_SB16_SYNTH : constant := 64;         --  mmreg.h:202
   MM_MSFT_SB16_AUX_LINE : constant := 65;         --  mmreg.h:203
   MM_MSFT_SB16_AUX_CD : constant := 66;         --  mmreg.h:204
   MM_MSFT_SB16_MIXER : constant := 67;         --  mmreg.h:205
   MM_MSFT_SBPRO_WAVEIN : constant := 68;         --  mmreg.h:206
   MM_MSFT_SBPRO_WAVEOUT : constant := 69;         --  mmreg.h:207
   MM_MSFT_SBPRO_MIDIIN : constant := 70;         --  mmreg.h:208
   MM_MSFT_SBPRO_MIDIOUT : constant := 71;         --  mmreg.h:209
   MM_MSFT_SBPRO_SYNTH : constant := 72;         --  mmreg.h:210
   MM_MSFT_SBPRO_AUX_LINE : constant := 73;         --  mmreg.h:211
   MM_MSFT_SBPRO_AUX_CD : constant := 74;         --  mmreg.h:212
   MM_MSFT_SBPRO_MIXER : constant := 75;         --  mmreg.h:213
   MM_MSFT_MSOPL_SYNTH : constant := 76;         --  mmreg.h:215
   MM_CREATIVE_SB15_WAVEIN : constant := 1;          --  mmreg.h:218
   MM_CREATIVE_SB20_WAVEIN : constant := 2;          --  mmreg.h:219
   MM_CREATIVE_SBPRO_WAVEIN : constant := 3;          --  mmreg.h:220
   MM_CREATIVE_SBP16_WAVEIN : constant := 4;          --  mmreg.h:221
   MM_CREATIVE_SB15_WAVEOUT : constant := 101;        --  mmreg.h:222
   MM_CREATIVE_SB20_WAVEOUT : constant := 102;        --  mmreg.h:223
   MM_CREATIVE_SBPRO_WAVEOUT : constant := 103;        --  mmreg.h:224
   MM_CREATIVE_SBP16_WAVEOUT : constant := 104;        --  mmreg.h:225
   MM_CREATIVE_MIDIOUT : constant := 201;        --  mmreg.h:226
   MM_CREATIVE_MIDIIN : constant := 202;        --  mmreg.h:227
   MM_CREATIVE_FMSYNTH_MONO : constant := 301;        --  mmreg.h:228
   MM_CREATIVE_FMSYNTH_STEREO : constant := 302;        --  mmreg.h:229
   MM_CREATIVE_AUX_CD : constant := 401;        --  mmreg.h:230
   MM_CREATIVE_AUX_LINE : constant := 402;        --  mmreg.h:231
   MM_CREATIVE_AUX_MIC : constant := 403;        --  mmreg.h:232
   MM_CREATIVE_AUX_MASTER : constant := 404;        --  mmreg.h:233
   MM_CREATIVE_AUX_PCSPK : constant := 405;        --  mmreg.h:234
   MM_CREATIVE_AUX_WAVE : constant := 406;        --  mmreg.h:235
   MM_CREATIVE_AUX_MIDI : constant := 407;        --  mmreg.h:236
   MM_CREATIVE_SBPRO_MIXER : constant := 408;        --  mmreg.h:237
   MM_CREATIVE_SB16_MIXER : constant := 409;        --  mmreg.h:238
   MM_MEDIAVISION_PROAUDIO : constant := 16#10#;     --  mmreg.h:243
   MM_PROAUD_MIDIOUT : constant := 16#11#;     --  mmreg.h:244
   MM_PROAUD_MIDIIN : constant := 16#12#;     --  mmreg.h:245
   MM_PROAUD_SYNTH : constant := 16#13#;     --  mmreg.h:246
   MM_PROAUD_WAVEOUT : constant := 16#14#;     --  mmreg.h:247
   MM_PROAUD_WAVEIN : constant := 16#15#;     --  mmreg.h:248
   MM_PROAUD_MIXER : constant := 16#16#;     --  mmreg.h:249
   MM_PROAUD_AUX : constant := 16#17#;     --  mmreg.h:250
   MM_MEDIAVISION_THUNDER : constant := 16#20#;     --  mmreg.h:253
   MM_THUNDER_SYNTH : constant := 16#23#;     --  mmreg.h:254
   MM_THUNDER_WAVEOUT : constant := 16#24#;     --  mmreg.h:255
   MM_THUNDER_WAVEIN : constant := 16#25#;     --  mmreg.h:256
   MM_THUNDER_AUX : constant := 16#27#;     --  mmreg.h:257
   MM_MEDIAVISION_TPORT : constant := 16#40#;     --  mmreg.h:260
   MM_TPORT_WAVEOUT : constant := 16#41#;     --  mmreg.h:261
   MM_TPORT_WAVEIN : constant := 16#42#;     --  mmreg.h:262
   MM_TPORT_SYNTH : constant := 16#43#;     --  mmreg.h:263
   MM_MEDIAVISION_PROAUDIO_PLUS : constant := 16#50#;     --  mmreg.h:266
   MM_PROAUD_PLUS_MIDIOUT : constant := 16#51#;     --  mmreg.h:267
   MM_PROAUD_PLUS_MIDIIN : constant := 16#52#;     --  mmreg.h:268
   MM_PROAUD_PLUS_SYNTH : constant := 16#53#;     --  mmreg.h:269
   MM_PROAUD_PLUS_WAVEOUT : constant := 16#54#;     --  mmreg.h:270
   MM_PROAUD_PLUS_WAVEIN : constant := 16#55#;     --  mmreg.h:271
   MM_PROAUD_PLUS_MIXER : constant := 16#56#;     --  mmreg.h:272
   MM_PROAUD_PLUS_AUX : constant := 16#57#;     --  mmreg.h:273
   MM_MEDIAVISION_PROAUDIO_16 : constant := 16#60#;     --  mmreg.h:276
   MM_PROAUD_16_MIDIOUT : constant := 16#61#;     --  mmreg.h:277
   MM_PROAUD_16_MIDIIN : constant := 16#62#;     --  mmreg.h:278
   MM_PROAUD_16_SYNTH : constant := 16#63#;     --  mmreg.h:279
   MM_PROAUD_16_WAVEOUT : constant := 16#64#;     --  mmreg.h:280
   MM_PROAUD_16_WAVEIN : constant := 16#65#;     --  mmreg.h:281
   MM_PROAUD_16_MIXER : constant := 16#66#;     --  mmreg.h:282
   MM_PROAUD_16_AUX : constant := 16#67#;     --  mmreg.h:283
   MM_MEDIAVISION_PROSTUDIO_16 : constant := 16#60#;     --  mmreg.h:286
   MM_STUDIO_16_MIDIOUT : constant := 16#61#;     --  mmreg.h:287
   MM_STUDIO_16_MIDIIN : constant := 16#62#;     --  mmreg.h:288
   MM_STUDIO_16_SYNTH : constant := 16#63#;     --  mmreg.h:289
   MM_STUDIO_16_WAVEOUT : constant := 16#64#;     --  mmreg.h:290
   MM_STUDIO_16_WAVEIN : constant := 16#65#;     --  mmreg.h:291
   MM_STUDIO_16_MIXER : constant := 16#66#;     --  mmreg.h:292
   MM_STUDIO_16_AUX : constant := 16#67#;     --  mmreg.h:293
   MM_MEDIAVISION_CDPC : constant := 16#70#;     --  mmreg.h:296
   MM_CDPC_MIDIOUT : constant := 16#71#;     --  mmreg.h:297
   MM_CDPC_MIDIIN : constant := 16#72#;     --  mmreg.h:298
   MM_CDPC_SYNTH : constant := 16#73#;     --  mmreg.h:299
   MM_CDPC_WAVEOUT : constant := 16#74#;     --  mmreg.h:300
   MM_CDPC_WAVEIN : constant := 16#75#;     --  mmreg.h:301
   MM_CDPC_MIXER : constant := 16#76#;     --  mmreg.h:302
   MM_CDPC_AUX : constant := 16#77#;     --  mmreg.h:303
   MM_MEDIAVISION_OPUS1208 : constant := 16#80#;     --  mmreg.h:306
   MM_OPUS401_MIDIOUT : constant := 16#81#;     --  mmreg.h:307
   MM_OPUS401_MIDIIN : constant := 16#82#;     --  mmreg.h:308
   MM_OPUS1208_SYNTH : constant := 16#83#;     --  mmreg.h:309
   MM_OPUS1208_WAVEOUT : constant := 16#84#;     --  mmreg.h:310
   MM_OPUS1208_WAVEIN : constant := 16#85#;     --  mmreg.h:311
   MM_OPUS1208_MIXER : constant := 16#86#;     --  mmreg.h:312
   MM_OPUS1208_AUX : constant := 16#87#;     --  mmreg.h:313
   MM_MEDIAVISION_OPUS1216 : constant := 16#90#;     --  mmreg.h:316
   MM_OPUS1216_MIDIOUT : constant := 16#91#;     --  mmreg.h:317
   MM_OPUS1216_MIDIIN : constant := 16#92#;     --  mmreg.h:318
   MM_OPUS1216_SYNTH : constant := 16#93#;     --  mmreg.h:319
   MM_OPUS1216_WAVEOUT : constant := 16#94#;     --  mmreg.h:320
   MM_OPUS1216_WAVEIN : constant := 16#95#;     --  mmreg.h:321
   MM_OPUS1216_MIXER : constant := 16#96#;     --  mmreg.h:322
   MM_OPUS1216_AUX : constant := 16#97#;     --  mmreg.h:323
   MM_ARTISOFT_SBWAVEIN : constant := 1;          --  mmreg.h:326
   MM_ARTISOFT_SBWAVEOUT : constant := 2;          --  mmreg.h:327
   MM_MMOTION_WAVEAUX : constant := 1;          --  mmreg.h:330
   MM_MMOTION_WAVEOUT : constant := 2;          --  mmreg.h:331
   MM_MMOTION_WAVEIN : constant := 3;          --  mmreg.h:332
   MM_IBM_PCMCIA_WAVEIN : constant := 11;         --  mmreg.h:333
   MM_IBM_PCMCIA_WAVEOUT : constant := 12;         --  mmreg.h:334
   MM_IBM_PCMCIA_SYNTH : constant := 13;         --  mmreg.h:335
   MM_IBM_PCMCIA_MIDIIN : constant := 14;         --  mmreg.h:336
   MM_IBM_PCMCIA_MIDIOUT : constant := 15;         --  mmreg.h:337
   MM_IBM_PCMCIA_AUX : constant := 16;         --  mmreg.h:338
   MM_VOCALTEC_WAVEOUT : constant := 1;          --  mmreg.h:341
   MM_VOCALTEC_WAVEIN : constant := 2;          --  mmreg.h:342
   MM_ROLAND_MPU401_MIDIOUT : constant := 15;         --  mmreg.h:345
   MM_ROLAND_MPU401_MIDIIN : constant := 16;         --  mmreg.h:346
   MM_ROLAND_SMPU_MIDIOUTA : constant := 17;         --  mmreg.h:347
   MM_ROLAND_SMPU_MIDIOUTB : constant := 18;         --  mmreg.h:348
   MM_ROLAND_SMPU_MIDIINA : constant := 19;         --  mmreg.h:349
   MM_ROLAND_SMPU_MIDIINB : constant := 20;         --  mmreg.h:350
   MM_ROLAND_SC7_MIDIOUT : constant := 21;         --  mmreg.h:351
   MM_ROLAND_SC7_MIDIIN : constant := 22;         --  mmreg.h:352
   MM_ROLAND_SERIAL_MIDIOUT : constant := 23;         --  mmreg.h:353
   MM_ROLAND_SERIAL_MIDIIN : constant := 24;         --  mmreg.h:354
   MM_DSP_SOLUTIONS_WAVEOUT : constant := 1;          --  mmreg.h:357
   MM_DSP_SOLUTIONS_WAVEIN : constant := 2;          --  mmreg.h:358
   MM_DSP_SOLUTIONS_SYNTH : constant := 3;          --  mmreg.h:359
   MM_DSP_SOLUTIONS_AUX : constant := 4;          --  mmreg.h:360
   MM_WANGLABS_WAVEIN1 : constant := 1;          --  mmreg.h:363
   MM_WANGLABS_WAVEOUT1 : constant := 2;          --  mmreg.h:364
   MM_TANDY_VISWAVEIN : constant := 1;          --  mmreg.h:367
   MM_TANDY_VISWAVEOUT : constant := 2;          --  mmreg.h:368
   MM_TANDY_VISBIOSSYNTH : constant := 3;          --  mmreg.h:369
   MM_TANDY_SENS_MMAWAVEIN : constant := 4;          --  mmreg.h:370
   MM_TANDY_SENS_MMAWAVEOUT : constant := 5;          --  mmreg.h:371
   MM_TANDY_SENS_MMAMIDIIN : constant := 6;          --  mmreg.h:372
   MM_TANDY_SENS_MMAMIDIOUT : constant := 7;          --  mmreg.h:373
   MM_TANDY_SENS_VISWAVEOUT : constant := 8;          --  mmreg.h:374
   MM_TANDY_PSSJWAVEIN : constant := 9;          --  mmreg.h:375
   MM_TANDY_PSSJWAVEOUT : constant := 10;         --  mmreg.h:376
   MM_INTELOPD_WAVEIN : constant := 1;          --  mmreg.h:379
   MM_INTELOPD_WAVEOUT : constant := 101;        --  mmreg.h:380
   MM_INTELOPD_AUX : constant := 401;        --  mmreg.h:381
   MM_INTERACTIVE_WAVEIN : constant := 16#45#;     --  mmreg.h:384
   MM_INTERACTIVE_WAVEOUT : constant := 16#45#;     --  mmreg.h:385
   MM_YAMAHA_GSS_SYNTH : constant := 16#1#;      --  mmreg.h:388
   MM_YAMAHA_GSS_WAVEOUT : constant := 16#2#;      --  mmreg.h:389
   MM_YAMAHA_GSS_WAVEIN : constant := 16#3#;      --  mmreg.h:390
   MM_YAMAHA_GSS_MIDIOUT : constant := 16#4#;      --  mmreg.h:391
   MM_YAMAHA_GSS_MIDIIN : constant := 16#5#;      --  mmreg.h:392
   MM_YAMAHA_GSS_AUX : constant := 16#6#;      --  mmreg.h:393
   MM_EVEREX_CARRIER : constant := 16#1#;      --  mmreg.h:396
   MM_ECHO_SYNTH : constant := 16#1#;      --  mmreg.h:399
   MM_ECHO_WAVEOUT : constant := 16#2#;      --  mmreg.h:400
   MM_ECHO_WAVEIN : constant := 16#3#;      --  mmreg.h:401
   MM_ECHO_MIDIOUT : constant := 16#4#;      --  mmreg.h:402
   MM_ECHO_MIDIIN : constant := 16#5#;      --  mmreg.h:403
   MM_ECHO_AUX : constant := 16#6#;      --  mmreg.h:404
   MM_SIERRA_ARIA_MIDIOUT : constant := 16#14#;     --  mmreg.h:407
   MM_SIERRA_ARIA_MIDIIN : constant := 16#15#;     --  mmreg.h:408
   MM_SIERRA_ARIA_SYNTH : constant := 16#16#;     --  mmreg.h:409
   MM_SIERRA_ARIA_WAVEOUT : constant := 16#17#;     --  mmreg.h:410
   MM_SIERRA_ARIA_WAVEIN : constant := 16#18#;     --  mmreg.h:411
   MM_SIERRA_ARIA_AUX : constant := 16#19#;     --  mmreg.h:412
   MM_SIERRA_ARIA_AUX2 : constant := 16#20#;     --  mmreg.h:413
   MM_CAT_WAVEOUT : constant := 1;          --  mmreg.h:416
   MM_DSP_GROUP_TRUESPEECH : constant := 16#1#;      --  mmreg.h:419
   MM_MELABS_MIDI2GO : constant := 16#1#;      --  mmreg.h:422
   MM_ESS_AMWAVEOUT : constant := 16#1#;      --  mmreg.h:425
   MM_ESS_AMWAVEIN : constant := 16#2#;      --  mmreg.h:426
   MM_ESS_AMAUX : constant := 16#3#;      --  mmreg.h:427
   MM_ESS_AMSYNTH : constant := 16#4#;      --  mmreg.h:428
   MM_ESS_AMMIDIOUT : constant := 16#5#;      --  mmreg.h:429
   MM_ESS_AMMIDIIN : constant := 16#6#;      --  mmreg.h:430
   MM_EPS_FMSND : constant := 1;          --  mmreg.h:433
   MM_TRUEVISION_WAVEIN1 : constant := 1;          --  mmreg.h:436
   MM_TRUEVISION_WAVEOUT1 : constant := 2;          --  mmreg.h:437
   MM_AZTECH_MIDIOUT : constant := 3;          --  mmreg.h:440
   MM_AZTECH_MIDIIN : constant := 4;          --  mmreg.h:441
   MM_AZTECH_WAVEIN : constant := 17;         --  mmreg.h:442
   MM_AZTECH_WAVEOUT : constant := 18;         --  mmreg.h:443
   MM_AZTECH_FMSYNTH : constant := 20;         --  mmreg.h:444
   MM_AZTECH_PRO16_WAVEIN : constant := 33;         --  mmreg.h:445
   MM_AZTECH_PRO16_WAVEOUT : constant := 34;         --  mmreg.h:446
   MM_AZTECH_PRO16_FMSYNTH : constant := 38;         --  mmreg.h:447
   MM_AZTECH_DSP16_WAVEIN : constant := 65;         --  mmreg.h:448
   MM_AZTECH_DSP16_WAVEOUT : constant := 66;         --  mmreg.h:449
   MM_AZTECH_DSP16_FMSYNTH : constant := 68;         --  mmreg.h:450
   MM_AZTECH_DSP16_WAVESYNTH : constant := 70;         --  mmreg.h:451
   MM_AZTECH_AUX_CD : constant := 401;        --  mmreg.h:452
   MM_AZTECH_AUX_LINE : constant := 402;        --  mmreg.h:453
   MM_AZTECH_AUX_MIC : constant := 403;        --  mmreg.h:454
   MM_VIDEOLOGIC_MSWAVEIN : constant := 1;          --  mmreg.h:457
   MM_VIDEOLOGIC_MSWAVEOUT : constant := 2;          --  mmreg.h:458
   MM_KORG_PCIF_MIDIOUT : constant := 1;          --  mmreg.h:461
   MM_KORG_PCIF_MIDIIN : constant := 2;          --  mmreg.h:462
   MM_APT_ACE100CD : constant := 1;          --  mmreg.h:465
   MM_ICS_WAVEDECK_WAVEOUT : constant := 1;          --  mmreg.h:468
   MM_ICS_WAVEDECK_WAVEIN : constant := 2;          --  mmreg.h:469
   MM_ICS_WAVEDECK_MIXER : constant := 3;          --  mmreg.h:470
   MM_ICS_WAVEDECK_AUX : constant := 4;          --  mmreg.h:471
   MM_ICS_WAVEDECK_SYNTH : constant := 5;          --  mmreg.h:472
   MM_ITERATEDSYS_FUFCODEC : constant := 1;          --  mmreg.h:475
   MM_METHEUS_ZIPPER : constant := 1;          --  mmreg.h:478
   MM_WINNOV_CAVIAR_WAVEIN : constant := 1;          --  mmreg.h:481
   MM_WINNOV_CAVIAR_WAVEOUT : constant := 2;          --  mmreg.h:482
   MM_WINNOV_CAVIAR_VIDC : constant := 3;          --  mmreg.h:483
   MM_WINNOV_CAVIAR_CHAMPAGNE : constant := 4;          --  mmreg.h:484
   MM_WINNOV_CAVIAR_YUV8 : constant := 5;          --  mmreg.h:485
   MM_NCR_BA_WAVEIN : constant := 1;          --  mmreg.h:488
   MM_NCR_BA_WAVEOUT : constant := 2;          --  mmreg.h:489
   MM_NCR_BA_SYNTH : constant := 3;          --  mmreg.h:490
   MM_NCR_BA_AUX : constant := 4;          --  mmreg.h:491
   MM_NCR_BA_MIXER : constant := 5;          --  mmreg.h:492
   MM_VITEC_VMAKER : constant := 1;          --  mmreg.h:495
   MM_VITEC_VMPRO : constant := 2;          --  mmreg.h:496
   MM_MOSCOM_VPC2400 : constant := 1;          --  mmreg.h:499
   MM_SILICONSOFT_SC1_WAVEIN : constant := 1;          --  mmreg.h:502
   MM_SILICONSOFT_SC1_WAVEOUT : constant := 2;          --  mmreg.h:503
   MM_SILICONSOFT_SC2_WAVEIN : constant := 3;          --  mmreg.h:504
   MM_SILICONSOFT_SC2_WAVEOUT : constant := 4;          --  mmreg.h:505
   MM_SILICONSOFT_SOUNDJR2_WAVEOUT : constant := 5;      --  mmreg.h:506
   MM_SILICONSOFT_SOUNDJR2PR_WAVEIN : constant := 6;      --  mmreg.h:507
   MM_SILICONSOFT_SOUNDJR2PR_WAVEOUT : constant := 7;      --  mmreg.h:508
   MM_SILICONSOFT_SOUNDJR3_WAVEOUT : constant := 8;      --  mmreg.h:509
   MM_OLIVETTI_WAVEIN : constant := 1;          --  mmreg.h:512
   MM_OLIVETTI_WAVEOUT : constant := 2;          --  mmreg.h:513
   MM_OLIVETTI_MIXER : constant := 3;          --  mmreg.h:514
   MM_OLIVETTI_AUX : constant := 4;          --  mmreg.h:515
   MM_OLIVETTI_MIDIIN : constant := 5;          --  mmreg.h:516
   MM_OLIVETTI_MIDIOUT : constant := 6;          --  mmreg.h:517
   MM_OLIVETTI_SYNTH : constant := 7;          --  mmreg.h:518
   MM_OLIVETTI_JOYSTICK : constant := 8;          --  mmreg.h:519
   MM_OLIVETTI_ACM_GSM : constant := 9;          --  mmreg.h:520
   MM_OLIVETTI_ACM_ADPCM : constant := 10;         --  mmreg.h:521
   MM_OLIVETTI_ACM_CELP : constant := 11;         --  mmreg.h:522
   MM_OLIVETTI_ACM_SBC : constant := 12;         --  mmreg.h:523
   MM_OLIVETTI_ACM_OPR : constant := 13;         --  mmreg.h:524
   MM_IOMAGIC_TEMPO_WAVEOUT : constant := 1;          --  mmreg.h:533
   MM_IOMAGIC_TEMPO_WAVEIN : constant := 2;          --  mmreg.h:534
   MM_IOMAGIC_TEMPO_SYNTH : constant := 3;          --  mmreg.h:535
   MM_IOMAGIC_TEMPO_MIDIOUT : constant := 4;          --  mmreg.h:536
   MM_IOMAGIC_TEMPO_MXDOUT : constant := 5;          --  mmreg.h:537
   MM_IOMAGIC_TEMPO_AUXOUT : constant := 6;          --  mmreg.h:538
   MM_MATSUSHITA_WAVEIN : constant := 1;          --  mmreg.h:541
   MM_MATSUSHITA_WAVEOUT : constant := 2;          --  mmreg.h:542
   MM_MATSUSHITA_FMSYNTH_STEREO : constant := 3;          --  mmreg.h:543
   MM_MATSUSHITA_MIXER : constant := 4;          --  mmreg.h:544
   MM_MATSUSHITA_AUX : constant := 5;          --  mmreg.h:545
   MM_NEWMEDIA_WAVJAMMER : constant := 1;          --  mmreg.h:548
   MM_LYRRUS_BRIDGE_GUITAR : constant := 1;          --  mmreg.h:557
   MM_OPTI_M16_FMSYNTH_STEREO : constant := 16#1#;      --  mmreg.h:560
   MM_OPTI_M16_MIDIIN : constant := 16#2#;      --  mmreg.h:561
   MM_OPTI_M16_MIDIOUT : constant := 16#3#;      --  mmreg.h:562
   MM_OPTI_M16_WAVEIN : constant := 16#4#;      --  mmreg.h:563
   MM_OPTI_M16_WAVEOUT : constant := 16#5#;      --  mmreg.h:564
   MM_OPTI_M16_MIXER : constant := 16#6#;      --  mmreg.h:565
   MM_OPTI_M16_AUX : constant := 16#7#;      --  mmreg.h:566
   MM_OPTI_P16_FMSYNTH_STEREO : constant := 16#10#;     --  mmreg.h:567
   MM_OPTI_P16_MIDIIN : constant := 16#11#;     --  mmreg.h:568
   MM_OPTI_P16_MIDIOUT : constant := 16#12#;     --  mmreg.h:569
   MM_OPTI_P16_WAVEIN : constant := 16#13#;     --  mmreg.h:570
   MM_OPTI_P16_WAVEOUT : constant := 16#14#;     --  mmreg.h:571
   MM_OPTI_P16_MIXER : constant := 16#15#;     --  mmreg.h:572
   MM_OPTI_P16_AUX : constant := 16#16#;     --  mmreg.h:573
   MM_OPTI_M32_WAVEIN : constant := 16#20#;     --  mmreg.h:574
   MM_OPTI_M32_WAVEOUT : constant := 16#21#;     --  mmreg.h:575
   MM_OPTI_M32_MIDIIN : constant := 16#22#;     --  mmreg.h:576
   MM_OPTI_M32_MIDIOUT : constant := 16#23#;     --  mmreg.h:577
   MM_OPTI_M32_SYNTH_STEREO : constant := 16#24#;     --  mmreg.h:578
   MM_OPTI_M32_MIXER : constant := 16#25#;     --  mmreg.h:579
   MM_OPTI_M32_AUX : constant := 16#26#;     --  mmreg.h:580

   RIFFINFO_IARL : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'A', 'R', 'L');
   --  mmreg.h:590
   RIFFINFO_IART : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'A', 'R', 'T');
   --  mmreg.h:591
   RIFFINFO_ICMS : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'C', 'M', 'S');
   --  mmreg.h:592
   RIFFINFO_ICMT : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'C', 'M', 'T');
   --  mmreg.h:593
   RIFFINFO_ICOP : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'C', 'O', 'P');
   --  mmreg.h:594
   RIFFINFO_ICRD : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'C', 'R', 'D');
   --  mmreg.h:595
   RIFFINFO_ICRP : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'C', 'R', 'P');
   --  mmreg.h:596
   RIFFINFO_IDIM : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'D', 'I', 'M');
   --  mmreg.h:597
   RIFFINFO_IDPI : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'D', 'P', 'I');
   --  mmreg.h:598
   RIFFINFO_IENG : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'E', 'N', 'G');
   --  mmreg.h:599
   RIFFINFO_IGNR : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'G', 'N', 'R');
   --  mmreg.h:600
   RIFFINFO_IKEY : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'K', 'E', 'Y');
   --  mmreg.h:601
   RIFFINFO_ILGT : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'L', 'G', 'T');
   --  mmreg.h:602
   RIFFINFO_IMED : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'M', 'E', 'D');
   --  mmreg.h:603
   RIFFINFO_INAM : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'N', 'A', 'M');
   --  mmreg.h:604
   RIFFINFO_IPLT : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'P', 'L', 'T');
   --  mmreg.h:605
   RIFFINFO_IPRD : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'P', 'R', 'D');
   --  mmreg.h:606
   RIFFINFO_ISBJ : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'S', 'B', 'J');
   --  mmreg.h:607
   RIFFINFO_ISFT : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'S', 'F', 'T');
   --  mmreg.h:608
   RIFFINFO_ISHP : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'S', 'H', 'P');
   --  mmreg.h:609
   RIFFINFO_ISRC : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'S', 'R', 'C');
   --  mmreg.h:610
   RIFFINFO_ISRF : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'S', 'R', 'F');
   --  mmreg.h:611
   RIFFINFO_ITCH : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'T', 'C', 'H');
   --  mmreg.h:612
   RIFFINFO_ISMP : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'S', 'M', 'P');
   --  mmreg.h:615
   RIFFINFO_IDIT : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('I', 'D', 'I', 'T');
   --  mmreg.h:620

   WAVE_FORMAT_UNKNOWN : constant := 16#0#;      --  mmreg.h:639
   WAVE_FORMAT_ADPCM : constant := 16#2#;      --  mmreg.h:640
   WAVE_FORMAT_IBM_CVSD : constant := 16#5#;      --  mmreg.h:641
   WAVE_FORMAT_ALAW : constant := 16#6#;      --  mmreg.h:642
   WAVE_FORMAT_MULAW : constant := 16#7#;      --  mmreg.h:643
   WAVE_FORMAT_OKI_ADPCM : constant := 16#10#;     --  mmreg.h:644
   WAVE_FORMAT_DVI_ADPCM : constant := 16#11#;     --  mmreg.h:645
   WAVE_FORMAT_IMA_ADPCM : constant := 16#11#;     --  mmreg.h:646
   WAVE_FORMAT_MEDIASPACE_ADPCM : constant := 16#12#;     --  mmreg.h:647
   WAVE_FORMAT_SIERRA_ADPCM : constant := 16#13#;     --  mmreg.h:648
   WAVE_FORMAT_G723_ADPCM : constant := 16#14#;     --  mmreg.h:649
   WAVE_FORMAT_DIGISTD : constant := 16#15#;     --  mmreg.h:650
   WAVE_FORMAT_DIGIFIX : constant := 16#16#;     --  mmreg.h:651
   WAVE_FORMAT_DIALOGIC_OKI_ADPCM : constant := 16#17#;     --  mmreg.h:652
   WAVE_FORMAT_YAMAHA_ADPCM : constant := 16#20#;     --  mmreg.h:653
   WAVE_FORMAT_SONARC : constant := 16#21#;     --  mmreg.h:654
   WAVE_FORMAT_DSPGROUP_TRUESPEECH : constant := 16#22#; --  mmreg.h:655
   WAVE_FORMAT_ECHOSC1 : constant := 16#23#;     --  mmreg.h:656
   WAVE_FORMAT_AUDIOFILE_AF36 : constant := 16#24#;     --  mmreg.h:657
   WAVE_FORMAT_APTX : constant := 16#25#;     --  mmreg.h:658
   WAVE_FORMAT_AUDIOFILE_AF10 : constant := 16#26#;     --  mmreg.h:659
   WAVE_FORMAT_DOLBY_AC2 : constant := 16#30#;     --  mmreg.h:660
   WAVE_FORMAT_GSM610 : constant := 16#31#;     --  mmreg.h:661
   WAVE_FORMAT_ANTEX_ADPCME : constant := 16#33#;     --  mmreg.h:662
   WAVE_FORMAT_CONTROL_RES_VQLPC : constant := 16#34#;     --  mmreg.h:663
   WAVE_FORMAT_DIGIREAL : constant := 16#35#;     --  mmreg.h:664
   WAVE_FORMAT_DIGIADPCM : constant := 16#36#;     --  mmreg.h:665
   WAVE_FORMAT_CONTROL_RES_CR10 : constant := 16#37#;     --  mmreg.h:666
   WAVE_FORMAT_NMS_VBXADPCM : constant := 16#38#;     --  mmreg.h:667
   WAVE_FORMAT_G721_ADPCM : constant := 16#40#;     --  mmreg.h:668
   WAVE_FORMAT_MPEG : constant := 16#50#;     --  mmreg.h:669
   WAVE_FORMAT_CREATIVE_ADPCM : constant := 16#200#;    --  mmreg.h:670
   WAVE_FORMAT_CREATIVE_FASTSPEECH8 : constant := 16#202#; --  mmreg.h:671
   WAVE_FORMAT_CREATIVE_FASTSPEECH10 : constant := 16#203#; --  mmreg.h:672
   WAVE_FORMAT_FM_TOWNS_SND : constant := 16#300#;    --  mmreg.h:673
   WAVE_FORMAT_OLIGSM : constant := 16#1000#;   --  mmreg.h:674
   WAVE_FORMAT_OLIADPCM : constant := 16#1001#;   --  mmreg.h:675
   WAVE_FORMAT_OLICELP : constant := 16#1002#;   --  mmreg.h:676
   WAVE_FORMAT_OLISBC : constant := 16#1003#;   --  mmreg.h:677
   WAVE_FORMAT_OLIOPR : constant := 16#1004#;   --  mmreg.h:678
   WAVE_FORMAT_DEVELOPMENT : constant := 16#ffff#;   --  mmreg.h:685
   ACM_MPEG_LAYER1 : constant := 16#1#;      --  mmreg.h:1144
   ACM_MPEG_LAYER2 : constant := 16#2#;      --  mmreg.h:1145
   ACM_MPEG_LAYER3 : constant := 16#4#;      --  mmreg.h:1146
   ACM_MPEG_STEREO : constant := 16#1#;      --  mmreg.h:1147
   ACM_MPEG_JOINTSTEREO : constant := 16#2#;      --  mmreg.h:1148
   ACM_MPEG_DUALCHANNEL : constant := 16#4#;      --  mmreg.h:1149
   ACM_MPEG_SINGLECHANNEL : constant := 16#8#;      --  mmreg.h:1150
   ACM_MPEG_PRIVATEBIT : constant := 16#1#;      --  mmreg.h:1151
   ACM_MPEG_COPYRIGHT : constant := 16#2#;      --  mmreg.h:1152
   ACM_MPEG_ORIGINALHOME : constant := 16#4#;      --  mmreg.h:1153
   ACM_MPEG_PROTECTIONBIT : constant := 16#8#;      --  mmreg.h:1154
   ACM_MPEG_ID_MPEG1 : constant := 16#10#;     --  mmreg.h:1155
   WAVE_FILTER_UNKNOWN : constant := 16#0#;      --  mmreg.h:1308
   WAVE_FILTER_DEVELOPMENT : constant := 16#ffff#;   --  mmreg.h:1309
   WAVE_FILTER_VOLUME : constant := 16#1#;      --  mmreg.h:1325
   WAVE_FILTER_ECHO : constant := 16#2#;      --  mmreg.h:1339
   RIFFWAVE_inst : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('i', 'n', 's', 't');
   --  mmreg.h:1362
   RIFFCPPO : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('C', 'P', 'P', 'O');
   --  mmreg.h:1395
   RIFFCPPO_objr : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('o', 'b', 'j', 'r');
   --  mmreg.h:1397
   RIFFCPPO_obji : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('o', 'b', 'j', 'i');
   --  mmreg.h:1398
   RIFFCPPO_clsr : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('c', 'l', 's', 'r');
   --  mmreg.h:1400
   RIFFCPPO_clsi : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('c', 'l', 's', 'i');
   --  mmreg.h:1401
   RIFFCPPO_mbr : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('m', 'b', 'r', ' ');
   --  mmreg.h:1403
   RIFFCPPO_char : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('c', 'h', 'a', 'r');
   --  mmreg.h:1405
   RIFFCPPO_byte : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('b', 'y', 't', 'e');
   --  mmreg.h:1408
   RIFFCPPO_int : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('i', 'n', 't', ' ');
   --  mmreg.h:1409
   RIFFCPPO_word : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('w', 'o', 'r', 'd');
   --  mmreg.h:1410
   RIFFCPPO_long : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('l', 'o', 'n', 'g');
   --  mmreg.h:1411
   RIFFCPPO_dwrd : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('d', 'w', 'r', 'd');
   --  mmreg.h:1412
   RIFFCPPO_flt : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('f', 'l', 't', ' ');
   --  mmreg.h:1413
   RIFFCPPO_dbl : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('d', 'b', 'l', ' ');
   --  mmreg.h:1414
   RIFFCPPO_str : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem. mmioFOURCC ('s', 't', 'r', ' ');
   --  mmreg.h:1415
   BICOMP_IBMULTIMOTION : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem. mmioFOURCC ('U', 'L', 'T', 'I');
   --  mmreg.h:1463
   BICOMP_IBMPHOTOMOTION : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem. mmioFOURCC ('P', 'H', 'M', 'O');
   --  mmreg.h:1464
   BICOMP_CREATIVEYUV : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem. mmioFOURCC ('c', 'y', 'u', 'v');
   --  mmreg.h:1465
   JPEG_DIB : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem. mmioFOURCC ('J', 'P', 'E', 'G');
   --  mmreg.h:1470
   MJPG_DIB : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem. mmioFOURCC ('M', 'J', 'P', 'G');
   --  mmreg.h:1471
   JPEG_PROCESS_BASELINE : constant := 0;           --  mmreg.h:1474
   AVIIF_CONTROLFRAME : constant := 16#200#;    --  mmreg.h:1477
   JIFMK_SOF0 : constant := 16#ffc0#;   --  mmreg.h:1480
   JIFMK_SOF1 : constant := 16#ffc1#;   --  mmreg.h:1481
   JIFMK_SOF2 : constant := 16#ffc2#;   --  mmreg.h:1482
   JIFMK_SOF3 : constant := 16#ffc3#;   --  mmreg.h:1483
   JIFMK_SOF5 : constant := 16#ffc5#;   --  mmreg.h:1484
   JIFMK_SOF6 : constant := 16#ffc6#;   --  mmreg.h:1485
   JIFMK_SOF7 : constant := 16#ffc7#;   --  mmreg.h:1486
   JIFMK_JPG : constant := 16#ffc8#;   --  mmreg.h:1487
   JIFMK_SOF9 : constant := 16#ffc9#;   --  mmreg.h:1488
   JIFMK_SOF10 : constant := 16#ffca#;   --  mmreg.h:1489
   JIFMK_SOF11 : constant := 16#ffcb#;   --  mmreg.h:1490
   JIFMK_SOF13 : constant := 16#ffcd#;   --  mmreg.h:1491
   JIFMK_SOF14 : constant := 16#ffce#;   --  mmreg.h:1492
   JIFMK_SOF15 : constant := 16#ffcf#;   --  mmreg.h:1493
   JIFMK_DHT : constant := 16#ffc4#;   --  mmreg.h:1494
   JIFMK_DAC : constant := 16#ffcc#;   --  mmreg.h:1495
   JIFMK_RST0 : constant := 16#ffd0#;   --  mmreg.h:1496
   JIFMK_RST1 : constant := 16#ffd1#;   --  mmreg.h:1497
   JIFMK_RST2 : constant := 16#ffd2#;   --  mmreg.h:1498
   JIFMK_RST3 : constant := 16#ffd3#;   --  mmreg.h:1499
   JIFMK_RST4 : constant := 16#ffd4#;   --  mmreg.h:1500
   JIFMK_RST5 : constant := 16#ffd5#;   --  mmreg.h:1501
   JIFMK_RST6 : constant := 16#ffd6#;   --  mmreg.h:1502
   JIFMK_RST7 : constant := 16#ffd7#;   --  mmreg.h:1503
   JIFMK_SOI : constant := 16#ffd8#;   --  mmreg.h:1504
   JIFMK_EOI : constant := 16#ffd9#;   --  mmreg.h:1505
   JIFMK_SOS : constant := 16#ffda#;   --  mmreg.h:1506
   JIFMK_DQT : constant := 16#ffdb#;   --  mmreg.h:1507
   JIFMK_DNL : constant := 16#ffdc#;   --  mmreg.h:1508
   JIFMK_DRI : constant := 16#ffdd#;   --  mmreg.h:1509
   JIFMK_DHP : constant := 16#ffde#;   --  mmreg.h:1510
   JIFMK_EXP : constant := 16#ffdf#;   --  mmreg.h:1511
   JIFMK_APP0 : constant := 16#ffe0#;   --  mmreg.h:1512
   JIFMK_APP1 : constant := 16#ffe1#;   --  mmreg.h:1513
   JIFMK_APP2 : constant := 16#ffe2#;   --  mmreg.h:1514
   JIFMK_APP3 : constant := 16#ffe3#;   --  mmreg.h:1515
   JIFMK_APP4 : constant := 16#ffe4#;   --  mmreg.h:1516
   JIFMK_APP5 : constant := 16#ffe5#;   --  mmreg.h:1517
   JIFMK_APP6 : constant := 16#ffe6#;   --  mmreg.h:1518
   JIFMK_APP7 : constant := 16#ffe7#;   --  mmreg.h:1519
   JIFMK_JPG0 : constant := 16#fff0#;   --  mmreg.h:1520
   JIFMK_JPG1 : constant := 16#fff1#;   --  mmreg.h:1521
   JIFMK_JPG2 : constant := 16#fff2#;   --  mmreg.h:1522
   JIFMK_JPG3 : constant := 16#fff3#;   --  mmreg.h:1523
   JIFMK_JPG4 : constant := 16#fff4#;   --  mmreg.h:1524
   JIFMK_JPG5 : constant := 16#fff5#;   --  mmreg.h:1525
   JIFMK_JPG6 : constant := 16#fff6#;   --  mmreg.h:1526
   JIFMK_JPG7 : constant := 16#fff7#;   --  mmreg.h:1527
   JIFMK_JPG8 : constant := 16#fff8#;   --  mmreg.h:1528
   JIFMK_JPG9 : constant := 16#fff9#;   --  mmreg.h:1529
   JIFMK_JPG10 : constant := 16#fffa#;   --  mmreg.h:1530
   JIFMK_JPG11 : constant := 16#fffb#;   --  mmreg.h:1531
   JIFMK_JPG12 : constant := 16#fffc#;   --  mmreg.h:1532
   JIFMK_JPG13 : constant := 16#fffd#;   --  mmreg.h:1533
   JIFMK_COM : constant := 16#fffe#;   --  mmreg.h:1534
   JIFMK_TEM : constant := 16#ff01#;   --  mmreg.h:1535
   JIFMK_RES : constant := 16#ff02#;   --  mmreg.h:1536
   JIFMK_00 : constant := 16#ff00#;   --  mmreg.h:1537
   JIFMK_FF : constant := 16#ffff#;   --  mmreg.h:1538
   JPEG_Y : constant := 1;          --  mmreg.h:1542
   JPEG_YCbCr : constant := 2;          --  mmreg.h:1543
   JPEG_RGB : constant := 3;          --  mmreg.h:1544

   ICTYPE_VIDEO : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem. mmioFOURCC ('v', 'i', 'd', 'c');
   --  mmreg.h:1609
   ICTYPE_AUDIO : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem. mmioFOURCC ('a', 'u', 'd', 'c');
   --  mmreg.h:1610
   FOURCC_RDSP : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem. mmioFOURCC ('R', 'D', 'S', 'P');
   --  mmreg.h:1622

   MIXERCONTROL_CONTROLTYPE_SRS_MTS : constant := 16#20010006#;
   --  mmreg.h:1625
   MIXERCONTROL_CONTROLTYPE_SRS_ONOFF : constant := 16#20010007#;
   --  mmreg.h:1626
   MIXERCONTROL_CONTROLTYPE_SRS_SYNTHSELECT : constant := 16#20010008#;
   --  mmreg.h:1627

   type ADPCMCOEFSET;                                      --  mmreg.h:749
   type ADPCMWAVEFORMAT;                                   --  mmreg.h:768
   type DVIADPCMWAVEFORMAT;                                --  mmreg.h:789
   type IMAADPCMWAVEFORMAT;                                --  mmreg.h:806
   type MEDIASPACEADPCMWAVEFORMAT;                         --  mmreg.h:820
   type SIERRAADPCMWAVEFORMAT;                             --  mmreg.h:835
   type G723_ADPCMWAVEFORMAT;                              --  mmreg.h:852
   type DIGISTDWAVEFORMAT;                                 --  mmreg.h:868
   type DIGIFIXWAVEFORMAT;                                 --  mmreg.h:882
   type DIALOGICOKIADPCMWAVEFORMAT;                        --  mmreg.h:893
   type YAMAHA_ADPCMWAVEFORMAT;                            --  mmreg.h:908
   type SONARCWAVEFORMAT;                                  --  mmreg.h:923
   type TRUESPEECHWAVEFORMAT;                              --  mmreg.h:938
   type ECHOSC1WAVEFORMAT;                                 --  mmreg.h:955
   type AUDIOFILE_AF36WAVEFORMAT;                          --  mmreg.h:969
   type APTXWAVEFORMAT;                                    --  mmreg.h:982
   type AUDIOFILE_AF10WAVEFORMAT;                          --  mmreg.h:996
   type DOLBYAC2WAVEFORMAT;                                --  mmreg.h:1007
   type GSM610WAVEFORMAT;                                  --  mmreg.h:1015
   type ADPCMEWAVEFORMAT;                                  --  mmreg.h:1030
   type CONTRESVQLPCWAVEFORMAT;                            --  mmreg.h:1041
   type DIGIREALWAVEFORMAT;                                --  mmreg.h:1056
   type DIGIADPCMWAVEFORMAT;                               --  mmreg.h:1071
   type CONTRESCR10WAVEFORMAT;                             --  mmreg.h:1083
   type NMS_VBXADPCMWAVEFORMAT;                            --  mmreg.h:1100
   type G721_ADPCMWAVEFORMAT;                              --  mmreg.h:1116
   type MPEG1WAVEFORMAT;                                   --  mmreg.h:1129
   type CREATIVEADPCMWAVEFORMAT;                           --  mmreg.h:1165
   type CREATIVEFASTSPEECH8WAVEFORMAT;                     --  mmreg.h:1177
   type CREATIVEFASTSPEECH10WAVEFORMAT;                    --  mmreg.h:1188
   type FMTOWNS_SND_WAVEFORMAT;                            --  mmreg.h:1204
   type OLIGSMWAVEFORMAT;                                  --  mmreg.h:1219
   type OLIADPCMWAVEFORMAT;                                --  mmreg.h:1234
   type OLICELPWAVEFORMAT;                                 --  mmreg.h:1251
   type OLISBCWAVEFORMAT;                                  --  mmreg.h:1268
   type OLIOPRWAVEFORMAT;                                  --  mmreg.h:1285
   type WAVEFILTER;                                        --  mmreg.h:1311
   type VOLUMEWAVEFILTER;                                  --  mmreg.h:1328
   type ECHOWAVEFILTER;                                    --  mmreg.h:1342
   type s_RIFFWAVE_inst;                                   --  mmreg.h:1364
   type EXBMINFOHEADER;                                    --  mmreg.h:1445
   type JPEGINFOHEADER;                                    --  mmreg.h:1548

   type PADPCMCOEFSET is access all ADPCMCOEFSET;          --  mmreg.h:753
   subtype NPADPCMCOEFSET is PADPCMCOEFSET;                --  mmreg.h:754
   subtype LPADPCMCOEFSET is PADPCMCOEFSET;                --  mmreg.h:755

   type PADPCMWAVEFORMAT is access all ADPCMWAVEFORMAT;    --  mmreg.h:774
   subtype NPADPCMWAVEFORMAT is PADPCMWAVEFORMAT;          --  mmreg.h:775
   subtype LPADPCMWAVEFORMAT is PADPCMWAVEFORMAT;          --  mmreg.h:776

   type PDVIADPCMWAVEFORMAT is access all DVIADPCMWAVEFORMAT;
   --  mmreg.h:793
   subtype NPDVIADPCMWAVEFORMAT is PDVIADPCMWAVEFORMAT;    --  mmreg.h:794
   subtype LPDVIADPCMWAVEFORMAT is PDVIADPCMWAVEFORMAT;    --  mmreg.h:795

   type PIMAADPCMWAVEFORMAT is access all IMAADPCMWAVEFORMAT;
   --  mmreg.h:810
   subtype NPIMAADPCMWAVEFORMAT is PIMAADPCMWAVEFORMAT;    --  mmreg.h:811
   subtype LPIMAADPCMWAVEFORMAT is PIMAADPCMWAVEFORMAT;    --  mmreg.h:812

   type PMEDIASPACEADPCMWAVEFORMAT is access all MEDIASPACEADPCMWAVEFORMAT;
   --  mmreg.h:824
   subtype NPMEDIASPACEADPCMWAVEFORMAT is PMEDIASPACEADPCMWAVEFORMAT;
   --  mmreg.h:825
   subtype LPMEDIASPACEADPCMWAVEFORMAT is PMEDIASPACEADPCMWAVEFORMAT;
   --  mmreg.h:826

   type PSIERRAADPCMWAVEFORMAT is access all SIERRAADPCMWAVEFORMAT;
   --  mmreg.h:839
   subtype NPSIERRAADPCMWAVEFORMAT is PSIERRAADPCMWAVEFORMAT;
   --  mmreg.h:840
   subtype LPSIERRAADPCMWAVEFORMAT is PSIERRAADPCMWAVEFORMAT;
   --  mmreg.h:841

   type PG723_ADPCMWAVEFORMAT is access all G723_ADPCMWAVEFORMAT;
   --  mmreg.h:857
   subtype NPG723_ADPCMWAVEFORMAT is PG723_ADPCMWAVEFORMAT; --  mmreg.h:858
   subtype LPG723_ADPCMWAVEFORMAT is PG723_ADPCMWAVEFORMAT; --  mmreg.h:859

   type PDIGISTDWAVEFORMAT is access all DIGISTDWAVEFORMAT; --  mmreg.h:871
   subtype NPDIGISTDWAVEFORMAT is PDIGISTDWAVEFORMAT;      --  mmreg.h:872
   subtype LPDIGISTDWAVEFORMAT is PDIGISTDWAVEFORMAT;      --  mmreg.h:873

   type PDIGIFIXWAVEFORMAT is access all DIGIFIXWAVEFORMAT; --  mmreg.h:885
   subtype NPDIGIFIXWAVEFORMAT is PDIGIFIXWAVEFORMAT;      --  mmreg.h:886
   subtype LPDIGIFIXWAVEFORMAT is PDIGIFIXWAVEFORMAT;      --  mmreg.h:887

   type PDIALOGICOKIADPCMWAVEFORMAT is access all DIALOGICOKIADPCMWAVEFORMAT;
   --  mmreg.h:896
   subtype NPDIALOGICOKIADPCMWAVEFORMAT is PDIALOGICOKIADPCMWAVEFORMAT;
   --  mmreg.h:897
   subtype LPDIALOGICOKIADPCMWAVEFORMAT is PDIALOGICOKIADPCMWAVEFORMAT;
   --  mmreg.h:898

   type PYAMAHA_ADPCMWAVEFORMAT is access all YAMAHA_ADPCMWAVEFORMAT;
   --  mmreg.h:912
   subtype NPYAMAHA_ADPCMWAVEFORMAT is PYAMAHA_ADPCMWAVEFORMAT;
   --  mmreg.h:913
   subtype LPYAMAHA_ADPCMWAVEFORMAT is PYAMAHA_ADPCMWAVEFORMAT;
   --  mmreg.h:914

   type PSONARCWAVEFORMAT is access all SONARCWAVEFORMAT;  --  mmreg.h:927
   subtype NPSONARCWAVEFORMAT is PSONARCWAVEFORMAT;        --  mmreg.h:928
   subtype LPSONARCWAVEFORMAT is PSONARCWAVEFORMAT;        --  mmreg.h:929

   type PTRUESPEECHWAVEFORMAT is access all TRUESPEECHWAVEFORMAT;
   --  mmreg.h:944
   subtype NPTRUESPEECHWAVEFORMAT is PTRUESPEECHWAVEFORMAT; --  mmreg.h:945
   subtype LPTRUESPEECHWAVEFORMAT is PTRUESPEECHWAVEFORMAT; --  mmreg.h:946

   type PECHOSC1WAVEFORMAT is access all ECHOSC1WAVEFORMAT; --  mmreg.h:958
   subtype NPECHOSC1WAVEFORMAT is PECHOSC1WAVEFORMAT;       --  mmreg.h:959
   subtype LPECHOSC1WAVEFORMAT is PECHOSC1WAVEFORMAT;       --  mmreg.h:960

   type PAUDIOFILE_AF36WAVEFORMAT is access all AUDIOFILE_AF36WAVEFORMAT;
   --  mmreg.h:972
   subtype NPAUDIOFILE_AF36WAVEFORMAT is PAUDIOFILE_AF36WAVEFORMAT;
   --  mmreg.h:973
   subtype LPAUDIOFILE_AF36WAVEFORMAT is PAUDIOFILE_AF36WAVEFORMAT;
   --  mmreg.h:974

   type PAPTXWAVEFORMAT is access all APTXWAVEFORMAT;      --  mmreg.h:985
   subtype NPAPTXWAVEFORMAT is PAPTXWAVEFORMAT;            --  mmreg.h:986
   subtype LPAPTXWAVEFORMAT is PAPTXWAVEFORMAT;            --  mmreg.h:987

   type PAUDIOFILE_AF10WAVEFORMAT is access all AUDIOFILE_AF10WAVEFORMAT;
   --  mmreg.h:999
   subtype NPAUDIOFILE_AF10WAVEFORMAT is PAUDIOFILE_AF10WAVEFORMAT;
   --  mmreg.h:1000
   subtype LPAUDIOFILE_AF10WAVEFORMAT is PAUDIOFILE_AF10WAVEFORMAT;
   --  mmreg.h:1001

   type PGSM610WAVEFORMAT is access all GSM610WAVEFORMAT;  --  mmreg.h:1019
   subtype NPGSM610WAVEFORMAT is PGSM610WAVEFORMAT;        --  mmreg.h:1020
   subtype LPGSM610WAVEFORMAT is PGSM610WAVEFORMAT;        --  mmreg.h:1021

   type PADPCMEWAVEFORMAT is access all ADPCMEWAVEFORMAT;  --  mmreg.h:1034
   subtype NPADPCMEWAVEFORMAT is PADPCMEWAVEFORMAT;        --  mmreg.h:1035
   subtype LPADPCMEWAVEFORMAT is PADPCMEWAVEFORMAT;        --  mmreg.h:1036

   type PCONTRESVQLPCWAVEFORMAT is access all CONTRESVQLPCWAVEFORMAT;
   --  mmreg.h:1045
   subtype NPCONTRESVQLPCWAVEFORMAT is PCONTRESVQLPCWAVEFORMAT;
   --  mmreg.h:1046
   subtype LPCONTRESVQLPCWAVEFORMAT is PCONTRESVQLPCWAVEFORMAT;
   --  mmreg.h:1047

   type PDIGIREALWAVEFORMAT is access all DIGIREALWAVEFORMAT;
   --  mmreg.h:1060
   subtype NPDIGIREALWAVEFORMAT is PDIGIREALWAVEFORMAT;    --  mmreg.h:1061
   subtype LPDIGIREALWAVEFORMAT is PDIGIREALWAVEFORMAT;    --  mmreg.h:1062

   type PDIGIADPCMWAVEFORMAT is access all DIGIADPCMWAVEFORMAT;
   --  mmreg.h:1075
   subtype NPDIGIADPCMWAVEFORMAT is PDIGIADPCMWAVEFORMAT;  --  mmreg.h:1076
   subtype LPDIGIADPCMWAVEFORMAT is PDIGIADPCMWAVEFORMAT;  --  mmreg.h:1077

   type PCONTRESCR10WAVEFORMAT is access all CONTRESCR10WAVEFORMAT;
   --  mmreg.h:1087
   subtype NPCONTRESCR10WAVEFORMAT is PCONTRESCR10WAVEFORMAT;
   --  mmreg.h:1088
   subtype LPCONTRESCR10WAVEFORMAT is PCONTRESCR10WAVEFORMAT;
   --  mmreg.h:1089

   type PNMS_VBXADPCMWAVEFORMAT is access all NMS_VBXADPCMWAVEFORMAT;
   --  mmreg.h:1104
   subtype NPNMS_VBXADPCMWAVEFORMAT is PNMS_VBXADPCMWAVEFORMAT;
   --  mmreg.h:1105
   subtype LPNMS_VBXADPCMWAVEFORMAT is PNMS_VBXADPCMWAVEFORMAT;
   --  mmreg.h:1106

   type PG721_ADPCMWAVEFORMAT is access all G721_ADPCMWAVEFORMAT;
   --  mmreg.h:1120
   subtype NPG721_ADPCMWAVEFORMAT is PG721_ADPCMWAVEFORMAT; --  mmreg.h:1121
   subtype LPG721_ADPCMWAVEFORMAT is PG721_ADPCMWAVEFORMAT; --  mmreg.h:1122

   type PMPEG1WAVEFORMAT is access all MPEG1WAVEFORMAT;     --  mmreg.h:1140
   subtype NPMPEG1WAVEFORMAT is PMPEG1WAVEFORMAT;           --  mmreg.h:1141
   subtype LPMPEG1WAVEFORMAT is PMPEG1WAVEFORMAT;           --  mmreg.h:1142

   type PCREATIVEADPCMWAVEFORMAT is access all CREATIVEADPCMWAVEFORMAT;
   --  mmreg.h:1169
   subtype NPCREATIVEADPCMWAVEFORMAT is PCREATIVEADPCMWAVEFORMAT;
   --  mmreg.h:1170
   subtype LPCREATIVEADPCMWAVEFORMAT is PCREATIVEADPCMWAVEFORMAT;
   --  mmreg.h:1171

   type PCREATIVEFASTSPEECH8WAVEFORMAT is access all
     CREATIVEFASTSPEECH8WAVEFORMAT;                      --  mmreg.h:1181
   subtype NPCREATIVEFASTSPEECH8WAVEFORMAT is PCREATIVEFASTSPEECH8WAVEFORMAT;
   --  mmreg.h:1182
   subtype LPCREATIVEFASTSPEECH8WAVEFORMAT is PCREATIVEFASTSPEECH8WAVEFORMAT;
   --  mmreg.h:1183

   type PCREATIVEFASTSPEECH10WAVEFORMAT is access all
     CREATIVEFASTSPEECH10WAVEFORMAT;                     --  mmreg.h:1192
   subtype NPCREATIVEFASTSPEECH10WAVEFORMAT is PCREATIVEFASTSPEECH10WAVEFORMAT;
   --  mmreg.h:1193
   subtype LPCREATIVEFASTSPEECH10WAVEFORMAT is PCREATIVEFASTSPEECH10WAVEFORMAT;
   --  mmreg.h:1194

   type PFMTOWNS_SND_WAVEFORMAT is access all FMTOWNS_SND_WAVEFORMAT;
   --  mmreg.h:1208
   subtype NPFMTOWNS_SND_WAVEFORMAT is PFMTOWNS_SND_WAVEFORMAT;
   --  mmreg.h:1209
   subtype LPFMTOWNS_SND_WAVEFORMAT is PFMTOWNS_SND_WAVEFORMAT;
   --  mmreg.h:1210

   type POLIGSMWAVEFORMAT is access all OLIGSMWAVEFORMAT;  --  mmreg.h:1222
   subtype NPOLIGSMWAVEFORMAT is POLIGSMWAVEFORMAT;        --  mmreg.h:1223
   subtype LPOLIGSMWAVEFORMAT is POLIGSMWAVEFORMAT;        --  mmreg.h:1224

   type POLIADPCMWAVEFORMAT is access all OLIADPCMWAVEFORMAT;
   --  mmreg.h:1237
   subtype NPOLIADPCMWAVEFORMAT is POLIADPCMWAVEFORMAT;    --  mmreg.h:1238
   subtype LPOLIADPCMWAVEFORMAT is POLIADPCMWAVEFORMAT;    --  mmreg.h:1239

   type POLICELPWAVEFORMAT is access all OLICELPWAVEFORMAT; --  mmreg.h:1254
   subtype NPOLICELPWAVEFORMAT is POLICELPWAVEFORMAT;      --  mmreg.h:1255
   subtype LPOLICELPWAVEFORMAT is POLICELPWAVEFORMAT;      --  mmreg.h:1256

   type POLISBCWAVEFORMAT is access all OLISBCWAVEFORMAT;  --  mmreg.h:1271
   subtype NPOLISBCWAVEFORMAT is POLISBCWAVEFORMAT;        --  mmreg.h:1272
   subtype LPOLISBCWAVEFORMAT is POLISBCWAVEFORMAT;        --  mmreg.h:1273

   type POLIOPRWAVEFORMAT is access all OLIOPRWAVEFORMAT;  --  mmreg.h:1288
   subtype NPOLIOPRWAVEFORMAT is POLIOPRWAVEFORMAT;        --  mmreg.h:1289
   subtype LPOLIOPRWAVEFORMAT is POLIOPRWAVEFORMAT;        --  mmreg.h:1290

   type PWAVEFILTER is access all WAVEFILTER;              --  mmreg.h:1317
   subtype NPWAVEFILTER is PWAVEFILTER;                    --  mmreg.h:1318
   subtype LPWAVEFILTER is PWAVEFILTER;                    --  mmreg.h:1319

   type PVOLUMEWAVEFILTER is access all VOLUMEWAVEFILTER;  --  mmreg.h:1332
   subtype NPVOLUMEWAVEFILTER is PVOLUMEWAVEFILTER;        --  mmreg.h:1333
   subtype LPVOLUMEWAVEFILTER is PVOLUMEWAVEFILTER;        --  mmreg.h:1334

   type PECHOWAVEFILTER is access all ECHOWAVEFILTER;      --  mmreg.h:1347
   subtype NPECHOWAVEFILTER is PECHOWAVEFILTER;            --  mmreg.h:1348
   subtype LPECHOWAVEFILTER is PECHOWAVEFILTER;            --  mmreg.h:1349

   type ADPCMCOEFSET is                                    --  mmreg.h:749
      record
         iCoef1 : Win32.SHORT;                            --  mmreg.h:750
         iCoef2 : Win32.SHORT;                            --  mmreg.h:751
      end record;

   type ADPCMCOEFSET_Array is                              --  mmreg.h:772
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased ADPCMCOEFSET;

   type ADPCMWAVEFORMAT is                                 --  mmreg.h:768
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:769
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:770
         wNumCoef : Win32.WORD;                   --  mmreg.h:771
         aCoef : ADPCMCOEFSET_Array;           --  mmreg.h:772
      end record;

   type DVIADPCMWAVEFORMAT is                              --  mmreg.h:789
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:790
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:791
      end record;

   type IMAADPCMWAVEFORMAT is                              --  mmreg.h:806
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:807
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:808
      end record;

   type MEDIASPACEADPCMWAVEFORMAT is                       --  mmreg.h:820
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;         --  mmreg.h:821
         wRevision : Win32.WORD;                          --  mmreg.h:822
      end record;

   type SIERRAADPCMWAVEFORMAT is                           --  mmreg.h:835
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;         --  mmreg.h:836
         wRevision : Win32.WORD;                          --  mmreg.h:837
      end record;

   type G723_ADPCMWAVEFORMAT is                            --  mmreg.h:852
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;     --  mmreg.h:853
         cbExtraSize : Win32.WORD;                      --  mmreg.h:854
         nAuxBlockSize : Win32.WORD;                      --  mmreg.h:855
      end record;

   type DIGISTDWAVEFORMAT is                               --  mmreg.h:868
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:869
      end record;

   type DIGIFIXWAVEFORMAT is                               --  mmreg.h:882
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:883
      end record;

   type DIALOGICOKIADPCMWAVEFORMAT is                      --  mmreg.h:893
      record
         ewf : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:894
      end record;

   type YAMAHA_ADPCMWAVEFORMAT is                          --  mmreg.h:908
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:909
      end record;

   type SONARCWAVEFORMAT is                                --  mmreg.h:923
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;         --  mmreg.h:924
         wCompType : Win32.WORD;                          --  mmreg.h:925
      end record;

   type TRUESPEECHWAVEFORMAT is                            --  mmreg.h:938
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:939
         wRevision : Win32.WORD;                   --  mmreg.h:940
         nSamplesPerBlock : Win32.WORD;                   --  mmreg.h:941
         abReserved : Win32.BYTE_Array (0 .. 27);      --  mmreg.h:942
      end record;

   type ECHOSC1WAVEFORMAT is                               --  mmreg.h:955
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:956
      end record;

   type AUDIOFILE_AF36WAVEFORMAT is                        --  mmreg.h:969
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:970
      end record;

   type APTXWAVEFORMAT is                                  --  mmreg.h:982
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:983
      end record;

   type AUDIOFILE_AF10WAVEFORMAT is                        --  mmreg.h:996
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:997
      end record;

   type DOLBYAC2WAVEFORMAT is                              --  mmreg.h:1007
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;      --  mmreg.h:1008
         nAuxBitsCode : Win32.WORD;                       --  mmreg.h:1009
      end record;

   type GSM610WAVEFORMAT is                                --  mmreg.h:1015
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:1016
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:1017
      end record;

   type ADPCMEWAVEFORMAT is                                --  mmreg.h:1030
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:1031
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:1032
      end record;

   type CONTRESVQLPCWAVEFORMAT is                          --  mmreg.h:1041
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:1042
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:1043
      end record;

   type DIGIREALWAVEFORMAT is                              --  mmreg.h:1056
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:1057
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:1058
      end record;

   type DIGIADPCMWAVEFORMAT is                             --  mmreg.h:1071
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:1072
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:1073
      end record;

   type CONTRESCR10WAVEFORMAT is                           --  mmreg.h:1083
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:1084
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:1085
      end record;

   type NMS_VBXADPCMWAVEFORMAT is                          --  mmreg.h:1100
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;  --  mmreg.h:1101
         wSamplesPerBlock : Win32.WORD;                   --  mmreg.h:1102
      end record;

   type G721_ADPCMWAVEFORMAT is                            --  mmreg.h:1116
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;     --  mmreg.h:1117
         nAuxBlockSize : Win32.WORD;                      --  mmreg.h:1118
      end record;

   type MPEG1WAVEFORMAT is                                 --  mmreg.h:1129
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;     --  mmreg.h:1130
         fwHeadLayer : Win32.WORD;                      --  mmreg.h:1131
         dwHeadBitrate : Win32.DWORD;                     --  mmreg.h:1132
         fwHeadMode : Win32.WORD;                      --  mmreg.h:1133
         fwHeadModeExt : Win32.WORD;                      --  mmreg.h:1134
         wHeadEmphasis : Win32.WORD;                      --  mmreg.h:1135
         fwHeadFlags : Win32.WORD;                      --  mmreg.h:1136
         dwPTSLow : Win32.DWORD;                     --  mmreg.h:1137
         dwPTSHigh : Win32.DWORD;                     --  mmreg.h:1138
      end record;

   type CREATIVEADPCMWAVEFORMAT is                         --  mmreg.h:1165
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;         --  mmreg.h:1166
         wRevision : Win32.WORD;                          --  mmreg.h:1167
      end record;

   type CREATIVEFASTSPEECH8WAVEFORMAT is                   --  mmreg.h:1177
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;         --  mmreg.h:1178
         wRevision : Win32.WORD;                          --  mmreg.h:1179
      end record;

   type CREATIVEFASTSPEECH10WAVEFORMAT is                  --  mmreg.h:1188
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;         --  mmreg.h:1189
         wRevision : Win32.WORD;                          --  mmreg.h:1190
      end record;

   type FMTOWNS_SND_WAVEFORMAT is                          --  mmreg.h:1204
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;         --  mmreg.h:1205
         wRevision : Win32.WORD;                          --  mmreg.h:1206
      end record;

   type OLIGSMWAVEFORMAT is                                --  mmreg.h:1219
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:1220
      end record;

   type OLIADPCMWAVEFORMAT is                              --  mmreg.h:1234
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:1235
      end record;

   type OLICELPWAVEFORMAT is                               --  mmreg.h:1251
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:1252
      end record;

   type OLISBCWAVEFORMAT is                                --  mmreg.h:1268
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:1269
      end record;

   type OLIOPRWAVEFORMAT is                                --  mmreg.h:1285
      record
         wfx : Win32.Mmsystem.WAVEFORMATEX;               --  mmreg.h:1286
      end record;

   type WAVEFILTER is                                      --  mmreg.h:1311
      record
         cbStruct : Win32.DWORD;                       --  mmreg.h:1312
         dwFilterTag : Win32.DWORD;                       --  mmreg.h:1313
         fdwFilter : Win32.DWORD;                       --  mmreg.h:1314
         dwReserved : Win32.DWORD_Array (0 .. 4);           --  mmreg.h:1315
      end record;

   type VOLUMEWAVEFILTER is                                --  mmreg.h:1328
      record
         wfltr : WAVEFILTER;                           --  mmreg.h:1329
         dwVolume : Win32.DWORD;                          --  mmreg.h:1330
      end record;

   type ECHOWAVEFILTER is                                  --  mmreg.h:1342
      record
         wfltr : WAVEFILTER;                           --  mmreg.h:1343
         dwVolume : Win32.DWORD;                          --  mmreg.h:1344
         dwDelay : Win32.DWORD;                          --  mmreg.h:1345
      end record;

   type s_RIFFWAVE_inst is                                 --  mmreg.h:1364
      record
         bUnshiftedNote : Win32.BYTE;                     --  mmreg.h:1365
         chFineTune : Win32.CHAR;                     --  mmreg.h:1366
         chGain : Win32.CHAR;                     --  mmreg.h:1367
         bLowNote : Win32.BYTE;                     --  mmreg.h:1368
         bHighNote : Win32.BYTE;                     --  mmreg.h:1369
         bLowVelocity : Win32.BYTE;                     --  mmreg.h:1370
         bHighVelocity : Win32.BYTE;                     --  mmreg.h:1371
      end record;

   type EXBMINFOHEADER is                                  --  mmreg.h:1445
      record
         bmi : Win32.Wingdi.BITMAPINFOHEADER; --  mmreg.h:1446
         biExtDataOffset : Win32.DWORD;                   --  mmreg.h:1448
      end record;

   type JPEGINFOHEADER is                                  --  mmreg.h:1548
      record
         JPEGSize : Win32.DWORD;                 --  mmreg.h:1551
         JPEGProcess : Win32.DWORD;                 --  mmreg.h:1552
         JPEGColorSpaceID : Win32.DWORD;                 --  mmreg.h:1555
         JPEGBitsPerSample : Win32.DWORD;                 --  mmreg.h:1556
         JPEGHSubSampling : Win32.DWORD;                 --  mmreg.h:1557
         JPEGVSubSampling : Win32.DWORD;                 --  mmreg.h:1558
      end record;

private

   pragma Convention (C_Pass_By_Copy, ADPCMCOEFSET);        --  mmreg.h:749
   pragma Convention (C, ADPCMWAVEFORMAT);                  --  mmreg.h:768
   pragma Convention (C, DVIADPCMWAVEFORMAT);               --  mmreg.h:789
   pragma Convention (C, IMAADPCMWAVEFORMAT);               --  mmreg.h:806
   pragma Convention (C, MEDIASPACEADPCMWAVEFORMAT);        --  mmreg.h:820
   pragma Convention (C, SIERRAADPCMWAVEFORMAT);            --  mmreg.h:835
   pragma Convention (C, G723_ADPCMWAVEFORMAT);             --  mmreg.h:852
   pragma Convention (C, DIGISTDWAVEFORMAT);                --  mmreg.h:868
   pragma Convention (C, DIGIFIXWAVEFORMAT);                --  mmreg.h:882
   pragma Convention (C, DIALOGICOKIADPCMWAVEFORMAT);       --  mmreg.h:893
   pragma Convention (C, YAMAHA_ADPCMWAVEFORMAT);           --  mmreg.h:908
   pragma Convention (C, SONARCWAVEFORMAT);                 --  mmreg.h:923
   pragma Convention (C, TRUESPEECHWAVEFORMAT);             --  mmreg.h:938
   pragma Convention (C, ECHOSC1WAVEFORMAT);                --  mmreg.h:955
   pragma Convention (C, AUDIOFILE_AF36WAVEFORMAT);         --  mmreg.h:969
   pragma Convention (C, APTXWAVEFORMAT);                   --  mmreg.h:982
   pragma Convention (C, AUDIOFILE_AF10WAVEFORMAT);         --  mmreg.h:996
   pragma Convention (C, DOLBYAC2WAVEFORMAT);               --  mmreg.h:1007
   pragma Convention (C, GSM610WAVEFORMAT);                 --  mmreg.h:1015
   pragma Convention (C, ADPCMEWAVEFORMAT);                 --  mmreg.h:1030
   pragma Convention (C, CONTRESVQLPCWAVEFORMAT);           --  mmreg.h:1041
   pragma Convention (C, DIGIREALWAVEFORMAT);               --  mmreg.h:1056
   pragma Convention (C, DIGIADPCMWAVEFORMAT);              --  mmreg.h:1071
   pragma Convention (C, CONTRESCR10WAVEFORMAT);            --  mmreg.h:1083
   pragma Convention (C, NMS_VBXADPCMWAVEFORMAT);           --  mmreg.h:1100
   pragma Convention (C, G721_ADPCMWAVEFORMAT);             --  mmreg.h:1116
   pragma Convention (C, MPEG1WAVEFORMAT);                  --  mmreg.h:1129
   pragma Convention (C, CREATIVEADPCMWAVEFORMAT);          --  mmreg.h:1165
   pragma Convention (C, CREATIVEFASTSPEECH8WAVEFORMAT);    --  mmreg.h:1177
   pragma Convention (C, CREATIVEFASTSPEECH10WAVEFORMAT);   --  mmreg.h:1188
   pragma Convention (C, FMTOWNS_SND_WAVEFORMAT);           --  mmreg.h:1204
   pragma Convention (C, OLIGSMWAVEFORMAT);                 --  mmreg.h:1219
   pragma Convention (C, OLIADPCMWAVEFORMAT);               --  mmreg.h:1234
   pragma Convention (C, OLICELPWAVEFORMAT);                --  mmreg.h:1251
   pragma Convention (C, OLISBCWAVEFORMAT);                 --  mmreg.h:1268
   pragma Convention (C, OLIOPRWAVEFORMAT);                 --  mmreg.h:1285
   pragma Convention (C, WAVEFILTER);                       --  mmreg.h:1311
   pragma Convention (C, VOLUMEWAVEFILTER);                 --  mmreg.h:1328
   pragma Convention (C, ECHOWAVEFILTER);                   --  mmreg.h:1342
   pragma Convention (C_Pass_By_Copy, s_RIFFWAVE_inst);     --  mmreg.h:1364
   pragma Convention (C, EXBMINFOHEADER);                   --  mmreg.h:1445
   pragma Convention (C, JPEGINFOHEADER);                   --  mmreg.h:1548

end Win32.Mmreg;
