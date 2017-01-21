 class Level{
  AgentNeptune agentNeptune = new AgentNeptune();
  Bouncer bouncer = new Bouncer(1280);
  LevelStatus status;
  ArrayList<Character> characters = new ArrayList<Character>();
  Level(){
    status = LevelStatus.IN_PROGRESS;
    characters.add(agentNeptune);
    characters.add(bouncer);
  }
  
  AgentNeptune getAgent(){
    return agentNeptune;
  }
  
  ArrayList<Character> getCharacters(){
    return characters;
  }
  
  
  LevelStatus getLevelStatus(){
    return status;
  }
   
}