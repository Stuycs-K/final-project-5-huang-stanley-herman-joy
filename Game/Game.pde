Tetris bob;
boolean done = false;
boolean start = false;
PImage startImage;
void draw(){
  if (start) {
    if (!done){
      if (bob.run()){
        done = true;
      }
    }
    else{
      background(0);
      textSize(15);
      fill(255); //<>//
      text("GAME OVER", width/2, height/2);
      text("press enter to play again", width/2, height/2 + 15);
    }
  }
}
void keyPressed(){
  if (!done && start){
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
  if (key == ' ') {
    start = true;
    background(0);
    bob = new Tetris();
  }
}
  void setup(){
    size(1050, 840);
    bob = new Tetris();
    background(0);
    startImage = loadImage("start.png");
    image(startImage, 0, -30, 1050, 870);
  }
