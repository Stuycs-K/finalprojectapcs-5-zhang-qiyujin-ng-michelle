public class Fruits {
  private final String[] FruitCategory = new String[]{"strawberry.jpg","apple.jpg","banana.jpg","peach.jpg","cherry.jpg"};
  private PImage image;
  private String fruitType;
  
  public Fruits(){
    fruitType = "Images/" + FruitCategory[(int)(Math.random()*FruitCategory.length)];
    image = loadImage(fruitType);
  }

  public String getFruitType(){
    return fruitType;
  }
  
  public void drawFruits(int x, int y, int size){
    image.resize(size,0);
    image(image, x, y);
  }  

  
}
