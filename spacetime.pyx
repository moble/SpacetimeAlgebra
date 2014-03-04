# distutils: language = c++
# distutils: sources = SpacetimeAlgebra.cpp

cdef extern from "SpacetimeAlgebra.hpp" namespace "SpacetimeAlgebra":
    cdef cppclass Rectangle:

