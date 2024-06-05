import java.util.Arrays;
public class Tetris{
  int points;
  Block[][] blocks;
  Piece joe;
  int millis;
  boolean complete = false;
  PImage design = loadImage("redcar.png");
  int size = 35;
  public Tetris(){
    joe = new Piece(randomPiece());
    joe.display();
    blocks = new Block[10][20];
    millis = 0;
  }
  void run(){
    joe.display();
    //System.out.println(joe.wide + "," + joe.tall);
    //System.out.println(joe.topleft[0] + "," + joe.topleft[1]);
    if (willfall()){
      if (millis() > millis + 1000){
        joe.fall();
        millis += 1000;
      }
    }
    else{
      for (int i = 0; i < joe.blocks.length; i++){
        for (int j = 0; j < joe.blocks[0].length; j++){
          if (joe.blocks[i][j] != null){
            blocks[joe.topleft[0] / size + i - joe.wherex][joe.topleft[1] / size + j - joe.wherey] = joe.blocks[i][j];
          }
          display();
        }
      }
      joe = new Piece(randomPiece());
      clearRow();
    }
  }
  boolean willfall(){
    for (int i = 0; i < joe.blocks.length; i++){
      for (int j = joe.blocks[0].length - 1; j > -1; j--){
        if (joe.blocks[i][j] != null){
          if (joe.blocks[i][j].getY() / size == blocks[0].length - 1 || blocks[joe.blocks[i][j].getX() / size][joe.blocks[i][j].getY() / size + 1] != null) {
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
  void plunge(){
    while (willfall()){
      joe.fall();
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
    return (int)(Math.random()*7)+1;
  }
  void clearRow() {
    for (int i = 0; i < blocks.length; i++) {
      complete = true;
      for (int j = 0; j < blocks[0].length; j++) {
        if (blocks[i][j] == null) {
          complete = false;
        }
      }
      if (complete) {
        for (int k = i; k > 0; k--) {
          for (int j = 0; j < blocks[0].length; j++) {
            if (blocks[j][k-1] != null) {
              blocks[j][k] = new Block(j * size, (k) * size, design);
              System.out.println("not null: " + j + ", " + k);
            }
            else {
              blocks[j][k] = null;
              System.out.println("is null: " + j + ", " + k);
            }
            background(255);
            display();
          }
        }
      }
    }
  }
}
