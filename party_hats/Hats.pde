class Hats {
  PVector positionH;
  PVector gravity;
  int hatType; //1 = clown, 2 = crown, 3 = propeller, 4 = viking
  
  Hats(int H, char c){
    hatType = H; // removed hat colour assignment since hats only have 1 colour scheme each
    float lX = constrain(mouseX, 10, width - 10);
    positionH = new PVector(lX, 50); //spawns hat at the top of the screen
  }
  void display(){
    //draw the hat
  }
  
  void update(){
    //positionH.add(gravity); //gravity without velocity|| 99% sure this would continually add gravity and end up creating a railgun hat launcher, which is equally hilarious as dumb also not what i want but ill leave it in for now untill i come back to this
  }
}
