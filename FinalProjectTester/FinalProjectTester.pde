Fruits fruit = new Fruits();
Board board;
int sideLength = 500;
int dimension = 10;

void setup(){
  size(1000,1000);
  board = new Board(dimension, dimension, sideLength/dimension);
}

void draw(){
  square(0,0,100);
  fruit.drawFruits(0,0,100);
  
}
