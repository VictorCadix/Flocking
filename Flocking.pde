Flock flock;

void setup(){
  size(600,600);
  
  flock = new Flock(50);
}

void draw(){
  background(200);
  flock.update();
  flock.draw();  
}
