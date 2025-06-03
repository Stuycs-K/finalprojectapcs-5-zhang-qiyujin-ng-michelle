public class ScoreBoard{
    private int score = 0;
    private int level = 1;

    void setup(){
        fill(136, 224, 236);
        rect(0, 500, 500, 100);

    }

    public ScoreBoard(){
        this.score = 0;
        this.level = 0;
    }



    private void levelUpdate(int score){
        if (((score/10000) + 1) > level){
            level = (score/10000) + 1;
            return level;
        }
    }

    public int getScore(){
        return score;
    }

    public int getLevel{
        return level;
    }

    
}