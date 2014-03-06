cdef extern from "Rectangle.h" namespace "shapes" :
    cdef cppclass cppRectangle "shapes::Rectangle" :
        cppRectangle() except +
        cppRectangle(int, int, int, int) except +
        int x0, y0, x1, y1
        int getLength()
        int getHeight()
        int getArea()
        void move(int, int)
        cppRectangle add(const cppRectangle&)
