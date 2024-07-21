/**
 *
 * [ Brief Game Intro ... ]
 *
 * @author Yifan Wu #mcg2299
 * @version 1.0 - 2022.4.30 : Created
 */
 
final int STATE_INTRO = 0;   // 'tell' / 'type' the introduction; 
final int STATE_MAINGAME = 1;    // Open eyes
final int STATE_END = 2;     // Go outside and Graduate 

// Global variables
int gameState;
int score, highScore;

void setup(){
 size(900, 900);
 
 backgroundCol = 0;
 
 String[] fileContent = loadStrings("highScore.txt");
 String firstLine = fileContent[0];
 highScore = Integer.parseInt(firstLine);
 
 switch(gameState){
  case STATE_INTRO :  setup_Intro(); break;
  case STATE_MAINGAME :  setup_Game(); break;
  case STATE_END : setup_End(); break;
   
   
 }
 // [ Any variables (game score/time...)that need to be reset ]
}

void draw() {
  switch (gameState) {
    case STATE_INTRO : draw_Intro(); break;
    case STATE_MAINGAME : draw_MainGame(); break;
    case STATE_END : draw_End(); break;
    
  }
}

void keyPressed(){
  switch( gameState ) {
    case STATE_INTRO : keyPressed_Intro();break;
    case STATE_MAINGAME :keyPressed_MainGame();break;
    case STATE_END : keyPressed_End(); break;
  }
}
