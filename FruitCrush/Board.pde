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
    checkForMatches();
    refillBoard();
  }
  
  public void drawBoard(){
    for (int n = 0; n < cols; n++){
      for (int m = 0; m < rows; m++){
        if (grid[n][m] != null){
          grid[n][m].drawFruits(n*cellSize, m*cellSize, cellSize);
        }
      }
    }
  }
  
  public void handleMouse(int x, int y){
    int secondCol = x / cellSize;
    int secondRow = y / cellSize;

    if (secondCol < 0 || secondCol >= cols || secondRow < 0 || secondRow >= rows){
      return;
    }

    if (firstRow == -5 && firstCol == -5){
      firstRow = row;
      firstCol = col;
    }
    else{
      if (((firstRow == secondRow) && (Math.abs(firstCol - secondCol) == 1)) || ((firstRow == secondRow) && (Math.abs(firstCol - secondCol) == 1))){
        swap(firstRow, firstCol, row, col);
      }
    }
    
  }
  
  public void swap(int firstRow, int firstCol, int secondRow, int secondCol){
    Fruits temp = grid[secondRow][secondCol];
    grid[secondRow][secondCol] = grid[firstRow][firstCol];
    grid[firstRow][firstCol] = temp;
  }

  public void applyGravity(){
    return;
  }
  
  public void refillBoard(){
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        if (grid[i][j] == null){
          grid[i][j] = new Fruits();
        }
      }
    }
  }
  
  public void checkForMatches(){
    boolean possible = false;
    boolean[][] matches = new boolean[rows][cols];

    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols-2; j++){
        Fruits fruit1 = grid[i][j];
        Fruits fruit2 = grid[i][j+1];
        Fruits fruit3 = grid[i][j+2];
        if (fruit1 != null && fruit2 != null && fruit3 != null &&
            fruit1.getFruitType().equals(fruit2.getFruitType()) && 
            fruit1.getFruitType().equals(fruit3.getFruitType())){
              matches[i][j] = true;
              matches[i][j+1] = true;
              matches[i][j+2] = true;
            }
      }
    }

    for (int m = 0; m < rows-2; m++){
      for (int n = 0; n < cols; n++){
        Fruits fruit1 = grid[m][n];
        Fruits fruit2 = grid[m+1][n];
        Fruits fruit3 = grid[m+2][n];
        if (fruit1 != null && fruit2 != null && fruit3 != null &&
            fruit1.getFruitType().equals(fruit2.getFruitType()) && 
            fruit1.getFruitType().equals(fruit3.getFruitType())){
              matches[m][n] = true;
              matches[m+1][n] = true;
              matches[m+2][n] = true;
            }
      }
    }
    
    for (int b = 0; b < rows; b++){
      for (int k = 0; k < cols; k++){
        if (matches[b][k]){
          grid[b][k] = null;
        }
      }
    }
  }
  
  public void isPossibleMove(){
    for (int i = 0; i < rows; i++){
      for (int j = 2; j < cols-2; j++){
        Fruits fruit1 = grid[i][j];
        Fruits fruit2 = grid[i][j+1];
        if (fruit1 != null && fruit2 != null &&
            fruit1.getFruitType().equals(fruit2.getFruitType())){
              fruit1Adjacent = grid[i][j-1];
              fruit1Left = grid[i][j-2];
              fruit2Adjacent = grid[i][j+1];
              fruit2Right = grid[i][j+2];
              return ((fruit1.getFruitType().equals(fruit1Adjacent.getFruitType())) ||
              (fruit1.getFruitType().equals(fruit1Left.getFruitType())) || 
              (fruit1.getFruitType().equals(fruit2Adjacent.getFruitType())) ||
              (fruit1.getFruitType().equals(fruit2Right.getFruitType())))
            }
      }
    }

    for (int i = 2; i < rows-2; i++){
      for (int j = 0; j < cols; j++){
        Fruits fruit1 = grid[i][j];
        Fruits fruit2 = grid[i][j+1];
        if (fruit1 != null && fruit2 != null &&
            fruit1.getFruitType().equals(fruit2.getFruitType())){
              fruit1Adjacent = grid[i-1][j];
              fruit1Top = grid[i-2][j];
              fruit2Adjacent = grid[i+1][j];
              fruit2Bottom = grid[i+2][j];
              return ((fruit1.getFruitType().equals(fruit1Adjacent.getFruitType())) ||
              (fruit1.getFruitType().equals(fruit1Top.getFruitType())) || 
              (fruit1.getFruitType().equals(fruit2Adjacent.getFruitType())) ||
              (fruit1.getFruitType().equals(fruit2Bottom.getFruitType())))
            }
      }
    }

    

  }
}
