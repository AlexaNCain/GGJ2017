abstract class Character {

  protected int charHeight;
  protected int charWidth;
  protected int step;
  protected int xPos;
  protected int yPos;

  int getXPos() {
    return xPos;
  }

  int getYPos() {
    return yPos;
  }

  abstract void move(int boundsCheck);
  abstract void drawMe();

  int getHeight() {
    return charHeight;
  }

  int getWidth() {
    return charWidth;
  }
}