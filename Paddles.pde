class Paddles {
  float xp, yp;
  float wid, hei;   //paddle
  


  Paddles()
  {

    xp = width-70;
    yp = height-200;

    wid = 20;
    hei = 130;
    

  }

  void render() {
    fill(0, 0, 255);
    rect(xp, yp, wid, hei);

  }

  void update() {
    yp = mouseY;
  }
}
