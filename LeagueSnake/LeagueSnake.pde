//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x = 0;
int y = 0;
// Add a constructor with parameters to initialize each variable.
public Segment (int x, int y){
this.x = x;
this.y = y;
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
ArrayList<Segment> tail = new ArrayList<Segment>();


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
  rect(head.x, head.y, 10, 10);
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
  for(int i = 0; i < tail.size(); i++){
    noStroke();
    fill(355, 355, 355);
    rect(tail.get(i).x, tail.get(i).y, 10, 10);
  }
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  tail.add(new Segment(head.x, head.y));
  tail.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for(int i = 0; i < tail.size(); i++){
    if(head.x == tail.get(i).x && head.y == tail.get(i).y){
      eaten = 1;
      tail.clear();
      tail.add(new Segment(head.x, head.y));
    }
  }
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
    head.y = head.y - 10;
    break;
  case DOWN:
    // move head down here 
    head.y = head.y + 10;
    break;
  case LEFT:
   // figure it out 
   head.x = head.x - 10;
    break;
  case RIGHT:
    // mystery code goes here 
    head.x = head.x + 10;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.x > 490){
  head.x = 0;
 }else if(head.x < 0){
  head.x = 490; 
 }else  if(head.y > 490){
  head.y = 0;
 }else if(head.y < 0){
  head.y = 490; 
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(head.x == foodX && head.y == foodY){
  eaten = eaten + 1;
  dropFood();
  tail.add(new Segment(head.x, head.y));
}
}
