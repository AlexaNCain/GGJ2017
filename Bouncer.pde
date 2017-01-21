class Bouncer extends Character {

  Bouncer(int x) {
    charHeight = 300;
    charWidth = 150;
    step = 25;
    xPos = x - charWidth;
    println("x= "+ x + " charWidth = " + charWidth + " xPos = " + xPos);
    yPos = 250;
    isRight = false;
    isUp = false;
  }

  void move(int boundsCheckY, int boundsCheckX) {
    
  }

  void drawMe() {
    rect(xPos, yPos, charWidth, charHeight);
  }
  
  void act(boolean keyPress){}
}