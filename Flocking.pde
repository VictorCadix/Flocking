Flock flock;
Obstacle obstacle;
Target target;
ArrayList <Target> targets;

int frameNumber = 0;

void setup(){
  size(600,600);
  
  flock = new Flock(50);
  obstacle = new Obstacle(20,mouseX,mouseY);
  target = new Target(15,mouseX,mouseY);
  targets = new ArrayList <Target>();
}

void draw(){
  frameNumber++;
  background(200);
  obstacle.pos.set(mouseX,mouseY);
  target.pos.set(mouseX,mouseY);
  flock.update(obstacle);
  flock.draw();
  obstacle.draw();
  target.draw();
  
  for(Target t : targets){
    t.draw();
  } //<>//
}

void keyPressed() {
  if (key == 'o'){
    obstacle.active_state = !obstacle.active_state;
  }
  else if(key == 't'){
    target.show_state = !target.show_state;
  }
}

void mouseReleased(){
  if (target.show_state){
    Target t = new Target(target);
    targets.add(t);
  }
}
