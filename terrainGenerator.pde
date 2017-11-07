int cols,rows;
int scale;
int w = 1200;
int h = 1600;
float flying = 0;

float[][] terrain;
void setup() {
  size(600, 600, P3D);
  scale = (int) random(20.0123451423) + 5;
  cols = w/scale;
  rows = h/scale;
  terrain = new float[cols][rows];
}

void draw() {
  
  flying -= 0.1; 
 
  float yoff = flying;
  for(int y = 0; y < rows; y++) {
    float xoff = 0;
    for(int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff,yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
  background(0);
  stroke(244,244,96);
  fill(244,164,96);
  
  translate(width/2 + 50,height/2 + 100);
  rotateX(PI/3);
  frameRate(1);
  
  translate(-w/2,-h/2);
  for(int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++) {
      vertex(x*scale,y*scale, terrain[x][y]);
      vertex(x*scale,(y+1)*scale, terrain[x][y+1]);
    }
    endShape();
  }
}