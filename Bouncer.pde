class Bouncer extends Character {

  Bouncer(int x) {
    charHeight = 300;
    charWidth = 150;
    xPos = x - charWidth;
    println("x= "+ x + " charWidth = " + charWidth + " xPos = " + xPos);
    yPos = 250;
  }

  void move(int boundsCheck) {
  }

  void drawMe() {
    rect(this.getXPos(), this.getYPos(), this.getWidth(), this.getHeight());
  }
}