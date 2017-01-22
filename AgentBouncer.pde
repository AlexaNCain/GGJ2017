class AgentBouncer extends Bouncer {

  protected boolean canActLeftRight = false;
  protected boolean canActUpDown;
  protected PImage theBouncer;
  protected int initWidth;
  protected int yOffset;
  protected int imgHeight;

  AgentBouncer(int x, int stepY, boolean canActUpDown) {
    charHeight = 250;
    charWidth = 950;
    initWidth = 300;
    imgHeight = 250;
    yOffset = 50;
    this.stepY = stepY;
    stepX = 20;
    xPos = x - initWidth;
    yPos = 250;
    isRight = false;
    isUp = false;
    this.canActUpDown = canActUpDown;
    theBouncer = loadImage("ArmAB.png");
  }

  void drawMe() {
    image(theBouncer, xPos, yPos, charWidth, imgHeight);
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

  void act(boolean keyPress) {
    canActLeftRight = true;
    canActUpDown = false;
  }

  int getYPos() {
    return yPos + yOffset;
  }

}