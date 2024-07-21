class Cereal {
  float x, y;
  float dx, dy;
  float d;   //circle 

  PImage cerealImg;

  Cereal() {
    
    cerealImg = loadImage("data/cereal.png");

    //x = 100;
    x = random(width/2, width-100);
    y = random(d*2, height-(d*2) );
    dx = random(-10);
    dy = random(-6);
    d = 50;
    
  }

  void update() {
    x += dx;
    y += dy;

    if ( x+d/2 >= width-1   ) {
      life = life - 1;
      fill(255, 0, 0);
      text("Oops!!", x-50, y); 
    }
    if (x-d/2 <= 0) {
      dx *=-1;
      score += 1;
    }
    if ((y+d/2 >= height-1) && (dy > 0) ) {
      dy *=-1;
    }
    if ( (y-d/2 <= 0) && (dy < 0)  ) {
      dy *=-1;
    }
  }

  void render() {
    imageMode(CENTER);
    
    pushMatrix();
    translate(x, y);
    
    float angle = atan2(dy, dx);
    
    rotate(angle);
    image(cerealImg, 0, 0, d, d);
    popMatrix();
  }

  void bounce(Paddles _paddle) {

    //hits left paddle, bounce back with a different angle
    if ( this.x+this.d/2 > _paddle.xp
      && this.y          > _paddle.yp
      && this.y          < _paddle.yp+_paddle.hei
      && this.dx         >=0)
    {
      this.dx *= -1;
      this.dy *= -3/2;
    }
    
    //if hit top, bounce back with a different angle
    if( this.x  > _paddle.xp
     && this.x  < _paddle.xp + _paddle.wid
     && this.y  == _paddle.yp
     && this.dy > 0)
    {
      this.dx *= -1;
      this.dy *= -3/2;
    }

    //if hit bottom plate, bounce back with a different angle
    if( this.x    > _paddle.xp
     && this.x    < _paddle.xp + _paddle.wid
     && this.y   == _paddle.yp + _paddle.hei
     && this.dy  < 0 )
    {
      this.dx *= -1;
      this.dy *= -3/2;
    }

  }
  
    // crash detection 
  boolean crashed(Rocks _rock){
    return( this.x + this.d/2 > _rock.x - _rock.d/2   // crash to the left of cereal
    &&  this.x - this.d/2 < _rock.x + _rock.d/2   // crash to the right of cereal
    &&  this.y + this.d/2 > _rock.y - _rock.d/2   // crash to the top of cereal
    &&  this.y - this.d/2 < _rock.y + _rock.d/2   // crash to the bottom of cereal
    &&  this.dx <0 );
  }
  
  
  boolean hasLeftScreen()
  {
    return(x+d/2 >= width-1);
  }
  
  boolean hasEaten()
  {
    return( x-d/2 <= 0 );
  }
  
  
  
  
} // [[[ End Of Class ]]]
