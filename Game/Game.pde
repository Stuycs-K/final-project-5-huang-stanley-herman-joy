Tetris bob;
boolean done = false;
void draw(){
  if (!done){
    stroke(255);
    for (int i = 0; i < 350; i+=35) {
      line(i-1, -1, i-1, 699);
    }
    for (int i = 0; i < 700; i+=35) {
      line(0, i-1, 350, i-1);
    }
    line(350, 0, 350, 700);
    if (bob.run()){
      done = true;
    }
  }
  else{
    background(0);
    fill(255);
    textSize(15);
    text("GAME OVER", bob.blocks.length * bob.size / 2 - 30, bob.blocks[0].length * bob.size /2);
    text("press enter to play again", bob.blocks.length * bob.size / 2 - 60, bob.blocks[0].length * bob.size /2 + 15);
  }
}
void keyPressed(){
  if (!done){
    if (key == 'a' && bob.canleft()) {
      bob.joe.moveleft();
      bob.movejoe2();
      bob.plunge(bob.joe2);
      bob.joe.display();
      bob.joe2.display();
    }
    if (key == 'd' && bob.canright()) {
      bob.joe.moveright();
      bob.movejoe2();
      bob.plunge(bob.joe2);
      bob.joe.display();
      bob.joe2.display();
    }
    if (key == 'r' && bob.canrotate()){
      bob.movejoe2();
      bob.joe.rotate();
      bob.joe2.rotate();
      bob.plunge(bob.joe2);
      bob.joe.display();
      bob.joe2.display();
    }
    if (key == 's') {
      bob.plunge(bob.joe);
      bob.joe.display();
    }
  }
  if (key == ENTER) {
      background(0);
      bob = new Tetris();
      bob.display();
      done = false;
  }
}
  void setup(){
    size(500, 700);
    background(0);
    bob = new Tetris();
  }
