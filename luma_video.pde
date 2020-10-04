import processing.video.*;
Movie myMovie;

void setup() {
  size(1280, 720);
  background(0);
  myMovie = new Movie(this, "test.mp4");
  myMovie.loop();
  
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
    float r = red(myMovie.pixels[loc]);
    float g = green(myMovie.pixels[loc]);
    float b = blue(myMovie.pixels[loc]);
    float prom = r*0.299+g*0.587+b*0.114;
    pixels[loc]=color(prom,prom,prom);
    }
  }
  updatePixels();
}