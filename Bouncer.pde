class Bouncer extends Character {

  private boolean canAct = false;
  private PImage theBouncer;
  private int initWidth;
  private int yOffset;
  private int imgHeight;

  Bouncer(int x) {
    charHeight = 300;
    charWidth = 1260;
    initWidth = 300;
    imgHeight = 400;
    yOffset = 50;
    stepY = 0;
    stepX = 20;
    xPos = x - initWidth;
    yPos = 250;
    isRight = false;
    isUp = false;
    theBouncer = loadImage("ArmB.png");
  }

  void move(int boundsCheckY, int boundsCheckX) {
    if (canAct) {
      moveLeftRight(boundsCheckX);
    }
  }

  void drawMe() {
    image(theBouncer, xPos, yPos, charWidth, imgHeight);
  }

  void act(boolean keyPress) {
    canAct = true;
  }
  
    int getYPos() {
    return yPos + yOffset;
  }
}