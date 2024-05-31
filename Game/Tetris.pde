public class Tetris{
  int points;
  Block[][] blocks;
  Piece joe;
  int millis;
  boolean plunge = false;
  public Tetris(){
    joe = new Piece(1);
    joe.display();
    blocks = new Block[10][10];
    millis = 0;
  }
  void run(){
    joe.display();
    //System.out.println(joe.wide + "," + joe.tall);
    //System.out.println(joe.topleft[0] + "," + joe.topleft[1]);
    if (joe.willfall()){
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
      joe = new Piece(5);
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
}
