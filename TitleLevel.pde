class TitleLevel extends Level {

  private boolean canWin;

  TitleLevel(int levelHeight, int levelWidth, Level nextLevel) {
    super(levelHeight, levelWidth, nextLevel);
    PImage bg = loadImage("Title.png");
    PImage bg2 = loadImage("Title2.png");
    background.add(bg);
    background.add(bg2);
    canRun = true;
    canWin = false;
  }

  void act(boolean keyPress) {

    if (!canWin) {

      currentFrame = currentFrame + 1;
      if (currentFrame >= background.size()) {
        currentFrame = currentFrame - 1;
        canWin = true;
      }
    } else {
      status = LevelStatus.WIN;
    }
  }

  LevelStatus checkWin() {
    return status;
  }

  void drawLevelFrame(int currentFrame) {
    handleBackground(currentFrame);
  }

  void restart() {
    status = LevelStatus.IN_PROGRESS;
  }
}