public class Board {
  
  private Fruits[][] grid;
  private int cols, rows;
  private int cellSize;
  private PImage boardImage;

  public Board(int cols, int rows, int cellSize){
    this.cols = cols;
    this.rows = rows;
    this.cellSize = cellSize;
    grid = new Fruits[cols][rows];
    initializeBoard();
  }
  
  public void initializeBoard(){
    String[] fruitTypes = {"strawberry", "apple", "banana", "peach", "cherry"};
    for (int i = 0; i < cols; i++){
      for (int j = 0; j < rows; j++){
        String randomType = fruitTypes[(int)(Math.random()*fruitTypes.length)];        
        grid[i][j] = new Fruits(randomType);
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
  }
  
  public void applyGravity(){
    
  }
  
  public void refillBoard(){
    
  }
  
  public void checkForMatches(){
    
  }
}
