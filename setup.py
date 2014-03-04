"""\

This is a simple compilation file for the spacetime-algebra module.
It depends on cython, which can be installed easily via most package
managers, or even more simply through pip (which is python's own
package manager):
    pip install Cython

To build this code and run it in place, run
    python setup.py build_ext --inplace
then open python and type 'import spacetime' in the current directory.

To install in the user's directory, run
    python setup.py install --user
Now, 'import spacetime' may be run from a python instance started in
any directory on the system."

Finally, to install system-wide (or even better, virtualenv-wide), run
    python setup.py install
Now, 'import spacetime' may be run from a python instance started in
any directory on the system.

"""

from distutils.core import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize('*.pyx'),
)
