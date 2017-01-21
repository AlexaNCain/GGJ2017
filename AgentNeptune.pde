class AgentNeptune extends Character {

  private boolean isPaused = false;

  AgentNeptune() {
    charHeight = 100;
    charWidth = 50;
    step = 15;
    xPos = 0;
    yPos = 150;
    isRight = true;
    isUp = true;
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
    rect(xPos, yPos, charWidth, charHeight);
  }
  
  private void keyAction(int boundsCheckX) {

    if (isRight) {
      moveRight();
    } else {
      moveLeft();
    }

    resolveLeftRightDirection(boundsCheckX);
  }
}