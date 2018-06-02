//Adam Małota
//Solar system
//UŚ 2018

Planet[] planets = new Planet[10]; // count of planets
float showOrbit=0.2;
int zoom =0;
float speedInc=1;
float years;

float camera;

float r = 500; //sun radius
float[] orbit_radius = {r+40,r+80,r+100,r+160,r+520,r+1000,r+2000,r+3000,r+4000}; //orbit radius 
float[] speed = {0.050,0.035,0.03,0.024,0.013,0.0096,0.0068,0.0054,0.0046}; //planet speed 
float[] planet_radius = {4.5, 12, 15, 6, 153, 124.5, 49.5, 46, 4.5}; //planet radius
color[] colors={color(204,153,51),color(255,204,153),color(51,204,0),color(255,0,0),color(255,255,204),color(102,255,255),color(51,153,255),color(0,0,255),color(0,0,255)};//planet color

PImage img;

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
  if(key=='v' || key=='V'){//3d
    D2();
  }
  if(key=='c' || key=='C'){//2d
    loop();
  }
}

void setup(){
  size(1200,800,P3D);
  planets[9]=new Planet(0,0,500,color(255,255,0)); //create sun
  for(int i=0;i<planets.length-1;i++){
    planets[i]=new Planet(speed[i],orbit_radius[i],planet_radius[i],colors[i]);//create planets
  }
}

void D2(){
    noLoop();
    background(0);
    //camera=0;
    rotateX(-camera);
    translate(0,0,-zoom);
    float scal=width/9;
    ellipse(0,0,height,height);//sun
    fill(204,153,51);
    ellipse(-4*scal,0,height/300,height/300);
    fill(255,204,153);
    ellipse(-3*scal,0,height/125,height/125);
    fill(51,204,0);
    ellipse(-2*scal,0,height/100,height/100);//earth
    fill(255,0,0);
    ellipse(-scal,0,height/250,height/250);
    fill(255,255,204);
    ellipse(0,0,height/10,height/10);
    fill(102,255,255);
    ellipse(scal,0,height/12,height/12);
    fill(51,153,255);
    ellipse(2*scal,0,height/30,height/30);
    fill(0,0,255);
    ellipse(3*scal,0,height/33,height/33);
    fill(0,0,255);
    ellipse(4*scal,0,height/300,height/300);
    fill(0,0,0); 
    textSize(15);
    text("          Sun", -75, -height/3);
    text(" Radius: 695508 km", -75, -height/3+25);
    text("Weight: 1,989E30 kg", -75, -height/3+50);
    fill(255,255,255); 
    text("          Mercury", -4*scal-50, 25);
    text(" Radius: 2440 km", -4*scal-50, 50);
    text("Weight: 3,285E23 kg", -4*scal-50, 75);
    text("To Sun: 58 mln km", -4*scal-50, 100);
    fill(255,255,255); 
    text(" Radius:", -3*scal-50, -50);
    text("Weight:", -3*scal-50, -75);
    text("To Sun:", -3*scal-50, -100);
    fill(0,0,0); 
    text("          Venus", -3*scal-40, -25);
    text("6052 km", -3*scal+20, -50);
    text("4,867E24 kg", -3*scal+20, -75);
    text("108,2 mln km", -3*scal+20, -100);
    text("          Earth", -2*scal-50, 25);
    text("Radius: 6371 km", -2*scal-50, 50);
    text("Weight: 5,972E24 kg", -2*scal-50, 75);
    text("To Sun: 149,6 mln km", -2*scal-50, 100);
    text("        Moon: 1", -2*scal-50, 125);
    text("          Mars", -scal-50, -25);
    text("Radius: 3389 km", -scal-50, -50);
    text("Weight: 6,417E23 kg", -scal-50, -75);
    text("To Sun: 228 mln km", -scal-50, -100);
    text("        Moon: 2", -scal-50, -125);
    text("          Jupiter", -50, 50);
    text("Radius: 69911 km", -50, 75);
    text("Weight: 1,89E27 kg", -50, 100);
    text("To Sun: 779 mln km", -50, 125);
    text("        Moon: 69", -50, 150);
    text("          Saturn", scal-50, -50);
    text("Radius: 58232 km", scal-50, -75);
    text("Weight: 5,683E26 kg", scal-50, -100);
    text("To Sun: 1,43 mld km", scal-50, -125);
    text("        Moon: 62", scal-50, -150);
    text("          Uranus", 2*scal-50, 50);
    text("Radius: 25362 km", 2*scal-50, 75);
    text("Weight: 8,68E25 kg", 2*scal-50, 100);
    text("To Sun: 2,87 mld km", 2*scal-50, 125);
    text("        Moon: 27", 2*scal-50, 150);
    text("Radius:", 3*scal-70, -50);
    text("Weight:", 3*scal-70, -75);
    text("To Sun:", 3*scal-70, -100);
    fill(255,255,255); 
    text("          Neptune", 3*scal-40, -25);
    text("24622 km", 3*scal+20, -50);
    text("1,024E26 kg", 3*scal+20, -75);
    text("4,5 mld km", 3*scal+20, -100);
    text("        Moon: 14", 3*scal-40, -125);
    text("          Pluto", 4*scal-80, 25);
    text("Radius: 1188 km", 4*scal-80, 50);
    text("Weight: 1,303E22 kg", 4*scal-80, 75);
    text("To Sun: ~6 mld km", 4*scal-80, 100);
    text("        Moon: 5", 4*scal-80, 125);
    text("NOT A PLANET", 4*scal-80, 150);
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
  text("Information v/c ", width-250, 110); 
}

void draw(){
  background(0);
  lights(); //light
  showText();
  translate(width/2,height/2); //center camera 
  translate(0,0,zoom); //zoom
  camera=-mouseY*PI/(2*height);
  rotateX(camera); //camera up and down
  for(int i=0;i<planets.length;i++){
    planets[i].show(); //update and show planet
  }
}
  
