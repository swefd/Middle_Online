GameBoy gb = new GameBoy();

int headX = 0;
int headY = 0;

int moveX = 1;  // напрям руху
int moveY = 0;  // напрям руху


void setup() {
  size(285, 565);
  gb.begin(0);
}


void draw() {
  gb.drawDisplay();
  gb.drawPoint(headX, headY);
  
  if (frameCount % 20 == 0){
    headX += moveX;
    headY += moveY;
  }
  
  if (headX > 7){
    headX = 0;
  }
  
  if (headX < 0){
    headX = 7;
  }
  
}

void keyPressed(){
  if (gb.getKey() == 3 && moveY != 1){
     //up
     moveX = 0;
     moveY = -1;
   }
   
   if (gb.getKey() == 4 && moveX != 1){
     //Left
     moveX = -1;
     moveY = 0;
   }
   
  if (gb.getKey() == 5 && moveX != -1){
     //Right
     moveX = 1;
     moveY = 0;
   }
  
  if (gb.getKey() == 6 && moveY != -1){
    //DOWN
    moveX = 0;
    moveY = 1;
  }
   
   
}
