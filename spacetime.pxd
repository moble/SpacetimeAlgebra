cdef extern from "SpacetimeAlgebra.hpp" namespace "SpacetimeAlgebra":
    cdef cppclass cppmv "SpacetimeAlgebra::mv":
        int m_gu
        double m_c[16]
        cppmv() except +
        cppmv(const cppmv&A) except +
        cppmv(double scalar) except +
        cppmv(int gu, const double *coordinates) except +
        # cppmv(const gamma_0_t&A) except +
        # cppmv(const gamma_1_t&A) except +
        # cppmv(const gamma_2_t&A) except +
        # cppmv(const gamma_3_t&A) except +
        # cppmv(const I_t&A) except +
        # cppmv(const I3_t&A) except +
        # cppmv(const cppmv3&A) except +
        # cppmv(const vector&A) except +
        # cppmv(const vector3&A) except +
        # cppmv(const bivector&A) except +
        # cppmv(const bivector3&A) except +
        # cppmv(const pseudovector&A) except +
        # cppmv(const spinor&A) except +
        # cppmv(const spinor3&A) except +
        double get_scalar()



    # cdef cppclass cppgamma_0_t "SpacetimeAlgebra::gamma_0_t":


    # cdef cppclass cppgamma_1_t "SpacetimeAlgebra::gamma_1_t":


    # cdef cppclass cppgamma_2_t "SpacetimeAlgebra::gamma_2_t":


    # cdef cppclass cppgamma_3_t "SpacetimeAlgebra::gamma_3_t":


    # cdef cppclass cppI_t "SpacetimeAlgebra::I_t":


    # cdef cppclass cppI3_t "SpacetimeAlgebra::I3_t":


    # cdef cppclass cppmv3 "SpacetimeAlgebra::mv3":


    # cdef cppclass cppvector "SpacetimeAlgebra::vector":


    # cdef cppclass cppvector3 "SpacetimeAlgebra::vector3":


    # cdef cppclass cppbivector "SpacetimeAlgebra::bivector":


    # cdef cppclass cppbivector3 "SpacetimeAlgebra::bivector3":


    # cdef cppclass cpppseudovector "SpacetimeAlgebra::pseudovector":


    # cdef cppclass cppspinor "SpacetimeAlgebra::spinor":


    # cdef cppclass cppspinor3 "SpacetimeAlgebra::spinor3":
