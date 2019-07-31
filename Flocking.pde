Flock flock;
Obstacle obstacle;

int frameNumber = 0;

void setup(){
  size(600,600);
  
  flock = new Flock(50);
  obstacle = new Obstacle(10,mouseX,mouseY);
}

void draw(){
  frameNumber++;
  background(200);
  flock.update();
  obstacle.pos.set(mouseX,mouseY);
  flock.draw();
  obstacle.draw();
}
