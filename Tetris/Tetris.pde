int points;
Block[][] blocks;
Piece joe;
void draw(){
  joe.display();
  System.out.println(joe.wide + "," + joe.tall);
  System.out.println(joe.topleft[0] + "," + joe.topleft[1]);
  if (!joe.fall()){
    for (int i = 0; i < joe.blocks.length; i++){
      for (int j = 0; j < joe.blocks[0].length; j++){
        if (joe.blocks[i][j] != null){
          blocks[joe.topleft[0] / 50 + i][joe.topleft[1] / 50 + j] = joe.blocks[i][j];
        }
      }
      display();
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
    joe.plunge();
    joe.display();
  }
}
void setup(){
  size(500, 500);
  background(255);
  joe = new Piece(1);
  joe.fall();
  joe.display();
  blocks = new Block[10][10];
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
