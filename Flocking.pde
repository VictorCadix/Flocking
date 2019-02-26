Flock flock;

int frameNumber = 0;

void setup(){
  size(600,600);
  
  flock = new Flock(50);
}

void draw(){
  frameNumber++;
  background(200);
  flock.update();
  flock.draw();
}
