/* $Source$ */
/* $Revision$ $Date$ $Author$ */
typedef struct _ldiv_t {
        long quot;
        long rem;
} _ldiv_t;

void ldiv_wrapper (long x, long y, _ldiv_t *result) {
    extern _ldiv_t ldiv(long, long);

    *result = ldiv(x, y);
}

typedef struct _div_t {
        int quot;
        int rem;
} _div_t;

void div_wrapper (int x, int y, _div_t *result) {
    extern _div_t div(int, int);

    *result = div(x, y);
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
