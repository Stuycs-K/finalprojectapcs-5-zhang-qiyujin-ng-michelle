
# Technical Details:

Period: 5  
Group members: Qiyujin Zhang, Michelle Ng  
Group Name (be creative and lean into it!): Fruit Crush: Qiwi & Melonchelle  
Brief Project description (1 paragraph summary): We will be recreating Candy Crush (but making it fruit instead of candy). We will make a 10x10 grid with different images (symbols) that represent the fruit. We will have a scoreboard at the top that continuously updates. If you have 3 or more of the same fruits in a line (link), you will get a 100 points per fruit cleared. If you link 4, you will get a special fruit. When the special type of a fruit is canceled out, it instantly clears out its row and column; you get 200 points per fruit cleared. If you link 5, the special in the middle will clear the entire board and then regenerate; you get 100 points per fruit cleared.   
Expanded Description:  
Critical features (Minimum Viable Product): We will have the 10x10 board and the different fruits made. We will make it so that the fruits can be linked together and clear their respective sections.   
Ending features: We will have one special fruit that can clear the entire board and regenerate it when 5 are linked together. We will have another special fruit (that can act as any fruit) that can simultaneously clear its row and column when linked, only given after linking 4 normal fruits.   

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.
![Alt text](ClassDiagramOne.png?raw=true "Class Diagram" )
 -FruitCrush.java: main file.  
   -Fruits.java: creates types of Fruits and include their corresponding images.   
     -SpecialFruits.java: creates Fruits that will do special moves.   
   -Board.java: creates the board and makes actual updates at the end of each move.    
   -Algorism.java: The key algorism that ensures that there's always a possible next move/refresh the board.  

# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)
