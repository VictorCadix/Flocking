
class Flock{
  ArrayList <Boid> boids;
    
  Flock(int total){
    boids = new ArrayList <Boid>();
    
    for(int i=0; i<total; i++){
      Boid boid = new Boid();
      boid.vel.setRandom_with_mod(2);
      boid.pos.set(random(width), random(height));
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
