public class Block{
  final static int size = 50;
  PImage design;
  int xcor;
  int ycor;
  public Block(int x, int y, PImage image){
    xcor = x;
    ycor = y;
    design = image;
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
    design.resize(50, 50);
    image(design, xcor, ycor);
  }
}
