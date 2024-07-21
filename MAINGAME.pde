/*
 * Functions relate to the STATE_MAINGAME state.
 */
 
Paddles paddle;
Rocks rock;
ArrayList<Cereal> cereals;

int FRAME_RATE = 60;  //in frames. 60 frames = 1 second

int life = 5;    // initially 5 lives

/**
 * Setting up for the cereal throwing part
 */
 
 void gameBegin() {
   println("Game state : MAINGAME");

   gameState = STATE_MAINGAME;
   setup_Game();
 }
 
 
/**
 * Convinent STATE_GAME variables setting
*/
 void setup_Game(){
   score = 0;
   
   cereals = new ArrayList<Cereal>();
   cereals.add(new Cereal() );
   paddle = new Paddles();
   rock = new Rocks();

 }
 
/**
 * 
 */
void draw_MainGame(){
  
  background(255);  
  // TODO- change to a livingroon environment
  
  for( int i = 0; i < cereals.size() ; i ++)
  {
    Cereal cereal = cereals.get(i);
    cereal.render(); 
  }
  
  paddle.render();
  
  for( int i = 0; i < cereals.size() ; i++)
  {
    Cereal cereal = cereals.get(i);
    cereal.update();
    if(cereal.hasLeftScreen() || cereal.hasEaten() ){
      cereals.remove(i);
      i--;     // if cereals left right/left side of screen, remove from the arrayList
    }
    if( cereal.crashed(rock) ){
      cereal.dx *= -1;
      cereal.dy *= -1;
      cereal.dx = (cereal.dx+rock.dx)/2;
    }
  }
  
  if( frameCount % (FRAME_RATE/3) == 0 ){    // spawn a new cereal every 1/3 second
    cereals.add(new Cereal() );
  }
  
  paddle.update();
  rock.launched();
  
  for(int i=0; i < cereals.size() ; i++){
    Cereal cereal = cereals.get(i);
    cereal.bounce(paddle);
  }
  
  
  
  fill(255, 0, 0);
  textSize(20);
  text("Life Remained :", width/2, 70);
  text(life, width/2+130, 70);
  text("Cereals eaten :", width/2, 90);
  text(score, width/2+130, 90);
  
  // if the player died too much, game ends
  if ( life == 0)  
 { 
   score = 0;   // reset score and enter End gameState
   life = 5;    // reset life remaining
   gameState = STATE_END;  
   endGame(); }
  
}



/**
 *
 */
void keyPressed_MainGame(){
  // Nothing to do here
}
