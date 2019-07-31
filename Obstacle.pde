class Obstacle{
  int radio;
  Vector2D pos;
  
  Obstacle(int r, float posX, float posY){
    radio = r;
    pos = new Vector2D(posX, posY);
  }
  
  void draw(){
    ellipse(pos.x, pos.y, radio, radio);
  }
}
