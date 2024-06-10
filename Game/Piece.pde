import java.util.Arrays;
public class Piece{
  Block[][] blocks;
  PImage design = loadImage("best.png");
  PImage design1 = loadImage("best1.png");
  int[] topleft;
  int wide, tall;
  int wherex, wherey;
  int size;
  int gameWidth = 10;
  int gameHeight = 40;
  int num;
  int tint;
  boolean up;
  ArrayList<Integer> bottom;
  public Piece(int num, int level, int[] topleft, int size){
    color newColor;
    this.size = size;
    this.topleft = new int[]{topleft[0], topleft[1]};
    tint = 96;
    up = true;
    this.num = num;
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
        if (green(design.pixels[i]) < 200){
          design.pixels[i] = newColor;
        }
      }
      design.updatePixels();
    }
    if (num % 3 == 1){
      for (int i = 0; i < design.pixels.length; i++){
        if (green(design1.pixels[i]) < 200){
          design1.pixels[i] = newColor;
        }
      }
      design1.updatePixels();
    }
    if (num % 3 == 2){
      for (int i = 0; i < design.pixels.length; i++){
        if (green(design1.pixels[i]) < 200){
          design1.pixels[i] = newColor;
        }
      }
      design1.updatePixels();
    }
    if (num == 0){
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[1], design, size);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design, size);
      blocks[2][0] = new Block(topleft[0] + 2 * size, topleft[1], design, size);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design, size);
      tall = 2;
      wide = 3;
    }
    if (num == 1) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[1], design1, size);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design1, size);
      blocks[2][0] = new Block(topleft[0] + 2 * size, topleft[1], design1, size);
      blocks[2][1] = new Block(topleft[0] + 2 * size, topleft[1] + size, design1, size);
      tall = 2;
      wide = 3;
    }
    if (num == 2) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[1], design1, size);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design1, size);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design1, size);
      blocks[2][1] = new Block(topleft[0] + 2 * size, topleft[1] + size, design1, size);
      tall = 2;
      wide = 3;
    }
    if (num == 3) {
      blocks = new Block[2][2];
      blocks[0][0] = new Block(topleft[0], topleft[1], design, size);
      blocks[0][1] = new Block(topleft[0], topleft[1] + size, design, size);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design, size);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design, size);
      tall = 2;
      wide = 2;
    }
    if (num == 4) {
      blocks = new Block[3][3];
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design1, size);
      blocks[2][0] = new Block(topleft[0] + 2 * size, topleft[1], design1, size);
      blocks[0][1] = new Block(topleft[0], topleft[1] + size, design1, size);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design1, size);
      tall = 2;
      wide = 3;
    }
    if (num == 5) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[1], design1, size);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design1, size);
      blocks[2][0] = new Block(topleft[0] + size * 2, topleft[1], design1, size);
      blocks[0][1] = new Block(topleft[0], topleft[1] + size, design1, size);
      tall = 2;
      wide = 3;  
    }
    if (num == 6) {
      blocks = new Block[4][4];
      blocks[0][1] = new Block(topleft[0], topleft[1] + size, design, size);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design, size);
      blocks[2][1] = new Block(topleft[0] + 2 * size, topleft[1] + size, design, size);
      blocks[3][1] = new Block(topleft[0] + 3 * size, topleft[1] + size, design, size);
      tall = 1;
      wide = 4;
    }
    findtopleft();
  }

  void fall(){
    if (topleft[1] < height - (tall * size)){
      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            fill(0);
            square(blocks[i][j].getX(), blocks[i][j].getY(), size);
            blocks[i][j].setY(blocks[i][j].getY() + size);
          }
        }
      }
      topleft[1] += size;
      display();
    }
  }  
  void rotate(){
    if (topleft[0] / size - 10 < 21 - blocks[0].length && topleft[1] / size  - 2 < 20 - blocks.length){
      topleft[0] -= wherex * size;
      topleft[1] -= wherey * size;
      Block[][] newblocks = new Block[blocks[0].length][blocks.length];
      for (int i = 0; i < newblocks.length; i++){
        for (int j = 0; j < newblocks[0].length; j++){
          if (blocks[j][blocks.length - 1 - i] != null){
            noStroke();
            square(blocks[j][blocks.length - 1 - i].getX(), blocks[j][blocks.length - 1 - i].getY(), size);
            blocks[j][blocks.length - 1 - i].setX(topleft[0] + i * size);
            blocks[j][blocks.length - 1 - i].setY(topleft[1] + j * size);
            newblocks[i][j] = blocks[j][blocks.length - 1 - i];
          }
        }
      }
      this.blocks = newblocks;
      this.display();
      int x = tall;
      tall = wide;
      wide = x;
      findtopleft();
    }
  }
  void moveleft(){
    if (topleft[0] != 0){
      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), size);
            blocks[i][j].setX(blocks[i][j].getX() - size);
          }
        }
      }
      topleft[0] -= size;
    }
  }
  void moveright(){
    if (topleft[0] != (10 * size) - (wide * size)){
      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), size);
            blocks[i][j].setX(blocks[i][j].getX() + size);
          }
        }
      }
      topleft[0] += size;
    }
  }
  void display(){
    for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if (blocks[i][j] != null){
          blocks[i][j].display();
        }
      }
    }
  }
  void fancydisplay(){
    for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), size);
          }
        }
      }
    tint(255, tint);
    display();
    if (tint == 128 || tint == 64){
      up = !up;
    }
    if (up){
      tint += 2;
    }
    else{
      tint -= 2;
    }
    tint(255, 255);
  }
  void findtopleft(){
    wherex = 0;
    wherey = 0;
    if (Arrays.equals(blocks[0], new Block[blocks[0].length])){
      topleft[0] += size;
      wherex = 1;
    }
    if (Arrays.equals(blocks[1], new Block[blocks[1].length])){
      topleft[0] += size;
      wherex = 2;
    }
    boolean bob = true;
    for (int i = 0; i < blocks.length; i++){
      if (blocks[i][0] != null){
        bob = false;
        break;
      }
    }
    if (bob){
      topleft[1] += size;
      wherey = 1;
      for (int i = 0; i < blocks.length; i++){
        if (blocks[i][1] != null){
          bob = false;
          break;
        }
      }
      if (bob){
        wherey = 2;
        topleft[1] += size;
      }
    }
  }
}
