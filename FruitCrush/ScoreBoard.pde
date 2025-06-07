public class ScoreBoard{
    private int score;
    private int level;

    public void display(){
        fill(136, 224, 236);
        rect(0, 500, 500, 100);

        fill(0);
        textSize(20);
        textAlign(LEFT, CENTER);
        text("Score: " + score, 20, 515);
        text("Level: " + level, 20, 545);
        text(level, 20, 575);
        text(level+1, 153, 575);

        stroke(255);
        rect(47, 568, 100, 15);

        fill(0, 255, 0);
        stroke(255);
        double fillPercent = (((double) score - ((level-1)*2500))/2500);
        int fillAmt = (int) (fillPercent * 100);
        rect(47, 568, fillAmt, 15);
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
        int newLevel = (score/2500)+1;
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
