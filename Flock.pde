
class Flock{
  ArrayList <Boid> boids;
    
  Flock(int total){
    boids = new ArrayList <Boid>();
    
    for(int i=0; i<total; i++){
      Boid boid = new Boid(i);
      boid.newVel.setRandom_with_maxMod(2);
      boid.newPos.set(random(width), random(height));
      boid.vel.set(boid.newVel);
      boid.pos.set(boid.newPos);
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
        if (dist < 50){
          Vector2D distVect = substract(boids.get(i).pos, boids.get(n).pos);
          float angle = angle_between(boids.get(n).vel, distVect);
          if (angle < 90){
            near_boids.add(boids.get(i));
          }
        }
      }
      boids.get(n).update(near_boids);
    }
  }
  
  void draw(){
    for (Boid boid : boids){
      boid.draw();
    }
  }
}
