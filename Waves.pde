GameLevel currentLevel;
GameLevel levelOne;
AgentNeptune agentNeptune;
int currentFrame = 0;
static boolean acting = false;

//static PImage bg1;
//static PImage bg2;
//static PImage bg3;
int frames = 40;

void setup() {
  size(1280, 800);
  background(175);
  levelOne = new GameLevel(height, width);
  currentLevel = levelOne;
  agentNeptune = currentLevel.getAgent();
  frameRate(frames);
  //bg1 = loadImage("background1.png");
  //bg2 = loadImage("background2.png");
  //bg3 = loadImage("background3.png");
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
/*void drawAgent(){
 rect(agentNeptune.getXPos(), agentNeptune.getYPos(), agentNeptune.getWidth(), agentNeptune.getHeight());
 }*/