


float [] startX = new float[amt];
float [] cloudR = new float[amt];
float [] cloudY = new float[amt]

void setup()
{
  size(600 ,600);
  noStroke();
  
    for (int i = 0; i < startX.length; i++)
    {
      startX[i] = random(width, width + width /2);
    }
    
     for (int i = 0; i < cloudR.length; i++)
    {
      cloudR[i] = random(5,20);
    }
}

void draw()
{
  background(0);
  
    for(int i = 0; i < startX.length; i++)
    {
      drawCloud(startX[i],200,cloudR[i]);
      
      startX[i] --;
      
      if(startX[i] + cloudR[i] * 3 < 0)
      {
       startX[i] = width;
      }
    }
  
  
}

void drawCloud(float x,float y, float r)
{
  float centerC = r * 2;

  
  //cloud shape
  ellipse(x + r, y, r, r);
  ellipse(x,y,centerC,centerC);
  ellipse(x - r,y,r,r);
  
}
