boolean turn, finished;
Integer[][] player1 = new Integer[3][3];
Integer[][] player2 = new Integer[3][3];

void setup() {
  strokeWeight(1);
  size(300, 300);
  background(255);
  stroke(3);
  fill(0);
  line(0, 0, width, 0);
  line(0, 100, width, 100);
  line(0, 200, width, 200);
  line(0, height, width, height);
  line(100, 0, 100, height);
  line(200, 0, 200, height);
  fill(255);
  strokeWeight(2);
  for (int i = 0; i < 3; i+=1) {
    for (int j = 0; j < 3; j+=1) {
      player1[i][j] = 0;
      player2[i][j] = 0;
    }
  }
  finished = false;
  turn = true;
}

void draw() {
  winCondition();
}

void winCondition() {
  stroke(0);
  if (!finished) {
    if ((player1[0][0] == 1 && player1[0][1] == 1 && player1[0][2] == 1) || (player2[0][0] == 1 && player2[0][1] == 1 && player2[0][2] == 2)) {
      line(50, 50, 50, 250);
      gameOver();
      finished = true;
    } else if ((player1[1][0] == 1 && player1[1][1] == 1 && player1[1][2] == 1) || (player2[1][0] == 1 && player2[1][1] == 1 && player2[1][2] == 2)) {
      line(150, 50, 150, 250);
      gameOver();
      finished = true;
    } else if ((player1[2][0] == 1 && player1[2][1] == 1 && player1[2][2] == 1) || (player2[2][0] == 1 && player2[2][1] == 1 && player2[2][2] == 2)) {
      line(250, 50, 250, 250);
      gameOver();
      finished = true;
    } else if ((player1[0][0] == 1 && player1[1][0] == 1 && player1[2][0] == 1) || (player2[0][0] == 1 && player2[1][0] == 1 && player2[2][0] == 2)) {
      line(50, 50, 250, 50);
      gameOver();
      finished = true;
    } else if ((player1[0][1] == 1 && player1[1][1] == 1 && player1[2][1] == 1) || (player2[0][1] == 1 && player2[1][1] == 1 && player2[2][1] == 2)) {
      line(50, 150, 250, 150);
      gameOver();
      finished = true;
    } else if ((player1[0][2] == 1 && player1[1][2] == 1 && player1[2][2] == 1) || (player2[0][2] == 1 && player2[1][2] == 1 && player2[2][2] == 2)) {
      line(50, 250, 250, 250);
      gameOver();
      finished = true;
    } else if ((player1[0][0] == 1 && player1[1][1] == 1 && player1[2][2] == 1) || (player2[0][0] == 1 && player2[1][1] == 1 && player2[2][2] == 2)) {
      line(50, 50, 250, 250);
      gameOver();
      finished = true;
    } else if ((player1[2][0] == 1 && player1[1][1] == 1 && player1[0][2] == 1) || (player2[2][0] == 1 && player2[1][1] == 1 && player2[0][2] == 2)) {
      line(250, 50, 50, 250);
      gameOver();
      finished = true;
    }
  }
}

void gameOver() {
  for (int i = 0; i < 3; i+=1) {
    for (int j = 0; j < 3; j+=1) {
      player1[i][j] = 1;
      player2[i][j] = 1;
    }
  }
}

void mousePressed() {
  if (mouseX > 0 && mouseX < 100) {
    if (mouseY > 0 && mouseY < 100) {
      if (player1[0][0] == 0 && player2[0][0] == 0) {
        if (turn == true) {
          stroke(200, 0, 0);
          line(15, 15, 85, 85);
          line(85, 15, 15, 85);
          player1[0][0] = 1;
        } else {
          stroke(0, 0, 200);
          ellipse(50, 50, 75, 75);
          player2[0][0] = 1;
        }
        turn = !turn;
      }
    } else if (mouseY > 100 && mouseY < 200) {
      if (player1[0][1] == 0 && player2[0][1] == 0) {
        if (turn == true) {
          stroke(200, 0, 0);
          line(15, 115, 85, 185);
          line(85, 115, 15, 185);
          player1[0][1] = 1;
        } else {
          stroke(0, 0, 200);
          ellipse(50, 150, 75, 75);
          player2[0][1] = 1;
        }
        turn = !turn;
      }
    } else {
      if (player1[0][2] == 0 && player2[0][2] == 0) {
        if (turn == true) {
          stroke(200, 0, 0);
          line(15, 215, 85, 285);
          line(85, 215, 15, 285);
          player1[0][2] = 1;
        } else {
          stroke(0, 0, 200);
          ellipse(50, 250, 75, 75);
          player2[0][2] = 1;
        }
        turn = !turn;
      }
    }
  } else if (mouseX > 100 && mouseX < 200) {
    if (mouseY > 0 && mouseY < 100) {
      if (player1[1][0] == 0 && player2[1][0] == 0) {
        if (turn == true) {
          stroke(200, 0, 0);
          line(115, 15, 185, 85);
          line(185, 15, 115, 85);
          player1[1][0] = 1;
        } else {
          stroke(0, 0, 200);
          ellipse(150, 50, 75, 75);
          player2[1][0] = 1;
        }
        turn = !turn;
      }
    } else if (mouseY > 100 && mouseY < 200) {
      if (player1[1][1] == 0 && player2[1][1] == 0) {
        if (turn == true) {
          stroke(200, 0, 0);
          line(115, 115, 185, 185);
          line(185, 115, 115, 185);
          player1[1][1] = 1;
        } else {
          stroke(0, 0, 200);
          ellipse(150, 150, 75, 75);
          player2[1][1] = 1;
        }
        turn = !turn;
      }
    } else {
      if (player1[1][2] == 0 && player2[1][2] == 0) {
        if (turn == true) {
          stroke(200, 0, 0);
          line(115, 215, 185, 285);
          line(185, 215, 115, 285);
          player1[1][2] = 1;
        } else {
          stroke(0, 0, 200);
          ellipse(150, 250, 75, 75);
          player2[1][2] = 1;
        }
        turn = !turn;
      }
    }
  } else {
    if (mouseY > 0 && mouseY < 100) {
      if (player1[2][0] == 0 && player2[2][0] == 0) {
        if (turn == true) {
          stroke(200, 0, 0);
          line(215, 15, 285, 85);
          line(285, 15, 215, 85);
          player1[2][0] = 1;
        } else {
          stroke(0, 0, 200);
          ellipse(250, 50, 75, 75);
          player2[2][0] = 1;
        }
        turn = !turn;
      }
    } else if (mouseY > 100 && mouseY < 200) {
      if (player1[2][1] == 0 && player2[2][1] == 0) {
        if (turn == true) {
          stroke(200, 0, 0);
          line(215, 115, 285, 185);
          line(285, 115, 215, 185);
          player1[2][1] = 1;
        } else {
          stroke(0, 0, 200);
          ellipse(250, 150, 75, 75);
          player2[2][1] = 1;
        }
        turn = !turn;
      }
    } else {
      if (player1[2][2] == 0 && player2[2][2] == 0) {
        if (turn == true) {
          stroke(200, 0, 0);
          line(215, 215, 285, 285);
          line(285, 215, 215, 285);
          player1[2][2] = 1;
        } else {
          stroke(0, 0, 200);
          ellipse(250, 250, 75, 75);
          player2[2][2] = 1;
        }
        turn = !turn;
      }
    }
  }
}

void keyPressed() {
  setup();
}