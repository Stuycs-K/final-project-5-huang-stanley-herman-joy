public class Block{
  final static int size = 35;
  PImage design;
  int xcor;
  int ycor;
  public Block(int x, int y, PImage image){
    xcor = x;
    ycor = y;
    design = image;
    design.resize(size - 1, size - 1);
  }
  public int getX(){
    return xcor;
  }
  public int getY(){
    return ycor;
  }
  void setX(int newX){
    this.xcor = newX;
  }
  void setY(int newY){
    this.ycor = newY;
  }
  void display(){
    image(design, xcor, ycor);
  }
}
