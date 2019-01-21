
class Flock{
  ArrayList <Boid> boids;
    
  Flock(int total){
    boids = new ArrayList <Boid>();
    
    for(int i=0; i<total; i++){
      Boid boid = new Boid();
      boid.vel.setRandom_with_maxMod(2);
      boid.pos.set(random(width), random(height));
      boids.add(boid);
    }
  }
  
  void update(){
    for (int n=0; n<boids.size(); n++){
      ArrayList <Boid> near_boids;
      near_boids = new ArrayList <Boid>();
      
      for (int i=0; i<boids.size(); i++){
        if (i == n){
          continue;
        }
        float dist = boids.get(n).dist2(boids.get(i));
        if (dist < 100){
          near_boids.add(boids.get(i));
        }
      }
      boids.get(n).update(near_boids);
    }
    println("FRAME");
    for (int n=0; n<boids.size(); n++){
      boids.get(n).vel.print_();
      println();
    }
  }
  
  void draw(){
    for (Boid boid : boids){
      boid.draw();
    }
  }
}
