  

Board board;

void setup(){
  int sideLength = 500;
  int dimention = 10;
  size(sideLength,sideLength);
  board = new Board(dimention, dimention, sideLength/dimention);
  boardImage = board.boardImage;
  boardImage.resize(sideLength,0);
  image(loadImage(boardImage),0,0);
}

void draw(){
  
}

void settings(){
  
}

void mousePressed(){
  
}
