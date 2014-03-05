all: GAtest

CleanupLineEndings:=perl -i -p -e 's/\r$$//; s/[ \t]*$$//'

SpacetimeAlgebra.cpp: SpacetimeAlgebra.xml
	g25 SpacetimeAlgebra.xml
	$(CleanupLineEndings) SpacetimeAlgebra.hpp
	$(CleanupLineEndings) SpacetimeAlgebra.cpp
	$(CleanupLineEndings) SpacetimeAlgebra_mt.cpp
	$(CleanupLineEndings) SpacetimeAlgebra_parse_multivector.cpp
	$(CleanupLineEndings) SpacetimeAlgebra_test_main.cpp

SpacetimeAlgebra_parse_multivector.cpp: SpacetimeAlgebra.cpp

SpacetimeAlgebra_test_main.cpp: SpacetimeAlgebra.cpp

SpacetimeAlgebra_mt.cpp: SpacetimeAlgebra.cpp

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -I/usr/local/include $< -o $@

GAtest: SpacetimeAlgebra_parse_multivector.o \
	SpacetimeAlgebra_mt.o \
	SpacetimeAlgebra.o SpacetimeAlgebra_test_main.o
	$(CXX) $(CXXFLAGS) \
	SpacetimeAlgebra.o SpacetimeAlgebra_parse_multivector.o \
	SpacetimeAlgebra_test_main.o \
	SpacetimeAlgebra_mt.o \
	-lm \
	-o test

clean:
	rm -f test *.o *.g SpacetimeAlgebra.cpp SpacetimeAlgebra.hpp doxyfile \
	SpacetimeAlgebra_parse_multivector.cpp SpacetimeAlgebra_test_main.cpp \
	SpacetimeAlgebra_mt.cpp SpacetimeAlgebra_mt.h
