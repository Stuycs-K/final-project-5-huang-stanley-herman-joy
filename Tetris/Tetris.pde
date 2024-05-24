int points;
int[] heights;
void draw(){
  Block bob = new Block(100, 100, loadImage("redcar.png"));
  Piece joe = new Piece(1);
    joe.display();
  joe.fall();
}
void keyPressed(){
  
}
void setup(){
  size(500, 500);
  background(255);
}
