import ddf.minim.*; //<>//
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Level currentLevel;
CreditsLevel credits;
GameLevel3 levelThree;
GameLevel2 levelTwo;
GameLevel levelOne;
TitleLevel title;
AgentNeptune agentNeptune;
int currentFrame = 0;
static boolean acting = false;
private LevelStatus currentStatus;
Minim minim;
static AudioPlayer audioPlayer;
AudioPlayer musicBox;
static PImage insideBg1;
static PImage insideBg2;
static PImage insideBg3;

int frames = 40;

void setup() {
  size(1280, 800);
  background(175);

  insideBg1 = loadImage("background1.png");
  insideBg2 = loadImage("background2.png");
  insideBg3 = loadImage("background3.png");
  credits = new CreditsLevel(height,width,null);
  levelThree= new GameLevel3(height, width, credits);
  levelTwo = new GameLevel2(height, width, levelThree);
  levelOne = new GameLevel(height, width, levelTwo);
  Level cutSceneOne = new CutSceneLevel(height, width, levelOne);
  title = new TitleLevel(height, width, cutSceneOne);
  currentLevel = title;
  currentStatus = title.getLevelStatus();
  frameRate(frames);
  minim = new Minim(this);
  audioPlayer = minim.loadFile("Collision.mp3");
  musicBox = minim.loadFile("CrestingWave.mp3");
  musicBox.loop();
  fill(230);
  textSize(32);
}

void draw() {


  if (currentLevel != null) {
    if (currentLevel.getLevelStatus() == LevelStatus.IN_PROGRESS) {
      currentLevel.drawLevelFrame(currentFrame);
      currentFrame = (currentFrame + 1) % frames;
    }

    currentStatus = currentLevel.checkWin();

    if (currentStatus == LevelStatus.WIN) {
      currentLevel = currentLevel.getNextLevel();
    } else if (currentStatus == LevelStatus.LOSE) {
      delay(1000);
      currentLevel.restart();
    }
  }
}

void keyPressed() {


  if (currentLevel != null) {
    if (currentLevel.getLevelStatus() == LevelStatus.IN_PROGRESS && !currentLevel.isCanRun()) {
      currentLevel.startLevel();
    } else if (key != ESC && acting == false) {
      currentLevel.act(true);
    }
  }
}

void keyReleased() {
  if (key != ESC && acting == false && currentLevel != null) {
    currentLevel.act(false);
  }
}