GameLevel currentLevel;
GameLevel levelOne;
AgentNeptune agentNeptune;
//Bouncer bouncer;

void setup(){
  size(1280, 800);
  background(175);
  levelOne = new GameLevel(height, width);
  currentLevel = levelOne;
  agentNeptune = currentLevel.getAgent();
  //bouncer = new Bouncer(width);
  frameRate(40);
}

void draw(){
 // agentNeptune.move(height);
  background(175);
  handleCharacters(currentLevel.getCharacters());
  
}


void handleCharacters(ArrayList<Character> characters){
  
  for(Character character : characters){
    character.move(height);
    character.drawMe();
  }
}

void keyPressed(){
  if(key != ESC){
    agentNeptune.act(true);
  }
}

void keyReleased(){
   if(key != ESC){
    agentNeptune.act(false);
  }
}
/*void drawAgent(){
   rect(agentNeptune.getXPos(), agentNeptune.getYPos(), agentNeptune.getWidth(), agentNeptune.getHeight());
  }*/