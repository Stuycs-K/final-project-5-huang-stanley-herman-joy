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
      blocks[0][1] = new Block(topleft[0], topleft[0] + 35, design);
      blocks[0][2] = new Block(topleft[0], topleft[0] + 70, design);
      blocks[1][1] = new Block(topleft[0] + 35, topleft[0] + 35, design);
      tall = 3;
      wide = 2;
    }
    if (num == 2) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[0], design);
      blocks[0][1] = new Block(topleft[0], topleft[0] + 35, design);
      blocks[0][2] = new Block(topleft[0], topleft[0] + 70, design);
      blocks[1][2] = new Block(topleft[0] + 35, topleft[0] + 70, design);
      tall = 3;
      wide = 2;
    }
    if (num == 3) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[0], design);
      blocks[0][1] = new Block(topleft[0], topleft[0] + 35, design);
      blocks[0][2] = new Block(topleft[0], topleft[0] + 70, design);
      blocks[1][0] = new Block(topleft[0] + 35, topleft[0], design);
      tall = 3;
      wide = 2;  
    }
    if (num == 4) {
      blocks = new Block[2][2];
      blocks[0][0] = new Block(topleft[0], topleft[0], design);
      blocks[0][1] = new Block(topleft[0], topleft[0] + 35, design);
      blocks[1][0] = new Block(topleft[0] + 35, topleft[0], design);
      blocks[1][1] = new Block(topleft[0] + 35, topleft[0] + 35, design);
      tall = 2;
      wide = 2;
    }
    if (num == 5) {
      blocks = new Block[4][4];
      blocks[1][0] = new Block(topleft[0] + 35, topleft[0], design);
      blocks[1][1] = new Block(topleft[0] + 35, topleft[0] + 35, design);
      blocks[1][2] = new Block(topleft[0] + 35, topleft[0] + 70, design);
      blocks[1][3] = new Block(topleft[0] + 35, topleft[0] + 135, design);
      tall = 4;
      wide = 1;
    }
     if (num == 6) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[0], design);
      blocks[1][0] = new Block(topleft[0] + 35, topleft[0], design);
      blocks[1][1] = new Block(topleft[0] + 35, topleft[0] + 35, design);
      blocks[2][1] = new Block(topleft[0] + 70, topleft[0] + 35, design);
      tall = 2;
      wide = 3;
    }
    if (num == 7) {
      blocks = new Block[3][3];
      blocks[1][0] = new Block(topleft[0] + 35, topleft[0], design);
      blocks[2][0] = new Block(topleft[0] + 70, topleft[0], design);
      blocks[0][1] = new Block(topleft[0], topleft[0] + 35, design);
      blocks[1][1] = new Block(topleft[0] + 35, topleft[0] + 35, design);
      tall = 2;
      wide = 3;
    }
    findtopleft();
  }

  void fall(){
    if (topleft[1] < 350 - (tall * 35)){
      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), 35);
            blocks[i][j].setY(blocks[i][j].getY() + 35);
          }
        }
      }
      topleft[1] += 35;
      display();
    }
  }  
  void rotate(){
    if (topleft[0] < 385 - blocks[0].length * 35 && topleft[1] < 350 - blocks.length * 35){
      Block[][] newblocks = new Block[blocks[0].length][blocks.length];
      for (int i = 0; i < newblocks.length; i++){
        for (int j = 0; j < newblocks[0].length; j++){
          if (blocks[j][blocks.length - 1 - i] != null){
            noStroke();
            square(blocks[j][blocks.length - 1 - i].getX(), blocks[j][blocks.length - 1 - i].getY(), 35);
            blocks[j][blocks.length - 1 - i].setX(topleft[0] + i * 35);
            blocks[j][blocks.length - 1 - i].setY(topleft[1] + j * 35);
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
            square(blocks[i][j].getX(), blocks[i][j].getY(), 35);
            blocks[i][j].setX(blocks[i][j].getX() - 35);
          }
        }
      }
      topleft[0] -= 35;
    }
  }
  void moveright(){
    if (topleft[0] != 350 - (wide * 35)){
      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[0].length; j++){
          if (blocks[i][j] != null){
            noStroke();
            square(blocks[i][j].getX(), blocks[i][j].getY(), 35);
            blocks[i][j].setX(blocks[i][j].getX() + 35);
          }
        }
      }
      topleft[0] += 35;
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
      topleft[0] += 35;
      wherex = 1;
    }
    if (Arrays.equals(blocks[1], new Block[blocks[1].length])){
      topleft[0] += 35;
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
      topleft[1] += 35;
      wherey = 1;
      for (int i = 0; i < blocks.length; i++){
        if (blocks[i][1] != null){
          bob = false;
          break;
        }
      }
      if (bob){
        wherey = 2;
        topleft[1] += 35;
      }
    }
  }
}
