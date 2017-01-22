class CreditsLevel extends Level {

  private boolean canWin;

  CreditsLevel(int levelHeight, int levelWidth, Level nextLevel) {
    super(levelHeight, levelWidth, nextLevel);
    PImage bg = loadImage("Credits1.png");
    PImage bg2 = loadImage("Credits2.png");
    PImage bg3 = loadImage("Credits3.png");
    PImage bg4 = loadImage("Credits4.png");
    background.add(bg);
    background.add(bg2);
    background.add(bg3);
    background.add(bg4);
    canRun = true;
    canWin = false;
  }

  void act(boolean keyPress) {

    if (keyPress) {
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