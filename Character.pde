abstract class Character {

  protected int charHeight;
  protected int charWidth;
  protected int step;
  protected int xPos;
  protected int yPos;
  protected boolean hasActed = false;
  protected boolean isRight;
  protected boolean isUp;

  int getXPos() {
    return xPos;
  }

  int getYPos() {
    return yPos;
  }

  int getXCenter() {
    return xPos + (charWidth / 2);
  }

  int getYCenter() {
    return yPos + (charHeight / 2);
  }

  abstract void move(int boundsCheckY, int boundsCheckX);
  abstract void drawMe();

  int getHeight() {
    return charHeight;
  }

  int getWidth() {
    return charWidth;
  }

  protected void moveUp() {
    yPos = yPos - step;
    println("here " + yPos + " " + step);
  }

  protected void moveDown() {
    yPos = yPos + step;
  }

  protected void moveLeft() {
    xPos = xPos - step;
  }

  protected void moveRight() {
    xPos = xPos + step;
  }
  abstract void act(boolean keyPress);

  protected void resolveDirectionUpDown(int boundsCheck) {
    if ((isUp == true && yPos < 0) || (isUp == false && yPos > (boundsCheck - charHeight))) {
      isUp = !isUp;
    }
  }

  protected void resolveLeftRightDirection(int boundsCheck) {
    if ((isRight == false && xPos < 0) || (isRight == true && xPos > (boundsCheck - charWidth))) {
      isRight = !isRight;
    }
  }
}