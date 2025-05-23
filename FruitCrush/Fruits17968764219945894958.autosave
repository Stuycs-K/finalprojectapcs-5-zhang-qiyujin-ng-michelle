public class Fruits {
  private String FruitCatogory;
  private PImage image;
  
  public Fruits(String fruitType){
    if(fruitType.equals("strawberry")){
      image = loadImage("strawberry.jpg");
      FruitCatogory = "strawberry";
    }
    if(fruitType.equals("apple")){
      image = loadImage("apple.jpg");
      FruitCatogory = "apple";
    }
    if(fruitType.equals("banana")){
      image = loadImage("banana.jpg");
      FruitCatogory = "banana";
    }
    if(fruitType.equals("peach")){
      image = loadImage("peach.jpg");
      FruitCatogory = "peach";
    }
    if(fruitType.equals("cherry")){
      image = loadImage("cherry.jpg");
      FruitCatogory = "cherry";
    }
  }
  
  public void draw(int x, int y, int size){
    image.resize(size,0);
    image(image, x, y);
  }
  
  public String getType(){
    return FruitCatogory;
  }

  
}
