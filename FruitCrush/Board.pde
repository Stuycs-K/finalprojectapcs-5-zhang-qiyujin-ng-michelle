public class Board {
  
  private Fruits[][] grid;
  private int cols, rows;
  private int cellSize;
  private PImage boardImage;
  private int firstRow = -5;
  private int firstCol = -5;

  public Board(int cols, int rows, int cellSize){
    this.cols = cols;
    this.rows = rows;
    this.cellSize = cellSize;
    grid = new Fruits[cols][rows];
    initializeBoard();
  }
  
  public void initializeBoard(){
    for (int i = 0; i < cols; i++){
      for (int j = 0; j < rows; j++){    
        grid[i][j] = new Fruits();
      }
    }
  }
  
  public void update(){

  }
  
  public void draw(){
    for (int n = 0; n < cols; n++){
      for (int m = 0; m < rows; m++){
        if (grid[n][m] != null){
          grid[n][m].draw(n*cellSize, m*cellSize, cellSize);
        }
      }
    }
  }
  
  public void handleMouse(int x, int y){
    int col = x / cellSize;
    int row = y / cellSize;

    if (col < 0 || col >= cols || row < 0 || row >= rows){
      return;
    }

    if (firstRow == -5 && firstCol == -5){
      firstRow = row;
      firstCol = col;
    }
    else{
      if (((firstRow == row) && (Math.abs(firstCol - col) == 1)) || ((firstRow == row) && (Math.abs(firstCol - col) == 1))){
        swap(firstRow, firstCol, row, col);
      }
    }
    
  }
  
  public void applyGravity(){
    
  }
  
  public void refillBoard(){
    
  }
  
  public void checkForMatches(){
    
  }
}
