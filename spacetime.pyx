# distutils: language = c++
# distutils: sources = SpacetimeAlgebra.cpp

cimport spacetime

cdef class mv:
    cdef spacetime.cppmv *thisptr      # hold a C++ instance which we're wrapping
    def __cinit__(self):
        self.thisptr = new spacetime.cppmv()
    def __dealloc__(self):
        del self.thisptr
    def get_scalar(self):
        return self.thisptr.get_scalar()
