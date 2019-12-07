//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int segmentX = 0;
int segmentY = 0;
// Add a constructor with parameters to initialize each variable.
public Segment (int segmentX, int segmentY){
segmentX = this.segmentX;
segmentY = this.segmentY;
}
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;
int foodX;
int foodY;
int direction = UP;
int eaten = 0;



//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
head = new Segment(250, 250);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0, 0, 0);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  //Draw the food
  noStroke();
  fill(200, 200, 200);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  noStroke();
  fill(355, 355, 355);
  rect(head.segmentX, head.segmentY, 10, 10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == UP){
    if(direction != DOWN){
   direction = UP; 
    }
  }else if(keyCode == DOWN){
    if(direction != UP){
   direction = DOWN; 
    }
  }else if(keyCode == LEFT){
    if(direction != RIGHT){
   direction = LEFT; 
    }
  }else if(keyCode == RIGHT){
    if(direction != LEFT){
   direction = RIGHT; 
    }
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
    // move head up here
    head.segmentY = head.segmentY - 10;
    break;
  case DOWN:
    // move head down here 
    head.segmentY = head.segmentY + 10;
    break;
  case LEFT:
   // figure it out 
   head.segmentX = head.segmentX - 10;
    break;
  case RIGHT:
    // mystery code goes here 
    head.segmentX = head.segmentX + 10;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.segmentX > 490){
  head.segmentX = 0;
 }else if(head.segmentX < 0){
  head.segmentX = 490; 
 }else  if(head.segmentY > 490){
  head.segmentY = 0;
 }else if(head.segmentY < 0){
  head.segmentY = 490; 
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(head.segmentX == foodX && head.segmentY == foodY){
  eaten = eaten + 1;
  dropFood();
}
}
