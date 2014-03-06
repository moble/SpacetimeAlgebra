from libcpp.string cimport string

cdef extern from "SpacetimeAlgebra.hpp" namespace "SpacetimeAlgebra":
    cdef cppclass cppmv "SpacetimeAlgebra::mv":
        ## Constructors
        cppmv() except +
        cppmv(const cppmv&A) except +
        cppmv(double scalar) except +
        cppmv(int gu, const double *coordinates) except +
        cppmv(const cppgamma_0_t&A) except +
        cppmv(const cppgamma_1_t&A) except +
        cppmv(const cppgamma_2_t&A) except +
        cppmv(const cppgamma_3_t&A) except +
        cppmv(const cppI_t&A) except +
        cppmv(const cppI3_t&A) except +
        cppmv(const cppmv3&A) except +
        cppmv(const cppvector&A) except +
        cppmv(const cppvector3&A) except +
        cppmv(const cppbivector&A) except +
        cppmv(const cppbivector3&A) except +
        cppmv(const cpppseudovector&A) except +
        cppmv(const cppspinor&A) except +
        cppmv(const cppspinor3&A) except +
        ## Set various parts
        void set()
        void set(const cppmv &A)
        void set(double)
        void set(int gu, const double *coordinates)
        void set(const cppgamma_0_t &A)
        void set(const cppgamma_1_t &A)
        void set(const cppgamma_2_t &A)
        void set(const cppgamma_3_t &A)
        void set(const cppI_t &A)
        void set(const cppI3_t &A)
        void set(const cppmv3 &A)
        void set(const cppvector &A)
        void set(const cppvector3 &A)
        void set(const cppbivector &A)
        void set(const cppbivector3 &A)
        void set(const cpppseudovector &A)
        void set(const cppspinor &A)
        void set(const cppspinor3 &A)
        ## Set components
        void set_scalar(double val)
        void set_gamma_0(double val)
        void set_gamma_1(double val)
        void set_gamma_2(double val)
        void set_gamma_3(double val)
        void set_gamma_0_gamma_1(double val)
        void set_gamma_0_gamma_2(double val)
        void set_gamma_1_gamma_2(double val)
        void set_gamma_0_gamma_3(double val)
        void set_gamma_1_gamma_3(double val)
        void set_gamma_2_gamma_3(double val)
        void set_gamma_0_gamma_1_gamma_2(double val)
        void set_gamma_0_gamma_1_gamma_3(double val)
        void set_gamma_0_gamma_2_gamma_3(double val)
        void set_gamma_1_gamma_2_gamma_3(double val)
        void set_gamma_0_gamma_1_gamma_2_gamma_3(double val)
        ## Get components
        double get_scalar()
        double get_gamma_0()
        double get_gamma_1()
        double get_gamma_2()
        double get_gamma_3()
        double get_gamma_0_gamma_1()
        double get_gamma_0_gamma_2()
        double get_gamma_1_gamma_2()
        double get_gamma_0_gamma_3()
        double get_gamma_1_gamma_3()
        double get_gamma_2_gamma_3()
        double get_gamma_0_gamma_1_gamma_2()
        double get_gamma_0_gamma_1_gamma_3()
        double get_gamma_0_gamma_2_gamma_3()
        double get_gamma_1_gamma_2_gamma_3()
        double get_gamma_0_gamma_1_gamma_2_gamma_3()
        ## String functions
        string toString(const char* format)
        string toString_e()
        string toString_e20()
    ## Algebraic operations on mv
    cdef cppmv cppadd "SpacetimeAlgebra::add" (const cppmv &a, const cppmv &b)
    cdef cppmv cppsubtract "SpacetimeAlgebra::subtract" (const cppmv &a, const cppmv &b)
    cdef cppmv cppgp "SpacetimeAlgebra::gp" (const double a, const cppmv &b)
    cdef cppmv cppgp "SpacetimeAlgebra::gp" (const cppmv &a, const double b)
    cdef cppmv cppgp "SpacetimeAlgebra::gp" (const cppmv &a, const cppmv &b)
    cdef cppmv cppdiv "SpacetimeAlgebra::div" (const cppmv &a, const double b)
    cdef cppmv cpprc "SpacetimeAlgebra::rc" (const cppmv &a, const cppmv &b)
    cdef cppmv cpplc "SpacetimeAlgebra::lc" (const cppmv &a, const cppmv &b)
    cdef double cppsp "SpacetimeAlgebra::sp" (const cppmv &a, const cppmv &b)
    cdef cppmv cppop "SpacetimeAlgebra::op" (const cppmv &a, const cppmv &b)
    cdef cppmv cppdual "SpacetimeAlgebra::dual" (const cppmv &a)
    cdef cppmv cppnegate "SpacetimeAlgebra::negate" (const cppmv &a)
    cdef cppmv cppreverse "SpacetimeAlgebra::reverse" (const cppmv &a)
    cdef cppmv cppcliffordConjugate "SpacetimeAlgebra::cliffordConjugate" (const cppmv &a)
    cdef cppmv cppgradeInvolution "SpacetimeAlgebra::gradeInvolution" (const cppmv &a)
    cdef double cppnorm "SpacetimeAlgebra::norm" (const cppmv &a)
    cdef double cppnorm2 "SpacetimeAlgebra::norm2" (const cppmv &a)
    cdef cppmv cppunit "SpacetimeAlgebra::unit" (const cppmv &a)
    cdef cppmv cppversorInverse "SpacetimeAlgebra::versorInverse" (const cppmv &a)
    cdef cppmv cppexp "SpacetimeAlgebra::exp" (const cppmv &x, int order)
    cdef cppmv cppsin "SpacetimeAlgebra::sin" (const cppmv &x, int order)
    cdef cppmv cppcos "SpacetimeAlgebra::cos" (const cppmv &x, int order)
    cdef cppmv cppsinh "SpacetimeAlgebra::sinh" (const cppmv &x, int order)
    cdef cppmv cppcosh "SpacetimeAlgebra::cosh" (const cppmv &x, int order)
    ## Extract graded parts
    cdef cppmv cppextractGrade0 "SpacetimeAlgebra::extractGrade0" (const cppmv &a)
    cdef cppmv cppextractGrade1 "SpacetimeAlgebra::extractGrade1" (const cppmv &a)
    cdef cppmv cppextractGrade2 "SpacetimeAlgebra::extractGrade2" (const cppmv &a)
    cdef cppmv cppextractGrade3 "SpacetimeAlgebra::extractGrade3" (const cppmv &a)
    cdef cppmv cppextractGrade4 "SpacetimeAlgebra::extractGrade4" (const cppmv &a)


    cdef cppclass cppgamma_0_t "SpacetimeAlgebra::gamma_0_t":
        cppgamma_0_t() except +
        cppgamma_0_t(const cppgamma_0_t &A) except +


    cdef cppclass cppgamma_1_t "SpacetimeAlgebra::gamma_1_t":
        cppgamma_1_t() except +
        cppgamma_1_t(const cppgamma_1_t &A) except +


    cdef cppclass cppgamma_2_t "SpacetimeAlgebra::gamma_2_t":
        cppgamma_2_t() except +
        cppgamma_2_t(const cppgamma_2_t &A) except +


    cdef cppclass cppgamma_3_t "SpacetimeAlgebra::gamma_3_t":
        cppgamma_3_t() except +
        cppgamma_3_t(const cppgamma_3_t &A) except +


    cdef cppclass cppI_t "SpacetimeAlgebra::I_t":
        cppI_t() except +
        cppI_t(const cppI_t &A) except +

    cppI_t I


    cdef cppclass cppI3_t "SpacetimeAlgebra::I3_t":
        cppI3_t() except +
        cppI3_t(const cppI3_t &A) except +


    cdef cppclass cppmv3 "SpacetimeAlgebra::mv3":
        cppmv3() except +
        cppmv3(const cppmv3 &A) except +


    cdef cppclass cppvector "SpacetimeAlgebra::vector":
        cppvector() except +
        cppvector(const cppvector &A) except +


    cdef cppclass cppvector3 "SpacetimeAlgebra::vector3":
        cppvector3() except +
        cppvector3(const cppvector3 &A) except +


    cdef cppclass cppbivector "SpacetimeAlgebra::bivector":
        cppbivector() except +
        cppbivector(const cppbivector &A) except +


    cdef cppclass cppbivector3 "SpacetimeAlgebra::bivector3":
        cppbivector3() except +
        cppbivector3(const cppbivector3 &A) except +


    cdef cppclass cpppseudovector "SpacetimeAlgebra::pseudovector":
        cpppseudovector() except +
        cpppseudovector(const cpppseudovector &A) except +


    cdef cppclass cppspinor "SpacetimeAlgebra::spinor":
        cppspinor() except +
        cppspinor(const cppspinor &A) except +


    cdef cppclass cppspinor3 "SpacetimeAlgebra::spinor3":
        cppspinor3() except +
        cppspinor3(const cppspinor3 &A) except +
