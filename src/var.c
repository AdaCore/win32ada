/*
 * Copyright 1994 Intermetrics, Inc.  All rights reserved.
 * Written by Mitch Gart.
 *
 * Copyright (C) 2000-2010, AdaCore
 *
 * The following macros let us call a function with the
 * right number of arguments, up to MAX, currently 50.
 * The macros use ANSI C argument pasting ##, and also a
 * GCC-specific feature, that allows a macro with a variable
 * number of arguments (args...).  See gcc.info-7.  There are
 * some nasty special cases for 0 args that don't work right.
 *
 * Automatically generated with the following program.
 * To change the max number of arguments, re-run this program
 * with MAX redefined, it's easier than editing the macros by hand.
 *
 * #define MAX 50
 *
 * main() {
 *     int i;
 *
 *     printf("/*** start of automatically generated lines ***\/\n");
 *     printf("#define list1 p[0]\n");
 *     printf("#ifdef STACK_GROWS_UP\n");
 *     for(i=1; i<MAX; i++)
 *      printf("#define list%d list%d, p[%d]\n", i+1, i, i);
 *     printf("#else\n");
 *     for(i=1; i<MAX; i++)
 *      printf("#define list%d p[%d], list%d\n", i+1, i, i);
 *     printf("#endif\n");
 *     printf("\n");
 *
 *     printf("#define line(func, n, args...) ");
 *     printf("case n: func(##args, list ## n); break\n");
 *     printf("\n");
 *
 *     printf("#define cases(func, args...)\t\\\n");
 *     printf(" case 0: func(## args); break;\t\\\n");
 *     for(i=1; i<=MAX; i++) {
 *      printf(" line(func, %d, ## args)", i);
 *      if(i<MAX)
 *          printf(";\t\\");
 *      printf("\n");
 *     }
 *     printf("/*** end of automatically generated lines ***\/\n");
 * }
 */

#include <stdio.h>
#include <assert.h>

#define list0(p)
#define list1(p) p[0]

#define list2(p) list1(p), p[1]
#define list3(p) list2(p), p[2]
#define list4(p) list3(p), p[3]
#define list5(p) list4(p), p[4]
#define list6(p) list5(p), p[5]
#define list7(p) list6(p), p[6]
#define list8(p) list7(p), p[7]
#define list9(p) list8(p), p[8]
#define list10(p) list9(p), p[9]
#define list11(p) list10(p), p[10]
#define list12(p) list11(p), p[11]
#define list13(p) list12(p), p[12]
#define list14(p) list13(p), p[13]
#define list15(p) list14(p), p[14]
#define list16(p) list15(p), p[15]
#define list17(p) list16(p), p[16]
#define list18(p) list17(p), p[17]
#define list19(p) list18(p), p[18]
#define list20(p) list19(p), p[19]
#define list21(p) list20(p), p[20]
#define list22(p) list21(p), p[21]
#define list23(p) list22(p), p[22]
#define list24(p) list23(p), p[23]
#define list25(p) list24(p), p[24]
#define list26(p) list25(p), p[25]
#define list27(p) list26(p), p[26]
#define list28(p) list27(p), p[27]
#define list29(p) list28(p), p[28]
#define list30(p) list29(p), p[29]
#define list31(p) list30(p), p[30]
#define list32(p) list31(p), p[31]
#define list33(p) list32(p), p[32]
#define list34(p) list33(p), p[33]
#define list35(p) list34(p), p[34]
#define list36(p) list35(p), p[35]
#define list37(p) list36(p), p[36]
#define list38(p) list37(p), p[37]
#define list39(p) list38(p), p[38]
#define list40(p) list39(p), p[39]
#define list41(p) list40(p), p[40]
#define list42(p) list41(p), p[41]
#define list43(p) list42(p), p[42]
#define list44(p) list43(p), p[43]
#define list45(p) list44(p), p[44]
#define list46(p) list45(p), p[45]
#define list47(p) list46(p), p[46]
#define list48(p) list47(p), p[47]
#define list49(p) list48(p), p[48]
#define list50(p) list49(p), p[49]

#define cases(func, p)                  \
 case 0: return (*func)(list0(p));      \
 case 1: return (*func)(list1(p));      \
 case 2: return (*func)(list2(p));      \
 case 3: return (*func)(list3(p));      \
 case 4: return (*func)(list4(p));      \
 case 5: return (*func)(list5(p));      \
 case 6: return (*func)(list6(p));      \
 case 7: return (*func)(list7(p));      \
 case 8: return (*func)(list8(p));      \
 case 9: return (*func)(list9(p));      \
 case 10: return (*func)(list10(p));    \
 case 11: return (*func)(list11(p));    \
 case 12: return (*func)(list12(p));    \
 case 13: return (*func)(list13(p));    \
 case 14: return (*func)(list14(p));    \
 case 15: return (*func)(list15(p));    \
 case 16: return (*func)(list16(p));    \
 case 17: return (*func)(list17(p));    \
 case 18: return (*func)(list18(p));    \
 case 19: return (*func)(list19(p));    \
 case 20: return (*func)(list20(p));    \
 case 21: return (*func)(list21(p));    \
 case 22: return (*func)(list22(p));    \
 case 23: return (*func)(list23(p));    \
 case 24: return (*func)(list24(p));    \
 case 25: return (*func)(list25(p));    \
 case 26: return (*func)(list26(p));    \
 case 27: return (*func)(list27(p));    \
 case 28: return (*func)(list28(p));    \
 case 29: return (*func)(list29(p));    \
 case 30: return (*func)(list30(p));    \
 case 31: return (*func)(list31(p));    \
 case 32: return (*func)(list32(p));    \
 case 33: return (*func)(list33(p));    \
 case 34: return (*func)(list34(p));    \
 case 35: return (*func)(list35(p));    \
 case 36: return (*func)(list36(p));    \
 case 37: return (*func)(list37(p));    \
 case 38: return (*func)(list38(p));    \
 case 39: return (*func)(list39(p));    \
 case 40: return (*func)(list40(p));    \
 case 41: return (*func)(list41(p));    \
 case 42: return (*func)(list42(p));    \
 case 43: return (*func)(list43(p));    \
 case 44: return (*func)(list44(p));    \
 case 45: return (*func)(list45(p));    \
 case 46: return (*func)(list46(p));    \
 case 47: return (*func)(list47(p));    \
 case 48: return (*func)(list48(p));    \
 case 49: return (*func)(list49(p));    \
 case 50: return (*func)(list50(p))

/*
 * Now functions can be called that interface between Ada and C.
 * Each function can have a beginning fixed number of parameters,
 * followed by a vector of 0 or more parameters.  Using the
 * cases(func, args) macro, the function can call the right C
 * function with the right number of parameters.
 *
 * for example, cases(printf, fmt) will expand to
 *    when 0: printf(fmt); break;
 *    when 1: printf(fmt, p[0]); break;
 *    when 2: printf(fmt, p[0], p[1]); break;
 *    etc, up to MAX
 * on a machine where the stack grows up, and
 *    when 0: printf(fmt); break;
 *    when 1: printf(fmt, p[0]); break;
 *    when 2: printf(fmt, p[1], p[0]); break;
 * on a machine where the stack grows down.
 */

typedef void* param_t;

int
do_varargs(int (*func)(),       /* function to be called */
           int nb_args,         /* number of int arguments */
           param_t *p)          /* argument list */
{
    switch(nb_args) {
        cases(func, p);
    }
}

double
to_double(void *fp, int siz)
{
    switch(siz/8) {
        case sizeof(float):
            return (double) *(float *)fp;
        case sizeof(double):
            return (double) *(double *)fp;
        default:
          assert(0);
    }
}

param_t
to_param_t(void *ip, int siz, int is_unsigned)
{
    switch(siz/8) {
        case sizeof(char):
            if(is_unsigned)
                return (param_t) (uintptr_t) *(unsigned char *)ip;
            else
                return (param_t) (uintptr_t) *(signed char *)ip;

        case sizeof(short):
            if(is_unsigned)
                return (param_t) (uintptr_t) *(unsigned short *)ip;
            else
                return (param_t) (uintptr_t) *(signed short *)ip;

        case sizeof(int):
            if(is_unsigned)
                return (param_t) (uintptr_t) *(unsigned int *)ip;
            else
                return (param_t) (uintptr_t) *(signed int *)ip;

        case sizeof(long long):
            if(is_unsigned)
                return (param_t) (uintptr_t) *(unsigned long long *)ip;
            else
                return (param_t) (uintptr_t) *(signed long long *)ip;
        default:
          assert(0);
    }
}
