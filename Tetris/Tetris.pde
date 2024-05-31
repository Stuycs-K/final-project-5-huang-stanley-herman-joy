int points;
Block[][] blocks;
Piece joe;
int millis;
boolean plunge = false;
boolean complete = false;
PImage design;
void draw(){
  //blocks[i][j]: i is the column from left to right, j is the row, from top to bottom
  joe.display();
  if (joe.willfall()){
    if (millis() > millis + 1000){
      joe.fall();
      millis += 1000;
    }
  }
  else{
    for (int i = 0; i < joe.blocks.length; i++){
      for (int j = 0; j < joe.blocks[0].length; j++){
        if (joe.blocks[i][j] != null){
          blocks[joe.topleft[0] / 50 + i][joe.topleft[1] / 50 + j] = joe.blocks[i][j];
        }
        display();
      }
    }
    joe = new Piece(1);
    for (int i = 0; i < blocks.length; i++) {
      complete = true;
      for (int j = 0; j < blocks[0].length; j++) {
        if (blocks[j][i] == null) {
          complete = false;
        }
      }
      if (complete) {
        for (int k = i; k > 0; k--) {
          for (int j = 0; j < blocks[0].length; j++) {
            if (blocks[j][k-1] != null) {
              blocks[j][k] = new Block(j * 50, (k-1) * 50, design);
            }
            else {
              blocks[j][k] = null;
            }
            background(255);
            display();
          }
        }
      }
    }

    joe = new Piece(1);
  }
}
void keyPressed(){
  if (key == 'a') {
    joe.moveleft();
    joe.display();
  }
  if (key == 'd') {
    joe.moveright();
    joe.display();
  }
  if (key == 'r'){
    joe.rotate();
    joe.display();
  }
  if (key == 's') {
    plunge = true;
    joe.plunge();
    joe.display();
  }
}
void setup(){
  size(500, 500);
  background(255);
  joe = new Piece(1);
  joe.display();
  blocks = new Block[10][10];
  millis = 0;
  design = loadImage("redcar.png");
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
