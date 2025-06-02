Fruits fruit;
Board board;
PImage boardImage;
int sideLength = 500;
int dimension = 10;

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
  if(!board.inOperation){
    board.handleMouse(mouseX,mouseY);
  }
}
