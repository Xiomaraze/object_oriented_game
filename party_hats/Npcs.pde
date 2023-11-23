class Npcs {
  PVector position;
  PVector speed;
  int animalType; //duck = 1, bear = 2, cat = 3
  color animalColour;
  color animalEdge;
  int order; //1 = first in line, 2 = second in line, 3 = third in line 
  boolean hat;
  color duckFeet;
  
  Npcs(int ani, int ord, char col, boolean h){
    if (ord == 1){
      position = new PVector(410, 370);
    }
    else if (ord == 2){
      position = new PVector(460, 370);
    }
    else {
      position = new PVector(510, 370);
    }
    if (col == 'r') {
      animalColour = color(255, int(random(160, 210)), int(random(160, 255))); //assigns random redish colour
      animalEdge = color(235, green(animalColour) - 20, blue(animalColour) - 20); //darker colour for outline
    }
    else if (col == 'b') {
      animalColour = color(int(random(160, 255)), int(random(160, 255)), int(random(210, 255)));
      animalEdge = color(red(animalColour) - 20, green(animalColour) - 20, blue(animalColour) - 20);
    }
    else if (col == 'y') {
      animalColour = color(int(random(220, 255)), 255, 160);
      animalEdge = color(red(animalColour) - 20, 235, 140);
    }
    else if (col == 'o') {
      animalColour = color(255, int(random(195, 230)), 160);
      animalEdge = color(235, green(animalColour) - 20, 140);
    }
    else if (col == 'g') {
      animalColour = color(int(random(160, 220)), 255, int(random(160, 210)));
      animalEdge = color(red(animalColour) - 20, 235, blue(animalColour) - 20);
    }
    else {
      animalColour = color(int(random(185, 240)), 160, 255);
      animalEdge = color(red(animalColour) - 20, 140, 235);
    }
    order = ord;
    animalType = ani;
    hat = h;
    duckFeet = color(232, 176, 63); //fill colour for duck feet
  }


  void display(){
    //Duck
      if (animalType == 1) {
        //back foot for duck
        fill(duckFeet);
        stroke(red(duckFeet) - 5, green(duckFeet) - 5, blue(duckFeet) - 5);
        quad(position.x + 10, position.y - 10, position.x + 15, position.y - 8, position.x + 10, position.y + 2, position.x + 5, position.y);
        fill(animalColour);
        stroke(animalEdge);
        //position point is at the feet of animal
        ellipse(position.x, position.y - 70, 45, 45);//head
        ellipse(position.x + 25, position.y - 30, 90, 50);//body
        arc(position.x + 25, position.y - 30, 40, 20, PI+QUARTER_PI, TWO_PI);
        arc(position.x + 25, position.y - 32, 40, 20, 0, HALF_PI+QUARTER_PI);
        fill(0);
        noStroke();
        ellipse(position.x - 10, position.y - 80, 10, 20);
        //front foot for duck
        fill(duckFeet);
        stroke(red(duckFeet) - 5, green(duckFeet) - 5, blue(duckFeet) - 5);
        quad(position.x + 50, position.y - 10, position.x + 55, position.y - 12, position.x + 60, position.y - 2, position.x + 55, position.y);
      }
    //Bear
    
    //Cat
  }
}
