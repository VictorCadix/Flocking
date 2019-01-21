
class Flock{
  ArrayList <Boid> boids;
    
  Flock(int total){
    boids = new ArrayList <Boid>();
    
    for(int i=0; i<total; i++){
      Boid boid = new Boid();
      boids.add(boid);
    }
        
    Boid b1 = boids.get(0);
    b1.vel.set(0.2,0);
    b1.pos.set(width/2, height/2);
    
    Boid b2 = boids.get(1);
    b2.vel.set(0.1,0.1);
    b2.pos.set(width/2, height/2);
  }
  
  void draw(){
    for (Boid boid : boids){
      boid.update();
      boid.draw();
    }
  }
}
