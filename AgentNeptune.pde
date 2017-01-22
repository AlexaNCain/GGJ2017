class AgentNeptune extends Character {

  private boolean isPaused = false;
  private PImage neptuneHimself;
  private int imgWidth;
  private int xOffset;

  AgentNeptune() {
    charHeight = 250;
    charWidth = 185;
    imgWidth = 950;
    xPos = 0;
    xOffset = imgWidth - charWidth;
    stepY = 20;
    stepX = 25;
    yPos = 150;
    isRight = true;
    isUp = true;
    neptuneHimself = loadImage("Arm.png");
  }

  boolean isHasActed() {
    return hasActed;
  }
  void act(boolean keyPress) {
    setPaused(keyPress);
    hasActed = true;
  }

  private void setPaused(boolean paused) {
    isPaused = paused;
  }

  void move(int boundsCheckY, int boundsCheckX) {

    if (!hasActed) {
      if (isPaused == false) {

        if (isUp) {
          moveUp();
        } else {
          moveDown();
        }

        resolveDirectionUpDown(boundsCheckY);
      }
    } else {

      keyAction(boundsCheckX);
    }
  }

  void drawMe() {
    image(neptuneHimself, (xPos - xOffset), yPos, imgWidth, charHeight);
  }
  
  private void keyAction(int boundsCheckX) {
  
      moveLeftRight(boundsCheckX);
    }
}