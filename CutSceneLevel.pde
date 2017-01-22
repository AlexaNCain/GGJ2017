class CutSceneLevel extends Level {

  CutSceneLevel(int levelHeight, int levelWidth, Level nextLevel) {
    super(levelHeight, levelWidth, nextLevel);
    PImage bg = loadImage("bouncerBg1.png");
    PImage agentNeptune = loadImage("Agent.png");
    background.add(bg);
    canRun = false;
  }

  void drawLevelFrame(int frameNumber) {
    handleBackground(frameNumber);
  }
  void act(boolean keyPress) {
    if (keyPress) {
      status = LevelStatus.WIN;
    }
  }
  void restart() {
    status=LevelStatus.IN_PROGRESS;
  }
  LevelStatus checkWin() {
    return status;
  }
}