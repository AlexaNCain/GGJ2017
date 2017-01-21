abstract class Character{
  
  int height;
  int width;
  int step;
  int xPos;
  int yPos;

  int getXPos() {
    return xPos;
  }

  int getYPos() {
    return yPos;
  }

  abstract void move(int boundsCheck);

  int getHeight() {
    return height;
  }

  int getWidth() {
    return width;
  }
  
}