class Npcs {
  PVector position;
  PVector speed = new PVector(0, 10);
  int animalType; //duck = 1, bear = 2, cat = 3
  PImage walk1;
  PImage walk2;
  char colour;
  boolean hat;
  int hatType; //0 is no hat, 1 = clown, 2 = crown, 3 = propeller, 4 = viking
  
  Npcs(int ani, int ord, char col, PImage step1, PImage step2, boolean h, int hatT){
    position = new PVector(410 + (ord * 10), 370); //assigns the object a location to start moving from
    walk1 = step1;
    walk2 = step2;
    colour = col;
    animalType = ani;
    hat = h;
    hatType = hatT;
  }


  void display(){
    int frame = frameCount % 10;
    if ((frame >= 0) && (frame < 5)){
      image(walk1, position.x, position.y);
    }
    else {
      image(walk2, position.x, position.y);
    }
  }
  
  void update(){
    position.add(speed);
  }
}
