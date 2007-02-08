/* $Source$ */
/* $Revision: 11231 $ $Date: 2000-08-10 11:10:30 +0200 (Thu, 10 Aug 2000) $ $Author: dijk $ */

/* for debugging stdarg.ad* */

dump(addr, nb_int)
    int *addr, nb_int;
{
    int i;

    printf("buffer at addr %d %08x, %d ints: ", addr, addr, nb_int);
    if(nb_int > 100) nb_int = 100;
    for(i=0; i<nb_int; i++)
	printf("%08x ", *addr++);
    printf("\n\n");
}

#if 0
----------------------
-- REVISION HISTORY --
----------------------

----------------------------
revision 1.1
date: 1998/10/15 20:30:04;  author: obry;  state: Exp;
Initial revision
----------------------------
New changes after this line and before endif
#endif
