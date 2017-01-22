class GameLevel3 extends Level {
  ArrayList<Character> characters = new ArrayList<Character>();
  private AgentNeptune agentNeptune;
  private AgentBouncer bouncer;
  private String bouncerText;
  private String bouncerText2;
  private int loseCount;
  private boolean canWin = false;
  private int bouncerTextX;
  private int bouncerTextY;


  GameLevel3(int screenHeight, int screenWidth, Level nextLevel) {
    super(screenHeight, screenWidth, nextLevel);
    PImage bg1 = Waves.insideBg1;
    PImage bg2 = Waves.insideBg2;
    PImage bg3 = Waves.insideBg3;
    bouncerText = "";
    bouncerText2 = "";
    loseCount = 0;
    background.add(bg1);
    background.add(bg2);
    background.add(bg3);
    restart();
  }

  void restart() {
    characters = new ArrayList<Character>();
    agentNeptune = new AgentNeptune(15);
    bouncer = new AgentBouncer(levelWidth, 35, true);
    characters.add(agentNeptune);
    characters.add(bouncer);
    bouncerTextX =bouncer.getXPos();
    bouncerTextY = bouncer.getYPos();
    canRun = false;
    status = LevelStatus.IN_PROGRESS;
  }

  ArrayList<Character> getCharacters() {
    return characters;
  }

  AgentNeptune getAgent() {
    return agentNeptune;
  }

  void drawLevelFrame(int frameNumber) {

    handleBackground(frameNumber);
    handleCharacters();

    text(bouncerText, bouncerTextX - 350, (bouncerTextY - 65));
    text(bouncerText2, bouncerTextX - 350, (bouncerTextY - 25));
  }

  private void handleCharacters() {

    for (Character character : characters) {
      if (!canWin) {
        character.move(levelHeight, levelWidth);
      }
      character.drawMe();
    }
  }

  void act(boolean keyPress) {
    if (canRun) {

      if (canWin) {
        status = LevelStatus.WIN;
      } else {
        bouncerText = "";
        bouncerText2 = "";
        for (Character character : characters) {
          character.act(keyPress);
        }
      }
    }
  }

  LevelStatus checkWin() {

    if (agentNeptune.isHasActed() && (agentNeptune.getXPos() + agentNeptune.getWidth()) >= bouncer.getXPos()) {
      if ((agentNeptune.getYCenter() > bouncer.getYPos()) && (agentNeptune.getYCenter() < bouncer.getYPos() + bouncer.getHeight())) {
        println("WINNER WINNER WOW !!!!!!!! WINNER !!!!!!!! WOW.");
        bouncerText = "You may learn our secrets,";
        bouncerText2 = "Fellow Order Member";
        canWin = true;
        //  status = LevelStatus.WIN;
        Waves.audioPlayer.play();
      } else {
        println("LOSER LOSER WOE !!!!!!!!! LOSER !!!!!!! WOE.");
        status = LevelStatus.LOSE;
        loseCount += 1;
       // bouncerText = "Let's pretend that didn't happen...";
        if (loseCount > 1) {
        //  bouncerText2 = "Again.";
        }
      }
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