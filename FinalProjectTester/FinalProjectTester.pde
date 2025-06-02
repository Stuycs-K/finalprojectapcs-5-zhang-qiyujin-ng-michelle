Fruits fruit;
Board board;
PImage boardImage;
int sideLength = 500;
int dimension = 10;

void setup(){
  size(1000,1000);
  fruit = new Fruits();
  board = new Board(dimension, dimension, sideLength/dimension);
  boardImage = loadImage(board.boardImage());
}

void draw(){
  square(0,0,100);
  fruit.drawFruits(0,0,100);
}
