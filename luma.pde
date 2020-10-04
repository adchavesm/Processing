PImage image;
void setup(){
  size(1080, 720);
  image = loadImage("hzd.jpeg");
  print(image);
  image.resize(1080,720);
}

void draw(){
  loadPixels();
  image.loadPixels();
  for( int x=0; x< width; x++){
    for(int y =0; y< height; y++){
      int loc = x+y*width;
      float r = red(image.pixels[loc]);
      float g = green(image.pixels[loc]);
      float b = blue(image.pixels[loc]);
      float prom = r*0.299+g*0.587+b*0.114;
      pixels[loc]=color(prom,prom,prom);
    }
  }
  updatePixels();
}