
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
  
  void setRandom_with_mod (float maxMod){
    this.x = random(-1, 1);
    this.y = random(-1, 1);
    
    float magnitude = random(maxMod);
    this.setMagnitude(magnitude);
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
  
  void setMagnitude(float mag){
    Vector2D v = new Vector2D();
    v = this.getUnitVector();
    v.multiply_by(mag);
    this.set(v);
  }
}
