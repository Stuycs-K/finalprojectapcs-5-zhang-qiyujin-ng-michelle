Board board;
PImage boardImage;
int sideLength = 500;
int dimension = 10;
int regenX, regenY, regenLength, regenWidth;
int homeX, homeY, homeLength, homeWidth;
boolean atHome = true;

void setup(){
    size(500,600);
    board = new Board(dimension, dimension, sideLength/dimension);
    boardImage = loadImage(board.boardImage());
    boardImage.resize(sideLength,0);
    fill(28,92,184);
    rect(0,0,500,600);
    textSize(100);
    fill(252, 63, 201);
    text("FRUIT",125,200);
    text("CRUSH",100,300);
    textSize(20);
    text("click anywhere to start",160,350);
}

void draw(){
  if(frameCount%10 == 0 && !board.inOperation && !atHome){
    background(0);
    image(boardImage,0,0);
    board.drawBoard();
    board.sb.display();
    board.update();
    regenButton(7*50, 500,3*50,100);
    homeButton(4*50, 500,3*50,100);
  }
  if(atHome){
    fill(28,92,184);
    rect(0,0,500,600);
    textSize(100);
    fill(252, 63, 201);
    text("FRUIT",125,200);
    text("CRUSH",100,300);
    textSize(20);
    text("click anywhere to start",160,350);
  }
}

void mousePressed(){
  if(atHome){
    atHome = false;
    return;
  }
  if(clickedOnRegen(mouseX,mouseY)){
    Board newBoard = new Board(dimension, dimension, sideLength/dimension);
    board.grid = newBoard.grid;
    return;
  }
  if(clickedOnHome(mouseX,mouseY)){
    atHome = true;
    return;
  }
  if(!board.inOperation){
    board.handleMouse(mouseX,mouseY);
  }
}
void regenButton(int x, int y, int xlength, int ywidth){
  regenX = x;
  regenY = y;
  regenLength = xlength;
  regenWidth = ywidth;  
  fill(125, 69, 214);
  rect(x,y,xlength,ywidth);
  fill(0);
  textSize(20);
  text("REGENERATE",370,550);
}

void homeButton(int x, int y, int xlength, int ywidth){
  homeX = x;
  homeY = y;
  homeLength = xlength;
  homeWidth = ywidth;  
  fill(125, 69, 214);
  rect(x,y,xlength,ywidth);
  fill(0);
  textSize(20);
  text("HOME",250,550);
}

boolean clickedOnRegen(int x, int y){
  return(x >= regenX && regenX <= (x+regenLength) && y >= regenY && regenY <= (y+regenWidth));
}
boolean clickedOnHome(int x, int y){
  return(x >= homeX && homeX <= (x+homeLength) && y >= homeY && homeY <= (y+homeWidth));
}
