//Adam Małota
//Solar system
//UŚ 2018

Planet[] planets = new Planet[10]; // count of planets
float showOrbit=0.2;
int zoom =0;
float speedInc=1;
float years;

float r = 500; //sun radius
float[] orbit_radius = {r+40,r+80,r+100,r+160,r+520,r+1000,r+2000,r+3000,r+4000}; //orbit radius 
float[] speed = {0.050,0.035,0.03,0.024,0.013,0.0096,0.0068,0.0054,0.0046}; //planet speed 
float[] planet_radius = {4.5, 12, 15, 6, 153, 124.5, 49.5, 46, 4.5}; //planet radius
color[] colors={color(204,153,51),color(255,204,153),color(51,204,0),color(255,0,0),color(255,255,204),color(102,255,255),color(51,153,255),color(0,0,255),color(0,0,255)};//planet color

PImage img;

void setup(){
  size(1200,800,P3D);
  planets[9]=new Planet(0,0,500,color(255,255,0)); //create sun
  for(int i=0;i<planets.length-1;i++){
    planets[i]=new Planet(speed[i],orbit_radius[i],planet_radius[i],colors[i]);//create planets
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e>0 ) {
    zoom+=50;
  }
  if (e<0 || zoom>-r/2 ) {
    zoom-=50;
  }
}

void keyPressed(){
  if(key=='o' || key=='O'){//show orbit
    showOrbit=0.2;
  }
  if(key=='p' || key=='P'){//hide orbit
    showOrbit=0;
  }
  if(key=='s' || key=='S'){//slower
    speedInc=0.5;
  }
  if(key=='f' || key=='F'){//faster
    speedInc=2;
  }
  if(key=='n' || key=='N'){//normal
    speedInc=1;
  }
}

void showText(){
  fill(255,255,255); 
  textSize(25);
  text("Solar System", 10, 30); 
  textSize(15);
  text("Show/Hise orbit - o/p", width-250, 30); 
  text("Faster/Slower/Normal - f/s/n", width-250, 50);
  text("Speed: "+speedInc, width-250, 70); 
  years+=speed[2]/6.25*speedInc;
  text("Years: "+years, width-250, 90); 
}

void draw(){
  background(0);
  lights(); //light
  showText();
  translate(width/2,height/2); //center camera 
  translate(0,0,zoom); //zoom
  rotateX(-mouseY*PI/(2*height)); //camera up and down
  for(int i=0;i<planets.length;i++){
    planets[i].show(); //update and show planet
  }
}
  
