Board board;
PImage boardImage;
int sideLength = 500;
int dimension = 10;
int tileWidth = sideLength/dimension;
int regenX, regenY, regenLength, regenWidth;
int homeX, homeY, homeLength, homeWidth;
int fourX, fourY, fourLength, fourWidth;
int fiveX, fiveY, fiveLength, fiveWidth;
int firstTileX, firstTileY, secondTileX, secondTileY;
boolean atHome = true;
boolean regenBoard, firstTile,secondTile;

void setup(){
    size(500,600);
    board = new Board(dimension, dimension, sideLength/dimension, 1);
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
    regenBoard = false;
    firstTile = false;
    secondTile = false;
}

void draw(){
  if(frameCount%10 == 0 && !atHome && !board.inOperation){
    background(0);
    image(boardImage,0,0);
    if(firstTile){
      fill(0,230,0);
      rect((firstTileX/tileWidth)*tileWidth,(firstTileY/tileWidth)*tileWidth,tileWidth, tileWidth);
      fill(0);
    }
    if(secondTile){
      fill(0,230,0);
      rect((secondTileX/tileWidth)*tileWidth,(secondTileY/tileWidth)*tileWidth,tileWidth, tileWidth);
      fill(0);
    }
    if(firstTile&&secondTile){
      firstTile = false;
      secondTile = false;
    }
    board.drawBoard();
    board.sb.display();
    board.update();
    if(!regenBoard)
      regenButton(7*50, 500,3*50,50, false);
    else{
      regenButton(7*50, 500,3*50,50, true);
      Board newBoard = new Board(dimension, dimension, sideLength/dimension, board.sb.getLevel());
      board.grid = newBoard.grid;
      regenBoard = false;
    }
    homeButton(4*50, 500,3*50,50);
    special4Button(4*50, 550, 3*50, 50);
    special5Button(7*50, 550, 3*50, 50);
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
    regenButton(7*50, 500,3*50,50, true);
    regenBoard = true;
    return;
  }
  if(clickedOnHome(mouseX,mouseY)){
    atHome = true;
    return;
  }
  if(!board.inOperation){
    if(mouseY <= sideLength){
      if(firstTile){
        secondTile = true;
        secondTileX = mouseX;
        secondTileY = mouseY;
      }
      else{
        firstTile = true;
        firstTileX = mouseX;
        firstTileY = mouseY;
      }
    }
    board.handleMouse(mouseX,mouseY);
  }
  if (clickedOnFour(mouseX,mouseY)){
    board.special4Demo();
  }
  if(clickedOnFive(mouseX,mouseY)){
    board.special5Demo();
  }
}
void regenButton(int x, int y, int xlength, int ywidth, boolean regeneratingNow){
  regenX = x;
  regenY = y;
  regenLength = xlength;
  regenWidth = ywidth;  
  fill(125, 69, 214);
  rect(x,y,xlength,ywidth);
  fill(0);
  textSize(20);
  if (regeneratingNow){
    text("REGENERATING",360,525);
  }
  else
    text("REGENERATE",370,525);
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
  text("HOME",250,525);
}

void special4Button(int x, int y, int xlength, int ywidth){
  fourX = x;
  fourY = y;
  fourLength = xlength;
  fourWidth = ywidth;  
  fill(144, 238, 144);
  rect(x,y,xlength,ywidth);
  fill(0);
  textSize(20);
  text("Special-4", 235, 575);
}

void special5Button(int x, int y, int xlength, int ywidth){
  fiveX = x;
  fiveY = y;
  fiveLength = xlength;
  fiveWidth = ywidth;  
  fill(144, 238, 144);
  rect(x,y,xlength,ywidth);
  fill(0);
  textSize(20);
  text("Special-5", 385, 575);
}

boolean clickedOnRegen(int x, int y){
  return(x >= regenX && x <= (regenX+regenLength) && y >= regenY && y <= (regenY+regenWidth));
}
boolean clickedOnHome(int x, int y){
  return(x >= homeX && x <= (homeX+homeLength) && y >= homeY && y <= (homeY+homeWidth));
}
boolean clickedOnFour(int x, int y){
  return(x >= fourX && x <= (fourX+fourLength) && y >= fourY && y <= (fourY+fourWidth));
}
boolean clickedOnFive(int x, int y){
  return(x >= fiveX && x <= (fiveY+homeLength) && y >= fiveY && y <= (fiveY+fiveWidth));
}
