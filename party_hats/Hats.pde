class Hats {
  PVector positionH;
  PVector gravity;
  int hatType; //1 = clown, 2 = crown, 3 = propeller, 4 = viking
  color hatColor;
  color hatEdge;
  
  Hats(int H, char c){
    hatType = H;
    // assign colour to the hat
    if (c == 'r'){
      
    }
    else if (c == 'y') {
      
    }
    else if (c == 'b'){
      
    }
    else if (c == 'g') {
      
    }
    else if (c == 'o') {
      
    }
    else {
      
    }
    float lX = constrain(mouseX, 10, width - 10);
    positionH = new PVector(lX, 50); //spawns hat at the top of the screen
  }
  void display(){
    //draw the hat
  }
  
  void update(){
    positionH.add(gravity); //gravity without velocity
  }
}