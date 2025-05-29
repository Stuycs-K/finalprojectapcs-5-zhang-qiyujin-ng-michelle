public class Fruits {
  private final String[] FruitCatogory = new String[]{"strawberry.png","apple.png","banana.png","peach.png","cherry.png"};
  private PImage image;
  
  public Fruits(){
    String fruitType = FruitCatogory[(int)(Math.random()*FruitCatogory.length)];
    image = loadImage(fruitType);
  }
  
  public void drawImage(int x, int y, int size){
    image.resize(size,0);
    image(image, x, y);
  }  

  
}
