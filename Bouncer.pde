class Bouncer extends Character {

  private boolean canAct = false;
  private PImage theBouncer;
  private int initWidth;

  Bouncer(int x) {
    charHeight = 300;
    charWidth = 400;
    initWidth = 300;
    stepY = 0;
    stepX = 20;
    xPos = x - initWidth;
    yPos = 250;
    isRight = false;
    isUp = false;
    theBouncer = loadImage("FistB.png");
  }

  void move(int boundsCheckY, int boundsCheckX) {
    if (canAct) {
      moveLeftRight(boundsCheckX);
    }
  }

  void drawMe() {
    image(theBouncer, xPos, yPos, charWidth, charHeight);
  }

  void act(boolean keyPress) {
    canAct = true;
  }
}