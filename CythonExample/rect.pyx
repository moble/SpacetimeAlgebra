# distutils: language = c++
# distutils: sources = Rectangle.cpp

cimport rect
from cython.operator cimport dereference as deref

cdef class Rectangle:
    cdef rect.cppRectangle *thisptr      # hold a C++ instance which we're wrapping
    def __cinit__(self, int x0, int y0, int x1, int y1):
        self.thisptr = new rect.cppRectangle(x0, y0, x1, y1)
    def __dealloc__(self):
        del self.thisptr
    def getLength(self):
        return self.thisptr.getLength()
    def getHeight(self):
        return self.thisptr.getHeight()
    def getArea(self):
        return self.thisptr.getArea()
    def move(self, dx, dy):
        self.thisptr.move(dx, dy)
    cdef add(self, Rectangle b):
        cdef rect.cppRectangle c
        c = self.thisptr.add(deref(b.thisptr))
        return 0.0
    property x0:
        def __get__(self): return self.thisptr.x0
        def __set__(self, x0): self.thisptr.x0 = x0
    property x1:
        def __get__(self): return self.thisptr.x1
        def __set__(self, x1): self.thisptr.x1 = x1
    property y0:
        def __get__(self): return self.thisptr.y0
        def __set__(self, y0): self.thisptr.y0 = y0
    property y1:
        def __get__(self): return self.thisptr.y1
        def __set__(self, y1): self.thisptr.y1 = y1
