public class ScoreBoard{
    private int score = 0;
    private int level = 0;

    void setup(){
        fill(136, 224, 236);
        rect(0, 500, 500, 100);

    }

    public int levelUpdate(int score){
        if ((score/10000) > level){
            level = (score/10000);
            return level;
        }
    }

    
}