int height  = 800;
int width = 1280;
Level currentLevel;
Level levelOne = new Level();
AgentNeptune agentNeptune;
Bouncer bouncer;

void setup(){
  size(1280, 800);
  background(175);
  currentLevel = levelOne;
  agentNeptune = currentLevel.getAgent();
  bouncer = new Bouncer(width);
}

void draw(){
  //println("before " + agentNeptune.getYPos());
  agentNeptune.move(height);
   // println("after " + agentNeptune.getYPos());
  background(175);
  drawCharacters(currentLevel.getCharacters());
 
//println(agentNeptune.getYPos());
  //drawAgent();
  //rect(bouncer.getXPos(), bouncer.getYPos(), bouncer.getWidth(), bouncer.getHeight());
  
}

void drawCharacters(ArrayList<Character> characters){
  
  for(Character character : characters){
    rect(character.getXPos(), character.getYPos(), character.getWidth(), character.getHeight());
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
void drawAgent(){
   rect(agentNeptune.getXPos(), agentNeptune.getYPos(), agentNeptune.getWidth(), agentNeptune.getHeight());
  }