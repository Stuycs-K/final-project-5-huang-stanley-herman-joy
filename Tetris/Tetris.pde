int points;
int[] heights;
void draw(){
  
  
}
void keyPressed(){
  
}
void setup(){
  size(500, 500);
  Block bob = new Block(100, 100, loadImage("redcar.png"));
  Piece joe = new Piece(1);
    joe.display();
  joe.fall();
}
