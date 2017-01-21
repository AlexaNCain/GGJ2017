class GameLevel extends Level{
    ArrayList<Character> characters = new ArrayList<Character>();
    private AgentNeptune agentNeptune;
    private Bouncer bouncer;

    GameLevel(int screenHeight, int screenWidth){
      super(screenHeight, screenWidth);
      agentNeptune = new AgentNeptune();
      bouncer = new Bouncer(levelWidth);
      characters.add(agentNeptune);
      characters.add(bouncer);
    }
    
   ArrayList<Character> getCharacters(){
      return characters;
    }
  
    AgentNeptune getAgent(){
      return agentNeptune;
    }
  
}