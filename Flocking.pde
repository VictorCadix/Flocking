Flock flock;
Obstacle obstacle;

int frameNumber = 0;

void setup(){
  size(600,600);
  
  flock = new Flock(50);
  obstacle = new Obstacle(20,mouseX,mouseY);
}

void draw(){
  frameNumber++;
  background(200);
  obstacle.pos.set(mouseX,mouseY);
  flock.update(obstacle);
  flock.draw();
  obstacle.draw();
}

void keyPressed() {
  if (key == 'o'){
    obstacle.active_state = !obstacle.active_state;
  }
}
