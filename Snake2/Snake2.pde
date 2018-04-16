int gameWidth = 600;
int gameHeight = 600;
float difficulty = 0.3;
Snake player;
Food food;
boolean gameOver = false;


void setup() {
  size(600, 600);
  player = new Snake();
  food = new Food();
  PFont f = createFont("Arial", 16, true);
  textFont(f, 32);
}

void draw() {
  if (!gameOver) {
    background(0);
    drawGrid();
    food.show();
    player.move();
    if (player.foundFood()) {
      player.eatFood();
      player.printSnakeCoords();
    }
    player.show();
    if (player.collideWithWall() || (player.collideWithSelf() && !player.justAte)) {
      gameOver = true;
      fill(255, 0, 0);
      text("Game Over", width/2.7, height/2);
    }
  }
}

void drawGrid() {
  stroke(100);
  for (int i = 0; i < width; i+=width/20) {
    line(i, 0, i, height);
  }
  for (int i = 0; i < height; i+=height/20) {
    line(0, i, width, i);
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    player.xSpeed = 0;
    player.ySpeed = -difficulty;
  } else if (key == 's' || key == 'S') {
    player.xSpeed = 0;
    player.ySpeed = difficulty;
  } else if (key == 'a' || key == 'A') {
    player.xSpeed = -difficulty;
    player.ySpeed = 0;
  } else if (key == 'd' || key == 'D') {
    player.xSpeed = difficulty;
    player.ySpeed = 0;
  } else if (key == 'r' || key == 'R') {
    gameOver = false;
    player = new Snake();
    food = new Food();
  }
}