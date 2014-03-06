all: SpacetimeAlgebra_parse_mv.o SpacetimeAlgebra.o

# all: GAtest

CleanupLineEndings:=perl -i -p -e 's/\t/  /g; s/[ \t\r]*$$//'

SpacetimeAlgebra.cpp: SpacetimeAlgebraInput.xml SpacetimeAlgebra.xsl
	saxon -xsl:SpacetimeAlgebra.xsl -s:SpacetimeAlgebraInput.xml -o:SpacetimeAlgebra.xml
	g25 SpacetimeAlgebra.xml
	$(CleanupLineEndings) SpacetimeAlgebra.hpp
	$(CleanupLineEndings) SpacetimeAlgebra.cpp
	$(CleanupLineEndings) SpacetimeAlgebra_parse_mv.cpp
#	$(CleanupLineEndings) SpacetimeAlgebra_mt.cpp
#	$(CleanupLineEndings) SpacetimeAlgebra_test_main.cpp

SpacetimeAlgebra_parse_mv.cpp: SpacetimeAlgebra.cpp

# SpacetimeAlgebra_mt.cpp: SpacetimeAlgebra.cpp

# SpacetimeAlgebra_test_main.cpp: SpacetimeAlgebra.cpp

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -I/usr/local/include $< -o $@

GAtest: SpacetimeAlgebra_parse_mv.o \
	SpacetimeAlgebra_mt.o \
	SpacetimeAlgebra.o SpacetimeAlgebra_test_main.o
	$(CXX) $(CXXFLAGS) \
	SpacetimeAlgebra.o SpacetimeAlgebra_parse_mv.o \
	SpacetimeAlgebra_mt.o \
	SpacetimeAlgebra_test_main.o \
	-lm \
	-o test

clean:
	rm -rf docs test *.o *.g SpacetimeAlgebra.cpp SpacetimeAlgebra.hpp doxyfile \
	SpacetimeAlgebra_parse_mv.cpp SpacetimeAlgebra_test_main.cpp \
	SpacetimeAlgebra_mt.cpp SpacetimeAlgebra_mt.h
