PGraphics pg;

String [] fuentesEnergia = {"petroleo", "Carbon"};
int[] data = new int[256];
PImage image;
int mayor=0;

void setup() {
  size(900, 600);
  pg = createGraphics(800, 500);
  image = loadImage("hzd.jpeg");
}

void draw() {
  loadPixels();
  image.loadPixels();
  for( int x=0; x< width; x++){
    for(int y =0; y< height; y++){
      int loc = x+y*width;
      float r = red(image.pixels[loc]);
      float g = green(image.pixels[loc]);
      float b = blue(image.pixels[loc]);
      float prom = r*0.2126+g*0.7152+b*0.0722;
      int i= (int) prom;
      data[i] = data[i] +1;
      if (data[i] > mayor) {
        mayor=data[i];
      }
    }
  }
  
  float x = width*0.1;
  float y = height* 0.9;
  float delta = width *0.8 / data.length;
  float w = delta * 0.8;
  background(50);
  for(float value: data){
    float h = map( (value/mayor)*300 , 0, 100, 0, 150);
    fill(210,70,50);
    rect(x, y-h, w, h);
    x=x+delta;
  }
}