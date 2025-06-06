public class Board {

  private Fruits[][] grid;
  private int cols, rows;
  private int cellSize;
  private String boardImage;
  private int firstRow = -5;
  private int firstCol = -5;
  private boolean inOperation;
  private boolean gameStarted;
  private ScoreBoard sb;
  private int level;

  public Board(int cols, int rows, int cellSize, int level){
    this.cols = cols;
    this.rows = rows;
    this.cellSize = cellSize;
    this.boardImage = "PinkGrid.png";
    this.sb = new ScoreBoard();
    this.sb.level=level;
    this.level=level;
    grid = new Fruits[rows][cols];
    initializeBoard();
    gameStarted = false;
    while(checkForMatches()){
      refillBoard();
    }
    gameStarted = true;
    inOperation = false;
  }

  public String boardImage(){
    return boardImage;
  }


  public void initializeBoard(){
    for (int r = 0; r < rows; r++){
      for (int c = 0; c < cols; c++){
        grid[r][c] = new Fruits(this.level,r*cellSize);
      }
    }
  }

  public void update(){
    if(allFruitsSettled())
      checkForMatches();
    applyGravity();
    refillBoard();
  }
  
  public boolean allFruitsSettled(){
    for (int r = 0; r < rows; r++){
      for (int c = 0; c < cols; c++){
        if(grid[r][c]!=null && !grid[r][c].isSettled()){
          return false;
        }
      }
    }
    return true;
  }
  
  public void drawBoard(){
    for (int r = 0; r < rows; r++){
      for (int c = 0; c < cols; c++){
        if (grid[r][c] != null){
          grid[r][c].updateFall();
          grid[r][c].drawFruits(c*cellSize, grid[r][c].yPosition, cellSize);
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
    if (firstRow < 0){
      firstRow = secondRow;
      firstCol = secondCol;
    }
    else{
      if (((firstRow == secondRow) && (Math.abs(firstCol - secondCol) == 1)) || ((firstCol == secondCol) && (Math.abs(firstRow - secondRow) == 1))){
        inOperation = true;
        swap(firstRow, firstCol, secondRow, secondCol);
        if (!(hasMatch(secondRow,secondCol) || hasMatch(firstRow,firstCol))){
          swap(firstRow, firstCol, secondRow, secondCol);
        }
        firstRow = -5;
        firstCol = -5;
        inOperation = false;
      }
    }
  }

  public boolean hasMatch(int row, int col){
    if(row<0 || row >= rows || col < 0 || col >= cols){
      return false;
    }
    Fruits center = grid[row][col];
    String type = center.getFruitType();

    int count = 1;
    for(int c = col -1; c >= 0; c--){
      if(grid[row][c].getFruitType().equals(type))
        count++;
       else
         break;
    }
    for(int c = col+1; c < cols; c ++){
       if(grid[row][c].getFruitType().equals(type))
        count++;
       else
         break;
    }
    if (count >= 3)
      return true;

    count = 1;
    for(int r = row -1; r >= 0; r--){
      if(grid[r][col].getFruitType().equals(type))
        count++;
       else
         break;
    }
    for(int r = row+1; r < rows; r ++){
       if(grid[r][col].getFruitType().equals(type))
        count++;
       else
         break;
    }
    return (count >= 3);

  }

  public void swap(int firstRow, int firstCol, int secondRow, int secondCol){
    Fruits secondFruit = grid[secondRow][secondCol];
    grid[secondRow][secondCol] = grid[firstRow][firstCol];
    grid[firstRow][firstCol] = secondFruit;
    inOperation = false;
  }

  public void applyGravity(){
    inOperation = true;
    for(int c = 0; c < cols; c++){
      int bottomRow = rows-1;
      for(int r = rows-1; r >= 0; r --){
        if(grid[r][c] != null){
          grid[r][c].targetY = (bottomRow)*cellSize;
          grid[bottomRow][c] = grid[r][c];
          if(bottomRow != r){
            grid[r][c] = null;
          }
          bottomRow--;
        }
      }
    }
  }

  public void refillBoard(){
    for (int r = 0; r < rows; r++){
      for (int c = 0; c < cols; c++){
        int emptyInCol = nullsInCol(c);
        if (grid[r][c] == null){
          if(!gameStarted){
            grid[r][c] = new Fruits(sb.level,r*cellSize);
          }
          else{
            grid[r][c] = new Fruits(sb.level,(r-emptyInCol-1)*cellSize);
            grid[r][c].targetY = r*cellSize;
          }
        }
      }
    }
    inOperation = false;
  }
  
  public int nullsInCol(int col){
    int count = 0;
    for(int r = 0; r < rows; r ++){
      if(grid[r][col] == null){
        count ++;
      }
    } 
    return count;
  }

  public void clearRowCol(int row, int col, boolean[][] matches){
    for (int i = 0; i < cols; i++){
      matches[row][i] = true;
    }
    for (int j = 0; j < rows; j++){
      matches[j][col] = true;
    }
  }

  public boolean checkForMatches(){
    boolean possible = false;
    boolean[][] matches = new boolean[rows][cols];

    for (int r = 0; r < rows; r++){
      for (int c = 0; c < cols-2; c++){
        Fruits fruit1 = grid[r][c];
        Fruits fruit2 = grid[r][c+1];
        Fruits fruit3 = grid[r][c+2];
        if (fruit1 != null && fruit2 != null && fruit3 != null &&
            fruit1.getFruitType().equals(fruit2.getFruitType()) &&
            fruit2.getFruitType().equals(fruit3.getFruitType())){
              if (c+4<cols && grid[r][c+4] != null && fruit1.getFruitType().equals(grid[r][c+4].getFruitType())){
                grid[5][5] = new SpecialFruits(5);
                for (int i = 0; i < rows; i++){
                  clearRowCol(i,0,matches);
                }
                if(gameStarted)
                  sb.addToScore(10000);
                possible = true;
              }
              else if (c+3<cols && grid[r][c+3] != null && fruit1.getFruitType().equals(grid[r][c+3].getFruitType())){
                grid[r][c+3] = new SpecialFruits(4);
                clearRowCol(r,c+3,matches);
                if(gameStarted)
                  sb.addToScore(3800);
                possible = true;
              }
              else{
                matches[r][c] = true;
                matches[r][c+1] = true;
                matches[r][c+2] = true;
                if(gameStarted)
                  sb.addToScore(300);
                possible = true;
              }
            }
      }
    }

    for (int n = 0; n < cols; n++){
      for (int m = 0; m < rows-2; m++){
        Fruits fruit1 = grid[m][n];
        Fruits fruit2 = grid[m+1][n];
        Fruits fruit3 = grid[m+2][n];
        if (fruit1 != null && fruit2 != null && fruit3 != null &&
            fruit1.getFruitType().equals(fruit2.getFruitType()) &&
            fruit1.getFruitType().equals(fruit3.getFruitType())){
              if (m+4<rows && grid[m+4][n] != null && fruit1.getFruitType().equals(grid[m+4][n].getFruitType())){
                grid[5][5] = new SpecialFruits(5);
                for (int i = 0; i < rows; i++){
                  clearRowCol(i,0,matches);
                }
                if(gameStarted)
                  sb.addToScore(10000);
                possible = true;
              }
              else if (m+3<rows && grid[m+3][n] != null && fruit1.getFruitType().equals(grid[m+3][n].getFruitType())){
                grid[m+3][n] = new SpecialFruits();
                clearRowCol(m+3,n,matches);
                if(gameStarted)
                  sb.addToScore(3800);
                possible = true;
              }
              else{
                matches[m][n] = true;
                matches[m+1][n] = true;
                matches[m+2][n] = true;
                if(gameStarted)
                  sb.addToScore(300);
                possible = true;
              }
            }
      }
    }

    int clearedCount = 0;
    for (int b = 0; b < rows; b++){
      for (int k = 0; k < cols; k++){
        if (matches[b][k]){
          grid[b][k] = null;
          clearedCount++;
        }
      }
    }

    if (clearedCount == rows*cols){
      initializeBoard();
      while(checkForMatches()){
        refillBoard();
      }
    }
    
    inOperation = false;
    return possible;
  }

  public boolean isPossibleMove(){
    for (int i = 0; i < rows; i++){
      for (int j = 2; j < cols-2; j++){
        Fruits fruit1 = grid[i][j];
        Fruits fruit2 = grid[i][j+1];
        if (fruit1 != null && fruit2 != null &&
            fruit1.getFruitType().equals(fruit2.getFruitType())){
              Fruits fruit1Adjacent = grid[i][j-1];
              Fruits fruit1Left = grid[i][j-2];
              Fruits fruit2Adjacent = grid[i][j+1];
              Fruits fruit2Right = grid[i][j+2];
              if ((fruit1Adjacent != null && fruit1.getFruitType().equals(fruit1Adjacent.getFruitType())) ||
              (fruit1Left != null && fruit1.getFruitType().equals(fruit1Left.getFruitType())) ||
              (fruit2Adjacent != null && fruit1.getFruitType().equals(fruit2Adjacent.getFruitType())) ||
              (fruit2Right != null && fruit1.getFruitType().equals(fruit2Right.getFruitType()))){
                return true;
              }
          }
      }
    }

    for (int i = 2; i < rows-2; i++){
      for (int j = 0; j < cols; j++){
        Fruits fruit1 = grid[i][j];
        Fruits fruit2 = grid[i][j+1];
        if (fruit1 != null && fruit2 != null &&
            fruit1.getFruitType().equals(fruit2.getFruitType())){
              Fruits fruit1Adjacent = grid[i-1][j];
              Fruits fruit1Top = grid[i-2][j];
              Fruits fruit2Adjacent = grid[i+1][j];
              Fruits fruit2Bottom = grid[i+2][j];
              if ((fruit1Adjacent != null && fruit1.getFruitType().equals(fruit1Adjacent.getFruitType())) ||
              (fruit1Top != null && fruit1.getFruitType().equals(fruit1Top.getFruitType())) ||
              (fruit2Adjacent != null && fruit1.getFruitType().equals(fruit2Adjacent.getFruitType())) ||
              (fruit2Bottom != null && fruit1.getFruitType().equals(fruit2Bottom.getFruitType()))){
                return true;
              }
            }
      }
    }

    int count = 0;

    for (int i = 1; i < rows-1; i++){
      for (int j = 1; j < cols-1; j++){
        Fruits center = grid[i][j];
        Fruits left = grid[i][j-1];
        Fruits right = grid[i][j+1];
        Fruits top = grid[i-1][j];
        Fruits bottom = grid[i+1][j];
        if (left != null && center.getFruitType().equals(left.getFruitType())){
          count++;
        }
        if (right != null && center.getFruitType().equals(right.getFruitType())){
          count++;
        }
        if (top != null && center.getFruitType().equals(top.getFruitType())){
          count++;
        }
        if (bottom != null && center.getFruitType().equals(bottom.getFruitType())){
          count++;
        }
      }
    }

    return (count>=3);

  }
}
