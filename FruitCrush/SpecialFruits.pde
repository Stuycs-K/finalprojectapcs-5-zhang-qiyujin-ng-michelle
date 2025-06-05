public class SpecialFruits extends Fruits {
  private PImage specialImage;
  private int matchNum;

  public SpecialFruits(){
    super(0);
    matchNum = match; 
    setFruitType("Images/special"+matchNum+".png");
    specialImage = loadImage(getFruitType());
  }

  public void drawFruits(int x, int y, int size){
    specialImage.resize(size,0);
    image(specialImage, x, y);
  }

}
