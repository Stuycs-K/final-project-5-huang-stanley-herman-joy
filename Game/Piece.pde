import java.util.Arrays;
public class Piece{
  Block[][] blocks;
  PImage design = loadImage("redcar.png");
  int[] topleft;
  int wide, tall;
  int wherex, wherey;
  ArrayList<Integer> bottom;
  public Piece(int num){
    topleft = new int[]{0, 0};
    if (num == 1){
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[0], design);
      blocks[0][1] = new Block(topleft[0], topleft[0] + 50, design);
      blocks[0][2] = new Block(topleft[0], topleft[0] + 100, design);
      blocks[1][1] = new Block(topleft[0] + 50, topleft[0] + 50, design);
      tall = 3;
      wide = 2;
    }
    if (num == 2) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[0], design);
      blocks[0][1] = new Block(topleft[0], topleft[0] + 50, design);
      blocks[0][2] = new Block(topleft[0], topleft[0] + 100, design);
      blocks[1][2] = new Block(topleft[0] + 50, topleft[0] + 100, design);
      tall = 3;
      wide = 2;
    }
    if (num == 3) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[0], design);
      blocks[0][1] = new Block(topleft[0], topleft[0] + 50, design);
      blocks[0][2] = new Block(topleft[0], topleft[0] + 100, design);
      blocks[1][0] = new Block(topleft[0] + 50, topleft[0], design);
      tall = 3;
      wide = 2;  
    }
    if (num == 4) {
      blocks = new Block[2][2];
      blocks[0][0] = new Block(topleft[0], topleft[0], design);
      blocks[0][1] = new Block(topleft[0], topleft[0] + 50, design);
      blocks[1][0] = new Block(topleft[0] + 50, topleft[0], design);
      blocks[1][1] = new Block(topleft[0] + 50, topleft[0] + 50, design);
      tall = 2;
      wide = 2;
    }
    if (num == 5) {
      blocks = new Block[4][4];
      blocks[1][0] = new Block(topleft[0] + 50, topleft[0], design);
      blocks[1][1] = new Block(topleft[0] + 50, topleft[0] + 50, design);
      blocks[1][2] = new Block(topleft[0] + 50, topleft[0] + 100, design);
      blocks[1][3] = new Block(topleft[0] + 50, topleft[0] + 150, design);
      tall = 4;
      wide = 1;
    }
     if (num == 6) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0] + 50, topleft[0], design);
      blocks[0][1] = new Block(topleft[0] + 50, topleft[0] + 50, design);
      blocks[1][1] = new Block(topleft[0] + 50, topleft[0] + 100, design);
      blocks[1][2] = new Block(topleft[0] + 50, topleft[0] + 150, design);
      tall = 2;
      wide = 3;
    }
    if (num == 7) {
      blocks = new Block[3][3];
      blocks[0][1] = new Block(topleft[0] + 50, topleft[0], design);
      blocks[0][2] = new Block(topleft[0] + 50, topleft[0] + 50, design);
      blocks[1][0] = new Block(topleft[0] + 50, topleft[0] + 100, design);
      blocks[1][1] = new Block(topleft[0] + 50, topleft[0] + 150, design);
      tall = 2;
      wide = 3;
    }
    findtopleft();
  }

  void fall(){
    if (topleft[1] < 500 - (tall * 50)){
      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), 50);
            blocks[i][j].setY(blocks[i][j].getY() + 50);
          }
        }
      }
      topleft[1] += 50;
      display();
    }
  }  
  void rotate(){
    if (topleft[0] < 550 - blocks[0].length * 50 && topleft[1] < 500 - blocks.length * 50){
      Block[][] newblocks = new Block[blocks[0].length][blocks.length];
      for (int i = 0; i < newblocks.length; i++){
        for (int j = 0; j < newblocks[0].length; j++){
          if (blocks[j][blocks.length - 1 - i] != null){
            noStroke();
            square(blocks[j][blocks.length - 1 - i].getX(), blocks[j][blocks.length - 1 - i].getY(), 50);
            blocks[j][blocks.length - 1 - i].setX(topleft[0] + i * 50);
            blocks[j][blocks.length - 1 - i].setY(topleft[1] + j * 50);
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
  void plunge(){
    for (int i = 0; i < blocks.length; i++) {
      for (int j = 0; j < blocks[0].length; j++) {
        if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), 50);
            blocks[i][j].setY(500 - ((tall - j + wherey) * 50));
          }
      }
    }
    topleft[1] = 500 - (tall * 50);
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
  void findtopleft(){
    wherex = 0;
    wherey = 0;
    if (Arrays.equals(blocks[0], new Block[blocks[0].length])){
      topleft[0] += 50;
      wherex = 1;
    }
    if (Arrays.equals(blocks[1], new Block[blocks[1].length])){
      topleft[0] += 50;
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
      topleft[1] += 50;
      wherey = 1;
      for (int i = 0; i < blocks.length; i++){
        if (blocks[i][1] != null){
          bob = false;
          break;
        }
      }
      if (bob){
        wherey = 2;
        topleft[1] += 50;
      }
    }
  }
}
