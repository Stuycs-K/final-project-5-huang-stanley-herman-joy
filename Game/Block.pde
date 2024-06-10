public class Block{
  PImage design;
  int xcor;
  int ycor;
  int level;
  int num;
  public Block(int x, int y, PImage image, int size, int level, int num){
    xcor = x;
    ycor = y;
    design = image;
    design.resize(size - 2, size - 2);
    this.level = level;
    this.num = num;
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
  void updateColor(){
    color newColor;
    if (level % 10 == 0){
      if (num % 3 == 0)
        newColor = color(0, 82, 232);
      else if(num % 3 == 1)
        newColor = color(60, 188, 252);
      else
        newColor = color(0, 88, 248);
    }
    else if (level % 10 == 1){
      if (num % 3 == 0)
        newColor = color(0, 157, 0);
      else if(num % 3 == 1)
        newColor = color(184, 248, 24);
      else
        newColor = color(0, 168, 0);
    }
    else if (level % 10 == 2){
      if (num % 3 == 0)
        newColor = color(216, 0, 204);
      else if(num % 3 == 1)
        newColor = color(248, 120, 248);
      else
        newColor = color(216, 0, 204);
    }
    else if (level % 10 == 3){
      if (num % 3 == 0)
        newColor = color(0, 88, 248);
      else if(num % 3 == 1)
        newColor = color(88, 216, 84);
      else
        newColor = color(0, 88, 248);
    }
    else if (level % 10 == 4){
      if (num % 3 == 0)
        newColor = color(228, 0, 88);
      else if(num % 3 == 1)
        newColor = color(88, 248, 152);
      else
        newColor = color(228, 0, 88);
    }
    else if (level % 10 == 5){
      if (num % 3 == 0)
        newColor = color(88, 248, 152);
      else if(num % 3 == 1)
        newColor = color(104, 136, 252);
      else
        newColor = color(88, 248, 152);
    }
    else if (level % 10 == 6){
      if (num % 3 == 0)
        newColor = color(248, 56, 0);
      else if(num % 3 == 1)
        newColor = color(124, 124, 124);
      else
        newColor = color(248, 56, 0);
    }
    else if (level % 10 == 7){
      if (num % 3 == 0)
        newColor = color(104, 68, 252);
      else if(num % 3 == 1)
        newColor = color(168, 0, 32);
      else
        newColor = color(104, 68, 252);
    }
    else if (level % 10 == 8){
      if (num % 3 == 0)
        newColor = color(0, 88, 248);
      else if(num % 3 == 1)
        newColor = color(248, 56, 0);
      else
        newColor = color(0, 88, 248);
    }
    else{
      if (num % 3 == 0)
        newColor = color(248, 56, 0);
      else if(num % 3 == 1)
        newColor = color(242, 160, 68);
      else
        newColor = color(248, 56, 0);
    }
    if (num % 3 == 0){
      for (int i = 0; i < design.pixels.length; i++){
        if (green(design.pixels[i]) < 200 || blue(design.pixels[i]) < 200 || red(design.pixels[i]) < 200){
          design.pixels[i] = newColor;
        }
      }
      design.updatePixels();
    }
    if (num % 3 == 1){
      for (int i = 0; i < design.pixels.length; i++){
        if (green(design.pixels[i]) < 200 || blue(design.pixels[i]) < 200 || red(design.pixels[i]) < 200){
          design.pixels[i] = newColor;
        }
      }
      design.updatePixels();
    }
    if (num % 3 == 2){
      for (int i = 0; i < design.pixels.length; i++){
        if (green(design.pixels[i]) < 200 || blue(design.pixels[i]) < 200 || red(design.pixels[i]) < 200){
          design.pixels[i] = newColor;
        }
      }
      design.updatePixels();
    }
  }
}
