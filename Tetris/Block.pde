public class Block{
  int size;
  PImage design;
  int xcor;
  int ycor;
  public Block(int x, int y, PImage image){
    size = 50;
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
    design.resize(100, 0);
    image(design, xcor, ycor);
  }
}
