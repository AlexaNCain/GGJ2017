 class Level{
  private AgentNeptune agentNeptune = new AgentNeptune();
  private Bouncer bouncer = new Bouncer(1280);
  private LevelStatus status;
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