class GameLevel extends Level {
  ArrayList<Character> characters = new ArrayList<Character>();
  private AgentNeptune agentNeptune;
  private Bouncer bouncer;


  GameLevel(int screenHeight, int screenWidth, Level nextLevel) {
    super(screenHeight, screenWidth, nextLevel);
    PImage bg1 = loadImage("background1.png");
    PImage bg2 = loadImage("background2.png");
    PImage bg3 = loadImage("background3.png");
    agentNeptune = new AgentNeptune();
    bouncer = new Bouncer(levelWidth);
    characters.add(agentNeptune);
    characters.add(bouncer);
    background.add(bg1);
    background.add(bg2);
    background.add(bg3);
    canRun = false;
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
  }




  private void handleCharacters() {

    for (Character character : characters) {
      character.move(levelHeight, levelWidth);
      character.drawMe();
    }
  }

  void act(boolean keyPress) {
    if(canRun){
    for (Character character : characters) {
      character.act(keyPress);
    }
    }
  }

  LevelStatus checkWin() {

    if (agentNeptune.isHasActed() && (agentNeptune.getXPos() + agentNeptune.getWidth()) >= bouncer.getXPos()) {
      if ((agentNeptune.getYCenter() > bouncer.getYPos()) && (agentNeptune.getYCenter() < bouncer.getYPos() + bouncer.getHeight())) {
        println("WINNER WINNER WOW !!!!!!!! WINNER !!!!!!!! WOW.");
        status = LevelStatus.WIN;
      } else {
        println("LOSER LOSER WOE !!!!!!!!! LOSER !!!!!!! WOE.");
        status = LevelStatus.LOSE;
      }
    }
    
      return status;
  }
}