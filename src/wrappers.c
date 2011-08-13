/*************************************************************************/
/* Define some wrapper routines for Win32Ada project on Win32 and Win64  */
/*                                                                       */
/* This file is now maintained and made available by AdaCore under       */
/* the same terms.                                                       */
/*                                                                       */
/* Copyright (C) 2000-2011, AdaCore                                      */
/*************************************************************************/

#if defined (_WIN64)
/* ??? MISSING NDRcopy in Win32 import libraries */
void NDRcopy (void *P1, void *P2, unsigned int c)
{
}
#endif
