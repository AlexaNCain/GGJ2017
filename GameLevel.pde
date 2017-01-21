class GameLevel extends Level {
  ArrayList<Character> characters = new ArrayList<Character>();
  private AgentNeptune agentNeptune;
  private Bouncer bouncer;
  private ArrayList<PImage> background = new ArrayList<PImage>();

  private int currentFrame = 0;


  GameLevel(int screenHeight, int screenWidth) {
    super(screenHeight, screenWidth);
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

  private void handleBackground(int frameNumber) {
    background(background.get(currentFrame));
    if (frameNumber % 10 == 0 ) {    
      currentFrame=(currentFrame + 1) % background.size();
    }
  }

  private void handleCharacters() {

    for (Character character : characters) {
      character.move(levelHeight);
      character.drawMe();
    }
  }

  void act(boolean keyPress) {
    for (Character character : characters) {
      character.act(keyPress);
    }

    if (agentNeptune.getYCenter() > bouncer.getYPos() && agentNeptune.getYCenter() < bouncer.getYPos() + bouncer.getHeight()) {
      println("WINNER WINNER WOW !!!!!!!! WINNER !!!!!!!! WOW.");
    } else {
      println("LOSER LOSER WOE !!!!!!!!! LOSER !!!!!!! WOE.");
    }
  }
}