public class Piece{
  Block[][] blocks;
  PImage design = loadImage("redcar.png");
  public Piece(int num){
    blocks = new Block[4][4];
    if (num == 1){
      blocks[0][0] = new Block(0, 0, design);
    }
  }
  void fall(){
    for (int i = 0; i < 4; i++){
      for (int j = 0; j < 4; j++){
        if (blocks[i][j] != null){
          if (blocks[i][j].getY() != 450) {
            blocks[i][j].setY(blocks[i][j].getY() + 1);
          }
        }
      }
    }
    this.display();
  }
  void rotate(){
    
  }
  void plunge(){
    
  }
  void moveleft(){
    for (int i = 0; i < 4; i++){
      for (int j = 0; j < 4; j++){
        if (blocks[i][j] != null){
          if (blocks[i][j].getX() != 0){
            blocks[i][j].setX(blocks[i][j].getX() - 50);
          }
        }
      }
    }
  }
  void moveright(){
    for (int i = 0; i < 4; i++){
      for (int j = 0; j < 4; j++){
        if (blocks[i][j] != null){
          if (blocks[i][j].getX() != 450){
            blocks[i][j].setX(blocks[i][j].getX() + 50);
          }
        }
      }
    }
  }
  void display(){
    for (int i = 0; i < 4; i++){
      for (int j = 0; j < 4; j++){
        if (blocks[i][j] != null){
          blocks[i][j].display();
        }
      }
    }
  }
}
