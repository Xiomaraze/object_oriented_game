//Allie Arnott
//991396872

ArrayList <Npcs> animals = new ArrayList<Npcs>();
ArrayList <Hats> chapeaux = new ArrayList<Hats>();
PVector rLocation; //the robot arm location
int buttonSelected = 1;
int scoreGoal;
int curScore;
boolean[] hearts = new boolean[5];

void setup(){
  size(400, 400);
  animals.add(new Npcs(1, 0, 'b', false));
  curScore = 0;
  scoreGoal = int(random(1, 20));
  for (int i = 0; i < 3; i++){
    hearts[i] = true; //sets up player's life points
  }
}

void draw(){
  rectMode(CORNER);
  // background art stuff here
  
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
  rLocation.x = constrain(mouseX, 10, width-10);
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
  float distance = one.dist(two);
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
        animals.add(new Npcs(animal, width + 50, 'g', hatted));
      case 2: //purple
        animals.add(new Npcs(animal, width + 50, 'p', hatted));
      case 3: //orange
        animals.add(new Npcs(animal, width + 50, 'o', hatted));
      case 4: //yellow
        animals.add(new Npcs(animal, width + 50, 'y', hatted));
      case 5: //red
        animals.add(new Npcs(animal, width + 50, 'r', hatted));
      default: //blue
        animals.add(new Npcs(animal, width + 50, 'b', hatted));
    }
  }
  if (first.position.x <= -50){
    animals.remove(0); //i feel like im missing something here and it really shouldnt be as easy as this
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

void scoreCalc(int current, boolean correct){
  //correct animal = +2
  //correct colour = +1
  //correct hat = +1
}
