class Rocks{
 float x, y;  // x and y position of the rock
 float d;   // rock diameter
 float dx;  // horizontal velocity
 float acceleration;   
 
   Rocks()
   {
     x = 0;
     y = random(0, height);  // generate randomly on canvas
     d = 30;
     dx = 4;   // the initial speed = 4
     acceleration = 0.5;  // accelerate at the rate of 0.5
   }
  
  void launched(){
    fill(130);  // grey color
    ellipse(x, y, d, d);  
    
    x += dx;   // move the rock horizontally with acceleration
    dx += acceleration;  
    
    if( x > width + d ){   // reset position and speed when rock reaches far right of the screen
      x = 0;
      y = random(0, height);
      dx = 4;
    }
    
  }
 

}
