/* $Source$ */
/* $Revision$ $Date$ $Author$ */

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
