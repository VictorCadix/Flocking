
class Vector2D {
  float x;
  float y;
  
  Vector2D(){
    this.x = 0;
    this.y = 0;
  }
  
  Vector2D(Vector2D vect){
    this.x = vect.x;
    this.y = vect.y;
  }
  
  void set (float inX, float inY){
    this.x = inX;
    this.y = inY;
  }
  
  void set (Vector2D v){
    this.x = v.x;
    this.y = v.y;
  }
  
  void setRandom_with_maxMod (float maxMod){
    this.x = random(-1, 1);
    this.y = random(-1, 1);
    
    float magnitude = random(maxMod);
    this.setMagnitude(magnitude);
  }
  
  void setRandom_with_mod (float mod){
    this.x = random(-1, 1);
    this.y = random(-1, 1);
    
    this.setMagnitude(mod);
  }
  
  void add (Vector2D vector){
    this.x += vector.x;
    this.y += vector.y;
  }
  
  void substract (Vector2D vector){
    this.x -= vector.x;
    this.y -= vector.y;
  }
  
  Vector2D multiply_by (float gain){
    this.x *= gain;
    this.y *= gain;
    return this;
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
  
  void set_unitary_values(Vector2D unit){  //Change direction, maintain magnitude.
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
  
  void limit(float lim){
    if (this.getModule() > lim){
      this.setMagnitude(lim);
    }
  }
  
  void print_(){
    print("[" + str(this.x) + "," + str(this.y) + "]");
  }
}

Vector2D add (Vector2D vect1, Vector2D vect2){
  Vector2D sum = new Vector2D(vect1);
  sum.add(vect2);
  return sum;
}

Vector2D substract (Vector2D vect1, Vector2D vect2){
  Vector2D sum = new Vector2D(vect1);
  sum.substract(vect2);
  return sum;
}

float dotProduct(Vector2D vect1, Vector2D vect2){
  float result;
  result = vect1.x * vect2.x + vect1.y * vect2.y;
  return result;
}

float angle_between(Vector2D vect1, Vector2D vect2){
  float num = dotProduct(vect1, vect2);
  float den = vect1.getModule() * vect2.getModule();
  float result = acos(num/den);
  result = degrees(result);
  return result;
}
