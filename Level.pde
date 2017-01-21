abstract class Level {

  protected LevelStatus status;
  protected Level nextLevel = null;
  protected int levelHeight;
  protected int levelWidth;


  Level(int levelHeight, int levelWidth) {
    this.levelHeight = levelHeight;
    this.levelWidth = levelWidth;
    status = LevelStatus.IN_PROGRESS;
  }

  LevelStatus getLevelStatus() {
    return status;
  }

  abstract void drawLevelFrame(int frameNumber);

  void setLevelStatus(LevelStatus status) {
    this.status = status;
  }
}