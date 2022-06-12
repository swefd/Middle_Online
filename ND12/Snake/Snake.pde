// For Presentations

GameBoy gb = new GameBoy();

int headX = 0;
int headY = 0;

int moveX = 1;
int moveY = 0;

int foodX = (int)random(0, 8);
int foodY = (int)random(0, 16);

ArrayList<TailPiece> tail = new ArrayList<TailPiece>();

void setup() {
  size(285, 565);
  gb.begin(0);
}


void draw() {  
  gb.drawDisplay();
  gb.drawPoint(headX, headY);
  gb.drawPoint(foodX, foodY);

  if (frameCount % 20 == 0) {    
    headX += moveX;
    headY += moveY;

    if (headX > 7) {
      headX = 0;
    } else if (headX < 0) {
      headX = 7;
    }

    if (headY > 15) {
      headY = 0;
    } else if (headY < 0) {
      headY = 15;
    }

    if (headX == foodX && headY == foodY) {
      foodX = (int)random(0, 8);
      foodY = (int)random(0, 16);
    }
  }
}

void addTail() {
  int newPieceX = headX;
  int newPieceY = headY;
  tail.add(new TailPiece(newPieceX, newPieceY));
}

void keyPressed() {
  if (gb.getKey() == 3 && moveY != 1) {
    moveX = 0;
    moveY = -1;
  }

  if (gb.getKey() == 4 && moveX != 1) {
    moveX = -1;
    moveY = 0;
  }

  if (gb.getKey() == 5 && moveX != -1) {
    moveX = 1;
    moveY = 0;
  }

  if (gb.getKey() == 6 && moveY != -1) {
    moveX = 0;
    moveY = 1;
  }
}
