public class Fruits {
  private final String[] FruitCatogory = new String[]{"strawberry","apple","banana","peach","cherry"};
  private PImage image;
  
  public Fruits(){
    String fruitType = FruitCatogory[(int)(Math.random()*FruitCatogory.length)];
    image = loadImage(fruitType+".jpg");
  }

  public String getFruitType(){
    return fruitType;
  }
  
  public void drawImage(int x, int y, int size){
    image.resize(size,0);
    image(image, x, y);
  }  

  
}
