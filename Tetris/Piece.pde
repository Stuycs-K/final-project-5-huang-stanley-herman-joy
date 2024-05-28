public class Piece{
  Block[][] blocks;
  PImage design = loadImage("redcar.png");
  int[] topleft;
  int wide, tall;
  public Piece(int num){
    topleft = new int[]{0, 0};
    blocks = new Block[3][3];
    if (num == 1){
      blocks[0][0] = new Block(0, 0, design);
      blocks[0][1] = new Block(0, 50, design);
      blocks[0][2] = new Block(0, 100, design);
      blocks[1][1] = new Block(50, 50, design);
      tall = 3;
      wide = 2;
    }
  }
  boolean fall(){
    if (topleft[1] < 500 - (tall * 50)){
      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), 50);
            blocks[i][j].setY(blocks[i][j].getY() + 1);
          }
        }
      }
      topleft[1]++;
      display();
      return true;
    }
    return false;
  }
  void rotate(){
    if (topleft[0] < 550 - blocks[0].length * 50 && topleft[1] < 500 - blocks.length * 50){
      Block[][] newblocks = new Block[blocks[0].length][blocks.length];
      for (int i = 0; i < newblocks.length; i++){
        for (int j = 0; j < newblocks[0].length; j++){
          if (blocks[j][2 - i] != null){
            noStroke();
            square(blocks[j][2 - i].getX(), blocks[j][2 - i].getY(), 50);
            blocks[j][2 - i].setX(topleft[0] + i * 50);
            blocks[j][2 - i].setY(topleft[1] + j * 50);
            newblocks[i][j] = blocks[j][2 - i];
          }
        }
      }
      this.blocks = newblocks;
      this.display();
      int x = tall;
      tall = wide;
      wide = x;
    }
  }
  void plunge(){
    for (int i = 0; i < blocks.length; i++) {
      for (int j = 0; j < blocks[0].length; j++) {
        if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), 50);
            blocks[i][j].setY(460);
          }
      }
    }
  }
  void moveleft(){
    if (topleft[0] != 0){
      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), 50);
            blocks[i][j].setX(blocks[i][j].getX() - 50);
          }
        }
      }
      topleft[0] -= 50;
    }
  }
  void moveright(){
    if (topleft[0] != 500 - (wide * 50)){
      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), 50);
            blocks[i][j].setX(blocks[i][j].getX() + 50);
          }
        }
      }
      topleft[0] += 50;
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
}
