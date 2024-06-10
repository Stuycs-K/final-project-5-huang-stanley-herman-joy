import java.util.Arrays;
public class Tetris{
  int points;
  Block[][] blocks;
  Piece joe;
  Piece joe2;
  Piece nextPiece;
  int millis;
  PImage design = loadImage("best.png");
  PImage design1 = loadImage("best1.png");
  int size = 35;
  int rowscleared = 0;
  int level = 3;
  int[] rates = new int[]{48, 43, 38, 33, 28, 24, 20, 16, 12, 9, 9, 9, 6, 6, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 4, 3, 3, 3, 2, 1};
  int rate = rates[Math.min(rowscleared / 10, 29)] * 1000 / 60;
  PImage numbers = loadImage("numbers.png");
  int[] stats = new int[]{0, 0, 0, 0, 0, 0, 0};
  public Tetris(){
    numbers.resize(400, 28);
    blocks = new Block[10][20];
    joe = new Piece(randomPiece(), level, new int[]{490, 105});
    joe2 = new Piece(joe.num, level, new int[]{490, 105});
    findNextPiece();
    plunge(joe2);
    joe.display();
    joe2.display();
    millis = millis();
    rowscleared = 500;
    points = 0;
    PImage playfield = loadImage("play.png");
    playfield.resize(410, 755);
    image(playfield, 320, 78);
    fill(0);
    noStroke(); //<>//
    rect(350, 105, 350, 700);
    PImage nextpiece = loadImage("next.png");
    nextpiece.resize(220, 270);
    image(nextpiece, 730, 370);
    rect(765, 450, 150, 155);
    nextPiece.display();
    PImage lines = loadImage("lines.png");
    lines.resize(410, 73);
    image(lines, 320, 0);
    rect(593, 17, 110, 40);
    displayNumbers("" + rowscleared, 588, 24);
    stats = new int[]{0, 0, 0, 0, 0, 0, 0};
  }
  void findNextPiece(){
    rect(765, 450, 150, 155);
    int random = randomPiece();
    int x = 765;
    int y = 485;
    if (random == 6){
      x = 770; //<>//
      y = 467;
    }
    else if (random == 3){
      x = 805;
    }
    else{
      x = 787;
    }
    nextPiece = new Piece(random, level, new int[]{x, y});
    nextPiece.display();
  }
  boolean run(){
    joe2.fancydisplay();
    joe.display();
    if (willfall(joe)){
      if (millis() > millis + rate){
        joe.fall();
        millis += rate;
      }
    }
    else{
      if (millis() > millis + rate / 4){
        for (int i = 0; i < joe.blocks.length; i++){
          for (int j = 0; j < joe.blocks[0].length; j++){
            if (joe.topleft[1] / size + j - joe.wherey < 0){
              return false;
            }
            if (joe.blocks[i][j] != null){
              blocks[joe.topleft[0] / size + i - joe.wherex - 10][joe.topleft[1] / size + j - joe.wherey - 3] = joe.blocks[i][j];
            }
            display();
          }
        }
        clearRow();
        stats[joe.num]++;
        joe = new Piece(nextPiece.num, level, new int[]{490, 105}); //<>//
        joe2 = new Piece(joe.num, level, new int[]{490, 105});
        findNextPiece();
        joe.display();
        plunge(joe2);
        if (!canspawn()){
          return true;
        }
      }
      for (int i = 0; i < stats.length; i++) {
        System.out.print(stats[i] + ", ");
      }
      System.out.println();
    }
    //debugBlocks(); DEBUGGGGGGG
    return lose();
  }
  boolean willfall(Piece cool){
    for (int i = 0; i < cool.blocks.length; i++){
      for (int j = cool.blocks[0].length - 1; j > -1; j--){
        if (cool.blocks[i][j] != null){
          if (cool.blocks[i][j].getY() / size - 3 == blocks[0].length - 1 || blocks[cool.blocks[i][j].getX() / size - 10][cool.blocks[i][j].getY() / size - 2] != null) {
            return false;
          }
          break;
        }
      }
    }
    return true;
  }
  boolean canleft(){
    for (int i = 0; i < joe.blocks.length; i++){
      for (int j = 0; j < joe.blocks[0].length; j++){
        if (joe.blocks[j][i] != null){
          if (joe.blocks[j][i].getX() / size == 10 || blocks[joe.blocks[j][i].getX() / size - 11][joe.blocks[j][i].getY() / size - 3] != null) {
            return false;
          }
          break;
        }
      }
    }
    return true;
  }
  boolean canright(){
    for (int i = 0; i < joe.blocks.length; i++){
      for (int j = joe.blocks[0].length - 1; j > -1 ; j--){
        if (joe.blocks[j][i] != null){
          if (joe.blocks[j][i].getX() / size - 9 == blocks.length || blocks[joe.blocks[j][i].getX() / size - 9][joe.blocks[j][i].getY() / size - 3] != null) {
            return false;
          }
          break;
        }
      }
    }
    return true;
  }
  void movejoe2(){
    bob.joe2.topleft = new int[]{bob.joe.topleft[0], bob.joe.topleft[1]};
    for (int i = 0; i < joe2.blocks.length; i++){
      for (int j = 0; j < joe2.blocks[0].length; j++){
        if (joe2.blocks[i][j] != null){
          noStroke();
          square(joe2.blocks[i][j].getX(), joe2.blocks[i][j].getY(), size);
          joe2.blocks[i][j].setX(joe.blocks[i][j].getX());
          joe2.blocks[i][j].setY(joe.blocks[i][j].getY());
        }
      }
    }
  }
  void plunge(Piece cool){
    while (willfall(cool)){
      cool.fall();
    }
  }
  boolean canrotate(){
    int x = (joe.topleft[0] / size) - joe.wherex - 10;
    int y = (joe.topleft[1] / size) - joe.wherey;
    for (int i = 0; i < joe.blocks[0].length; i++){
      for (int j = 0; j < joe.blocks.length; j++){
        if (j + x < 0 || j + x > 9 || joe.blocks.length - 1 - i + y < 0 || joe.blocks.length - 1 - i + y >= 20 || blocks[j + x][joe.blocks.length - 1 - i + y] != null){
          return false;
        }
      }
    }
    return true;
  }
  boolean canspawn(){
    for (int i = 1; i < joe.blocks.length; i++){
      for (int j = 0; j < joe.blocks[0].length; j++){
        if (blocks[joe.topleft[0] / 35 + j - 10][joe.topleft[1] / 35 + i - 3] != null){
          return false;
        }
      }
    }
    return true;
  }
  void display(){
    for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if (blocks[i][j] != null){
          blocks[i][j].display();
        }
      } //<>//
    }
  }
  void displayNumbers(String bob, int x, int y){
    char[] sam = bob.toCharArray(); //<>// //<>//
    for (int i = 0; i < sam.length; i++){
      PImage john = numbers.get((sam[i] - '0') * 40, 0, 40, 35);
      for (int j = 0; j < john.pixels.length; j++){
        if (red(john.pixels[j]) > 100){
          john.pixels[j] = color(230, 230, 230);
        }
      }
      if (i == 2){
        john = john.get(0, 0, 37, 35);
      }
      if (sam[i] == '0'){
        image(john, x + i * 40 + 2, y);
      }
      else{
        image(john, x + i * 40, y);
      }
    }
  }
  void debugBlocks(){
    for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if (blocks[i][j] != null){
          System.out.print("1");
        }
        else{
          System.out.print("0");
        }
      }
      System.out.println();
    }
    System.out.println();
  }
  int randomPiece(){
    return (int)(Math.random() * 7);
  }
  void clearRow() {
    for (int i = 0; i < blocks[0].length; i++) {
      boolean complete = true;
      for (int j = 0; j < blocks.length; j++) {
        if (blocks[j][i] == null) {
          complete = false;
        }
      }
      if (complete) {
        rowscleared++;
        for (int k = i; k > 0; k--) {
          for (int j = 0; j < blocks.length; j++) {
            if (blocks[j][k-1] != null) {
              blocks[j][k] = new Block((j + 10) * size, (k + 3) * size, blocks[j][k-1].design);
            }
            else {
              blocks[j][k] = null;
            }
            rect(350, 105, 350, 700);
            display();
          }
        }
      }
    }
    displayNumbers("" + rowscleared, 588, 24);
  }
  boolean lose() {
    for (int i = 0; i < blocks.length; i++) {
      if (blocks[i][0] != null) {
        return true;
      }
    }
    return false;
  }
}
