class Food {

  int x;
  int y;

  Food() {
    do {
      x = (int)random(0, 20);
      y = (int)random(0, 20);
    }while (x == 21 || y == 21 || !uniqueCoords());
  }
  
  boolean uniqueCoords(){
    for(int i = 0; i < player.snakeLength; i+=1){
      for(int j = 0; j < player.snakeLength; j+=1){
        if(player.pastX[i] == x && y == player.pastY[j]){
          return false;
        }
      }
    }
    return true;
  }
  
  void show(){
    fill(0,0,255);
    rect(x*gameWidth/20, y*gameHeight/20, gameWidth/20, gameHeight/20);
  }
  
}