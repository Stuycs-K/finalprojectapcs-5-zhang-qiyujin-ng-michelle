public class SpecialFruits extends Fruits {
  private int SpecialLevel;
  
  public void triggerSpecial(int[][] board, int row, int col){
    int specialCheck = 0;
    int rowCheck = row;
    for (int i = 0; i < 5; i++){
      if (board[row+i][col]==board[row][col]){
        specialCheck++;
      }
      else{
        specialCheck = 0;
        break;
      }
      rowCheck++;
    }
  }
}
