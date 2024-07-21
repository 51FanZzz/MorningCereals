/*
 * Functions relate to the STATE_MAINGAME state.
 */
 
Paddles paddle;
Rocks rock;
ArrayList<Cereal> cereals;

int FRAME_RATE = 60;  //in frames. 60 frames = 1 second
int life = 5;    // initially 5 lives

PImage youImg;  // image of "you" to better visualize the "eating"

SoundFile sndBer;
SoundFile sndOps;

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
 void setup_Game(){    // initialize global variables, objects, images and sound
   score = 0;   
   
   cereals = new ArrayList<Cereal>();
   cereals.add(new Cereal() );
   paddle = new Paddles();
   rock = new Rocks();
   
   youImg = loadImage("you.png");
   
   sndBer = new SoundFile(this, "ber.wav");
   sndOps = new SoundFile(this, "ops.wav");

 }
 
/**
 * 
 */
void draw_MainGame(){
  
  background(255);

  for( int i = 0; i < cereals.size() ; i ++)
  {
    Cereal cereal = cereals.get(i);   // render each cereals
    cereal.render(); 
  }
  
  paddle.render();
  
  for( int i = 0; i < cereals.size() ; i++)
  {
    Cereal cereal = cereals.get(i);   // update each cereals, making them to move and interact
    cereal.update();
    
    if(cereal.hasLeftScreen() )
    {
      sndOps.play();   // when goes outside right wall, play the sound
      cereals.remove(i);
      i--;     // if cereals left right/left side of screen, remove from the arrayList
    }
    
    if(cereal.hasEaten() )
    {
     sndBer.play();   // when eaten, play the sound and remove it from ArrayList
     cereals.remove(i);
     i--;
    }
    
    if(   cereal.x + cereal.d/2 > rock.x - rock.d/2   // crash to the left of cereal
      &&  cereal.x - cereal.d/2 < rock.x + rock.d/2   // crash to the right of cereal
      &&  cereal.y + cereal.d/2 > rock.y - rock.d/2   // crash to the top of cereal
      &&  cereal.y - cereal.d/2 < rock.y + rock.d/2   // crash to the bottom of cereal
      &&  cereal.dx             <0                  )
    {                    
      cereal.dx *= -1;    // if cereals crashed with rocks, bounce back with average horizontal velocity
      cereal.dy *= -1;
      cereal.dx = (cereal.dx+rock.dx)/2;
    }
    
    
  }
  
  if( frameCount % (FRAME_RATE/3) == 0 ){    // spawn a new cereal automatically every 1/3 second
    cereals.add(new Cereal() );
  }
  
  paddle.update();  // generate the paddle
  rock.launched();  // generate the rock
  
  for(int i=0; i < cereals.size() ; i++){
    Cereal cereal = cereals.get(i);
    cereal.bounce(paddle);   // cereals bouncing detection
  }
  
  image(youImg, 50, 520, width/2, height);   // load "you" character on the left screen
  
  fill(255, 0, 0);
  textSize(20);
  text("Life Remained :", width/2, 70);   // generate the subtitles on the top right screen
  text(life, width/2+130, 70);
  text("Cereals eaten :", width/2, 90);
  text(score, width/2+130, 90);
  
  // if the player died too much, game ends
  if ( life == 0)  
 { 
   life = 5;    // reset life remaining
   
   gameState = STATE_END;   // enter End state
   endGame(); 
 }
}
 

/**
 *
 */
void keyPressed_MainGame(){
  // Nothing to do here
}
