all: GAtest

CleanupLineEndings:=perl -i -pe 's/\r$$//'

SpacetimeAlgebra.cpp: SpacetimeAlgebra.xml
	g25 SpacetimeAlgebra.xml
	$(CleanupLineEndings) SpacetimeAlgebra.hpp
	$(CleanupLineEndings) SpacetimeAlgebra.cpp

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
	SpacetimeAlgebraParser.cpp SpacetimeAlgebraLexer.cpp \
	SpacetimeAlgebra_parse_multivector.cpp SpacetimeAlgebra_test_main.cpp \
	SpacetimeAlgebra_mt.cpp SpacetimeAlgebra_mt.h

