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
    
  }
  
  public void update(){
    
  }
  
  public void draw(){
    
  }
  
  public void handleMouse(int x, int y){
    
  }
  
  public void applyGravity(){
    
  }
  
  public void refillBoard(){
    
  }
  
  public void checkForMatches(){
    
  }
}
