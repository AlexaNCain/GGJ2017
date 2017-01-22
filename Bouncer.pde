class Bouncer extends Character {

  protected boolean canActLeftRight = false;
  protected boolean canActUpDown;
  protected PImage theBouncer;
  protected int initWidth;
  protected int yOffset;
  protected int imgHeight;

@Deprecated
Bouncer(){} //AgentBouncer testing

  Bouncer(int x, int stepY, boolean canActUpDown) {
    charHeight = 300;
    charWidth = 1260;
    initWidth = 300;
    imgHeight = 400;
    yOffset = 50;
    this.stepY = stepY;
    stepX = 20;
    xPos = x - initWidth;
    yPos = 250;
    isRight = false;
    isUp = false;
    this.canActUpDown = canActUpDown;
    theBouncer = loadImage("ArmB.png");
  }

  void move(int boundsCheckY, int boundsCheckX) {
    if (canActLeftRight) {
      moveLeftRight(boundsCheckX);
    }
    if(canActUpDown){
      println("move");
      moveUpDown(boundsCheckY);
    }
  }

  void drawMe() {
    image(theBouncer, xPos, yPos, charWidth, imgHeight);
  }

  void act(boolean keyPress) {
    canActLeftRight = true;
    canActUpDown = false;
  }

  int getYPos() {
    return yPos + yOffset;
  }
}