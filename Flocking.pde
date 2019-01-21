Flock flock;

void setup(){
  size(600,600);
  
  flock = new Flock(20);
}

void draw(){
  background(200);
  flock.update();
  flock.draw();  
}
