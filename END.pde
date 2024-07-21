/*
 * Functions relate to the STATE_END state.
 */
PImage fatty;  // appeared when player beats highest record
PImage skinny; // appeared when player did not beat highest record

/*
 * Setting up for the game Ending
 */
 void endGame(){
   
   cereals.clear();  // clear up generated cereals
   
   gameState = STATE_END;   //enter End game state
   println("Game state : END");
   setup_End();
   
 }
 
/**
 * Convienent STATE_END variables setting
 */
void setup_End(){
  
 fatty = loadImage("fatty.png");
 skinny = loadImage("skinny.png");
 
  // Finish calculating game score and keep highest score record
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
  background(87);  // GREY color
  
  if(score>=highScore)  // if players beat the highest record, showing "fatty" image
  {
  image(fatty, width/2, height/2, width/3, height-260);
  fill(255);
  textSize(47);
  text("Congrats! Now you are over-weight ;)", width/2, height/2);
  }
  else 
  {
    image(skinny, width/2, height/2);   // if players did not beat the highest record, showing "skinny" image
    fill(255);
    textSize(47);
    text("Oops, seems like you are still hungry", width/2-30, height/2-50);
  }
  
  fill(255, 255, 0);  // yellow color for score showing
  textSize(38);
  text("Highest  Eating  Record:" , width/2-24, height-28);
  text(highScore, width/2+189, height-26);
  
  fill(255,0,0);    // red color for showing restart title
  textSize(35);
  text("Press 'BackSpace' to restart", width/2-1, height-71);
}


/**
 *
 */
void keyPressed_End() {
  if(keyCode  == BACKSPACE){   // press 'BACKSPACE' to enter STATE_INTRO
  
    backgroundCol = 0;   // reset everything and enter INTRO state again
    play = false;
    restart_Game();
    println("RESTART !");
    
   }
}


  
