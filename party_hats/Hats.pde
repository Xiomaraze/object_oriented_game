class Hats {
  PVector positionH;
  PVector gravity = new PVector(0, 5);
  int hatType; //1 = clown, 2 = viking, 3 = propeller, 4 = crown
  boolean moving;
  
  Hats(int H, float mposx, float mposy){
    hatType = H; // removed hat colour assignment since hats only have 1 colour scheme each
    positionH = new PVector(mposx, mposy);
  }
  void display(){
    //draw the hat
    if (hatType == 1){
      image(clownStraight, positionH.x, positionH.y);
    }
    else if (hatType == 2){
      image(vikingStraight, positionH.x, positionH.y);
    }
    else if (hatType == 3){
      image(propellerStraight, positionH.x, positionH.y);
    }
    else if (hatType == 4){
      image(crownStraight, positionH.x, positionH.y);
    }
    else {}
  }
  
  void update(){
    positionH.add(gravity); //gravity without velocity|| 99% sure this would continually add gravity and end up creating a railgun hat launcher, which is equally hilarious as dumb also not what i want but ill leave it in for now untill i come back to this
  }
}
