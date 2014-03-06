all:
	python setup.py build_ext --inplace

clean:
	/bin/rm -rf build spacetime.so spacetime.cpp
