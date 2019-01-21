
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
  
  void set (Vector2D v){
    this.x = v.x;
    this.y = v.y;
  }
  
  void add (Vector2D vector){
    this.x += vector.x;
    this.y += vector.y;
  }
  
  void multiply_by (float gain){
    this.x *= gain;
    this.y *= gain;
  }
  
  void divide_by (float div){
    this.x /= div;
    this.y /= div;
  }
  
  float getModule(){
    float mod = sqrt(x*x + y*y);
    return mod;
  }
  
  Vector2D getUnitVector(){
    float mod = this.getModule();
    Vector2D unit = new Vector2D();
    unit.x = this.x/mod;
    unit.y = this.y/mod;
    return(unit);
  }
  
  void set_unitary_values(Vector2D unit){
    float mod = this.getModule();
    unit.multiply_by(mod);
    this.set(unit);
  }
}
