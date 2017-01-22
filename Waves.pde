Level currentLevel;
GameLevel levelOne;
TitleLevel title;
AgentNeptune agentNeptune;
int currentFrame = 0;
static boolean acting = false;

int frames = 40;

void setup() {
  size(1280, 800);
  background(175);

  levelOne = new GameLevel(height, width, null);
  title = new TitleLevel(height, width, levelOne);
  currentLevel = title;
  frameRate(frames);
}

void draw() {

  if (currentLevel != null) {
    if (currentLevel.getLevelStatus() == LevelStatus.IN_PROGRESS) {
      background(175);
      currentLevel.drawLevelFrame(currentFrame);
      currentFrame = (currentFrame + 1) % frames;
    }
    
    if (currentLevel.checkWin() == LevelStatus.WIN) {
        currentLevel = currentLevel.getNextLevel();
      } //<>//
  }
}

void keyPressed() {
  if(currentLevel.getLevelStatus() == LevelStatus.IN_PROGRESS && !currentLevel.isCanRun()){
    currentLevel.startLevel();
  }
  
  else if (key != ESC && acting == false && currentLevel != null) {
    currentLevel.act(true);
  }
}

void keyReleased() {
  if (key != ESC && acting == false && currentLevel != null) {
    currentLevel.act(false);
  }
}