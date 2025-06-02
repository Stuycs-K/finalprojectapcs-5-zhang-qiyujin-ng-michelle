public class Fruits {
  private final String[] FruitCategory = new String[]{"strawberry.jpg","apple.jpg","banana.jpg","peach.jpg","cherry.jpg"};
  private PImage image;
  private String fruitType;
  
  public Fruits(){
    fruitType = "Images\\" + FruitCategory[(int)(Math.random()*FruitCategory.length)];
    image = loadImage(sketchPath(fruitType));
  }

  public String getFruitType(){
    return fruitType;
  }
  
  public void drawFruits(int x, int y, int size) {
    if (image != null) {
      image.resize(size, 0);
      image(image, x, y);
    }
    else {
      println("Image not found: " + fruitType);
    }
    println("Resolved path: " + sketchPath("Images/cherry.jpg"));
  }

  
}
