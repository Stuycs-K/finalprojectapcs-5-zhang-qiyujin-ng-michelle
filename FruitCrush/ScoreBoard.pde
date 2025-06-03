public class ScoreBoard{
    private int score;
    private int level;

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
        updateLevel(score);
    }

    public ScoreBoard(){
        this.score = 0;
        this.level = 1;
    }

    private void updateLevel(int score){
        int newLevel = (score/10000)+1;
        if (newLevel > level){
            level = newLevel;
        }
    }

    public int getScore(){
        return score;
    }

    public int getLevel(){
        return level;
    }


}
