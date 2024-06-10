import java.util.Arrays;
public class Tetris{
  int points;
  int top;
  Block[][] blocks;
  Piece joe;
  Piece joe2;
  Piece nextPiece;
  int millis;
  PImage design = loadImage("best.png");
  PImage design1 = loadImage("best1.png");
  int size = 35;
  int rowscleared = 0;
  int[] rates = new int[]{48, 43, 38, 33, 28, 24, 20, 16, 12, 9, 9, 9, 6, 6, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 4, 3, 3, 3, 2, 1};
  int rate = rates[Math.min(rowscleared / 10, 29)] * 1000 / 60;
  PImage linenumbers = loadImage("numbers.png");
  PImage scorenumbers = loadImage("numbers.png");
  int[] stats = new int[]{0, 0, 0, 0, 0, 0, 0};
  int level;
  public Tetris(int top){
    linenumbers.resize(400, 28);
    scorenumbers.resize(400, 39);
    blocks = new Block[10][20];
    joe = new Piece(randomPiece(), level, new int[]{490, 105}, size);
    joe2 = new Piece(joe.num, level, new int[]{490, 105}, size);
    findNextPiece(randomPiece());
    plunge(joe2);
    joe.display();
    joe2.display();
    millis = millis();
    rowscleared = 0;
    points = 0;
    this.top = top;
    stats = new int[]{0, 0, 0, 0, 0, 0, 0};
    PImage playfield = loadImage("play.png");
    playfield.resize(410, 755);
    image(playfield, 320, 78);
    fill(0);
    noStroke(); //<>// //<>//
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
    displayNumbers("" + rowscleared % 1000, 588, 24);
    PImage score = loadImage("score.png");
    score.resize(300, 350);
    image(score, 732, 3);
    displayScore("" + top % 1000000, 760, 120);
    displayScore("" + points % 1000000, 760, 237);
    PImage statistics = loadImage("statistics.png");
    statistics.resize(315, 650);
    image(statistics, 3, 183);
    rect(60, 308, 220, 480);
    stats[joe.num]++;
    displayPieceStats();
    PImage stage = loadImage("level.png");
    stage.resize(240, 135);
    image(stage, 730, 640);
    displayLevel("" + level % 100, 790, 709);
  }
  void findNextPiece(int random){
    rect(765, 450, 150, 155);
    int x = 765;
    int y = 485;
    if (random == 6){
      x = 770;
      y = 467;
    }
    else if (random == 3){
      x = 805;
    }
    else{
      x = 787;
    }
    nextPiece = new Piece(random, level, new int[]{x, y}, size);
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
        newPiece();
        display();
        if (!canspawn()){
          return true;
        }
      }
    }
    //debugBlocks(); DEBUGGGGGGG
    return lose();
  }
  void newPiece(){
    for (int i = 0; i < joe2.blocks.length; i++){
      for (int j = 0; j < joe2.blocks[0].length; j++){
        if (joe2.blocks[i][j] != null){
          noStroke();
          square(joe2.blocks[i][j].getX(), joe2.blocks[i][j].getY(), size);
          square(joe.blocks[i][j].getX(), joe.blocks[i][j].getY(), size);
        }
      }
    }
    joe = new Piece(nextPiece.num, level, new int[]{490, 105}, size);
    int tint = joe2.tint;
    boolean up = joe2.up;
    joe2 = new Piece(joe.num, level, new int[]{490, 105}, size);
    joe2.tint = tint;
    joe2.up = up;
    stats[joe.num]++;
    displayStats("" + stats[joe.num], 157, 319 + joe.num * 65);
    findNextPiece(randomPiece());
    joe.display();
    plunge(joe2);
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
      } //<>//
    }
  }
  void plunge(Piece cool){ //<>//
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
    } //<>//
    return true;
  }
  void display(){ //<>//
    for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if (blocks[i][j] != null){ //<>//
          blocks[i][j].display();
        }
      } //<>//
    }
  }
  void displayNumbers(String bob, int x, int y){
    while (bob.length() < 3){
      bob = "0" + bob;
    }
    char[] sam = bob.toCharArray();
    for (int i = 0; i < sam.length; i++){
      PImage john = linenumbers.get((sam[i] - '0') * 40, 0, 40, 35);
      for (int j = 0; j < john.pixels.length; j++){
        if (red(john.pixels[j]) > 100){
          john.pixels[j] = color(230, 230, 230);
        }
      }
      if (sam[i] == '0'){
        image(john, x + i * 40 + 2, y);
      }
      else{
        image(john, x + i * 40, y);
      }
    }
  }
  void displayPieceStats(){
    for (int i = 0; i < 7; i++){
      int x = 70;
      int y = 308;
      if (i == 3){
        x = 82;
      }
      if (i == 6){
        x = 55;
        y = 285;
      }
      Piece joestat = new Piece(i, level, new int[]{x, y + i * 67}, 25);
      joestat.display();
      displayStats("" + stats[i], 157, 319 + i * 65);
    }
  }
  void displayStats(String bob, int x, int y){
    while (bob.length() < 3){
      bob = "0" + bob;
    }
    char[] sam = bob.toCharArray();
    for (int i = 0; i < sam.length; i++){
      PImage john = scorenumbers.get((sam[i] - '0') * 40, 0, 40, 35);
      if (sam[i] == '0'){
        image(john, x + i * 40 + 2, y);
      }
      else{
        image(john, x + i * 40, y);
      }
    }
  }
  void displayScore(String bob, int x, int y){
    while (bob.length() < 6){
      bob = "0" + bob;
    }
    char[] sam = bob.toCharArray();
    for (int i = 0; i < sam.length; i++){
      PImage john = scorenumbers.get((sam[i] - '0') * 40, 0, 40, 38);
      for (int j = 0; j < john.pixels.length; j++){
        if (red(john.pixels[j]) > 100){
          john.pixels[j] = color(230, 230, 230);
        }
      }
      if (sam[i] == '0'){
        image(john, x + i * 40 + 2, y);
      }
      else{
        image(john, x + i * 40, y);
      }
    }
  }
  void displayLevel(String bob, int x, int y){
    while (bob.length() < 3){
      bob = "0" + bob;
    }
    char[] sam = bob.toCharArray();
    for (int i = 0; i < sam.length; i++){
      PImage john = scorenumbers.get((sam[i] - '0') * 40, 0, 40, 38);
      for (int j = 0; j < john.pixels.length; j++){
        if (red(john.pixels[j]) > 100){
          john.pixels[j] = color(230, 230, 230);
        }
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
  void updateBlocks(){
    for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if (blocks[i][j] != null){
          blocks[i][j].level = level;
          blocks[i][j].updateColor();
        }
      }
    }
    display();
  }
  int randomPiece(){
    return (int)(Math.random() * 7);
  }
  void clearRow() {
    int cool = 0;
    for (int i = 0; i < blocks[0].length; i++) {
      boolean complete = true;
      for (int j = 0; j < blocks.length; j++) {
        if (blocks[j][i] == null) {
          complete = false;
        }
      }
      if (complete) {
        cool++;
        for (int k = i; k > 0; k--) {
          for (int j = 0; j < blocks.length; j++) {
            if (blocks[j][k-1] != null) {
              blocks[j][k] = new Block((j + 10) * size, (k + 3) * size, blocks[j][k-1].design, 35, level, blocks[j][k - 1].num);
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
    int temp = rowscleared % 10;
    rowscleared += cool;
    if (temp != rowscleared % 10){
      level++;
      updateBlocks();
    }
    displayNumbers("" + rowscleared, 588, 24);
    if (cool == 1)
      cool = 40;
    if (cool == 2)
      cool = 100;
    if (cool == 3)
      cool = 300;
    if (cool == 4)
      cool = 1200;
    points += cool * (level + 1);
    displayScore("" + points, 760, 237);
    rate = rates[Math.min(level, 29)] * 1000 / 60;
    displayLevel("" + level % 1000, 790, 709);
    displayPieceStats();
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
