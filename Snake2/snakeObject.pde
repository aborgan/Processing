class Snake{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  int pastX[] = new int[401];
  int pastY[] = new int[401];
  int snakeLength;
  boolean justAte;

  Snake() {
    x = 10;
    y = 10;
    xSpeed = difficulty;
    ySpeed = 0;
    snakeLength = 1;
    justAte = false;
  }

  void show() {
    fill(255);
    int drawX = (int)x;
    int drawY = (int)y;
    adjustSnake(drawX, drawY);
    for (int i = 0; i < snakeLength; i+=1) {
      rect(pastX[i]*gameWidth/20, pastY[i]*gameHeight/20, gameWidth/20, gameHeight/20);
    }
  }

  void adjustSnake(int drawX, int drawY) {
    if (drawX != pastX[0] || drawY != pastY[0]) {
      for (int i = snakeLength-1; i > 0; i-=1) {
        pastX[i] = pastX[i-1];
        pastY[i] = pastY[i-1];
      }
      pastX[0] = drawX;
      pastY[0] = drawY;
      justAte = false;
    }
  }

  void move() {
    x+=xSpeed;
    y+=ySpeed;
  }
  
  boolean foundFood(){
    if(food.x == this.pastX[0] && food.y == this.pastY[0]){
      return true;
    }
    return false;
  }
  
  void eatFood(){
    food = new Food();
    snakeLength+=1;
    justAte = true;
    pastX[snakeLength-1] = pastX[0];
    pastY[snakeLength-1] = pastY[0];
  }
  
  void printSnakeCoords(){
    println("snake Coords:");  
    for(int i = 0; i < snakeLength; i+=1){
        println("x: " + pastX[i] + " y: " + pastY[i]);
      }
  }
  
  boolean collideWithSelf(){
    for(int i = 1; i < snakeLength; i+=1){
      if(pastX[0] == pastX[i] && pastY[0] == pastY[i]){
        return true;
      }
    }
    return false;
  }
  
  boolean collideWithWall(){
    if(pastX[0] >= gameWidth/30 || pastX[0] < 0 || pastY[0] < 0 || pastY[0] >= gameHeight/30){
      return true;
    }
    return false;
  }
}