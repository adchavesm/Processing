PImage image;
int size=15;
float[][] kernel = new float[size][size];
//Desviación estándar 
float sigma = 15.0; 
    
//Suma para normalizar el kernel después 
float sum = 0.0; 
    
int mid = size/2;

void setup(){
  size(1080, 720);
  image = loadImage("hzd.jpeg");
  print(image);
  image.resize(1080,720);
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

void draw(){
  loadPixels();
  image.loadPixels();
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
            rb = rb + red(image.pixels[loc-(width*z)-(v)])* kernel[a][b] ;
            gb = gb + green(image.pixels[loc-(width*z)-(v)])* kernel[a][b] ;
            bb = bb + blue(image.pixels[loc-(width*z)-(v)])* kernel[a][b] ;
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