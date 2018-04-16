Player player1;
Player player2;
Ball ball;

void setup() {
  size(640, 360);
  player1 = new Player(20, height/2);
  player2 = new Player(width-20, height/2);
  ball = new Ball();
}

void draw() {
  background(0);
  player1.show(148, 0, 211);
  player1.update();
  player2.show(255, 0, 0);
  player2.update();
  check();
  ball.show();
  ball.update();
  ball.bounce();
  playerBounce();
  goal();
}

void check() {
  if (player1.y - (player1.playerHeight/2) < 0) {
    player1.ySpeed = 0;
  } else if (player1.y + (player1.playerHeight/2) > height) {
    player1.ySpeed = 0;
  }
  if (player2.y - (player2.playerHeight/2) < 0) {
    player2.ySpeed = 0;
  } else if (player2.y + (player2.playerHeight/2) > height) {
    player2.ySpeed = 0;
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    if (player1.y - (player1.playerHeight/2) > 0) {
      player1.ySpeed = -3;
    }
  }
  if (key == 's' || key == 'S') {
    if (player1.y + (player1.playerHeight/2) < height) {
      player1.ySpeed = 3;
    }
  }
  if (key == 'k' || key == 'K') {
    if (player2.y + (player2.playerHeight/2) < height) {
      player2.ySpeed = 3;
    }
  }
  if (key == 'i' || key == 'I') {
    if (player2.y - (player2.playerHeight/2) > 0) {
      player2.ySpeed = -3;
    }
  }
  
  if(key == 'v' || key == 'V'){
    println("Player 1's score is: " + player1.score);
    println("Player 2's score is: " + player2.score);
    if(player1.score > player2.score){
      println("Player 1 is winning");
    }
    else if(player1.score < player2.score){
      println("Player 2 is winning");
    }
    else{
      println("Game is tied");
    }
  }
  if(key == 'r' || key == 'R'){
    println("score is reset");
    player1.score = 0;
    player2.score = 0;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    player1.ySpeed = 0;
  }
  if (key == 's' || key == 'S') {
    player1.ySpeed = 0;
  }
  if (key == 'k' || key == 'K') {
    player2.ySpeed = 0;
  }
  if (key == 'i' || key == 'I') {
    player2.ySpeed = 0;
  }
}

void mousePressed() {
  ball.inPlay = true;
  float start = random(-1, 1);
  if (start <= 0) {
    ball.xSpeed = 3 * -1;
  } else {
    ball.xSpeed = 3;
  }
  start = random(-1, 1);
  if (start <= 0) {
    ball.ySpeed = 3 * -1;
  } else {
    ball.ySpeed = -3;
  }
}

void goal() {
  if (ball.x < 0) {
    ball = new Ball();
    player2.score+=1;
    println("player 2's score is:" + player2.score);
  } else if (ball.x > width) {
    ball = new Ball();
    player1.score+=1;
    println("player 1's score is:" + player1.score);
  }
}

void playerBounce() {
  if (ball.x < (20+player1.playerWidth)) {
    if (ball.y-(ball.diameter/2) < (player1.y + (player1.playerHeight/2)) && (ball.y+(ball.diameter/2) > (player1.y - (player1.playerHeight/2)))) {
      ball.xSpeed*=-1;
      ball.xSpeed+=1;
    }
  } else if (ball.x > (width-20-player2.playerWidth)) {
    if (ball.y-(ball.diameter/2) < (player2.y + (player2.playerHeight/2)) && (ball.y+(ball.diameter/2) > (player2.y - (player2.playerHeight/2)))) {
      ball.xSpeed*=-1;
      ball.xSpeed-=1;
    }
  }
}