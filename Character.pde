abstract class Character{
  
  protected int height;
  protected int width;
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
    return height;
  }

  int getWidth() {
    return width;
  }
  
}