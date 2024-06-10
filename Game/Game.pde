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
      textSize(50);
      fill(255); //<>//
      text("GAME OVER", width/2 - 100, height/2);
      text("press enter to play again", width/2 - 250, height/2 + 45);
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
    if (key == 'm'){
      bob.level++;
      bob.displayLevel("" + bob.level, 790, 709);
      bob.findNextPiece(bob.nextPiece.num);
      bob.displayPieceStats();
      bob.updateBlocks();
      bob.newPiece();
    }
    if (key == 's') {
      bob.plunge(bob.joe);
      bob.joe.display();
    }
  }
  if (key == ENTER) {
      background(0);
      int top = Math.max(bob.top, bob.points);
      System.out.println(top);
      bob = new Tetris(top);
      bob.display();
      done = false;
  }
  if (key == ' ') {
    start = true;
    background(0);
    bob = new Tetris(0);
  }
}
  void setup(){
    size(1050, 840);
    background(0);
    startImage = loadImage("start.png");
    image(startImage, 0, -30, 1050, 870);
  }
