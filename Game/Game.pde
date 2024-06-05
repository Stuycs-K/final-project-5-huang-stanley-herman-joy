Tetris bob;
void draw(){
  bob.run();
}
void keyPressed(){
    if (key == 'a' && bob.canleft()) {
      bob.joe.moveleft();
      bob.joe.display();
    }
    if (key == 'd' && bob.canright()) {
      bob.joe.moveright();
      bob.joe.display();
    }
    if (key == 'r' && bob.canrotate()){
      bob.joe.rotate();
      bob.joe.display();
    }
    if (key == 's') {
      bob.plunge();
      bob.joe.display();
    }
  }
  void setup(){
    size(350, 700);
    background(255);
    bob = new Tetris();
  }
