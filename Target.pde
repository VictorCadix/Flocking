class Target{
  int radio;
  Vector2D pos;
  boolean active_state;
  boolean show_state;
  
  Target(int r, float posX, float posY){
    radio = r;
    pos = new Vector2D(posX, posY);
    show_state = false;
    active_state = false;
  }
  // Copy constructor
  Target(Target t){
    radio = t.radio;
    pos = new Vector2D(t.pos);
    show_state = t.show_state;
    active_state = t.active_state;
  }
  
  void draw(){
    if (show_state){
      fill(0,255,0);
      ellipse(pos.x, pos.y, radio, radio);
    }
  }
}
