Fruits fruit;
Board board;
PImage boardImage;
int sideLength = 500;
int dimension = 10;
int regenX, regenY, regenLength, regenWidth;

void setup(){
  size(500,500);
  fruit = new Fruits();
  board = new Board(dimension, dimension, sideLength/dimension);
  boardImage = loadImage(board.boardImage());
  boardImage.resize(sideLength,0);
  image(boardImage,0,0);
  board.drawBoard();
}

void draw(){
  if(frameCount%10 == 0 && !board.inOperation){
    background(0);
    image(boardImage,0,0);
    board.drawBoard();
    board.update();
  }
}

void mousePressed(){
  if(clickedOnRegen(mouseX,mouseY)){
    board.drawBoard();
    return;
  }
  if(!board.inOperation){
    board.handleMouse(mouseX,mouseY);
  }
}

void regenBoard(int x, int y, int xlength, int ywidth){
  regenX = x;
  regenY = y;
  regenLength = xlength;
  regenWidth = ywidth;  
  rect(x,y,xlength,ywidth);
}

boolean clickedOnRegen(int x, int y){
  return(x >= regenX && regenX <= (x+regenLength) && y >= regenY && regenY <= (y+regenWidth));
}
