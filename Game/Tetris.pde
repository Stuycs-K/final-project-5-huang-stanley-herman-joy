public class Tetris{
  int points;
  Block[][] blocks;
  Piece joe;
  int millis;
  boolean complete = false;
  PImage design = loadImage("redcar.png");
  public Tetris(){
    joe = new Piece(randomPiece());
    joe.display();
    blocks = new Block[10][10];
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
            blocks[joe.topleft[0] / 50 + i - joe.wherex][joe.topleft[1] / 50 + j - joe.wherey] = joe.blocks[i][j];
          }
          display();
        }
      }
      debugBlocks();
      joe = new Piece(randomPiece());
      for (int i = 0; i < blocks.length; i++) {
        complete = true;
        for (int j = 0; j < blocks[0].length; j++) {
          if (blocks[j][i] == null) {
            complete = false;
          }
        }
        if (complete) {
          for (int k = i; k > 0; k--) {
            for (int j = 0; j < blocks[0].length; j++) {
              if (blocks[j][k-1] != null) {
                blocks[j][k] = new Block(j * 50, (k) * 50, design);
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
  boolean willfall(){
    return joe.topleft[1] < 500 - (joe.tall * 50);
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
}
