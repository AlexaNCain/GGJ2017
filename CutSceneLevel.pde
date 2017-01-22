class CutSceneLevel extends Level {

  PImage agentNeptune;
  int agentXPos;
  int agentHeight;
  int agentWidth;
  int keyPressCount;
  int eventCount;

  CutSceneLevel(int levelHeight, int levelWidth, Level nextLevel) {
    super(levelHeight, levelWidth, nextLevel);
    PImage bg = loadImage("bouncerBg1.png");
    agentNeptune = loadImage("Agent.png");
    background.add(bg);
    canRun = false;
    agentXPos = 0;
    agentHeight = 500;
    agentWidth = 200;
    keyPressCount = 0;
    eventCount = 2;
  }

  void drawLevelFrame(int frameNumber) {
    handleBackground(frameNumber);
    image(agentNeptune, agentXPos, (levelHeight - agentHeight), agentWidth, agentHeight);
    if(keyPressCount == 1){
     speak("Sounds like a whole lot of mumbo-jumbo…");
    } else if (keyPressCount == 2){
      speak("Well, here goes nothing.");
    } else if (keyPressCount >= 3){
      moveAgent();
    }
  }
  
  private void moveAgent(){
      agentXPos += 15;
  }

  private void speak(String text){
      fill(230);
      textSize(32);
      text(text, (agentXPos + agentWidth + 25), (agentHeight - 85)); 
  }

  void act(boolean keyPress) {
    if (keyPress) {
      keyPressCount += 1;
    }
  }
  void restart() {
    status=LevelStatus.IN_PROGRESS;
  }
  LevelStatus checkWin() {
    if (agentXPos > levelWidth) {
      status = LevelStatus.WIN;
    }
    return status;
  }
}