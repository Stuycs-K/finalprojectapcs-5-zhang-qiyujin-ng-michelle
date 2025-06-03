Fruits fruit;
Board board;
PImage boardImage;
int sideLength = 500;
int dimension = 10;

void setup(){
  size(500,600);
  board = new Board(dimension, dimension, sideLength/dimension);
  fruit = new Fruits(sb.getLevel());
  boardImage = loadImage(board.boardImage());
  boardImage.resize(sideLength,0);
  image(boardImage,0,0);
  board.drawBoard();
  board.sb.display();
}

void draw(){
  if(frameCount%10 == 0 && !board.inOperation){
    background(0);
    image(boardImage,0,0);
    board.drawBoard();
    board.sb.display();
    board.update();
  }
}

void mousePressed(){
  if(!board.inOperation){
    board.handleMouse(mouseX,mouseY);
  }
}
