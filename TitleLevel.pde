class TitleLevel extends Level {


  TitleLevel(int levelHeight, int levelWidth, Level nextLevel) {
    super(levelHeight, levelWidth, nextLevel);
    PImage bg = loadImage("Title.png");
    background.add(bg);
    canRun = true;
  }

  void act(boolean keyPress) {
    status = LevelStatus.WIN;
    println("title");
  }

  LevelStatus checkWin() {
    println("title status" + status.toString());
    return status;
  }

  void drawLevelFrame(int currentFrame) {
    handleBackground(currentFrame);
  }
}