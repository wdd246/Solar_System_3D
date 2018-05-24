Planet[] moons;

class Planet{
  float v=0; //speed of solar system
  float speed; 
  color colors; //planet color
  float orbitR;
  float planetR;
  int numMoon;

  Planet(float speed, float orbitR, float planetR,color colors){
    this.speed=speed;
    this.colors=colors;
    this.orbitR=orbitR;
    this.planetR=planetR;
  }

void show(){
  pushMatrix();
  rotateX(PI/2);
  stroke(colors); //orbit color
  strokeWeight(showOrbit); //show/hide orbit
  noFill();
  ellipse(0,0,2*orbitR,2*orbitR); //draw orbit
  popMatrix();
  noStroke();
  pushMatrix();
  rotateY(v); //speed of solar sys
  pushMatrix();
  translate(orbitR,0,0); //planet pos
  fill(colors); //planet colors
  sphere(planetR); //planet show
  popMatrix();
  popMatrix();
  v+=speed*speedInc;//speed of solar sys
}
}
