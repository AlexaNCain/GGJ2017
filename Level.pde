abstract class Level {

  protected LevelStatus status;
  protected Level nextLevel = null;
  protected int levelHeight;
  protected int levelWidth;
  protected ArrayList<PImage> background = new ArrayList<PImage>();
  protected int currentFrame = 0;
  protected boolean canRun;


  Level(int levelHeight, int levelWidth, Level nextLevel) {
    this.levelHeight = levelHeight;
    this.levelWidth = levelWidth;
    status = LevelStatus.IN_PROGRESS;
    this.nextLevel = nextLevel;
    
  }

  LevelStatus getLevelStatus() {
    return status;
  }
  
  boolean isCanRun(){
    return canRun;
  }

  abstract void drawLevelFrame(int frameNumber);
  abstract void act(boolean keyPress);
  abstract LevelStatus checkWin();
  
  protected void handleBackground(int frameNumber) {
    background(background.get(currentFrame));
    if (frameNumber % 10 == 0 ) {    
      currentFrame=(currentFrame + 1) % background.size();
    }
  }

  void setLevelStatus(LevelStatus status) {
    this.status = status;
  }
  
  Level getNextLevel(){
      return nextLevel;
  }
  
  void startLevel(){
  canRun = true;
}
}