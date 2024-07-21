/*
 * Functions relate to the STATE_INTRO state.
 */ 
float backgroundCol; 

boolean play = false;


void restart_Game(){
 println("Game state : INTRO");

 gameState = STATE_INTRO;
 setup_Intro();
  
}
/**
 * Convinent STATE_INTRO variables setting
 */
 
void setup_Intro() {
  // There is no variables that needs to be initialise (life remain/ timing..)in the setup
  backgroundCol = 0;
}


/**
 * Draws when player in INTRO_STATE
 */
void draw_Intro(){
  
  
  background(backgroundCol); 
  backgroundCol+=3;
  
  textAlign(CENTER);    // [ Typography - Processing ]
  textSize(40);
  fill(10);
  text("ARE YOU HUNGRY ?", width/2, height/2);
  
  if(backgroundCol == 255){
  play = true;
  }
  if(play){
  fill(255, 0, 0);
  text(" Press ENTER to eat ",width/2, height/2+50); 
  
  
  }
  
}

/**
 * Key press detection in INTRO state
 */
 
 void keyPressed_Intro() {
   
   if(keyCode  == ENTER){
    backgroundCol ++;
    // press 'ENTER' to enter STATE_MainGame
    gameBegin();
    println("Game state : INTRO");
    
   }
   
}
