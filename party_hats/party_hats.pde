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

void setup(){
  size(400, 400);
  animals.add(new Npcs(1, 0, 'b', false));
  curScore = 0;
  scoreGoal = int(random(1, 20));
  for (int i = 0; i < 3; i++){
    hearts[i] = true; //sets up player's life points
  }
  target = new Npcs(int(random(1, 4)), 1, 'p', true, int(random(1, 5))); //creates target with randomized animal type and hat type. colour is ALWAYS purple to start with
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
    case 2: //crown
      buttonSelected = 2;
    case 3: //propeller
      buttonSelected = 3;
    case 4: //viking
      buttonSelected = 4;
    default: //error
      println("Error hat not found");
      buttonSelected = 0;
  }
}

void robotArm(){
  //this should be the stuff to display the arm
  
}

void check(Npcs last, Npcs first){
  //no purpose for this next bit besides meeting requirements
  PVector one = last.position;
  PVector two = first.position;
  float distance = one.dist(two); //new PVector function ive not used before (skill 43)
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
      case 1: //green
        animals.add(new Npcs(animal, width + 50, 'g', hatted, int(random(0, 5))));
      case 2: //purple
        animals.add(new Npcs(animal, width + 50, 'p', hatted, int(random(0, 5))));
      case 3: //orange
        animals.add(new Npcs(animal, width + 50, 'o', hatted, int(random(0, 5))));
      case 4: //yellow
        animals.add(new Npcs(animal, width + 50, 'y', hatted, int(random(0, 5))));
      case 5: //red
        animals.add(new Npcs(animal, width + 50, 'r', hatted, int(random(0, 5))));
      default: //blue
        animals.add(new Npcs(animal, width + 50, 'b', hatted, int(random(0, 5))));
    }
  }
  if (first.position.x <= -20){
    animals.remove(0); //i feel like im missing something here and it really shouldnt be as easy as this
    if (first.hat == true) {
      scoreCalc(curScore, first);
    }
  }
}

void randomizeAnimal (Npcs current){
  //no real use for this yet, will randomize target animal theoretically
  current.animalType = int(random(1,3));
  int tempColNum = int(random(1, 7));
  int tempColNumTwo = int(random(1, 4));
  if (tempColNum <= 3){
    //red orange yellow
    switch(tempColNumTwo){
      case 1: //red
      
      case 2: //orange
      
      default: //yellow
    }
  }
  else {
    //green blue purple
    switch(tempColNumTwo){
      case 1: //green
      
      case 2: //blue
      
      default: //purple
    }
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
    case 2: // orange
      col = 'o';
    case 3: // yellow
      col = 'y';
    case 4: // green
      col = 'g';
    case 5: // blue
      col = 'b';
    default: // purple
      col = 'p';
  }
  target = new Npcs(int(random(1, 4)), 1, col, true, int(random(1, 5)));
}
