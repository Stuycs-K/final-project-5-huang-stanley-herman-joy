int points;
int[] heights;
Block bob;
Piece joe;
void draw(){
}
void keyPressed(){
  if (key == 'a') {
    joe.moveleft();
    background(255);
    joe.display();
  }
  if (key == 'd') {
    joe.moveright();
    background(255);
    joe.display();
  }
}
void setup(){
  size(500, 500);
  background(255);
  bob = new Block(100, 100, loadImage("redcar.png"));
  joe = new Piece(1);
  joe.fall();
  joe.display();
}
