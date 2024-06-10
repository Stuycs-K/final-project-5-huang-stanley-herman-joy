public class Block{
  PImage design;
  int xcor;
  int ycor;
  public Block(int x, int y, PImage image, int size){
    xcor = x;
    ycor = y;
    design = image;
    design.resize(size - 2, size - 2);
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
    image(design, xcor + 1, ycor + 1);
  }
}
