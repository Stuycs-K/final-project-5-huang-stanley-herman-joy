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
          blocks[i][j].setY(blocks[i][j].getY() + Block.size);
        }
      }
    }
    this.display();
  }
  void rotate(){
    Block[][] newblocks = new Block[blocks[0].length][blocks.length];
    for (int i = 0; i < blocks[0].length; i++){
      for (int j = 0; j < blocks.length; j++){
        newblocks[i][j] = blocks[i][j];
      }
    }
    blocks = newblocks;
  }
  void plunge(){
    
  }
  void moveleft(){
    
  }
  void moveright(){
    
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
