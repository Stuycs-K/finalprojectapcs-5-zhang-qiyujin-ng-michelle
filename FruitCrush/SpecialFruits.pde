public class SpecialFruits extends Fruits {
  private PImage specialImage;
  private int matchNum, waitTime;

  public SpecialFruits(int match, int initialY){
    super(0, initialY);
    matchNum = match;
    waitTime = 15;
    setFruitType("Images/special"+matchNum+".png");
    specialImage = loadImage(getFruitType());
  }

  public void drawFruits(int x, int y, int size){
    specialImage.resize(size,0);
    image(specialImage, x, y);
  }

}
