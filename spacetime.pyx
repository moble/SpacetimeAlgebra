# distutils: language = c++
# distutils: sources = SpacetimeAlgebra.cpp

cimport spacetime
from cython.operator cimport dereference as deref

cdef class mv:
    cdef spacetime.cppmv* thisptr      # hold a C++ instance which we're wrapping
    def __cinit__(self):
        self.thisptr = new spacetime.cppmv()
    def __dealloc__(self):
        del self.thisptr
    # ## Set by other types of multivectors
    # void set()
    # void set(const cppmv &A)
    # void set(double)
    # # void set(int gu, const double *coordinates)
    # void set(const cppgamma_0_t &A)
    # void set(const cppgamma_1_t &A)
    # void set(const cppgamma_2_t &A)
    # void set(const cppgamma_3_t &A)
    # void set(const cppI_t &A)
    # void set(const cppI3_t &A)
    # void set(const cppmv3 &A)
    # void set(const cppvector &A)
    # void set(const cppvector3 &A)
    # void set(const cppbivector &A)
    # void set(const cppbivector3 &A)
    # void set(const cpppseudovector &A)
    # void set(const cppspinor &A)
    # void set(const cppspinor3 &A)
    ## Set components
    cpdef set_scalar(self, double val):
        self.thisptr.set_scalar(val)
        return self
    cpdef set_gamma_0(self, double val):
        self.thisptr.set_gamma_0(val)
        return self
    cpdef set_gamma_1(self, double val):
        self.thisptr.set_gamma_1(val)
        return self
    cpdef set_gamma_2(self, double val):
        self.thisptr.set_gamma_2(val)
        return self
    cpdef set_gamma_3(self, double val):
        self.thisptr.set_gamma_3(val)
        return self
    cpdef set_gamma_0_gamma_1(self, double val):
        self.thisptr.set_gamma_0_gamma_1(val)
        return self
    cpdef set_gamma_0_gamma_2(self, double val):
        self.thisptr.set_gamma_0_gamma_2(val)
        return self
    cpdef set_gamma_1_gamma_2(self, double val):
        self.thisptr.set_gamma_1_gamma_2(val)
        return self
    cpdef set_gamma_0_gamma_3(self, double val):
        self.thisptr.set_gamma_0_gamma_3(val)
        return self
    cpdef set_gamma_1_gamma_3(self, double val):
        self.thisptr.set_gamma_1_gamma_3(val)
        return self
    cpdef set_gamma_2_gamma_3(self, double val):
        self.thisptr.set_gamma_2_gamma_3(val)
        return self
    cpdef set_gamma_0_gamma_1_gamma_2(self, double val):
        self.thisptr.set_gamma_0_gamma_1_gamma_2(val)
        return self
    cpdef set_gamma_0_gamma_1_gamma_3(self, double val):
        self.thisptr.set_gamma_0_gamma_1_gamma_3(val)
        return self
    cpdef set_gamma_0_gamma_2_gamma_3(self, double val):
        self.thisptr.set_gamma_0_gamma_2_gamma_3(val)
        return self
    cpdef set_gamma_1_gamma_2_gamma_3(self, double val):
        self.thisptr.set_gamma_1_gamma_2_gamma_3(val)
        return self
    cpdef set_gamma_0_gamma_1_gamma_2_gamma_3(self, double val):
        self.thisptr.set_gamma_0_gamma_1_gamma_2_gamma_3(val)
        return self
    ## Get components
    cpdef get_scalar(self):
        return self.thisptr.get_scalar()
    cpdef get_gamma_0(self):
        return self.thisptr.get_gamma_0()
    cpdef get_gamma_1(self):
        return self.thisptr.get_gamma_1()
    cpdef get_gamma_2(self):
        return self.thisptr.get_gamma_2()
    cpdef get_gamma_3(self):
        return self.thisptr.get_gamma_3()
    cpdef get_gamma_0_gamma_1(self):
        return self.thisptr.get_gamma_0_gamma_1()
    cpdef get_gamma_0_gamma_2(self):
        return self.thisptr.get_gamma_0_gamma_2()
    cpdef get_gamma_1_gamma_2(self):
        return self.thisptr.get_gamma_1_gamma_2()
    cpdef get_gamma_0_gamma_3(self):
        return self.thisptr.get_gamma_0_gamma_3()
    cpdef get_gamma_1_gamma_3(self):
        return self.thisptr.get_gamma_1_gamma_3()
    cpdef get_gamma_2_gamma_3(self):
        return self.thisptr.get_gamma_2_gamma_3()
    cpdef get_gamma_0_gamma_1_gamma_2(self):
        return self.thisptr.get_gamma_0_gamma_1_gamma_2()
    cpdef get_gamma_0_gamma_1_gamma_3(self):
        return self.thisptr.get_gamma_0_gamma_1_gamma_3()
    cpdef get_gamma_0_gamma_2_gamma_3(self):
        return self.thisptr.get_gamma_0_gamma_2_gamma_3()
    cpdef get_gamma_1_gamma_2_gamma_3(self):
        return self.thisptr.get_gamma_1_gamma_2_gamma_3()
    cpdef get_gamma_0_gamma_1_gamma_2_gamma_3(self):
        return self.thisptr.get_gamma_0_gamma_1_gamma_2_gamma_3()
    ## Nice string representations
    def __repr__(mv self):
        return self.thisptr.toString("%2.15g")
    def __str__(mv self):
        return self.thisptr.toString("%2.15g")
    ## Easier operators
    def __add__(mv self, mv other): # +
        cdef mv c=mv()
        c.thisptr.set(spacetime.cppadd(deref(self.thisptr), deref(other.thisptr)))
        return c
    def __sub__(mv self, mv other): # -
        cdef mv c=mv()
        c.thisptr.set(spacetime.cppsubtract(deref(self.thisptr), deref(other.thisptr)))
        return c
    def __mul__(self, other): # *
        cdef mv a
        cdef mv b
        cdef double d
        cdef mv c=mv()
        if(isinstance(self, float)) :
            d=self
            b=other
            c.thisptr.set(spacetime.cppgp(d, deref(b.thisptr)))
        elif(isinstance(other, float)) :
            d=other
            a=self
            c.thisptr.set(spacetime.cppgp(deref(a.thisptr), d))
        else :
            a=self
            b=other
            c.thisptr.set(spacetime.cppgp(deref(a.thisptr), deref(b.thisptr)))
        return c
    # def __mul__(mv self, mv other): # *
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppgp(deref(self.thisptr), deref(other.thisptr)))
    #     return c
    # # Can't overload operators, apparently...
    # # def __mul__(mv self, double other): # *
    # #     cdef mv c=mv()
    # #     c.thisptr.set(spacetime.cppgp(deref(self.thisptr), other))
    # #     return c
    def __div__(mv self, double other): # /
        cdef mv c=mv()
        c.thisptr.set(spacetime.cppdiv(deref(self.thisptr), other))
        return c
    def __truediv__(mv self, double other): # / [with __future__.division]
        cdef mv c=mv()
        c.thisptr.set(spacetime.cppdiv(deref(self.thisptr), other))
        return c
    def __floordiv__(mv self, double other): # //
        cdef mv c=mv()
        c.thisptr.set(spacetime.cppdiv(deref(self.thisptr), other))
        return c
    def __mod__(mv self, mv other): # %
        cdef mv c=mv()
        c.thisptr.set(spacetime.cppsp(deref(self.thisptr), deref(other.thisptr)))
        return c
    # def __pow__(mv self, mv other, None): # pow() **
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cpppow(deref(self.thisptr), deref(other.thisptr)))
    #     return c
    def __lshift__(mv self, mv other): # <<
        cdef mv c=mv()
        c.thisptr.set(spacetime.cpplc(deref(self.thisptr), deref(other.thisptr)))
        return c
    def __rshift__(mv self, mv other): # >>
        cdef mv c=mv()
        c.thisptr.set(spacetime.cpprc(deref(self.thisptr), deref(other.thisptr)))
        return c
    # def __and__(mv self, mv other): # &
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppand(deref(self.thisptr), deref(other.thisptr)))
    #     return c
    def __xor__(mv self, mv other): # ^
        cdef mv c=mv()
        c.thisptr.set(spacetime.cppop(deref(self.thisptr), deref(other.thisptr)))
        return c
    # def __or__(mv self, mv other): # |
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppor(deref(self.thisptr), deref(other.thisptr)))
    #     return c
    # def __radd__(mv self, mv other): # +
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppadd(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __rsub__(mv self, mv other): # -
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppsubtract(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __rmul__(mv self, mv other): # *
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppgp(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __rmul__(mv self, double other): # *
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppgp(deref(self.thisptr), other))
    #     return c
    # # It might not be useful to take the rdiv by a float
    # # def __rdiv__(mv self, double other): # /
    # #     cdef mv c=mv()
    # #     c.thisptr.set(spacetime.cppdiv(deref(self.thisptr), other)
    # #     return c
    # # def __rtruediv__(mv self, double other): # / [with __future__.division]
    # #     cdef mv c=mv()
    # #     c.thisptr.set(spacetime.cpptruediv(deref(self.thisptr), other)
    # #     return c
    # # def __rfloordiv__(mv self, double other): # //
    # #     cdef mv c=mv()
    # #     c.thisptr.set(spacetime.cppfloordiv(deref(self.thisptr), other)
    # #     return c
    # def __rmod__(mv self, mv other): # %
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppmod(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __rpow__(mv self, mv other): # pow() **
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cpppow(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __rlshift__(mv self, mv other): # <<
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cpplshift(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __rrshift__(mv self, mv other): # >>
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cpprshift(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __rand__(mv self, mv other): # &
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppand(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __rxor__(mv self, mv other): # ^
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppxor(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __ror__(mv self, mv other): # |
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppor(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __iadd__(mv self, mv other): # +=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppadd(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __isub__(mv self, mv other): # -=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppsub(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __imul__(mv self, mv other): # *=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppmul(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __idiv__(mv self, mv other): # /=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppdiv(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __itruediv__(mv self, mv other): # /= [with __future__.division]
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cpptruediv(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __ifloordiv__(mv self, mv other): # //=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppfloordiv(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __imod__(mv self, mv other): # %=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppmod(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __ipow__(mv self, mv other): # pow() **=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cpppow(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __ilshift__(mv self, mv other): # <<=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cpplshift(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __irshift__(mv self, mv other): # >>=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cpprshift(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __iand__(mv self, mv other): # &=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppand(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __ixor__(mv self, mv other): # ^=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppxor(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    # def __ior__(mv self, mv other): # |=
    #     cdef mv c=mv()
    #     c.thisptr.set(spacetime.cppor(deref(other.thisptr), deref(self.thisptr)))
    #     return c
    def __neg__(mv self): # - [unary]
        cdef mv c=mv()
        c.thisptr.set(spacetime.cppnegate(deref(self.thisptr)))
        return c
    # object.__pos__(mv self) # + [unary]
    # object.__abs__(mv self) # abs()
    def __invert__(mv self): # ~ [unary]
        cdef mv c=mv()
        c.thisptr.set(spacetime.cppreverse(deref(self.thisptr)))
        return c
    # object.__complex__(mv self) # complex()
    # object.__float__(mv self) # float()
    # object.__call__(mv self[, args...]) # for calling the mv object as a function
    # object.__len__(mv self)
    # object.__getitem__(mv self,key)
    # object.__setitem__(mv self,key,value)
    # object.__delitem__(mv self,key)
    # object.__getslice__(mv self,i,j)
    # object.__setslice__(mv self,i,j,sequence)
    # object.__delslice__(mv self,i,j)
    # object.____(mv self)
    # object.____(mv self)
    # object.____(mv self)
    # object.__getitem__(mv self)

## Algebraic operations
# cpdef add(mv a, mv b):
#     cdef mv c=mv()
#     c.thisptr.set(spacetime.cppadd(deref(a.thisptr), deref(b.thisptr)))
#     return c
cpdef dual(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppdual(deref(a.thisptr)))
    return b
cpdef reverse(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppreverse(deref(a.thisptr)))
    return b
cpdef cliffordConjugate(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppcliffordConjugate(deref(a.thisptr)))
    return b
cpdef gradeInvolution(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppgradeInvolution(deref(a.thisptr)))
    return b
cpdef norm(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppnorm(deref(a.thisptr)))
    return b
cpdef norm2(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppnorm2(deref(a.thisptr)))
    return b
cpdef unit(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppunit(deref(a.thisptr)))
    return b
cpdef versorInverse(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppversorInverse(deref(a.thisptr)))
    return b
cpdef exp(mv a, int order=20):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppexp(deref(a.thisptr), order))
    return b
cpdef sin(mv a, int order=12):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppsin(deref(a.thisptr), order))
    return b
cpdef cos(mv a, int order=12):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppcos(deref(a.thisptr), order))
    return b
cpdef sinh(mv a, int order=12):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppsinh(deref(a.thisptr), order))
    return b
cpdef cosh(mv a, int order=12):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppcosh(deref(a.thisptr), order))
    return b

## Extract graded parts
cpdef extractGrade0(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppextractGrade0(deref(a.thisptr)))
    return b
cpdef extractGrade1(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppextractGrade1(deref(a.thisptr)))
    return b
cpdef extractGrade2(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppextractGrade2(deref(a.thisptr)))
    return b
cpdef extractGrade3(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppextractGrade3(deref(a.thisptr)))
    return b
cpdef extractGrade4(mv a):
    cdef mv b=mv()
    b.thisptr.set(spacetime.cppextractGrade4(deref(a.thisptr)))
    return b
