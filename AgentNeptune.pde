class AgentNeptune extends Character {

  private boolean isPaused = false;
  private PImage neptuneHimself;
  private int initWidth;

  AgentNeptune() {
    charHeight = 150;
    charWidth = 200;
    xPos = -50;
    step = 15;
    yPos = 150;
    isRight = true;
    isUp = true;
    neptuneHimself = loadImage("Fist1.png");
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
    //rect(xPos, yPos, charWidth, charHeight);
    image(neptuneHimself, xPos, yPos, charWidth, charHeight);
  }
  
  private void keyAction(int boundsCheckX) {
  
      moveLeftRight(boundsCheckX);
    }
}