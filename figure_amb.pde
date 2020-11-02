float y = 50.0;
float velocidad = 3.0;
float radio = 55.0;
float constx=-4;
float consty=-0.4;
float count = 1;
float movx = 0;
float movy = 0;
boolean a = false ;

void setup(){
   size (900,500);
 }
 
 void draw(){
   background(255);
   translate(00,500);
   stroke(204, 102, 0);
   //   X1    Y1    X2   Y2
   line(600, -400, 800, -225);
   line(575, -350, 675, -260);
   line(575, -300, 630, -254.5);
   line(600, -400, 100, -345);
   ellipse(100, -322, 25 , 50);
   line(575, -350, 100, -298);
   line(575, -300, 199, -260);
   ellipse(199, -235, 25 , 50);
   line(675, -260, 199, -211);
   line(800, -225, 298, -171);
   ellipse(298, -146 , 25 , 50);
   line(800, -175, 298, -122);
   line(575, -350, 575, -300);
   line(800, -225, 800, -175);
   line(600, -400, 800, -225);
   line(575, -350, 675, -260);
   fill(255,0,0);
   if (a == false) {
     circle(630+(movx), -245 - (movy), 55);
   }else{
     circle(590+(movx), -390 - ( movy), 50);  
   }
   fill(255,255,255);
   if (movy < -100){
     a = !a;
     movx=0;
     movy=0;
     constx=-5;
     consty=-0.5;
   }
   
   if (movx < -350 && a == false) {
     
     constx= -0.5;
     consty= -1;
   }
   if (movx < -550 && a == true) {
     
     constx= -0.5;
     consty= -1;
   }
   
   //count++;
   movx= movx + constx ;
   movy= movy + consty ;
   
 }