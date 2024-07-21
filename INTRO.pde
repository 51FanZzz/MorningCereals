/*
 * Functions relate to the STATE_INTRO state.
 */ 
float backgroundCol;  // convinence variable to control background color

boolean play = false; // boolean variable to control "Press Enter to eat" subtitle


void restart_Game(){
 println("Game state : INTRO");

 gameState = STATE_INTRO;
 setup_Intro();
  
}
/**
 * Convinent STATE_INTRO variables setting
 */
 
void setup_Intro() {
  // There is no variables that needs to be initialise in the setup
}


/**
 * Draws when player enter INTRO_STATE
 */
void draw_Intro(){
  
  
  background(backgroundCol); 
  backgroundCol+=3;  // color slowly turns white
  
  textAlign(CENTER);    
  textSize(40);
  fill(10);
  text("ARE YOU HUNGRY ?", width/2, height/2);
  
  if(backgroundCol == 255)   // when background is white, shows pressing hint
  {
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
   
   if(keyCode  == ENTER){       // press 'ENTER' to enter STATE_MainGame
    backgroundCol ++;
    gameBegin();
    println("Game state : INTRO");
    
   }
   
}
