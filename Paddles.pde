class Paddles {
  float xp, yp;   // x and y coordinates of the paddle
  float wid, hei;   // the width and height of the paddle

  Paddles()
  {
    xp = width-70;
    yp = height-200;

    wid = 20;
    hei = 130;
  }

  void render() {
    fill(0, 0, 255);  // blue color
    rect(xp, yp, wid, hei);
  }

  void update() {
    yp = mouseY;  // keep the paddle follow mouse y coordinate
  }
  
}
