Integer player1[][] = new Integer[7][6];
Integer player2[][] = new Integer[7][6];
Integer column[][] = new Integer[7][6];
boolean turn;


// Green = 0, 255, 127
// Orange = 255, 165, 0

void setup() {
  size(700, 600);
  background(153, 50, 204);
  fill(255);
  int x = 50, y = 50;
  for (int i = 0; i < 7; i+=1) {
    for (int j = 0; j < 6; j+=1) {
      player1[i][j] = 0;
      player2[i][j] = 0;
      column[i][j] = 0;
      ellipse(x, y, 80, 80);
      y+=100;
    }
    y = 50;
    x+=100;
  }
  turn = true;
}

void draw() {
  win();
}

void win() {
  for (int i = 0; i < 7; i+=1) {
    for (int j = 0; j < 6; j+=1) {
      if (i < 4) {
        if ((player1[i][j] == 1 && player1[i+1][j] == 1 && player1[i+2][j] == 1 && player1[i+3][j] == 1) || (player2[i][j] == 1 && player2[i+1][j] == 1 && player2[i+2][j] == 1 && player2[i+3][j] == 1)) {
          line(50+(i*100), 50+(j*100), 350+(i*100), 50+(j*100));
          end();
        }
      }
      if (j < 3) {
        if ((player1[i][j] == 1 && player1[i][j+1] == 1 && player1[i][j+2] == 1 && player1[i][j+3] == 1) || (player2[i][j] == 1 && player2[i][j+1] == 1 && player2[i][j+2] == 1 && player2[i][j+3] == 1)) {
          line(50+(i*100), 50+(j*100), 50+(i*100), 350+(j*100));
          end();
        }
      }
      if (i < 4 && j > 2) {
        if ((player1[i][j] == 1 && player1[i+1][j-1] == 1 && player1[i+2][j-2] == 1 && player1[i+3][j-3] == 1) || (player2[i][j] == 1 && player2[i+1][j-1] == 1 && player2[i+2][j-2] == 1 && player2[i+3][j-3] == 1)) {
          line(50+(i*100), 50+(j*100), (i*100)+350, (j*100)-250);
          end();
        }
      }
      if (i < 4 && j < 3){
        if((player1[i][j] == 1 && player1[i+1][j+1] == 1 && player1[i+2][j+2] == 1 && player1[i+3][j+3] == 1) || (player2[i][j] == 1 && player2[i+1][j+1] == 1 && player2[i+2][j+2] == 1 && player2[i+3][j+3] == 1)) {
          line(50+(i*100), 50+(j*100), (i*100)+350, (j*100)+350);
          end();
        }
      }
    }
  }
}

void end() {
  for (int i = 0; i < 7; i+=1) {
    for (int j = 0; j < 6; j+=1) {
      column[i][j] = 1;
    }
  }
}

void keyPressed() {
  setup();
}

void mousePressed() {
  if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < height) {
    if (validMove(0)) {
      makeMove(0);
    }
  } else if (mouseX > 100 && mouseX < 200 && mouseY > 0 && mouseY < height) {
    if (validMove(1)) {
      makeMove(1);
    }
  } else if (mouseX > 200 && mouseX < 300 && mouseY > 0 && mouseY < height) {
    if (validMove(2)) {
      makeMove(2);
    }
  } else if (mouseX > 300 && mouseX < 400 && mouseY > 0 && mouseY < height) {
    if (validMove(3)) {
      makeMove(3);
    }
  } else if (mouseX > 400 && mouseX < 500 && mouseY > 0 && mouseY < height) {
    if (validMove(4)) {
      makeMove(4);
    }
  } else if (mouseX > 500 && mouseX < 600 && mouseY > 0 && mouseY < height) {
    if (validMove(5)) {
      makeMove(5);
    }
  } else if (mouseX > 600 && mouseX < 700 && mouseY > 0 && mouseY < height) {
    if (validMove(6)) {
      makeMove(6);
    }
  }
}

boolean validMove(int x) {
  for (int i = 5; i > -1; i-=1) {
    if (column[x][i] == 0) {
      return true;
    }
  }
  return false;
}

void makeMove(int x) {
  int y;
  for (y = 5; y > -1; y-=1) {
    if (column[x][y] == 0) {
      column[x][y] = 1;
      break;
    }
  }
  if (turn == true) {
    fill(255, 165, 0);
    player1[x][y] = 1;
  } else {
    fill(0, 255, 127);
    player2[x][y] = 1;
  }
  ellipse(50+(x*100), 50+(y*100), 80, 80);
  turn = !turn;
}