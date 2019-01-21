Flock flock;

void setup(){
  size(600,600);
  
  flock = new Flock(100);
}

void draw(){
  background(200);
  flock.draw();
  flock.update();
  
}
