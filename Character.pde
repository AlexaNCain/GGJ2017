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
  
  int getXCenter(){
    return xPos + (charWidth / 2);
  }

  int getYCenter(){
    return yPos + (charHeight / 2);
  }

  abstract void move(int boundsCheck);
  abstract void drawMe();

  int getHeight() {
    return charHeight;
  }

  int getWidth() {
    return charWidth;
  }
  
  abstract void act(boolean keyPress);
}