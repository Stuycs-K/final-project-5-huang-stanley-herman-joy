import java.util.Arrays;
public class Piece{
  Block[][] blocks;
  PImage design = loadImage("best.png");
  PImage design1 = loadImage("best1.png");
  int[] topleft;
  int wide, tall;
  int wherex, wherey;
  int size = 35;
  int gameWidth = 10;
  int gameHeight = 40;
  int num;
  ArrayList<Integer> bottom;
  public Piece(int num){
    topleft = new int[]{140, 0};
    this.num = num;
    if (num == 1){
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[1], design);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design);
      blocks[2][0] = new Block(topleft[0] + 2 * size, topleft[1], design);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design);
      tall = 2;
      wide = 3;
    }
    if (num == 2) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[1], design1);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design1);
      blocks[2][0] = new Block(topleft[0] + 2 * size, topleft[1], design1);
      blocks[2][1] = new Block(topleft[0] + 2 * size, topleft[1] + size, design1);
      tall = 2;
      wide = 3;
    }
    if (num == 3) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[1], design1);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design1);
      blocks[2][0] = new Block(topleft[0] + size * 2, topleft[1], design1);
      blocks[0][1] = new Block(topleft[0], topleft[1] + size, design1);
      tall = 2;
      wide = 3;  
    }
    if (num == 4) {
      blocks = new Block[2][2];
      blocks[0][0] = new Block(topleft[0], topleft[1], design);
      blocks[0][1] = new Block(topleft[0], topleft[1] + size, design);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design);
      tall = 2;
      wide = 2;
    }
    if (num == 5) {
      blocks = new Block[4][4];
      blocks[0][1] = new Block(topleft[0], topleft[1] + size, design);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design);
      blocks[2][1] = new Block(topleft[0] + 2 * size, topleft[1] + size, design);
      blocks[3][1] = new Block(topleft[0] + 3 * size, topleft[1] + size, design);
      tall = 1;
      wide = 4;
    }
     if (num == 6) {
      blocks = new Block[3][3];
      blocks[0][0] = new Block(topleft[0], topleft[1], design1);
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design1);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design1);
      blocks[2][1] = new Block(topleft[0] + 2 * size, topleft[1] + size, design1);
      tall = 2;
      wide = 3;
    }
    if (num == 7) {
      blocks = new Block[3][3];
      blocks[1][0] = new Block(topleft[0] + size, topleft[1], design1);
      blocks[2][0] = new Block(topleft[0] + 2 * size, topleft[1], design1);
      blocks[0][1] = new Block(topleft[0], topleft[1] + size, design1);
      blocks[1][1] = new Block(topleft[0] + size, topleft[1] + size, design1);
      tall = 2;
      wide = 3;
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
    if (topleft[0] / size < 11 - blocks[0].length && topleft[1] / size < 20 - blocks.length){
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
