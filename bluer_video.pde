import processing.video.*;
Movie myMovie;
int size=7;
float[][] kernel = new float[size][size];
//Desviación estándar 
float sigma = 15.0; 
    
//Suma para normalizar el kernel después 
float sum = 0.0; 
    
int mid = size/2;

void setup() {
  size(1280, 720);
  background(0);
  myMovie = new Movie(this, "test.mp4");
  myMovie.loop();
  
  for (int x = -mid; x <= mid; x++) { 
        for (int y = -mid; y <= mid; y++) { 
            kernel[x + mid][y + mid] = exp(-(x * x + y * y) / (2 * sigma * sigma)) / (2 * 3.1416 * sigma * sigma); 
            sum += kernel[x + mid][y + mid]; 
        } 
    } 
    //Normalización del kernel para un efecto mas limpio en el blurring
    for (int i = 0; i < size; ++i) {
      for (int j = 0; j < size; ++j) {
        kernel[i][j] /= sum; 
      }
    }
  
  
}

void draw() {
  //image(myMovie, 0, 0);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {

   m.read();
   loadPixels();
   myMovie.loadPixels();
   for( int x=0; x< width; x++){
     for(int y =0; y< height; y++){
      int loc = x+y*width;
      if (x <10 || y<10 || y> height-10 || x > width-10){
         pixels[loc]=color(0,0,0);
      }else{
        float rb=0;
        float gb=0;
        float bb=0;
        int a=0;
        int b=0;
        for (int z= -mid; z <= mid; z++){
          for (int v= -mid; v <= mid; v++){
            //println(red(myMovie.pixels[loc-(width*z)-(v)]));
            rb = rb + red(myMovie.pixels[loc-(width*z)-(v)])* kernel[a][b] ;
            gb = gb + green(myMovie.pixels[loc-(width*z)-(v)])* kernel[a][b] ;
            bb = bb + blue(myMovie.pixels[loc-(width*z)-(v)])* kernel[a][b] ;
            a++;
          }
          b++;
          a=0;
        }
        pixels[loc]=color(rb,gb,bb);
      }
    }
  }
  updatePixels();
}