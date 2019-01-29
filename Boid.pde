
class Boid{
  float size = 10;
  float maxAcel = 0.05;
  float maxVel = 2;
  
  Vector2D pos;
  Vector2D vel;
  Vector2D acel;
  
  Vector2D pos_target;
  Vector2D vel_target;
  
  Boid(){
    pos = new Vector2D();
    vel = new Vector2D();
    acel = new Vector2D();
    pos_target = new Vector2D();
    vel_target = new Vector2D();
  }
  
  void update(ArrayList <Boid> near_boids){
    acel.set(0,0);
    println(alignSlider.getPos());
    acel.add(this.align(near_boids).multiply_by(alignSlider.getPos()));
    acel.add(this.cohesion(near_boids).multiply_by(cohesionSlider.getPos()));
    acel.add(this.separation(near_boids).multiply_by(separationSlider.getPos()));
    
    vel.add(acel);
    pos.add(vel);
    
    if(pos.x > width){
      pos.x = 0;
    }
    else if(pos.x < 0){
      pos.x = width;
    }
    if(pos.y > height){
      pos.y = 0;
    }
    else if(pos.y < 0){
      pos.y = height;
    }
  }
  
  void draw(){
    fill(255);
    stroke(1);
    ellipse(pos.x, pos.y, size, size);
  }
  
  float dist2(Boid other){
    Vector2D dist = new Vector2D();
    dist.set(this.pos);
    dist.substract(other.pos);
    return(abs(dist.getModule()));
  }
  
  Vector2D align(ArrayList <Boid> near_boids){
    vel_target.set(0,0);
    for(int i=0; i<near_boids.size(); i++){ //<>//
      vel_target.add(near_boids.get(i).vel);
    }
    if (near_boids.size() != 0){
      vel_target.divide_by(near_boids.size());
    }
    else{
      vel_target.set(vel);
    }
    
    Vector2D force = new Vector2D(vel_target);
    force.setMagnitude(maxVel);
    force.substract(vel);
    if (force.getModule() > maxAcel){
      force.setMagnitude(maxAcel);
    }
    return(force);
  }
  
  Vector2D cohesion(ArrayList <Boid> near_boids){
    Vector2D force = new Vector2D();
    pos_target.set(0,0);
    for(int i=0; i<near_boids.size(); i++){
      pos_target.add(near_boids.get(i).pos);
    }
    if (near_boids.size() != 0){
      pos_target.divide_by(near_boids.size());
      
      force.set(pos_target);
      force.substract(pos);
      force.setMagnitude(maxVel);
      force.substract(vel);
      if (force.getModule() > maxAcel){
        force.setMagnitude(maxAcel);
      }
    }   
    
    return(force);
  }
  
  Vector2D separation(ArrayList <Boid> near_boids){
    Vector2D force = new Vector2D();
    pos_target.set(0,0);
    for(int i=0; i<near_boids.size(); i++){
      Vector2D dir = new Vector2D();
      dir.set(substract(this.pos,near_boids.get(i).pos));
      float mag = 1/dir.getModule();
      dir.setMagnitude(mag);
      force.add(dir);
    }
    if (near_boids.size() != 0){
      force.divide_by(near_boids.size());
      force.setMagnitude(maxVel);
      force.substract(vel);
      
      if (force.getModule() > maxAcel){
        force.setMagnitude(maxAcel);
      }
    }   
    
    return(force);
  }
}
