boolean inOperation;
Board board;

void setup(){
  int sideLength = 500;
  int dimension = 10;
  
  size(sideLength,sideLength); 
  board = new Board(dimension, dimension, sideLength/dimension);
  /*
  PImage boardImage = board.boardImage;
  boardImage.resize(sideLength,0);
  image(boardImage,0,0);
  board.initializeBoard();
  board.drawBoard();
  */
}

void draw(){
  image(loadImage(board.boardImage),0,0);
  
}
/*
void mousePressed(){
  
}
*/
