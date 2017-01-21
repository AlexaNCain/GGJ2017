GameLevel currentLevel;
GameLevel levelOne;
AgentNeptune agentNeptune;
int currentFrame = 0;
static boolean acting = false;

int frames = 40;

void setup() {
  size(1280, 800);
  background(175);
  levelOne = new GameLevel(height, width);
  currentLevel = levelOne;
  agentNeptune = currentLevel.getAgent();
  frameRate(frames);
}

void draw() {
  if(currentLevel.getLevelStatus() == LevelStatus.IN_PROGRESS){
  background(175);
  currentLevel.drawLevelFrame(currentFrame);
  currentFrame = (currentFrame + 1) % frames;
  currentLevel.checkWin();
  }
}

void keyPressed() {
  if (key != ESC && acting == false) {
    currentLevel.act(true);
  }
  
}

void keyReleased() {
  if (key != ESC && acting == false) {
    currentLevel.act(false);
  }
}