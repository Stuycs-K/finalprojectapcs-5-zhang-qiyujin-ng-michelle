public class ScoreBoard{
    private int score = 0;
    private int level = 1;

    public void display(){
        fill(136, 224, 236);
        rect(0, 500, 500, 100);

        fill(0);
        textSize(20);
        textAlign(LEFT, CENTER);
        text("Score: " + score, 20, 530);
        text("Level: " + level, 20, 560);
    }

    public void addToScore(int points){
        score+=points;
        updateLevel();
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