class Player{
  
  int score;
  float x;
  float y;
  float ySpeed;
  float playerWidth;
  float playerHeight;
  
  
  Player(int x, int y){
    this.x = x;
    this.y = y;
    score = 0;
    playerWidth = 20;
    playerHeight = 75;
    ySpeed = 0;
  }
  
  void show(int x, int y, int z){
    fill(x, y, z);
    rectMode(CENTER);
    rect(this.x, this.y, playerWidth, playerHeight);
  }
  
  void update(){
    y+=ySpeed;
  }
}