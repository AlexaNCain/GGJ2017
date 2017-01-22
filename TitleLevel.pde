class TitleLevel extends Level {


  TitleLevel(int levelHeight, int levelWidth, Level nextLevel) {
    super(levelHeight, levelWidth, nextLevel);
    PImage bg = loadImage("Title.png");
    background.add(bg);
    canRun = true;
  }

  void act(boolean keyPress) {
    status = LevelStatus.WIN;
  }

  LevelStatus checkWin() {
    return status;
  }

  void drawLevelFrame(int currentFrame) {
    handleBackground(currentFrame);
  }
  
  void restart(){
    status = LevelStatus.IN_PROGRESS;
  }
}