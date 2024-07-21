/**
 * "Let's Eat" is an interactive game.
 * You are very hungry in the morning, needing to eat as much as cereals for energy.
 * Watch out for the peddles !! Use the mouse to control the paddle and 
 * pop cereals in your mouth.
 * Have a feast !!
 *
 * This game is inspired by the classic game Brick Breaker.
 *
 * @author Yifan Wu #mcg2299
 * @version 1.0 - 2022.4.30 : Created
 */
 
final int STATE_INTRO = 0;   // 'tell' / 'type' the introduction; 
final int STATE_MAINGAME = 1;    // Open eyes
final int STATE_END = 2;     // Go outside and Graduate 

// Global variables
int gameState;         // use numbers to represent different game states
int score, highScore;  // variables to represent scores

import processing.sound.*;  // import the sound library to use audio file


void setup(){
 size(900, 900);
 
 backgroundCol = 0;  //initially background is black
 
 String[] fileContent = loadStrings("highScore.txt");  // high score keeping
 String firstLine = fileContent[0];
 highScore = Integer.parseInt(firstLine);
 
 switch(gameState){     // the control and siwitch over different game states' set up setting
  case STATE_INTRO    :  setup_Intro(); break;
  case STATE_MAINGAME :  setup_Game() ; break;
  case STATE_END      :  setup_End()  ; break;  
 }
 
 
}

void draw() {
  switch (gameState) {   // the control and switch over different game states' draw setting
    case STATE_INTRO   : draw_Intro()    ; break;
    case STATE_MAINGAME: draw_MainGame() ; break;
    case STATE_END     : draw_End()      ; break;
    
  }
}

void keyPressed(){
  switch( gameState ) {  // the control and switch over different game states' keyPressed setting
    case STATE_INTRO    : keyPressed_Intro()   ; break;
    case STATE_MAINGAME : keyPressed_MainGame(); break;
    case STATE_END      : keyPressed_End()     ; break;
  } 
}
