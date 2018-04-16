class Ball {

  float x;
  float xSpeed;
  float y;
  float ySpeed;
  boolean inPlay;
  float diameter;

  Ball() {
    x = width/2;
    y = height/2;
    inPlay = false;
    xSpeed = 0;
    ySpeed = 0;
    diameter = 25;
  }

  void update() {
    if (inPlay) {
      x+=xSpeed;
      y+=ySpeed;
    }
  }

  void show() {
    fill(0,0,255);
    ellipseMode(CENTER);
    ellipse(this.x, this.y, diameter, diameter);
  }
  
  void bounce(){
    if(ySpeed < 0 && y - (diameter/2) < 0){
      ySpeed*=-1;
    }
    else if(ySpeed > 0 && y + (diameter/2) > height){
      ySpeed*=-1;
    }
  }
}