
class Boid{
  float size = 10;
  
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
  }
  
  void update(){
    vel.add(acel);
    pos.add(vel);
    
    if(pos.x > width){
      pos.x = 0;
    }
    if(pos.y > height){
      pos.x = 0;
    }
  }
  void draw(){
    ellipse(pos.x, pos.y, size, size);
  }
  
}

class Vector2D {
  float x;
  float y;
  
  void set (float inX, float inY){
    this.x = inX;
    this.y = inY;
  }
  
  void add (Vector2D vector){
    this.x += vector.x;
    this.y += vector.y;
  }
  
  float getModule(){
    float mod = sqrt(x*x + y*y);
    return mod;
  }
}