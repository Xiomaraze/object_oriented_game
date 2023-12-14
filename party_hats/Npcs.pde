class Npcs {
  PVector position;
  PVector speed = new PVector(5,0);
  int animalType; //duck = 1, bear = 2, cat = 3
  PImage walk1;
  PImage walk2;
  char colour;
  boolean hat;
  int hatType; //0 is no hat, 1 = clown, 2 = viking, 3 = propeller, 4 = crown
  
  Npcs(int ani, int ord, char col, PImage step1, PImage step2, boolean h, int hatT){
    position = new PVector(400 + (ord*100), 200); //assigns the object a location to start moving from something about this is not working right
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
    if (hat == true){
      if (hatType == 1){
        if (animalType == 1){
          image(clownTilt, position.x + 50, position.y + 10);
        }
        else if (animalType == 2){
          image(clownTilt, position.x + 70, position.y - 10);
        }
        else {
          image(clownTilt, position.x + 30, position.y + 5);
        }
      }
      else if (hatType == 2){
        if (animalType == 1){
          image(vikingTilt, position.x + 40, position.y + 15);
        }
        else if (animalType == 2){
          image(vikingTilt, position.x + 60, position.y - 5);
        }
        else {
          image(vikingTilt, position.x + 25, position.y + 10);
        }
      }
      else if (hatType == 3){
        if (animalType == 1){
          image(propellerTilt, position.x + 45, position.y + 10);
        }
        else if (animalType == 2){
          image(propellerTilt, position.x + 65, position.y - 6);
        }
        else {
          image(propellerTilt, position.x + 25, position.y + 10);
        }
      }
      else {
        if (animalType == 1){
          image(crownTilt, position.x + 45, position.y + 10);
        }
        else if (animalType == 2){
          image(crownTilt, position.x + 65, position.y - 6);
        }
        else {
          image(crownTilt, position.x + 25, position.y + 10);
        }
      }
    }
  }
  
  void update(){
    position.sub(speed);
  }
}
