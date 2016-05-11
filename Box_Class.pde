class Box
{
  
  float x,y,w,h;
  
  Box(float cX, float cY, float cW, float cH)
  {
    x = cX;
    y = cY;
    w = cW;
    h = cH;
  }
  
  void update()
  {
    
    fill(255);
    
    rect(x,y,w,h);
  }
  
}
