class Cereal {
  float x, y;  // x and y coordinates of the cereal
  float dx, dy;  // horizontal and vertical movements of the cereal
  float d;   //diameter of the cereal 

  PImage cerealImg;  // cereal image loading

  Cereal() {
    
    cerealImg = loadImage("data/cereal.png");

    x = random(width/2, width-100);
    y = random(d*2, height-(d*2) );
    dx = random(-10);
    dy = random(-6);
    d = 50;
    
  }

  void update() {
    x += dx;  // moving the cereal
    y += dy;

    if ( x+d/2 >= width-1   ) 
    {  // if cereals hit right wall: life-1
      life = life - 1;
      println("Oops!!"); 
    }
    if (x-d/2 <= 0) {  // if cereals hit left wall: score+1
      score += 1;
    }
    if ((y+d/2 >= height-1) && (dy > 0) ) {   // if cereals hit top or bottom walls: bounce back
      dy *=-1;
    }
    if ( (y-d/2 <= 0) && (dy < 0)  ) {
      dy *=-1;
    }
  }

  void render() {
    imageMode(CENTER);
    
    pushMatrix();  
    
    translate(x, y);  // reset (x, y) coordinates as (0, 0)
    float angle = atan2(dy, dx);  // cereals image rotate at a certain angle depending on dy and dx
    rotate(angle);
    image(cerealImg, 0, 0, d, d);
    
    popMatrix();   
  }

  void bounce(Paddles _paddle) {

    if ( this.x+this.d/2 > _paddle.xp   //hits left side of the paddle, bounce back with a different angle
      && this.y          > _paddle.yp
      && this.y          < _paddle.yp+_paddle.hei
      && this.dx         >=0)
    {
      this.dx *= -1;
      this.dy *= -3/2;
    }
    
    if( this.x  >  _paddle.xp       //if hit top, bounce back with a different angle
     && this.x  <  _paddle.xp + _paddle.wid
     && this.y  == _paddle.yp
     && this.dy >  0)
    {
      this.dx *= -1;
      this.dy *= -3/2;
    }

    if( this.x    > _paddle.xp      //if hit bottom plate, bounce back with a different angle
     && this.x    < _paddle.xp + _paddle.wid
     && this.y   == _paddle.yp + _paddle.hei
     && this.dy   < 0 )
    {
      this.dx *= -1;
      this.dy *= -3/2;
    }

  }
  

    // check whether the cereal has touched right wall
  boolean hasLeftScreen()
  {
    return(x+d/2 >= width-1);
  }
  
    // check whether the cereal has touched left wall
  boolean hasEaten()
  {
    return( x-d/2 <= 0 );
  }
  
  
  
  
}
