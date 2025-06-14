  public class Fruits {
    private final String[][] FruitCategories = new String[][]{{"strawberry.png","grape.png","banana.png","orange.png","pineapple.png"}, 
    {"strawberry.png","grape.png","banana.png","orange.png","pineapple.png","mango.png"},
    {"strawberry.png","grape.png","banana.png","orange.png","pineapple.png","mango.png","kiwi.png"},
    {"strawberry.png","grape.png","banana.png","orange.png","pineapple.png","mango.png","kiwi.png","cherry.png"}};
    private PImage image;
    private String fruitType;
    private int targetY,fallSpeed,yPosition;
    private boolean recentlySwapped;

    public Fruits(int level, int initialY){
      int extraFruits = (level/5);
      if (extraFruits > 3){
        extraFruits = 3;
      }
      recentlySwapped = false;
      int categoryLength = FruitCategories[extraFruits].length;
      fruitType = "Images/" + FruitCategories[extraFruits][(int)(Math.random()*categoryLength)];
      image = loadImage(fruitType);
      yPosition = initialY;
      fallSpeed = 30;
    }

    public String getFruitType(){
      return fruitType;
    }

    public void setFruitType(String setFruitType){
      this.fruitType = setFruitType;
    }

    public void setFruit(String type){
      this.fruitType = type;
      this.image = loadImage("Images/"+type);
    }

    public void updateFall(){
      if(yPosition < targetY){
        yPosition += fallSpeed;
        if (yPosition > targetY) {
          yPosition = targetY;
        }
      }
    }
    
    public boolean isSettled(){
      return(targetY == yPosition);
    }
    
    public void drawFruits(int x, int y, int size){
      image.resize(size,0);
      image(image, x, y);
    }


  }
