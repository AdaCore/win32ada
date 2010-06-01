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

with Win32.Mmsystem;
with Win32.Wingdi;

package Win32.Mmreg is

   INC_MMREG                         : constant := 144;
   MM_CREATIVE                       : constant := 2;
   MM_MEDIAVISION                    : constant := 3;
   MM_FUJITSU                        : constant := 4;
   MM_ARTISOFT                       : constant := 20;
   MM_TURTLE_BEACH                   : constant := 21;
   MM_IBM                            : constant := 22;
   MM_VOCALTEC                       : constant := 23;
   MM_ROLAND                         : constant := 24;
   MM_DSP_SOLUTIONS                  : constant := 25;
   MM_NEC                            : constant := 26;
   MM_ATI                            : constant := 27;
   MM_WANGLABS                       : constant := 28;
   MM_TANDY                          : constant := 29;
   MM_VOYETRA                        : constant := 30;
   MM_ANTEX                          : constant := 31;
   MM_ICL_PS                         : constant := 32;
   MM_INTEL                          : constant := 33;
   MM_GRAVIS                         : constant := 34;
   MM_VAL                            : constant := 35;
   MM_INTERACTIVE                    : constant := 36;
   MM_YAMAHA                         : constant := 37;
   MM_EVEREX                         : constant := 38;
   MM_ECHO                           : constant := 39;
   MM_SIERRA                         : constant := 40;
   MM_CAT                            : constant := 41;
   MM_APPS                           : constant := 42;
   MM_DSP_GROUP                      : constant := 43;
   MM_MELABS                         : constant := 44;
   MM_COMPUTER_FRIENDS               : constant := 45;
   MM_ESS                            : constant := 46;
   MM_AUDIOFILE                      : constant := 47;
   MM_MOTOROLA                       : constant := 48;
   MM_CANOPUS                        : constant := 49;
   MM_EPSON                          : constant := 50;
   MM_TRUEVISION                     : constant := 51;
   MM_AZTECH                         : constant := 52;
   MM_VIDEOLOGIC                     : constant := 53;
   MM_SCALACS                        : constant := 54;
   MM_KORG                           : constant := 55;
   MM_APT                            : constant := 56;
   MM_ICS                            : constant := 57;
   MM_ITERATEDSYS                    : constant := 58;
   MM_METHEUS                        : constant := 59;
   MM_LOGITECH                       : constant := 60;
   MM_WINNOV                         : constant := 61;
   MM_NCR                            : constant := 62;
   MM_EXAN                           : constant := 63;
   MM_AST                            : constant := 64;
   MM_WILLOWPOND                     : constant := 65;
   MM_SONICFOUNDRY                   : constant := 66;
   MM_VITEC                          : constant := 67;
   MM_MOSCOM                         : constant := 68;
   MM_SILICONSOFT                    : constant := 69;
   MM_SUPERMAC                       : constant := 73;
   MM_AUDIOPT                        : constant := 74;
   MM_SPEECHCOMP                     : constant := 76;
   MM_DOLBY                          : constant := 78;
   MM_OKI                            : constant := 79;
   MM_AURAVISION                     : constant := 80;
   MM_OLIVETTI                       : constant := 81;
   MM_IOMAGIC                        : constant := 82;
   MM_MATSUSHITA                     : constant := 83;
   MM_CONTROLRES                     : constant := 84;
   MM_XEBEC                          : constant := 85;
   MM_NEWMEDIA                       : constant := 86;
   MM_NMS                            : constant := 87;
   MM_LYRRUS                         : constant := 88;
   MM_COMPUSIC                       : constant := 89;
   MM_OPTI                           : constant := 90;
   MM_DIALOGIC                       : constant := 93;
   MM_PCSPEAKER_WAVEOUT              : constant := 13;
   MM_MSFT_WSS_WAVEIN                : constant := 14;
   MM_MSFT_WSS_WAVEOUT               : constant := 15;
   MM_MSFT_WSS_FMSYNTH_STEREO        : constant := 16;
   MM_MSFT_WSS_MIXER                 : constant := 17;
   MM_MSFT_WSS_OEM_WAVEIN            : constant := 18;
   MM_MSFT_WSS_OEM_WAVEOUT           : constant := 19;
   MM_MSFT_WSS_OEM_FMSYNTH_STEREO    : constant := 20;
   MM_MSFT_WSS_AUX                   : constant := 21;
   MM_MSFT_WSS_OEM_AUX               : constant := 22;
   MM_MSFT_GENERIC_WAVEIN            : constant := 23;
   MM_MSFT_GENERIC_WAVEOUT           : constant := 24;
   MM_MSFT_GENERIC_MIDIIN            : constant := 25;
   MM_MSFT_GENERIC_MIDIOUT           : constant := 26;
   MM_MSFT_GENERIC_MIDISYNTH         : constant := 27;
   MM_MSFT_GENERIC_AUX_LINE          : constant := 28;
   MM_MSFT_GENERIC_AUX_MIC           : constant := 29;
   MM_MSFT_GENERIC_AUX_CD            : constant := 30;
   MM_MSFT_WSS_OEM_MIXER             : constant := 31;
   MM_MSFT_MSACM                     : constant := 32;
   MM_MSFT_ACM_MSADPCM               : constant := 33;
   MM_MSFT_ACM_IMAADPCM              : constant := 34;
   MM_MSFT_ACM_MSFILTER              : constant := 35;
   MM_MSFT_ACM_GSM610                : constant := 36;
   MM_MSFT_ACM_G711                  : constant := 37;
   MM_MSFT_ACM_PCM                   : constant := 38;
   MM_WSS_SB16_WAVEIN                : constant := 39;
   MM_WSS_SB16_WAVEOUT               : constant := 40;
   MM_WSS_SB16_MIDIIN                : constant := 41;
   MM_WSS_SB16_MIDIOUT               : constant := 42;
   MM_WSS_SB16_SYNTH                 : constant := 43;
   MM_WSS_SB16_AUX_LINE              : constant := 44;
   MM_WSS_SB16_AUX_CD                : constant := 45;
   MM_WSS_SB16_MIXER                 : constant := 46;
   MM_WSS_SBPRO_WAVEIN               : constant := 47;
   MM_WSS_SBPRO_WAVEOUT              : constant := 48;
   MM_WSS_SBPRO_MIDIIN               : constant := 49;
   MM_WSS_SBPRO_MIDIOUT              : constant := 50;
   MM_WSS_SBPRO_SYNTH                : constant := 51;
   MM_WSS_SBPRO_AUX_LINE             : constant := 52;
   MM_WSS_SBPRO_AUX_CD               : constant := 53;
   MM_WSS_SBPRO_MIXER                : constant := 54;
   MM_MSFT_WSS_NT_WAVEIN             : constant := 55;
   MM_MSFT_WSS_NT_WAVEOUT            : constant := 56;
   MM_MSFT_WSS_NT_FMSYNTH_STEREO     : constant := 57;
   MM_MSFT_WSS_NT_MIXER              : constant := 58;
   MM_MSFT_WSS_NT_AUX                : constant := 59;
   MM_MSFT_SB16_WAVEIN               : constant := 60;
   MM_MSFT_SB16_WAVEOUT              : constant := 61;
   MM_MSFT_SB16_MIDIIN               : constant := 62;
   MM_MSFT_SB16_MIDIOUT              : constant := 63;
   MM_MSFT_SB16_SYNTH                : constant := 64;
   MM_MSFT_SB16_AUX_LINE             : constant := 65;
   MM_MSFT_SB16_AUX_CD               : constant := 66;
   MM_MSFT_SB16_MIXER                : constant := 67;
   MM_MSFT_SBPRO_WAVEIN              : constant := 68;
   MM_MSFT_SBPRO_WAVEOUT             : constant := 69;
   MM_MSFT_SBPRO_MIDIIN              : constant := 70;
   MM_MSFT_SBPRO_MIDIOUT             : constant := 71;
   MM_MSFT_SBPRO_SYNTH               : constant := 72;
   MM_MSFT_SBPRO_AUX_LINE            : constant := 73;
   MM_MSFT_SBPRO_AUX_CD              : constant := 74;
   MM_MSFT_SBPRO_MIXER               : constant := 75;
   MM_MSFT_MSOPL_SYNTH               : constant := 76;
   MM_CREATIVE_SB15_WAVEIN           : constant := 1;
   MM_CREATIVE_SB20_WAVEIN           : constant := 2;
   MM_CREATIVE_SBPRO_WAVEIN          : constant := 3;
   MM_CREATIVE_SBP16_WAVEIN          : constant := 4;
   MM_CREATIVE_SB15_WAVEOUT          : constant := 101;
   MM_CREATIVE_SB20_WAVEOUT          : constant := 102;
   MM_CREATIVE_SBPRO_WAVEOUT         : constant := 103;
   MM_CREATIVE_SBP16_WAVEOUT         : constant := 104;
   MM_CREATIVE_MIDIOUT               : constant := 201;
   MM_CREATIVE_MIDIIN                : constant := 202;
   MM_CREATIVE_FMSYNTH_MONO          : constant := 301;
   MM_CREATIVE_FMSYNTH_STEREO        : constant := 302;
   MM_CREATIVE_AUX_CD                : constant := 401;
   MM_CREATIVE_AUX_LINE              : constant := 402;
   MM_CREATIVE_AUX_MIC               : constant := 403;
   MM_CREATIVE_AUX_MASTER            : constant := 404;
   MM_CREATIVE_AUX_PCSPK             : constant := 405;
   MM_CREATIVE_AUX_WAVE              : constant := 406;
   MM_CREATIVE_AUX_MIDI              : constant := 407;
   MM_CREATIVE_SBPRO_MIXER           : constant := 408;
   MM_CREATIVE_SB16_MIXER            : constant := 409;
   MM_MEDIAVISION_PROAUDIO           : constant := 16#10#;
   MM_PROAUD_MIDIOUT                 : constant := 16#11#;
   MM_PROAUD_MIDIIN                  : constant := 16#12#;
   MM_PROAUD_SYNTH                   : constant := 16#13#;
   MM_PROAUD_WAVEOUT                 : constant := 16#14#;
   MM_PROAUD_WAVEIN                  : constant := 16#15#;
   MM_PROAUD_MIXER                   : constant := 16#16#;
   MM_PROAUD_AUX                     : constant := 16#17#;
   MM_MEDIAVISION_THUNDER            : constant := 16#20#;
   MM_THUNDER_SYNTH                  : constant := 16#23#;
   MM_THUNDER_WAVEOUT                : constant := 16#24#;
   MM_THUNDER_WAVEIN                 : constant := 16#25#;
   MM_THUNDER_AUX                    : constant := 16#27#;
   MM_MEDIAVISION_TPORT              : constant := 16#40#;
   MM_TPORT_WAVEOUT                  : constant := 16#41#;
   MM_TPORT_WAVEIN                   : constant := 16#42#;
   MM_TPORT_SYNTH                    : constant := 16#43#;
   MM_MEDIAVISION_PROAUDIO_PLUS      : constant := 16#50#;
   MM_PROAUD_PLUS_MIDIOUT            : constant := 16#51#;
   MM_PROAUD_PLUS_MIDIIN             : constant := 16#52#;
   MM_PROAUD_PLUS_SYNTH              : constant := 16#53#;
   MM_PROAUD_PLUS_WAVEOUT            : constant := 16#54#;
   MM_PROAUD_PLUS_WAVEIN             : constant := 16#55#;
   MM_PROAUD_PLUS_MIXER              : constant := 16#56#;
   MM_PROAUD_PLUS_AUX                : constant := 16#57#;
   MM_MEDIAVISION_PROAUDIO_16        : constant := 16#60#;
   MM_PROAUD_16_MIDIOUT              : constant := 16#61#;
   MM_PROAUD_16_MIDIIN               : constant := 16#62#;
   MM_PROAUD_16_SYNTH                : constant := 16#63#;
   MM_PROAUD_16_WAVEOUT              : constant := 16#64#;
   MM_PROAUD_16_WAVEIN               : constant := 16#65#;
   MM_PROAUD_16_MIXER                : constant := 16#66#;
   MM_PROAUD_16_AUX                  : constant := 16#67#;
   MM_MEDIAVISION_PROSTUDIO_16       : constant := 16#60#;
   MM_STUDIO_16_MIDIOUT              : constant := 16#61#;
   MM_STUDIO_16_MIDIIN               : constant := 16#62#;
   MM_STUDIO_16_SYNTH                : constant := 16#63#;
   MM_STUDIO_16_WAVEOUT              : constant := 16#64#;
   MM_STUDIO_16_WAVEIN               : constant := 16#65#;
   MM_STUDIO_16_MIXER                : constant := 16#66#;
   MM_STUDIO_16_AUX                  : constant := 16#67#;
   MM_MEDIAVISION_CDPC               : constant := 16#70#;
   MM_CDPC_MIDIOUT                   : constant := 16#71#;
   MM_CDPC_MIDIIN                    : constant := 16#72#;
   MM_CDPC_SYNTH                     : constant := 16#73#;
   MM_CDPC_WAVEOUT                   : constant := 16#74#;
   MM_CDPC_WAVEIN                    : constant := 16#75#;
   MM_CDPC_MIXER                     : constant := 16#76#;
   MM_CDPC_AUX                       : constant := 16#77#;
   MM_MEDIAVISION_OPUS1208           : constant := 16#80#;
   MM_OPUS401_MIDIOUT                : constant := 16#81#;
   MM_OPUS401_MIDIIN                 : constant := 16#82#;
   MM_OPUS1208_SYNTH                 : constant := 16#83#;
   MM_OPUS1208_WAVEOUT               : constant := 16#84#;
   MM_OPUS1208_WAVEIN                : constant := 16#85#;
   MM_OPUS1208_MIXER                 : constant := 16#86#;
   MM_OPUS1208_AUX                   : constant := 16#87#;
   MM_MEDIAVISION_OPUS1216           : constant := 16#90#;
   MM_OPUS1216_MIDIOUT               : constant := 16#91#;
   MM_OPUS1216_MIDIIN                : constant := 16#92#;
   MM_OPUS1216_SYNTH                 : constant := 16#93#;
   MM_OPUS1216_WAVEOUT               : constant := 16#94#;
   MM_OPUS1216_WAVEIN                : constant := 16#95#;
   MM_OPUS1216_MIXER                 : constant := 16#96#;
   MM_OPUS1216_AUX                   : constant := 16#97#;
   MM_ARTISOFT_SBWAVEIN              : constant := 1;
   MM_ARTISOFT_SBWAVEOUT             : constant := 2;
   MM_MMOTION_WAVEAUX                : constant := 1;
   MM_MMOTION_WAVEOUT                : constant := 2;
   MM_MMOTION_WAVEIN                 : constant := 3;
   MM_IBM_PCMCIA_WAVEIN              : constant := 11;
   MM_IBM_PCMCIA_WAVEOUT             : constant := 12;
   MM_IBM_PCMCIA_SYNTH               : constant := 13;
   MM_IBM_PCMCIA_MIDIIN              : constant := 14;
   MM_IBM_PCMCIA_MIDIOUT             : constant := 15;
   MM_IBM_PCMCIA_AUX                 : constant := 16;
   MM_VOCALTEC_WAVEOUT               : constant := 1;
   MM_VOCALTEC_WAVEIN                : constant := 2;
   MM_ROLAND_MPU401_MIDIOUT          : constant := 15;
   MM_ROLAND_MPU401_MIDIIN           : constant := 16;
   MM_ROLAND_SMPU_MIDIOUTA           : constant := 17;
   MM_ROLAND_SMPU_MIDIOUTB           : constant := 18;
   MM_ROLAND_SMPU_MIDIINA            : constant := 19;
   MM_ROLAND_SMPU_MIDIINB            : constant := 20;
   MM_ROLAND_SC7_MIDIOUT             : constant := 21;
   MM_ROLAND_SC7_MIDIIN              : constant := 22;
   MM_ROLAND_SERIAL_MIDIOUT          : constant := 23;
   MM_ROLAND_SERIAL_MIDIIN           : constant := 24;
   MM_DSP_SOLUTIONS_WAVEOUT          : constant := 1;
   MM_DSP_SOLUTIONS_WAVEIN           : constant := 2;
   MM_DSP_SOLUTIONS_SYNTH            : constant := 3;
   MM_DSP_SOLUTIONS_AUX              : constant := 4;
   MM_WANGLABS_WAVEIN1               : constant := 1;
   MM_WANGLABS_WAVEOUT1              : constant := 2;
   MM_TANDY_VISWAVEIN                : constant := 1;
   MM_TANDY_VISWAVEOUT               : constant := 2;
   MM_TANDY_VISBIOSSYNTH             : constant := 3;
   MM_TANDY_SENS_MMAWAVEIN           : constant := 4;
   MM_TANDY_SENS_MMAWAVEOUT          : constant := 5;
   MM_TANDY_SENS_MMAMIDIIN           : constant := 6;
   MM_TANDY_SENS_MMAMIDIOUT          : constant := 7;
   MM_TANDY_SENS_VISWAVEOUT          : constant := 8;
   MM_TANDY_PSSJWAVEIN               : constant := 9;
   MM_TANDY_PSSJWAVEOUT              : constant := 10;
   MM_INTELOPD_WAVEIN                : constant := 1;
   MM_INTELOPD_WAVEOUT               : constant := 101;
   MM_INTELOPD_AUX                   : constant := 401;
   MM_INTERACTIVE_WAVEIN             : constant := 16#45#;
   MM_INTERACTIVE_WAVEOUT            : constant := 16#45#;
   MM_YAMAHA_GSS_SYNTH               : constant := 16#1#;
   MM_YAMAHA_GSS_WAVEOUT             : constant := 16#2#;
   MM_YAMAHA_GSS_WAVEIN              : constant := 16#3#;
   MM_YAMAHA_GSS_MIDIOUT             : constant := 16#4#;
   MM_YAMAHA_GSS_MIDIIN              : constant := 16#5#;
   MM_YAMAHA_GSS_AUX                 : constant := 16#6#;
   MM_EVEREX_CARRIER                 : constant := 16#1#;
   MM_ECHO_SYNTH                     : constant := 16#1#;
   MM_ECHO_WAVEOUT                   : constant := 16#2#;
   MM_ECHO_WAVEIN                    : constant := 16#3#;
   MM_ECHO_MIDIOUT                   : constant := 16#4#;
   MM_ECHO_MIDIIN                    : constant := 16#5#;
   MM_ECHO_AUX                       : constant := 16#6#;
   MM_SIERRA_ARIA_MIDIOUT            : constant := 16#14#;
   MM_SIERRA_ARIA_MIDIIN             : constant := 16#15#;
   MM_SIERRA_ARIA_SYNTH              : constant := 16#16#;
   MM_SIERRA_ARIA_WAVEOUT            : constant := 16#17#;
   MM_SIERRA_ARIA_WAVEIN             : constant := 16#18#;
   MM_SIERRA_ARIA_AUX                : constant := 16#19#;
   MM_SIERRA_ARIA_AUX2               : constant := 16#20#;
   MM_CAT_WAVEOUT                    : constant := 1;
   MM_DSP_GROUP_TRUESPEECH           : constant := 16#1#;
   MM_MELABS_MIDI2GO                 : constant := 16#1#;
   MM_ESS_AMWAVEOUT                  : constant := 16#1#;
   MM_ESS_AMWAVEIN                   : constant := 16#2#;
   MM_ESS_AMAUX                      : constant := 16#3#;
   MM_ESS_AMSYNTH                    : constant := 16#4#;
   MM_ESS_AMMIDIOUT                  : constant := 16#5#;
   MM_ESS_AMMIDIIN                   : constant := 16#6#;
   MM_EPS_FMSND                      : constant := 1;
   MM_TRUEVISION_WAVEIN1             : constant := 1;
   MM_TRUEVISION_WAVEOUT1            : constant := 2;
   MM_AZTECH_MIDIOUT                 : constant := 3;
   MM_AZTECH_MIDIIN                  : constant := 4;
   MM_AZTECH_WAVEIN                  : constant := 17;
   MM_AZTECH_WAVEOUT                 : constant := 18;
   MM_AZTECH_FMSYNTH                 : constant := 20;
   MM_AZTECH_PRO16_WAVEIN            : constant := 33;
   MM_AZTECH_PRO16_WAVEOUT           : constant := 34;
   MM_AZTECH_PRO16_FMSYNTH           : constant := 38;
   MM_AZTECH_DSP16_WAVEIN            : constant := 65;
   MM_AZTECH_DSP16_WAVEOUT           : constant := 66;
   MM_AZTECH_DSP16_FMSYNTH           : constant := 68;
   MM_AZTECH_DSP16_WAVESYNTH         : constant := 70;
   MM_AZTECH_AUX_CD                  : constant := 401;
   MM_AZTECH_AUX_LINE                : constant := 402;
   MM_AZTECH_AUX_MIC                 : constant := 403;
   MM_VIDEOLOGIC_MSWAVEIN            : constant := 1;
   MM_VIDEOLOGIC_MSWAVEOUT           : constant := 2;
   MM_KORG_PCIF_MIDIOUT              : constant := 1;
   MM_KORG_PCIF_MIDIIN               : constant := 2;
   MM_APT_ACE100CD                   : constant := 1;
   MM_ICS_WAVEDECK_WAVEOUT           : constant := 1;
   MM_ICS_WAVEDECK_WAVEIN            : constant := 2;
   MM_ICS_WAVEDECK_MIXER             : constant := 3;
   MM_ICS_WAVEDECK_AUX               : constant := 4;
   MM_ICS_WAVEDECK_SYNTH             : constant := 5;
   MM_ITERATEDSYS_FUFCODEC           : constant := 1;
   MM_METHEUS_ZIPPER                 : constant := 1;
   MM_WINNOV_CAVIAR_WAVEIN           : constant := 1;
   MM_WINNOV_CAVIAR_WAVEOUT          : constant := 2;
   MM_WINNOV_CAVIAR_VIDC             : constant := 3;
   MM_WINNOV_CAVIAR_CHAMPAGNE        : constant := 4;
   MM_WINNOV_CAVIAR_YUV8             : constant := 5;
   MM_NCR_BA_WAVEIN                  : constant := 1;
   MM_NCR_BA_WAVEOUT                 : constant := 2;
   MM_NCR_BA_SYNTH                   : constant := 3;
   MM_NCR_BA_AUX                     : constant := 4;
   MM_NCR_BA_MIXER                   : constant := 5;
   MM_VITEC_VMAKER                   : constant := 1;
   MM_VITEC_VMPRO                    : constant := 2;
   MM_MOSCOM_VPC2400                 : constant := 1;
   MM_SILICONSOFT_SC1_WAVEIN         : constant := 1;
   MM_SILICONSOFT_SC1_WAVEOUT        : constant := 2;
   MM_SILICONSOFT_SC2_WAVEIN         : constant := 3;
   MM_SILICONSOFT_SC2_WAVEOUT        : constant := 4;
   MM_SILICONSOFT_SOUNDJR2_WAVEOUT   : constant := 5;
   MM_SILICONSOFT_SOUNDJR2PR_WAVEIN  : constant := 6;
   MM_SILICONSOFT_SOUNDJR2PR_WAVEOUT : constant := 7;
   MM_SILICONSOFT_SOUNDJR3_WAVEOUT   : constant := 8;
   MM_OLIVETTI_WAVEIN                : constant := 1;
   MM_OLIVETTI_WAVEOUT               : constant := 2;
   MM_OLIVETTI_MIXER                 : constant := 3;
   MM_OLIVETTI_AUX                   : constant := 4;
   MM_OLIVETTI_MIDIIN                : constant := 5;
   MM_OLIVETTI_MIDIOUT               : constant := 6;
   MM_OLIVETTI_SYNTH                 : constant := 7;
   MM_OLIVETTI_JOYSTICK              : constant := 8;
   MM_OLIVETTI_ACM_GSM               : constant := 9;
   MM_OLIVETTI_ACM_ADPCM             : constant := 10;
   MM_OLIVETTI_ACM_CELP              : constant := 11;
   MM_OLIVETTI_ACM_SBC               : constant := 12;
   MM_OLIVETTI_ACM_OPR               : constant := 13;
   MM_IOMAGIC_TEMPO_WAVEOUT          : constant := 1;
   MM_IOMAGIC_TEMPO_WAVEIN           : constant := 2;
   MM_IOMAGIC_TEMPO_SYNTH            : constant := 3;
   MM_IOMAGIC_TEMPO_MIDIOUT          : constant := 4;
   MM_IOMAGIC_TEMPO_MXDOUT           : constant := 5;
   MM_IOMAGIC_TEMPO_AUXOUT           : constant := 6;
   MM_MATSUSHITA_WAVEIN              : constant := 1;
   MM_MATSUSHITA_WAVEOUT             : constant := 2;
   MM_MATSUSHITA_FMSYNTH_STEREO      : constant := 3;
   MM_MATSUSHITA_MIXER               : constant := 4;
   MM_MATSUSHITA_AUX                 : constant := 5;
   MM_NEWMEDIA_WAVJAMMER             : constant := 1;
   MM_LYRRUS_BRIDGE_GUITAR           : constant := 1;
   MM_OPTI_M16_FMSYNTH_STEREO        : constant := 16#1#;
   MM_OPTI_M16_MIDIIN                : constant := 16#2#;
   MM_OPTI_M16_MIDIOUT               : constant := 16#3#;
   MM_OPTI_M16_WAVEIN                : constant := 16#4#;
   MM_OPTI_M16_WAVEOUT               : constant := 16#5#;
   MM_OPTI_M16_MIXER                 : constant := 16#6#;
   MM_OPTI_M16_AUX                   : constant := 16#7#;
   MM_OPTI_P16_FMSYNTH_STEREO        : constant := 16#10#;
   MM_OPTI_P16_MIDIIN                : constant := 16#11#;
   MM_OPTI_P16_MIDIOUT               : constant := 16#12#;
   MM_OPTI_P16_WAVEIN                : constant := 16#13#;
   MM_OPTI_P16_WAVEOUT               : constant := 16#14#;
   MM_OPTI_P16_MIXER                 : constant := 16#15#;
   MM_OPTI_P16_AUX                   : constant := 16#16#;
   MM_OPTI_M32_WAVEIN                : constant := 16#20#;
   MM_OPTI_M32_WAVEOUT               : constant := 16#21#;
   MM_OPTI_M32_MIDIIN                : constant := 16#22#;
   MM_OPTI_M32_MIDIOUT               : constant := 16#23#;
   MM_OPTI_M32_SYNTH_STEREO          : constant := 16#24#;
   MM_OPTI_M32_MIXER                 : constant := 16#25#;
   MM_OPTI_M32_AUX                   : constant := 16#26#;

   RIFFINFO_IARL : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'A', 'R', 'L');
   RIFFINFO_IART : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'A', 'R', 'T');
   RIFFINFO_ICMS : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'C', 'M', 'S');
   RIFFINFO_ICMT : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'C', 'M', 'T');
   RIFFINFO_ICOP : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'C', 'O', 'P');
   RIFFINFO_ICRD : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'C', 'R', 'D');
   RIFFINFO_ICRP : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'C', 'R', 'P');
   RIFFINFO_IDIM : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'D', 'I', 'M');
   RIFFINFO_IDPI : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'D', 'P', 'I');
   RIFFINFO_IENG : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'E', 'N', 'G');
   RIFFINFO_IGNR : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'G', 'N', 'R');
   RIFFINFO_IKEY : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'K', 'E', 'Y');
   RIFFINFO_ILGT : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'L', 'G', 'T');
   RIFFINFO_IMED : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'M', 'E', 'D');
   RIFFINFO_INAM : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'N', 'A', 'M');
   RIFFINFO_IPLT : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'P', 'L', 'T');
   RIFFINFO_IPRD : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'P', 'R', 'D');
   RIFFINFO_ISBJ : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'S', 'B', 'J');
   RIFFINFO_ISFT : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'S', 'F', 'T');
   RIFFINFO_ISHP : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'S', 'H', 'P');
   RIFFINFO_ISRC : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'S', 'R', 'C');
   RIFFINFO_ISRF : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'S', 'R', 'F');
   RIFFINFO_ITCH : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'T', 'C', 'H');
   RIFFINFO_ISMP : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'S', 'M', 'P');
   RIFFINFO_IDIT : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'D', 'I', 'T');

   WAVE_FORMAT_UNKNOWN               : constant := 16#0#;
   WAVE_FORMAT_ADPCM                 : constant := 16#2#;
   WAVE_FORMAT_IBM_CVSD              : constant := 16#5#;
   WAVE_FORMAT_ALAW                  : constant := 16#6#;
   WAVE_FORMAT_MULAW                 : constant := 16#7#;
   WAVE_FORMAT_OKI_ADPCM             : constant := 16#10#;
   WAVE_FORMAT_DVI_ADPCM             : constant := 16#11#;
   WAVE_FORMAT_IMA_ADPCM             : constant := 16#11#;
   WAVE_FORMAT_MEDIASPACE_ADPCM      : constant := 16#12#;
   WAVE_FORMAT_SIERRA_ADPCM          : constant := 16#13#;
   WAVE_FORMAT_G723_ADPCM            : constant := 16#14#;
   WAVE_FORMAT_DIGISTD               : constant := 16#15#;
   WAVE_FORMAT_DIGIFIX               : constant := 16#16#;
   WAVE_FORMAT_DIALOGIC_OKI_ADPCM    : constant := 16#17#;
   WAVE_FORMAT_YAMAHA_ADPCM          : constant := 16#20#;
   WAVE_FORMAT_SONARC                : constant := 16#21#;
   WAVE_FORMAT_DSPGROUP_TRUESPEECH   : constant := 16#22#;
   WAVE_FORMAT_ECHOSC1               : constant := 16#23#;
   WAVE_FORMAT_AUDIOFILE_AF36        : constant := 16#24#;
   WAVE_FORMAT_APTX                  : constant := 16#25#;
   WAVE_FORMAT_AUDIOFILE_AF10        : constant := 16#26#;
   WAVE_FORMAT_DOLBY_AC2             : constant := 16#30#;
   WAVE_FORMAT_GSM610                : constant := 16#31#;
   WAVE_FORMAT_ANTEX_ADPCME          : constant := 16#33#;
   WAVE_FORMAT_CONTROL_RES_VQLPC     : constant := 16#34#;
   WAVE_FORMAT_DIGIREAL              : constant := 16#35#;
   WAVE_FORMAT_DIGIADPCM             : constant := 16#36#;
   WAVE_FORMAT_CONTROL_RES_CR10      : constant := 16#37#;
   WAVE_FORMAT_NMS_VBXADPCM          : constant := 16#38#;
   WAVE_FORMAT_G721_ADPCM            : constant := 16#40#;
   WAVE_FORMAT_MPEG                  : constant := 16#50#;
   WAVE_FORMAT_CREATIVE_ADPCM        : constant := 16#200#;
   WAVE_FORMAT_CREATIVE_FASTSPEECH8  : constant := 16#202#;
   WAVE_FORMAT_CREATIVE_FASTSPEECH10 : constant := 16#203#;
   WAVE_FORMAT_FM_TOWNS_SND          : constant := 16#300#;
   WAVE_FORMAT_OLIGSM                : constant := 16#1000#;
   WAVE_FORMAT_OLIADPCM              : constant := 16#1001#;
   WAVE_FORMAT_OLICELP               : constant := 16#1002#;
   WAVE_FORMAT_OLISBC                : constant := 16#1003#;
   WAVE_FORMAT_OLIOPR                : constant := 16#1004#;
   WAVE_FORMAT_DEVELOPMENT           : constant := 16#ffff#;
   ACM_MPEG_LAYER1                   : constant := 16#1#;
   ACM_MPEG_LAYER2                   : constant := 16#2#;
   ACM_MPEG_LAYER3                   : constant := 16#4#;
   ACM_MPEG_STEREO                   : constant := 16#1#;
   ACM_MPEG_JOINTSTEREO              : constant := 16#2#;
   ACM_MPEG_DUALCHANNEL              : constant := 16#4#;
   ACM_MPEG_SINGLECHANNEL            : constant := 16#8#;
   ACM_MPEG_PRIVATEBIT               : constant := 16#1#;
   ACM_MPEG_COPYRIGHT                : constant := 16#2#;
   ACM_MPEG_ORIGINALHOME             : constant := 16#4#;
   ACM_MPEG_PROTECTIONBIT            : constant := 16#8#;
   ACM_MPEG_ID_MPEG1                 : constant := 16#10#;
   WAVE_FILTER_UNKNOWN               : constant := 16#0#;
   WAVE_FILTER_DEVELOPMENT           : constant := 16#ffff#;
   WAVE_FILTER_VOLUME                : constant := 16#1#;
   WAVE_FILTER_ECHO                  : constant := 16#2#;
   RIFFWAVE_inst                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('i', 'n', 's', 't');
   RIFFCPPO                          : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('C', 'P', 'P', 'O');
   RIFFCPPO_objr                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('o', 'b', 'j', 'r');
   RIFFCPPO_obji                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('o', 'b', 'j', 'i');
   RIFFCPPO_clsr                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('c', 'l', 's', 'r');
   RIFFCPPO_clsi                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('c', 'l', 's', 'i');
   RIFFCPPO_mbr                      : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('m', 'b', 'r', ' ');
   RIFFCPPO_char                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('c', 'h', 'a', 'r');
   RIFFCPPO_byte                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('b', 'y', 't', 'e');
   RIFFCPPO_int                      : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('i', 'n', 't', ' ');
   RIFFCPPO_word                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('w', 'o', 'r', 'd');
   RIFFCPPO_long                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('l', 'o', 'n', 'g');
   RIFFCPPO_dwrd                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('d', 'w', 'r', 'd');
   RIFFCPPO_flt                      : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('f', 'l', 't', ' ');
   RIFFCPPO_dbl                      : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('d', 'b', 'l', ' ');
   RIFFCPPO_str                      : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('s', 't', 'r', ' ');
   BICOMP_IBMULTIMOTION              : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('U', 'L', 'T', 'I');
   BICOMP_IBMPHOTOMOTION             : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('P', 'H', 'M', 'O');
   BICOMP_CREATIVEYUV                : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('c', 'y', 'u', 'v');
   JPEG_DIB                          : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('J', 'P', 'E', 'G');
   MJPG_DIB                          : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('M', 'J', 'P', 'G');
   JPEG_PROCESS_BASELINE             : constant := 0;
   AVIIF_CONTROLFRAME                : constant := 16#200#;
   JIFMK_SOF0                        : constant := 16#ffc0#;
   JIFMK_SOF1                        : constant := 16#ffc1#;
   JIFMK_SOF2                        : constant := 16#ffc2#;
   JIFMK_SOF3                        : constant := 16#ffc3#;
   JIFMK_SOF5                        : constant := 16#ffc5#;
   JIFMK_SOF6                        : constant := 16#ffc6#;
   JIFMK_SOF7                        : constant := 16#ffc7#;
   JIFMK_JPG                         : constant := 16#ffc8#;
   JIFMK_SOF9                        : constant := 16#ffc9#;
   JIFMK_SOF10                       : constant := 16#ffca#;
   JIFMK_SOF11                       : constant := 16#ffcb#;
   JIFMK_SOF13                       : constant := 16#ffcd#;
   JIFMK_SOF14                       : constant := 16#ffce#;
   JIFMK_SOF15                       : constant := 16#ffcf#;
   JIFMK_DHT                         : constant := 16#ffc4#;
   JIFMK_DAC                         : constant := 16#ffcc#;
   JIFMK_RST0                        : constant := 16#ffd0#;
   JIFMK_RST1                        : constant := 16#ffd1#;
   JIFMK_RST2                        : constant := 16#ffd2#;
   JIFMK_RST3                        : constant := 16#ffd3#;
   JIFMK_RST4                        : constant := 16#ffd4#;
   JIFMK_RST5                        : constant := 16#ffd5#;
   JIFMK_RST6                        : constant := 16#ffd6#;
   JIFMK_RST7                        : constant := 16#ffd7#;
   JIFMK_SOI                         : constant := 16#ffd8#;
   JIFMK_EOI                         : constant := 16#ffd9#;
   JIFMK_SOS                         : constant := 16#ffda#;
   JIFMK_DQT                         : constant := 16#ffdb#;
   JIFMK_DNL                         : constant := 16#ffdc#;
   JIFMK_DRI                         : constant := 16#ffdd#;
   JIFMK_DHP                         : constant := 16#ffde#;
   JIFMK_EXP                         : constant := 16#ffdf#;
   JIFMK_APP0                        : constant := 16#ffe0#;
   JIFMK_APP1                        : constant := 16#ffe1#;
   JIFMK_APP2                        : constant := 16#ffe2#;
   JIFMK_APP3                        : constant := 16#ffe3#;
   JIFMK_APP4                        : constant := 16#ffe4#;
   JIFMK_APP5                        : constant := 16#ffe5#;
   JIFMK_APP6                        : constant := 16#ffe6#;
   JIFMK_APP7                        : constant := 16#ffe7#;
   JIFMK_JPG0                        : constant := 16#fff0#;
   JIFMK_JPG1                        : constant := 16#fff1#;
   JIFMK_JPG2                        : constant := 16#fff2#;
   JIFMK_JPG3                        : constant := 16#fff3#;
   JIFMK_JPG4                        : constant := 16#fff4#;
   JIFMK_JPG5                        : constant := 16#fff5#;
   JIFMK_JPG6                        : constant := 16#fff6#;
   JIFMK_JPG7                        : constant := 16#fff7#;
   JIFMK_JPG8                        : constant := 16#fff8#;
   JIFMK_JPG9                        : constant := 16#fff9#;
   JIFMK_JPG10                       : constant := 16#fffa#;
   JIFMK_JPG11                       : constant := 16#fffb#;
   JIFMK_JPG12                       : constant := 16#fffc#;
   JIFMK_JPG13                       : constant := 16#fffd#;
   JIFMK_COM                         : constant := 16#fffe#;
   JIFMK_TEM                         : constant := 16#ff01#;
   JIFMK_RES                         : constant := 16#ff02#;
   JIFMK_00                          : constant := 16#ff00#;
   JIFMK_FF                          : constant := 16#ffff#;
   JPEG_Y                            : constant := 1;
   JPEG_YCbCr                        : constant := 2;
   JPEG_RGB                          : constant := 3;

   ICTYPE_VIDEO : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('v', 'i', 'd', 'c');
   ICTYPE_AUDIO : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('a', 'u', 'd', 'c');
   FOURCC_RDSP  : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('R', 'D', 'S', 'P');

   MIXERCONTROL_CONTROLTYPE_SRS_MTS         : constant := 16#20010006#;
   MIXERCONTROL_CONTROLTYPE_SRS_ONOFF       : constant := 16#20010007#;
   MIXERCONTROL_CONTROLTYPE_SRS_SYNTHSELECT : constant := 16#20010008#;

   type ADPCMCOEFSET;
   type ADPCMWAVEFORMAT;
   type DVIADPCMWAVEFORMAT;
   type IMAADPCMWAVEFORMAT;
   type MEDIASPACEADPCMWAVEFORMAT;
   type SIERRAADPCMWAVEFORMAT;
   type G723_ADPCMWAVEFORMAT;
   type DIGISTDWAVEFORMAT;
   type DIGIFIXWAVEFORMAT;
   type DIALOGICOKIADPCMWAVEFORMAT;
   type YAMAHA_ADPCMWAVEFORMAT;
   type SONARCWAVEFORMAT;
   type TRUESPEECHWAVEFORMAT;
   type ECHOSC1WAVEFORMAT;
   type AUDIOFILE_AF36WAVEFORMAT;
   type APTXWAVEFORMAT;
   type AUDIOFILE_AF10WAVEFORMAT;
   type DOLBYAC2WAVEFORMAT;
   type GSM610WAVEFORMAT;
   type ADPCMEWAVEFORMAT;
   type CONTRESVQLPCWAVEFORMAT;
   type DIGIREALWAVEFORMAT;
   type DIGIADPCMWAVEFORMAT;
   type CONTRESCR10WAVEFORMAT;
   type NMS_VBXADPCMWAVEFORMAT;
   type G721_ADPCMWAVEFORMAT;
   type MPEG1WAVEFORMAT;
   type CREATIVEADPCMWAVEFORMAT;
   type CREATIVEFASTSPEECH8WAVEFORMAT;
   type CREATIVEFASTSPEECH10WAVEFORMAT;
   type FMTOWNS_SND_WAVEFORMAT;
   type OLIGSMWAVEFORMAT;
   type OLIADPCMWAVEFORMAT;
   type OLICELPWAVEFORMAT;
   type OLISBCWAVEFORMAT;
   type OLIOPRWAVEFORMAT;
   type WAVEFILTER;
   type VOLUMEWAVEFILTER;
   type ECHOWAVEFILTER;
   type s_RIFFWAVE_inst;
   type EXBMINFOHEADER;
   type JPEGINFOHEADER;

   type PADPCMCOEFSET is access all ADPCMCOEFSET;
   subtype NPADPCMCOEFSET is PADPCMCOEFSET;
   subtype LPADPCMCOEFSET is PADPCMCOEFSET;

   type PADPCMWAVEFORMAT is access all ADPCMWAVEFORMAT;
   subtype NPADPCMWAVEFORMAT is PADPCMWAVEFORMAT;
   subtype LPADPCMWAVEFORMAT is PADPCMWAVEFORMAT;

   type PDVIADPCMWAVEFORMAT is access all DVIADPCMWAVEFORMAT;
   subtype NPDVIADPCMWAVEFORMAT is PDVIADPCMWAVEFORMAT;
   subtype LPDVIADPCMWAVEFORMAT is PDVIADPCMWAVEFORMAT;

   type PIMAADPCMWAVEFORMAT is access all IMAADPCMWAVEFORMAT;
   subtype NPIMAADPCMWAVEFORMAT is PIMAADPCMWAVEFORMAT;
   subtype LPIMAADPCMWAVEFORMAT is PIMAADPCMWAVEFORMAT;

   type PMEDIASPACEADPCMWAVEFORMAT is access all MEDIASPACEADPCMWAVEFORMAT;
   subtype NPMEDIASPACEADPCMWAVEFORMAT is PMEDIASPACEADPCMWAVEFORMAT;
   subtype LPMEDIASPACEADPCMWAVEFORMAT is PMEDIASPACEADPCMWAVEFORMAT;

   type PSIERRAADPCMWAVEFORMAT is access all SIERRAADPCMWAVEFORMAT;
   subtype NPSIERRAADPCMWAVEFORMAT is PSIERRAADPCMWAVEFORMAT;
   subtype LPSIERRAADPCMWAVEFORMAT is PSIERRAADPCMWAVEFORMAT;

   type PG723_ADPCMWAVEFORMAT is access all G723_ADPCMWAVEFORMAT;
   subtype NPG723_ADPCMWAVEFORMAT is PG723_ADPCMWAVEFORMAT;
   subtype LPG723_ADPCMWAVEFORMAT is PG723_ADPCMWAVEFORMAT;

   type PDIGISTDWAVEFORMAT is access all DIGISTDWAVEFORMAT;
   subtype NPDIGISTDWAVEFORMAT is PDIGISTDWAVEFORMAT;
   subtype LPDIGISTDWAVEFORMAT is PDIGISTDWAVEFORMAT;

   type PDIGIFIXWAVEFORMAT is access all DIGIFIXWAVEFORMAT;
   subtype NPDIGIFIXWAVEFORMAT is PDIGIFIXWAVEFORMAT;
   subtype LPDIGIFIXWAVEFORMAT is PDIGIFIXWAVEFORMAT;

   type PDIALOGICOKIADPCMWAVEFORMAT is access all DIALOGICOKIADPCMWAVEFORMAT;
   subtype NPDIALOGICOKIADPCMWAVEFORMAT is PDIALOGICOKIADPCMWAVEFORMAT;
   subtype LPDIALOGICOKIADPCMWAVEFORMAT is PDIALOGICOKIADPCMWAVEFORMAT;

   type PYAMAHA_ADPCMWAVEFORMAT is access all YAMAHA_ADPCMWAVEFORMAT;
   subtype NPYAMAHA_ADPCMWAVEFORMAT is PYAMAHA_ADPCMWAVEFORMAT;
   subtype LPYAMAHA_ADPCMWAVEFORMAT is PYAMAHA_ADPCMWAVEFORMAT;

   type PSONARCWAVEFORMAT is access all SONARCWAVEFORMAT;
   subtype NPSONARCWAVEFORMAT is PSONARCWAVEFORMAT;
   subtype LPSONARCWAVEFORMAT is PSONARCWAVEFORMAT;

   type PTRUESPEECHWAVEFORMAT is access all TRUESPEECHWAVEFORMAT;
   subtype NPTRUESPEECHWAVEFORMAT is PTRUESPEECHWAVEFORMAT;
   subtype LPTRUESPEECHWAVEFORMAT is PTRUESPEECHWAVEFORMAT;

   type PECHOSC1WAVEFORMAT is access all ECHOSC1WAVEFORMAT;
   subtype NPECHOSC1WAVEFORMAT is PECHOSC1WAVEFORMAT;
   subtype LPECHOSC1WAVEFORMAT is PECHOSC1WAVEFORMAT;

   type PAUDIOFILE_AF36WAVEFORMAT is access all AUDIOFILE_AF36WAVEFORMAT;
   subtype NPAUDIOFILE_AF36WAVEFORMAT is PAUDIOFILE_AF36WAVEFORMAT;
   subtype LPAUDIOFILE_AF36WAVEFORMAT is PAUDIOFILE_AF36WAVEFORMAT;

   type PAPTXWAVEFORMAT is access all APTXWAVEFORMAT;
   subtype NPAPTXWAVEFORMAT is PAPTXWAVEFORMAT;
   subtype LPAPTXWAVEFORMAT is PAPTXWAVEFORMAT;

   type PAUDIOFILE_AF10WAVEFORMAT is access all AUDIOFILE_AF10WAVEFORMAT;
   subtype NPAUDIOFILE_AF10WAVEFORMAT is PAUDIOFILE_AF10WAVEFORMAT;
   subtype LPAUDIOFILE_AF10WAVEFORMAT is PAUDIOFILE_AF10WAVEFORMAT;

   type PGSM610WAVEFORMAT is access all GSM610WAVEFORMAT;
   subtype NPGSM610WAVEFORMAT is PGSM610WAVEFORMAT;
   subtype LPGSM610WAVEFORMAT is PGSM610WAVEFORMAT;

   type PADPCMEWAVEFORMAT is access all ADPCMEWAVEFORMAT;
   subtype NPADPCMEWAVEFORMAT is PADPCMEWAVEFORMAT;
   subtype LPADPCMEWAVEFORMAT is PADPCMEWAVEFORMAT;

   type PCONTRESVQLPCWAVEFORMAT is access all CONTRESVQLPCWAVEFORMAT;
   subtype NPCONTRESVQLPCWAVEFORMAT is PCONTRESVQLPCWAVEFORMAT;
   subtype LPCONTRESVQLPCWAVEFORMAT is PCONTRESVQLPCWAVEFORMAT;

   type PDIGIREALWAVEFORMAT is access all DIGIREALWAVEFORMAT;
   subtype NPDIGIREALWAVEFORMAT is PDIGIREALWAVEFORMAT;
   subtype LPDIGIREALWAVEFORMAT is PDIGIREALWAVEFORMAT;

   type PDIGIADPCMWAVEFORMAT is access all DIGIADPCMWAVEFORMAT;
   subtype NPDIGIADPCMWAVEFORMAT is PDIGIADPCMWAVEFORMAT;
   subtype LPDIGIADPCMWAVEFORMAT is PDIGIADPCMWAVEFORMAT;

   type PCONTRESCR10WAVEFORMAT is access all CONTRESCR10WAVEFORMAT;
   subtype NPCONTRESCR10WAVEFORMAT is PCONTRESCR10WAVEFORMAT;
   subtype LPCONTRESCR10WAVEFORMAT is PCONTRESCR10WAVEFORMAT;

   type PNMS_VBXADPCMWAVEFORMAT is access all NMS_VBXADPCMWAVEFORMAT;
   subtype NPNMS_VBXADPCMWAVEFORMAT is PNMS_VBXADPCMWAVEFORMAT;
   subtype LPNMS_VBXADPCMWAVEFORMAT is PNMS_VBXADPCMWAVEFORMAT;

   type PG721_ADPCMWAVEFORMAT is access all G721_ADPCMWAVEFORMAT;
   subtype NPG721_ADPCMWAVEFORMAT is PG721_ADPCMWAVEFORMAT;
   subtype LPG721_ADPCMWAVEFORMAT is PG721_ADPCMWAVEFORMAT;

   type PMPEG1WAVEFORMAT is access all MPEG1WAVEFORMAT;
   subtype NPMPEG1WAVEFORMAT is PMPEG1WAVEFORMAT;
   subtype LPMPEG1WAVEFORMAT is PMPEG1WAVEFORMAT;

   type PCREATIVEADPCMWAVEFORMAT is access all CREATIVEADPCMWAVEFORMAT;
   subtype NPCREATIVEADPCMWAVEFORMAT is PCREATIVEADPCMWAVEFORMAT;
   subtype LPCREATIVEADPCMWAVEFORMAT is PCREATIVEADPCMWAVEFORMAT;

   type PCREATIVEFASTSPEECH8WAVEFORMAT is access all
     CREATIVEFASTSPEECH8WAVEFORMAT;
   subtype NPCREATIVEFASTSPEECH8WAVEFORMAT is PCREATIVEFASTSPEECH8WAVEFORMAT;
   subtype LPCREATIVEFASTSPEECH8WAVEFORMAT is PCREATIVEFASTSPEECH8WAVEFORMAT;

   type PCREATIVEFASTSPEECH10WAVEFORMAT is access all
     CREATIVEFASTSPEECH10WAVEFORMAT;
   subtype NPCREATIVEFASTSPEECH10WAVEFORMAT is PCREATIVEFASTSPEECH10WAVEFORMAT;
   subtype LPCREATIVEFASTSPEECH10WAVEFORMAT is PCREATIVEFASTSPEECH10WAVEFORMAT;

   type PFMTOWNS_SND_WAVEFORMAT is access all FMTOWNS_SND_WAVEFORMAT;
   subtype NPFMTOWNS_SND_WAVEFORMAT is PFMTOWNS_SND_WAVEFORMAT;
   subtype LPFMTOWNS_SND_WAVEFORMAT is PFMTOWNS_SND_WAVEFORMAT;

   type POLIGSMWAVEFORMAT is access all OLIGSMWAVEFORMAT;
   subtype NPOLIGSMWAVEFORMAT is POLIGSMWAVEFORMAT;
   subtype LPOLIGSMWAVEFORMAT is POLIGSMWAVEFORMAT;

   type POLIADPCMWAVEFORMAT is access all OLIADPCMWAVEFORMAT;
   subtype NPOLIADPCMWAVEFORMAT is POLIADPCMWAVEFORMAT;
   subtype LPOLIADPCMWAVEFORMAT is POLIADPCMWAVEFORMAT;

   type POLICELPWAVEFORMAT is access all OLICELPWAVEFORMAT;
   subtype NPOLICELPWAVEFORMAT is POLICELPWAVEFORMAT;
   subtype LPOLICELPWAVEFORMAT is POLICELPWAVEFORMAT;

   type POLISBCWAVEFORMAT is access all OLISBCWAVEFORMAT;
   subtype NPOLISBCWAVEFORMAT is POLISBCWAVEFORMAT;
   subtype LPOLISBCWAVEFORMAT is POLISBCWAVEFORMAT;

   type POLIOPRWAVEFORMAT is access all OLIOPRWAVEFORMAT;
   subtype NPOLIOPRWAVEFORMAT is POLIOPRWAVEFORMAT;
   subtype LPOLIOPRWAVEFORMAT is POLIOPRWAVEFORMAT;

   type PWAVEFILTER is access all WAVEFILTER;
   subtype NPWAVEFILTER is PWAVEFILTER;
   subtype LPWAVEFILTER is PWAVEFILTER;

   type PVOLUMEWAVEFILTER is access all VOLUMEWAVEFILTER;
   subtype NPVOLUMEWAVEFILTER is PVOLUMEWAVEFILTER;
   subtype LPVOLUMEWAVEFILTER is PVOLUMEWAVEFILTER;

   type PECHOWAVEFILTER is access all ECHOWAVEFILTER;
   subtype NPECHOWAVEFILTER is PECHOWAVEFILTER;
   subtype LPECHOWAVEFILTER is PECHOWAVEFILTER;

   type ADPCMCOEFSET is record
      iCoef1 : Win32.SHORT;
      iCoef2 : Win32.SHORT;
   end record;

   type ADPCMCOEFSET_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased ADPCMCOEFSET;

   type ADPCMWAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
      wNumCoef         : Win32.WORD;
      aCoef            : ADPCMCOEFSET_Array;
   end record;

   type DVIADPCMWAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
   end record;

   type IMAADPCMWAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
   end record;

   type MEDIASPACEADPCMWAVEFORMAT is record
      wfx       : Win32.Mmsystem.WAVEFORMATEX;
      wRevision : Win32.WORD;
   end record;

   type SIERRAADPCMWAVEFORMAT is record
      wfx       : Win32.Mmsystem.WAVEFORMATEX;
      wRevision : Win32.WORD;
   end record;

   type G723_ADPCMWAVEFORMAT is record
      wfx           : Win32.Mmsystem.WAVEFORMATEX;
      cbExtraSize   : Win32.WORD;
      nAuxBlockSize : Win32.WORD;
   end record;

   type DIGISTDWAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type DIGIFIXWAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type DIALOGICOKIADPCMWAVEFORMAT is record
      ewf : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type YAMAHA_ADPCMWAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type SONARCWAVEFORMAT is record
      wfx       : Win32.Mmsystem.WAVEFORMATEX;
      wCompType : Win32.WORD;
   end record;

   type TRUESPEECHWAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wRevision        : Win32.WORD;
      nSamplesPerBlock : Win32.WORD;
      abReserved       : Win32.BYTE_Array (0 .. 27);
   end record;

   type ECHOSC1WAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type AUDIOFILE_AF36WAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type APTXWAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type AUDIOFILE_AF10WAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type DOLBYAC2WAVEFORMAT is record
      wfx          : Win32.Mmsystem.WAVEFORMATEX;
      nAuxBitsCode : Win32.WORD;
   end record;

   type GSM610WAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
   end record;

   type ADPCMEWAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
   end record;

   type CONTRESVQLPCWAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
   end record;

   type DIGIREALWAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
   end record;

   type DIGIADPCMWAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
   end record;

   type CONTRESCR10WAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
   end record;

   type NMS_VBXADPCMWAVEFORMAT is record
      wfx              : Win32.Mmsystem.WAVEFORMATEX;
      wSamplesPerBlock : Win32.WORD;
   end record;

   type G721_ADPCMWAVEFORMAT is record
      wfx           : Win32.Mmsystem.WAVEFORMATEX;
      nAuxBlockSize : Win32.WORD;
   end record;

   type MPEG1WAVEFORMAT is record
      wfx           : Win32.Mmsystem.WAVEFORMATEX;
      fwHeadLayer   : Win32.WORD;
      dwHeadBitrate : Win32.DWORD;
      fwHeadMode    : Win32.WORD;
      fwHeadModeExt : Win32.WORD;
      wHeadEmphasis : Win32.WORD;
      fwHeadFlags   : Win32.WORD;
      dwPTSLow      : Win32.DWORD;
      dwPTSHigh     : Win32.DWORD;
   end record;

   type CREATIVEADPCMWAVEFORMAT is record
      wfx       : Win32.Mmsystem.WAVEFORMATEX;
      wRevision : Win32.WORD;
   end record;

   type CREATIVEFASTSPEECH8WAVEFORMAT is record
      wfx       : Win32.Mmsystem.WAVEFORMATEX;
      wRevision : Win32.WORD;
   end record;

   type CREATIVEFASTSPEECH10WAVEFORMAT is record
      wfx       : Win32.Mmsystem.WAVEFORMATEX;
      wRevision : Win32.WORD;
   end record;

   type FMTOWNS_SND_WAVEFORMAT is record
      wfx       : Win32.Mmsystem.WAVEFORMATEX;
      wRevision : Win32.WORD;
   end record;

   type OLIGSMWAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type OLIADPCMWAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type OLICELPWAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type OLISBCWAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type OLIOPRWAVEFORMAT is record
      wfx : Win32.Mmsystem.WAVEFORMATEX;
   end record;

   type WAVEFILTER is record
      cbStruct    : Win32.DWORD;
      dwFilterTag : Win32.DWORD;
      fdwFilter   : Win32.DWORD;
      dwReserved  : Win32.DWORD_Array (0 .. 4);
   end record;

   type VOLUMEWAVEFILTER is record
      wfltr    : WAVEFILTER;
      dwVolume : Win32.DWORD;
   end record;

   type ECHOWAVEFILTER is record
      wfltr    : WAVEFILTER;
      dwVolume : Win32.DWORD;
      dwDelay  : Win32.DWORD;
   end record;

   type s_RIFFWAVE_inst is record
      bUnshiftedNote : Win32.BYTE;
      chFineTune     : Win32.CHAR;
      chGain         : Win32.CHAR;
      bLowNote       : Win32.BYTE;
      bHighNote      : Win32.BYTE;
      bLowVelocity   : Win32.BYTE;
      bHighVelocity  : Win32.BYTE;
   end record;

   type EXBMINFOHEADER is record
      bmi             : Win32.Wingdi.BITMAPINFOHEADER;
      biExtDataOffset : Win32.DWORD;
   end record;

   type JPEGINFOHEADER is record
      JPEGSize          : Win32.DWORD;
      JPEGProcess       : Win32.DWORD;
      JPEGColorSpaceID  : Win32.DWORD;
      JPEGBitsPerSample : Win32.DWORD;
      JPEGHSubSampling  : Win32.DWORD;
      JPEGVSubSampling  : Win32.DWORD;
   end record;

private

   pragma Convention (C_Pass_By_Copy, ADPCMCOEFSET);
   pragma Convention (C, ADPCMWAVEFORMAT);
   pragma Convention (C, DVIADPCMWAVEFORMAT);
   pragma Convention (C, IMAADPCMWAVEFORMAT);
   pragma Convention (C, MEDIASPACEADPCMWAVEFORMAT);
   pragma Convention (C, SIERRAADPCMWAVEFORMAT);
   pragma Convention (C, G723_ADPCMWAVEFORMAT);
   pragma Convention (C, DIGISTDWAVEFORMAT);
   pragma Convention (C, DIGIFIXWAVEFORMAT);
   pragma Convention (C, DIALOGICOKIADPCMWAVEFORMAT);
   pragma Convention (C, YAMAHA_ADPCMWAVEFORMAT);
   pragma Convention (C, SONARCWAVEFORMAT);
   pragma Convention (C, TRUESPEECHWAVEFORMAT);
   pragma Convention (C, ECHOSC1WAVEFORMAT);
   pragma Convention (C, AUDIOFILE_AF36WAVEFORMAT);
   pragma Convention (C, APTXWAVEFORMAT);
   pragma Convention (C, AUDIOFILE_AF10WAVEFORMAT);
   pragma Convention (C, DOLBYAC2WAVEFORMAT);
   pragma Convention (C, GSM610WAVEFORMAT);
   pragma Convention (C, ADPCMEWAVEFORMAT);
   pragma Convention (C, CONTRESVQLPCWAVEFORMAT);
   pragma Convention (C, DIGIREALWAVEFORMAT);
   pragma Convention (C, DIGIADPCMWAVEFORMAT);
   pragma Convention (C, CONTRESCR10WAVEFORMAT);
   pragma Convention (C, NMS_VBXADPCMWAVEFORMAT);
   pragma Convention (C, G721_ADPCMWAVEFORMAT);
   pragma Convention (C, MPEG1WAVEFORMAT);
   pragma Convention (C, CREATIVEADPCMWAVEFORMAT);
   pragma Convention (C, CREATIVEFASTSPEECH8WAVEFORMAT);
   pragma Convention (C, CREATIVEFASTSPEECH10WAVEFORMAT);
   pragma Convention (C, FMTOWNS_SND_WAVEFORMAT);
   pragma Convention (C, OLIGSMWAVEFORMAT);
   pragma Convention (C, OLIADPCMWAVEFORMAT);
   pragma Convention (C, OLICELPWAVEFORMAT);
   pragma Convention (C, OLISBCWAVEFORMAT);
   pragma Convention (C, OLIOPRWAVEFORMAT);
   pragma Convention (C, WAVEFILTER);
   pragma Convention (C, VOLUMEWAVEFILTER);
   pragma Convention (C, ECHOWAVEFILTER);
   pragma Convention (C_Pass_By_Copy, s_RIFFWAVE_inst);
   pragma Convention (C, EXBMINFOHEADER);
   pragma Convention (C, JPEGINFOHEADER);

end Win32.Mmreg;
