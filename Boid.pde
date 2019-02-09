
class Boid{
  int number;   //For debug purpose only
  float size = 10;
  float maxAcel = 0.05;
  float maxVel = 2;
  
  Vector2D pos;
  Vector2D vel;
  Vector2D acel;
  
  Vector2D newPos;
  Vector2D newVel;
  Vector2D newAcel;
  
  Vector2D pos_target;
  Vector2D vel_target;
  
  Boid(int num){
    number = num;
    pos = new Vector2D();
    vel = new Vector2D();
    acel = new Vector2D();
    
    newPos = new Vector2D();
    newVel = new Vector2D();
    newAcel = new Vector2D();
    
    pos_target = new Vector2D();
    vel_target = new Vector2D();
  }
  
  void update(ArrayList <Boid> near_boids){
    acel.set(0,0);
    acel.add(this.align(near_boids).multiply_by(alignSlider.getPos()/100));
    acel.add(this.cohesion(near_boids).multiply_by(cohesionSlider.getPos()/100));
    acel.add(this.separation(near_boids).multiply_by(separationSlider.getPos()/100));
    acel.limit(maxAcel);  
    
    newVel.add(acel);
    newVel.limit(maxVel);
    newPos.add(newVel);
    
    if(newPos.x > width){
      newPos.x = 0;
    }
    else if(newPos.x < 0){
      newPos.x = width;
    }
    if(newPos.y > height){
      newPos.y = 0;
    }
    else if(newPos.y < 0){
      newPos.y = height;
    }
  }
  
  void draw(){
    pos.set(newPos);
    vel.set(newVel);
    fill(255);
    stroke(1);
    ellipse(pos.x, pos.y, size, size);
  }
  
  float dist2(Boid other){
    Vector2D dist = new Vector2D();
    dist.set(this.pos);
    dist.substract(other.pos);
    return(dist.getModule());
  }
  
  Vector2D align(ArrayList <Boid> near_boids){
    vel_target.set(0,0);
    for(int i=0; i<near_boids.size(); i++){
      vel_target.add(near_boids.get(i).vel);
    }
    if (near_boids.size() != 0){
      vel_target.divide_by(near_boids.size());
    }
    else{
      vel_target.set(vel);
    }
    
    Vector2D force = new Vector2D(vel_target);
    force.substract(vel);
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
    }
    
    return(force);
  }
  
  Vector2D separation(ArrayList <Boid> near_boids){
    Vector2D force = new Vector2D();
    pos_target.set(0,0);
    for(int i=0; i<near_boids.size(); i++){
      Vector2D dir = new Vector2D();
      dir.set(substract(this.pos,near_boids.get(i).pos));
      float mag = dir.getModule();
      mag = 1/(mag * mag);
      dir.setMagnitude(mag);
      force.add(dir);
    }
    if (near_boids.size() != 0){
      force.divide_by(near_boids.size());
    }   
    
    return(force);
  }
}
