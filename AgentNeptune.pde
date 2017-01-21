class AgentNeptune extends Character {

  private int step;
  private boolean isUp = true;
  private boolean isPaused = false;

  AgentNeptune() {
    charHeight = 100;
    charWidth = 50;
    step = 15;
    xPos = 0;
    yPos = 150;
  }

  void act(boolean keyPress) {
    setPaused(keyPress);
  }

  private void setPaused(boolean paused) {
    isPaused = paused;
  }

  void move(int boundsCheck) {

    if (isPaused == false) {

      if (isUp) {
        moveUp();
      } else {
        moveDown();
      }

      resolveDirection(boundsCheck);
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

  private void moveUp() {
    yPos = yPos - step;
  }

  private void moveDown() {
    yPos = yPos + step;
  }
}