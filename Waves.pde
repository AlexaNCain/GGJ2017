import ddf.minim.*; //<>//
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Level currentLevel;
GameLevel levelOne;
TitleLevel title;
AgentNeptune agentNeptune;
int currentFrame = 0;
static boolean acting = false;
private LevelStatus currentStatus;
Minim minim;
static AudioPlayer audioPlayer;
AudioPlayer musicBox;


int frames = 40;

void setup() {
  size(1280, 800);
  background(175);

  levelOne = new GameLevel(height, width, null);
  title = new TitleLevel(height, width, levelOne);
  currentLevel = title;
  currentStatus = title.getLevelStatus();
  frameRate(frames);
  minim = new Minim(this);
  audioPlayer = minim.loadFile("Collision.mp3");
  musicBox = minim.loadFile("CrestingWave.mp3");
  musicBox.loop();
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
      delay(2000);
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