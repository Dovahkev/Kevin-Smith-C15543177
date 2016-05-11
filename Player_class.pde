class Player
{
 float x,y,w,h;
 
 Player(float posX, float posY, float pW, float pH)
{
  x = posX;
  y = posY;
  w = pW;
  h = pH;
} 

void update()
{
  fill(255,255,200);
  
  rect(x,y,w,h);
  
  if(boxY < height * 0.7f)
  {
    if(x >= playerX)
    {
      x--;
    }
    
    if(x <= playerX)
    {
      x++;
    }
    
  }
  
  
  if(boxY > height * 0.7f)
  {
    
    if(x < boxX)
    {
      x ++;
    }
    
    else if (x> boxX)
    {
      x--;
    }
    
    if( y > boxY --)
    {
      y --;
    }
    
    else if( y < boxY)
    {
      y++;
    }
  }
}
  
}
