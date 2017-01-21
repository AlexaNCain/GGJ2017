class AgentNeptune extends Character {

  private int step;
  private boolean isUp = true;
  private boolean isRight = true;
  private boolean isPaused = false;
  private boolean act = false;
  private boolean hasActed = false;
  AgentNeptune() {
    charHeight = 100;
    charWidth = 50;
    step = 15;
    xPos = 0;
    yPos = 150;
  }

  boolean isHasActed() {
    return hasActed;
  }
  void act(boolean keyPress) {
    //Waves.acting = true;
    setPaused(keyPress);
    act = true;
    //  keyAction(1280);
    //Waves.acting = false;
  }

  private void setPaused(boolean paused) {
    isPaused = paused;
  }

  void move(int boundsCheck) {

    if (!act) {
      if (isPaused == false) {

        if (isUp) {
          moveUp();
        } else {
          moveDown();
        }

        resolveDirection(boundsCheck);
      }
    } else {

      keyAction(1280);
    }
  }

  void drawMe() {
    rect(xPos, yPos, charWidth, charHeight);
    // println("y = " + yPos + " middle =" + getYCenter());
  }

  private void resolveDirection(int boundsCheck) {
    if ((isUp == true && yPos < 0) || (isUp == false && yPos > (boundsCheck - charHeight))) {
      isUp = !isUp;
    }
  }

  private void resolveLeftRightDirection(int boundsCheck) {
    if ((isRight == false && xPos < 0) || (isRight == true && xPos > (boundsCheck - charWidth))) {
      isRight = !isRight;
      hasActed = true;
    }
  }

  private void keyAction(int boundsCheck) {

    if (isRight) {
      moveRight();
    } else {
      moveLeft();
    }

    resolveLeftRightDirection(boundsCheck);
  }

  private void moveUp() {
    yPos = yPos - step;
  }

  private void moveDown() {
    yPos = yPos + step;
  }

  private void moveLeft() {
    xPos = xPos - step;
  }

  private void moveRight() {
    xPos = xPos + step;
  }
}