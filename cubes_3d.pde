float xmag, ymag = 0;
float newXmag, newYmag = 0; 
 
void setup()  { 
  size(640, 360, P3D); 
  //noStroke(); 
  //colorMode(RGB, 1); 
} 
 
void draw()  { 
  println(mouseX);
  background(0.5);
  
  translate(width/2, height/2, -30); 
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  
  box(50);fill(255,245,89);
  
  translate(0, 0, 50); box(50);fill(155,45,89);
  translate(0, 0, 50); box(50);fill(50,45,89);
  translate(0, 0, -50);
  translate(0, 0, -50); 
  translate(50, 0, 0); box(50);fill(255,0,123);
  translate(50, 0, 0); box(50);fill(22,0,123);
  translate(-100, 0, 0); 
  translate(0, 50, 0); box(50);fill(67,0,0);
  translate(0, 50, 0); box(50);fill(0,123,0);
  translate(0, -50, 50); box(50);fill(255,0,0);
  translate(50, -0, 0); box(50);fill(5,255,0);
  translate(0, -50, 0); box(50);fill(132,12,155);
  translate(0, 50, -50); box(50);
  

  
}