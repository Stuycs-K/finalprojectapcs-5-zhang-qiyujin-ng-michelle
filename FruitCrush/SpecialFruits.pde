/*public class SpecialFruits extends Fruits {
  private int SpecialLevel;
  
  public void triggerSpecial(int[][] board, int row, int col){
    int rowCheck = row;
    if (row+4 <= board.length){
      for (int i = 0; i < 5; i++){
      if (board[row+i][col]==board[row][col]){
        specialLevel++;
      }
      else{
        specialLevel = 0;
        break;
      }
      rowCheck++;
      }
    }
    else if (row-4 >= 0){
      for (int i = 0; i < 5; i++){
      if (board[row-i][col]==board[row][col]){
        specialLevel++;
      }
      else{
        specialLevel = 0;
        break;
      }
      rowCheck++;
      }
    }
    else if (col-4 >= 0){
      for (int i = 0; i < 5; i++){
      if (board[row][col-i]==board[row][col]){
        specialLevel++;
      }
      else{
        specialLevel = 0;
        break;
      }
      rowCheck++;
      }
    }
    else if (col+4 <= board[0].length){
      for (int i = 0; i < 5; i++){
      if (board[row][col+i]==board[row][col]){
        specialLevel++;
      }
      else{
        specialLevel = 0;
        break;
      }
      rowCheck++;
      }
    }

    if (specialLevel==5){
      for (int n = 0; n < row; n++){
        for (int j = 0; j < row[i].length; j++){
          board[n][j] = 0;
        }
      }
    }

    specialLevel = 0;
}*/
