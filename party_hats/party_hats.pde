//Allie Arnott
//991396872

ArrayList <Npcs> animals = new ArrayList<Npcs>();
ArrayList <Hats> chapeaux = new ArrayList<Hats>();
PVector rLocation; //the robot arm location
int buttonSelected = 1;

void setup(){
  size(400, 400);
  animals.add(new Npcs(2, 0, 'b', false));
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
  rLocation = constrain(mouseX, 10, width-10);
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
