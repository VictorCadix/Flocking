

class Boid{
  int number;   //For debug purpose only
  float size = 10;
  float maxAcel = 0.03;
  float maxVel = 2;
  
  float percep_radius = 50;
  float percep_angle = 90;
  
  float separ_gain = 1;
  float cohes_gain = 0.1;
  float align_gain = 0.7;
  
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
    Vector2D alignForce = new Vector2D (align(near_boids));
    Vector2D cohesForce = new Vector2D (cohesion(near_boids));
    Vector2D repulForce = new Vector2D (separation(near_boids));
    
    //if (near_boids.size() > 0){
    //  print(frameNumber);
    //  print("/" + number); //<>//
    //  print("/"); alignForce.print_();
    //  print("/"); cohesForce.print_();
    //  print("/"); repulForce.print_();
    //  println();
    //}
    
    acel.set(0,0);
    acel.add(alignForce.multiply_by(separ_gain));
    acel.add(cohesForce.multiply_by(cohes_gain));
    acel.add(repulForce.multiply_by(separ_gain));
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
    
    percep_radius = 50 + vel.getModule()/ maxVel * 50;
    percep_angle = 180 - vel.getModule()/ maxVel * 90;
  }
  
  void draw(){
    pos.set(newPos);
    vel.set(newVel);
    fill(255);
    stroke(1);
    ellipse(pos.x, pos.y, size, size);
    line(pos.x, pos.y, pos.x + vel.x*5, pos.y + vel.y*5);
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
    //force.setMagnitude(maxVel);
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
      //SEEK
      //force.setMagnitude(maxVel);
      //force.substract(vel);
    }
    
    return(force);
  }
  
  Vector2D separation(ArrayList <Boid> near_boids){
    Vector2D force = new Vector2D();
    pos_target.set(0,0);
    for(int i=0; i<near_boids.size(); i++){
      Vector2D dir = new Vector2D();
      dir.set(substract(this.pos,near_boids.get(i).pos));
      float mag = dir.getModule() - size;
      if (mag < 0){
        mag *= -1;
      }
      mag = mag/size; //Scale
      mag = 1/mag;
      dir.setMagnitude(mag);
      force.add(dir);
    }
    //if (near_boids.size() != 0){
      //force.divide_by(near_boids.size());
      //force.limit(maxAcel);
    //}   
    
    return(force);
  }
}
