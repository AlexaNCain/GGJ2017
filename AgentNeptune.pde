class AgentNeptune extends Character{

  private int step;
  private boolean isUp = true;
  private boolean isPaused = false;

  AgentNeptune() {
    height = 100;
    width = 50;
    step = 15;
    xPos = 0;
    yPos = 150;
  }
  
  void act(boolean keyPress){
    setPaused(keyPress);
  }
  
  private void setPaused(boolean paused){
    isPaused = paused;
  }

  void move(int boundsCheck){
    
    if(isPaused == false){
    
    if(isUp){
      moveUp();
    } else {
      moveDown();
    }
    
    resolveDirection(boundsCheck);
    }
  }
  
  void drawMe(){
     rect(this.getXPos(), this.getYPos(), this.getWidth(), this.getHeight());
  }
  
  private void resolveDirection(int boundsCheck){
    if((isUp == true && yPos < 0) || (isUp == false && yPos > (boundsCheck - height))){
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