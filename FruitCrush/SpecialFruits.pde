public class SpecialFruits extends Fruits {
  private PImage specialImage;

  public SpecialFruits(){
    super(0);
    setFruitType("Images/special.png");
    specialImage = loadImage(getFruitType());
  }

  public void drawFruits(int x, int y, int size){
    specialImage.resize(size,0);
    image(specialImage, x, y);
  }

}
