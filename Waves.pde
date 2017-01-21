GameLevel currentLevel;
GameLevel levelOne;
AgentNeptune agentNeptune;
int currentFrame = 0;

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
  background(175);
  currentLevel.drawLevelFrame(currentFrame);
  currentFrame = (currentFrame + 1) % frames;
}

void keyPressed() {
  if (key != ESC) {
    agentNeptune.act(true);
  }
}

void keyReleased() {
  if (key != ESC) {
    agentNeptune.act(false);
  }
}
/*void drawAgent(){
 rect(agentNeptune.getXPos(), agentNeptune.getYPos(), agentNeptune.getWidth(), agentNeptune.getHeight());
 }*/