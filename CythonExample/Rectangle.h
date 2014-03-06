namespace shapes {
  class Rectangle {
  public:
    int x0, y0, x1, y1;
    Rectangle() : x0(0), y0(0), x1(0), y1(0) { }
    Rectangle(int x0, int y0, int x1, int y1);
    ~Rectangle();
    int getLength();
    int getHeight();
    int getArea();
    void move(int dx, int dy);
    Rectangle add(const Rectangle& b);
  };
}
