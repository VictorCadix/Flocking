class Obstacle{
  int radio;
  Vector2D pos;
  boolean active_state;
  
  Obstacle(int r, float posX, float posY){
    radio = r;
    pos = new Vector2D(posX, posY);
    active_state = false;
  }
  
  void draw(){
    if (active_state){
      fill(255,0,0);
      ellipse(pos.x, pos.y, radio, radio);
    }
  }
}
