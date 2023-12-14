//Allie Arnott
//991396872

ArrayList <Npcs> animals = new ArrayList<Npcs>();
ArrayList <Hats> chapeaux = new ArrayList<Hats>();
PVector rLocation; //the robot arm location
int buttonSelected = 1;
int scoreGoal;
int curScore;
boolean[] hearts = new boolean[5];
PVector[] twinkles = new PVector[10];
Npcs target;

//sprite images loading here
//ducks first
PImage duckYellow0;
PImage duckYellow1;
PImage duckOrange0;
PImage duckOrange1;
PImage duckRed0;
PImage duckRed1;
PImage duckPurple0;
PImage duckPurple1;
PImage duckBlue0;
PImage duckBlue1;
PImage duckGreen0;
PImage duckGreen1;
//bears
PImage bearYellow0;
PImage bearYellow1;
PImage bearOrange0;
PImage bearOrange1;
PImage bearRed0;
PImage bearRed1;
PImage bearPurple0;
PImage bearPurple1;
PImage bearBlue0;
PImage bearBlue1;
PImage bearGreen0;
PImage bearGreen1;
//cats
PImage catYellow0;
PImage catYellow1;
PImage catOrange0;
PImage catOrange1;
PImage catRed0;
PImage catRed1;
PImage catPurple0;
PImage catPurple1;
PImage catBlue0;
PImage catBlue1;
PImage catGreen0;
PImage catGreen1;

//hats loading
PImage clownTilt;
PImage clownStraight;
PImage crownTilt;
PImage crownStraight;
PImage vikingTilt;
PImage vikingStraight;
PImage propellerTilt;
PImage propellerStraight;

void setup(){
  frameRate(60);
  size(400, 400);
  //animals.add(new Npcs(1, 0, 'b', false, 0)); add the image files
  curScore = 0;
  scoreGoal = int(random(1, 20));
  for (int i = 0; i < 3; i++){
    hearts[i] = true; //sets up player's life points
  }
  //loading the image files wall of loading commands oof
  duckYellow0 = loadImage("duckYellow0.png");
  duckYellow1 = loadImage("duckYellow1.png");
  duckOrange0 = loadImage("duckOrange0.png");
  duckOrange1 = loadImage("duckOrange1.png");
  duckRed0 = loadImage("duckRed0.png");
  duckRed1 = loadImage("duckRed1.png");
  duckPurple0 = loadImage("duckPurple0.png");
  duckPurple1 = loadImage("duckPurple1.png");
  duckBlue0 = loadImage("duckBlue0.png");
  duckBlue1 = loadImage("duckBlue1.png");
  duckGreen0 = loadImage("duckGreen0.png");
  duckGreen1 = loadImage("duckGreen1.png");
  bearYellow0 = loadImage("bearYellow0.png");
  bearYellow1 = loadImage("bearYellow1.png");
  bearOrange0 = loadImage("bearOrange0.png");
  bearOrange1 = loadImage("bearOrange1.png");
  bearRed0 = loadImage("bearRed0.png");
  bearRed1 = loadImage("bearRed1.png");
  bearPurple0 = loadImage("bearPurple0.png");
  bearPurple1 = loadImage("bearPurple1.png");
  bearBlue0 = loadImage("bearBlue0.png");
  bearBlue1 = loadImage("bearBlue1.png");
  bearGreen0 = loadImage("bearGreen0.png");
  bearGreen1 = loadImage("bearGreen1.png");
  catYellow0 = loadImage("catYellow0.png");
  catYellow1 = loadImage("catYellow1.png");
  catOrange0 = loadImage("catOrange0.png");
  catOrange1 = loadImage("catOrange1.png");
  catRed0 = loadImage("catRed0.png");
  catRed1 = loadImage("catRed1.png");
  catPurple0 = loadImage("catPurple0.png");
  catPurple1 = loadImage("catPurple1.png");
  catBlue0 = loadImage("catBlue0.png");
  catBlue1 = loadImage("catBlue1.png");
  catGreen0 = loadImage("catGreen0.png");
  catGreen1 = loadImage("catGreen1.png");
  clownTilt = loadImage("clownTilt.png");
  clownStraight = loadImage("clownStraight.png");
  crownTilt = loadImage("crownTilt.png");
  crownStraight = loadImage("crownStraight.png");
  vikingTilt = loadImage("vikingTilt.png");
  vikingStraight = loadImage("vikingStraight.png");
  propellerTilt = loadImage("propellerTilt.png");
  propellerStraight = loadImage("propellerStraight.png");
  
  int ani = int(random(1, 4));
  //target = new Npcs(, 1, 'p',  true, int(random(1, 5))); //creates target with randomized animal type and hat type. colour is ALWAYS purple to start with
  switch(ani){ //this switch statement is for the image file assignment
    case 1:
      target = new Npcs(1, 0, 'p', duckPurple0, duckPurple0, true, int(random(0, 5)));
      target.position = new PVector(width-150, height-150);
      break;
    case 2:
      target = new Npcs(2, 0, 'p', bearPurple0, bearPurple0, true, int(random(0, 5)));
      target.position = new PVector(width-150, height-150);
      break;
    default:
      target = new Npcs(3, 0, 'p', catPurple0, catPurple0, true, int(random(0, 5)));
      target.position = new PVector(width-150, height-150);
      break;
  }
}

void draw(){
  rectMode(CORNER);
  // background art stuff here
  background(#F7F2D4);
  rectMode(CORNERS);
  fill(#B49978);
  stroke(#9D8567);
  rect(-5, 300, 405, height);//floor boards colour variation
  fill(149, 112, 66, 50);
  rect(-5, 320, 405, 340);
  fill(149, 112, 66, 100);
  rect(-5, 341, 405, 360);
  fill(149, 112, 66, 150);
  rect(-5, 361, 405, 380);
  fill(149, 112, 66, 200);
  rect(-5, 381, 405, 400);
  //drawing the animals
  for (int k = animals.size() - 1; k >= 0; k--){
    Npcs current = animals.get(k);
    current.display();
    current.update();
    //if the animal moves beyond view remove the animal
    if (current.position.x < -10){
      animals.remove(k);
    }
  }
  target.display();
  //rLocation.x = constrain(mouseX, 10, width-10);
}

void mousePressed(){
  //drop hat at current X location for robot arm
  if (buttonSelected == 0){
    println ("Error 404, hat not found.");
  }
}

void keyPressed(){
  switch(key){
    case 1: //clown
      buttonSelected = 1;
      break;
    case 2: //crown
      buttonSelected = 2;
      break;
    case 3: //propeller
      buttonSelected = 3;
      break;
    case 4: //viking
      buttonSelected = 4;
      break;
    default: //error
      println("Error hat not found");
      buttonSelected = 0;
      break;
  }
}

void robotArm(){
  //this should be the stuff to display the arm
  
}

void check(Npcs last, Npcs first){
  //this function checks each animal that 
  PVector one = last.position;
  PVector two = first.position;
  float distance = one.dist(two); //new PVector function ive not used before (skill 43) will be printed to console
  println (distance);
  if (last.position.x < (width - 50)){
    int animal = int(random(1, 4));
    int colour = int(random(1, 7));
    float hat = random(-5, 5);
    boolean hatted;
    if (hat >= 0){
      hatted = false;
    }
    else {hatted = true;}
    switch (colour){
      case 1: //green-------------------------
        if (animal == 1){
          animals.add(new Npcs(animal, width + 50, 'g', duckGreen0, duckGreen1, hatted, int(random(0, 5))));
        }
        else if (animal == 2){
          animals.add(new Npcs(animal, width + 50, 'g', bearGreen0, bearGreen1, hatted, int(random(0, 5))));
        }
        else {
          animals.add(new Npcs(animal, width + 50, 'g', catGreen0, catGreen1, hatted, int(random(0, 5))));
        }
        break;
      case 2: //purple ----------------------------------------
        if (animal == 1){
          animals.add(new Npcs(animal, width + 50, 'p', duckPurple0, duckPurple1, hatted, int(random(0, 5))));
        }
        else if (animal == 2){
          animals.add(new Npcs(animal, width + 50, 'p', bearPurple0, bearPurple1, hatted, int(random(0, 5))));
        }
        else {
          animals.add(new Npcs(animal, width + 50, 'p', catPurple0, catPurple1, hatted, int(random(0, 5))));
        }
        break;
      case 3: //orange-------------------------------------
        if (animal == 1){
          animals.add(new Npcs(animal, width + 50, 'o', duckOrange0, duckOrange1, hatted, int(random(0, 5))));
        }
        else if (animal == 2){
          animals.add(new Npcs(animal, width + 50, 'o', bearOrange0, bearOrange1, hatted, int(random(0, 5))));
        }
        else {
          animals.add(new Npcs(animal, width + 50, 'o', catOrange0, catOrange1, hatted, int(random(0, 5))));
        }
        break;
      case 4: //yellow-------------------------------------
        if (animal == 1){
          animals.add(new Npcs(animal, width + 50, 'y', duckYellow0, duckYellow1, hatted, int(random(0, 5))));
        }
        else if (animal == 2){
          animals.add(new Npcs(animal, width + 50, 'y', bearYellow0, bearYellow1, hatted, int(random(0, 5))));
        }
        else {
          animals.add(new Npcs(animal, width + 50, 'y', catYellow0, catYellow1, hatted, int(random(0, 5))));
        }
        break;
      case 5: //red-------------------------------------
        if (animal == 1){
          animals.add(new Npcs(animal, width + 50, 'r', duckRed0, duckRed1, hatted, int(random(0, 5))));
        }
        else if (animal == 2){
          animals.add(new Npcs(animal, width + 50, 'r', bearRed0, bearRed1, hatted, int(random(0, 5))));
        }
        else {
          animals.add(new Npcs(animal, width + 50, 'r', catRed0, catRed1, hatted, int(random(0, 5))));
        }
        break;
      default: //blue-------------------------------------
        if (animal == 1){
          animals.add(new Npcs(animal, width + 50, 'b', duckBlue0, duckBlue1, hatted, int(random(0, 5))));
        }
        else if (animal == 2){
          animals.add(new Npcs(animal, width + 50, 'b', bearBlue0, bearBlue1, hatted, int(random(0, 5))));
        }
        else {
          animals.add(new Npcs(animal, width + 50, 'b', catBlue0, catBlue1, hatted, int(random(0, 5))));
        }
        break;
    }
  }
  if (first.position.x <= -20){
    if (first.hat == true) {
      scoreCalc(curScore, first);
    }
    animals.remove(0); //i feel like im missing something here and it really shouldnt be as easy as this
  }
}

void scoreCalc(int current, Npcs anim){
  int colRandomizer;
  char col;
  //correct animal = +2
  if (anim.animalType == target.animalType){
    current = current + 2;
  }
  //correct colour = +1
  if (anim.colour == target.colour){
    current = current + 1;
  }
  //correct hat = +3
  if (anim.hatType == target.hatType){
    current = current + 3;
  }
  colRandomizer = int(random(1, 7));
  switch (colRandomizer){
    case 1: // red
      col = 'r';
      break;
    case 2: // orange
      col = 'o';
      break;
    case 3: // yellow
      col = 'y';
      break;
    case 4: // green
      col = 'g';
      break;
    case 5: // blue
      col = 'b';
      break;
    default: // purple
      col = 'p';
      break;
  }
  int animal = int(random(1, 4));
  switch (colRandomizer){
      case 1: //green-------------------------
        if (animal == 1){
          target = new Npcs(animal, width + 50, col, duckGreen0, duckGreen1, true, int(random(0, 5)));
        }
        else if (animal == 2){
          target = new Npcs(animal, width + 50, col, bearGreen0, bearGreen1, true, int(random(0, 5)));
        }
        else {
         target = new Npcs(animal, width + 50, col, catGreen0, catGreen1, true, int(random(0, 5)));
        }
        break;
      case 2: //purple ----------------------------------------
        if (animal == 1){
          target = new Npcs(animal, width + 50, col, duckPurple0, duckPurple1, true, int(random(0, 5)));
        }
        else if (animal == 2){
          target = new Npcs(animal, width + 50, col, bearPurple0, bearPurple1, true, int(random(0, 5)));
        }
        else {
          target = new Npcs(animal, width + 50, col, catPurple0, catPurple1, true, int(random(0, 5)));
        }
        break;
      case 3: //orange-------------------------------------
        if (animal == 1){
          target = new Npcs(animal, width + 50, col, duckOrange0, duckOrange1, true, int(random(0, 5)));
        }
        else if (animal == 2){
          target = new Npcs(animal, width + 50, col, bearOrange0, bearOrange1, true, int(random(0, 5)));
        }
        else {
          target = new Npcs(animal, width + 50, col, catOrange0, catOrange1, true, int(random(0, 5)));
        }
        break;
      case 4: //yellow-------------------------------------
        if (animal == 1){
          target = new Npcs(animal, width + 50, col, duckYellow0, duckYellow1, true, int(random(0, 5)));
        }
        else if (animal == 2){
          animals.add(new Npcs(animal, width + 50, col, bearYellow0, bearYellow1, true, int(random(0, 5))));
        }
        else {
          target = new Npcs(animal, width + 50, col, catYellow0, catYellow1, true, int(random(0, 5)));
        }
        break;
      case 5: //red-------------------------------------
        if (animal == 1){
          target = new Npcs(animal, width + 50, col, duckRed0, duckRed1, true, int(random(0, 5)));
        }
        else if (animal == 2){
          target = new Npcs(animal, width + 50, col, bearRed0, bearRed1, true, int(random(0, 5)));
        }
        else {
          target = new Npcs(animal, width + 50, col, catRed0, catRed1, true, int(random(0, 5)));
        }
        break;
      default: //blue-------------------------------------
        if (animal == 1){
          target = new Npcs(animal, width + 50, col, duckBlue0, duckBlue1, true, int(random(0, 5)));
        }
        else if (animal == 2){
          target = new Npcs(animal, width + 50, col, bearBlue0, bearBlue1, true, int(random(0, 5)));
        }
        else {
          target = new Npcs(animal, width + 50, col, catBlue0, catBlue1, true, int(random(0, 5)));
        }
        break;
    }
}
