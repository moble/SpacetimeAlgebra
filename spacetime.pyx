# distutils: language = c++
# distutils: sources = SpacetimeAlgebra.cpp

cimport spacetime
from cython.operator cimport dereference as deref

cdef class mv:
    cdef spacetime.cppmv *thisptr      # hold a C++ instance which we're wrapping
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
    def __repr__(self):
        return self.thisptr.toString("%2.15g")
    def __str__(self):
        return self.thisptr.toString("%2.15g")
    cpdef str(self):
        return self.thisptr.toString("%2.15g")

## Algebraic operations
cpdef add(mv a, mv b):
    # cdef spacetime.cppmv C
    # C = spacetime.cppadd(deref(a.thisptr), deref(b.thisptr))
    # cdef mv c=mv()
    # c.thisptr.set(C)
    cdef mv c=mv()
    c.thisptr.set(spacetime.cppadd(deref(a.thisptr), deref(b.thisptr)))
    return c
