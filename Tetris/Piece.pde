public class Piece{
  Block[][] blocks;
  PImage design = loadImage("redcar.png");
  public Piece(int num){
    blocks = new Block[2][3];
    if (num == 1){
      blocks[0][0] = new Block(0, 0, design);
      blocks[0][1] = new Block(0, 50, design);
      blocks[0][2] = new Block(0, 100, design);
      blocks[1][1] = new Block(50, 50, design);
    }
  }
  void fall(){
    for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if (blocks[i][j] != null){
          if (blocks[i][j].getY() != 500 - (blocks[0].length - j) * 50) {
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
    for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if (blocks[i][j] != null && blocks[i][j].getY() != 500 - (blocks[0].length - j) * 50){
          if (blocks[i][j].getX() != i * 50){
            blocks[i][j].setX(blocks[i][j].getX() - 50);
          }
        }
      }
    }
  }
  void moveright(){
    for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if (blocks[i][j] != null && blocks[i][j].getY() != 500 - (blocks[0].length - j) * 50){
          if (blocks[i][j].getX() != 500 - (blocks.length - i) * 50){
            blocks[i][j].setX(blocks[i][j].getX() + 50);
          }
        }
      }
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
