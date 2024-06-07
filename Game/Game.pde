Tetris bob;
boolean done = false;
void draw(){
  if (!done){
    if (bob.run()){
      done = true;
    }
  }
  else{
    background(255);
    fill(0);
    textSize(10);
    text("GAME OVER", bob.blocks.length * bob.size / 2, bob.blocks[0].length * bob.size /2);
    text("press enter to play again", bob.blocks.length * bob.size / 2, bob.blocks[0].length * bob.size /2 + 10);
    fill(255);
  }
}
void keyPressed(){
  if (!done){
    System.out.println(bob.canrotate());
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
    if (key == ENTER) {
      background(255);
      bob = new Tetris();
      bob.display();
    }
  }
}
  void setup(){
    size(350, 700);
    background(0);
    bob = new Tetris();
  }
