/*
 * Functions relate to the STATE_END state.
 */
PImage fatty;
PImage skinny;

/*
 * Setting up for the game Ending
 */
 void endGame(){
   cereals.clear();
   
   gameState = STATE_END;
   println("Game state : END");
   setup_End();
 }
 
/**
 * Convienent STATE_END variables setting
 */
void setup_End(){
 // [ Finish calculating game score/life left/time ] 
 fatty = loadImage("fatty.png");
 skinny = loadImage("skinny.png");
 
 if(score>highScore){
   highScore = max(highScore, score);
   String[] highScoreSaving = new String[1];
   highScoreSaving[0] = Integer.toString(highScore);
   saveStrings("data/highScore.txt", highScoreSaving);
 }
}

/*
 * Sketch the End state
 */
void draw_End(){
  background(87);  // TODO ; change to a PImage
  
  if(score>=highScore)
  {
  image(fatty, width/2, height/2, width/2, height/2);
  fill(255);
  textSize(47);
  text("Congrats! Now you are over-weight ;)", width/2, height/2);
  }
  else 
  {
    image(skinny, width/2, height/2);
    fill(255);
    textSize(47);
    text("Oops, seems like you are still hungry", width/2-30, height/2-50);
  }
  
  fill(255, 255, 0);  // yellow color for score showing
  textSize(38);
  text("Highest  Eating  Record:" , width/2-21, height-28);
  text(highScore, width/2+189, height-26);
  
  fill(255,0,0);
  textSize(35);
  text("Press 'BackSpace' to restart", width/2+-1, height-71);
}


/**
 *
 */
void keyPressed_End() {
  // TODO; create an interaction pad to press in order to enter intro_state
  if(keyCode  == BACKSPACE){
    // press 'BACKSPACE' to enter STATE_INTRO
    restart_Game();
    println("RESTART !");
    
   }
}


  
