import java.util.Arrays;
public class Tetris{
  int points;
  Block[][] blocks;
  Piece joe;
  Piece joe2;
  int millis;
  PImage design = loadImage("best.png");
  PImage design1 = loadImage("best1.png");
  int size = 35;
  int rowscleared = 0;
  int level = 0;
  int[] rates = new int[]{48, 43, 38, 33, 28, 23, 18, 13, 8, 6, 5, 5, 5, 4, 4, 4, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1};
  int rate = rates[Math.min(rowscleared / 10, 29)] * 1000 / 60;
  public Tetris(){
    blocks = new Block[10][20];
    joe = new Piece(randomPiece(), level);
    joe2 = new Piece(joe.num, level);
    plunge(joe2);
    joe.display();
    joe2.display();
    millis = millis();
    rowscleared = 0;
    points = 0;
  }
  boolean run(){
    //System.out.println(joe.wide + "," + joe.tall);
    //System.out.println(joe.topleft[0] + "," + joe.topleft[1]);
    joe.display();
    joe2.fancydisplay(); //<>//
    if (willfall(joe)){
      if (millis() > millis + rate){
        joe.fall();
        millis += rate;
      }
    }
    else{
      if (millis() > millis + rate / 4){
        for (int i = 0; i < joe.blocks.length; i++){
          for (int j = 0; j < joe.blocks[0].length; j++){
            if (joe.topleft[1] / size + j - joe.wherey < 0){
              return false;
            }
            if (joe.blocks[i][j] != null){
              blocks[joe.topleft[0] / size + i - joe.wherex][joe.topleft[1] / size + j - joe.wherey] = joe.blocks[i][j];
            }
            display();
          }
        }
        joe = new Piece(randomPiece(), level); //<>//
        joe2 = new Piece(joe.num, level);
        joe.display();
        plunge(joe2);
        if (!canspawn()){
          return true;
        }
        clearRow();
      }
    }
    debugBlocks();
    return lose();
  }
  boolean willfall(Piece cool){
    for (int i = 0; i < cool.blocks.length; i++){
      for (int j = cool.blocks[0].length - 1; j > -1; j--){
        if (cool.blocks[i][j] != null){
          if (cool.blocks[i][j].getY() / size == blocks[0].length - 1 || blocks[cool.blocks[i][j].getX() / size][cool.blocks[i][j].getY() / size + 1] != null) {
            return false;
          }
          break;
        }
      }
    }
    return true;
  }
  boolean canleft(){
    for (int i = 0; i < joe.blocks.length; i++){
      for (int j = 0; j < joe.blocks[0].length; j++){
        if (joe.blocks[j][i] != null){
          if (joe.blocks[j][i].getX() / size == 0 || blocks[joe.blocks[j][i].getX() / size - 1][joe.blocks[j][i].getY() / size] != null) {
            return false;
          }
          break;
        }
      }
    }
    return true;
  }
  boolean canright(){
    for (int i = 0; i < joe.blocks.length; i++){
      for (int j = joe.blocks[0].length - 1; j > -1 ; j--){
        if (joe.blocks[j][i] != null){
          if (joe.blocks[j][i].getX() / size == blocks.length-1 || blocks[joe.blocks[j][i].getX() / size + 1][joe.blocks[j][i].getY() / size] != null) {
            return false;
          }
          break;
        }
      }
    }
    return true;
  }
  void movejoe2(){
    bob.joe2.topleft = new int[]{bob.joe.topleft[0], bob.joe.topleft[1]};
    for (int i = 0; i < joe2.blocks.length; i++){
      for (int j = 0; j < joe2.blocks[0].length; j++){
        if (joe2.blocks[i][j] != null){
          noStroke();
          square(joe2.blocks[i][j].getX(), joe2.blocks[i][j].getY(), size);
          joe2.blocks[i][j].setX(joe.blocks[i][j].getX());
          joe2.blocks[i][j].setY(joe.blocks[i][j].getY());
        }
      }
    }
  }
  void plunge(Piece cool){
    while (willfall(cool)){
      cool.fall();
    }
  }
  boolean canrotate(){
    int x = (joe.topleft[0] / size) - joe.wherex;
    int y = (joe.topleft[1] / size) - joe.wherey;
    for (int i = 0; i < joe.blocks[0].length; i++){
      for (int j = 0; j < joe.blocks.length; j++){
        if (j + x < 0 || j + x > 9 || joe.blocks.length - 1 - i + y < 0 || joe.blocks.length - 1 - i + y >= 20 || blocks[j + x][joe.blocks.length - 1 - i + y] != null){
          return false;
        }
      }
    }
    return true;
  }
  boolean canspawn(){
    for (int i = 1; i < joe.blocks.length; i++){
      for (int j = 0; j < joe.blocks[0].length; j++){
        if (blocks[joe.topleft[0] / 35 + j][joe.topleft[1] / 35 + i] != null){
          return false;
        }
      }
    }
    return true;
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
  void debugBlocks(){
    for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if (blocks[i][j] != null){
          System.out.print("1");
        }
        else{
          System.out.print("0");
        }
      }
      System.out.println();
    }
    System.out.println();
  }
  int randomPiece(){
    return (int)(Math.random() * 7);
  }
  void clearRow() {
    for (int i = 0; i < blocks[0].length; i++) {
      boolean complete = true;
      for (int j = 0; j < blocks.length; j++) {
        if (blocks[j][i] == null) {
          complete = false;
        }
      }
      if (complete) {
        rowscleared++;
        for (int k = i; k > 0; k--) {
          for (int j = 0; j < blocks.length; j++) {
            if (blocks[j][k-1] != null) {
              blocks[j][k] = new Block(j * size, (k) * size, blocks[j][k-1].design);
            }
            else {
              blocks[j][k] = null;
            }
            background(0);
            display();
          }
        }
      }
    }
  } //<>//
  boolean lose() {
    for (int i = 0; i < blocks.length; i++) {
      if (blocks[i][0] != null) {
        return true;
      }
    }
    return false;
  }
}
