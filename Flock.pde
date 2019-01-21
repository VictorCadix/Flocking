
class Flock{
  ArrayList <Boid> boids;
    
  Flock(int total){
    boids = new ArrayList <Boid>();
    
    for(int i=0; i<total; i++){
      Boid boid = new Boid();
      boid.vel.setRandom(1);
      boid.pos.set(width/2, height/2);
      boids.add(boid);
    }
  }
  
  void draw(){
    for (Boid boid : boids){
      boid.update();
      boid.draw();
    }
  }
}
