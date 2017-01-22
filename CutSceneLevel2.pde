class CutSceneLevel2 extends Level {

  PImage agentNeptune;
  PImage bouncer;
  int agentXPos;
  int agentHeight;
  int agentWidth;
  int keyPressCount;
  int eventCount;
  int bouncerHeight;
  int bouncerWidth;
  int bouncerXPos;

  CutSceneLevel2(int levelHeight, int levelWidth, Level nextLevel) {
    super(levelHeight, levelWidth, nextLevel);
    PImage bg = loadImage("insideBg1.png");
    PImage bg2 = loadImage("insideBg2.png");
    PImage bg3 = loadImage("insideBg3.png");
    bouncer = loadImage("BouncerMan.png");
    agentNeptune = Waves.agentImg;
    background.add(bg);
    background.add(bg2);  
    background.add(bg3);
    canRun = false;
    agentXPos = 0;
    agentHeight = 500;
    agentWidth = 200;
    bouncerHeight = 600;
    bouncerWidth = 333;
    bouncerXPos = levelWidth - bouncerWidth - 25;
    keyPressCount = 0;
    eventCount = 2;
  }

  void drawLevelFrame(int frameNumber) {
    handleBackground(frameNumber);
    image(agentNeptune, agentXPos, (levelHeight - agentHeight), agentWidth, agentHeight);
    image(bouncer, bouncerXPos, (levelHeight - bouncerHeight), bouncerWidth, bouncerHeight);
    if (keyPressCount == 1) {
      bouncerSpeak("Who are you?");
    } else if (keyPressCount == 2) {
      speak("Agent-- I mean, Brother Neptune.");
    } else if (keyPressCount == 3) {
      bouncerSpeak("...");
    } else if (keyPressCount == 4) {
      speak("...I am not with the FBI.");
    } else if (keyPressCount == 5) {
      bouncerSpeak("What's your business here?");
    } else if (keyPressCount == 6) {
      speak("Um... I am here to do a crime?");
    } else if (keyPressCount == 7) {
      bouncerSpeak("Approach to present the Order Greeting.");
    } else if (keyPressCount >= 8) {
      moveAgent();
    }
  }

  private void moveAgent() {
    agentXPos += 15;
  }

  private void speak(String text) {
    text(text, (agentXPos + agentWidth + 25), (agentHeight - 85));
  }

  private void bouncerSpeak(String text) {
    text(text, (bouncerXPos - 275), (bouncerHeight - 400));
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
    if (agentXPos > levelWidth - bouncerWidth - 250) {
      status = LevelStatus.WIN;
    }
    return status;
  }

  void handleBackground(int frameNumber) {
    super.handleBackground(frameNumber);
    if (frameNumber % 10 == 0 ) {    
      currentFrame=(currentFrame + 1) % background.size();
    }
  }
}