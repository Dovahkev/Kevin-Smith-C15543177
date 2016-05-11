
int amt = 20;

float [] startX = new float[amt];
float [] cloudR = new float[amt];
float [] cloudY = new float[amt];
float [] speed = new float[amt];

float planeX = -100;
float planeS = 3;

void setup()
{
  size(900 ,600);
  noStroke();
  
    for (int i = 0; i < startX.length; i++)
    {
      startX[i] = random(width, width + width /2);
    }
    
     for (int i = 0; i < cloudR.length; i++)
    {
      cloudR[i] = random(5,20);
    }
    
    for(int i = 0; i < cloudY.length; i++)
    {
      cloudY[i] = random(50,height * 0.3f);
    }
    
    for(int i = 0; i < speed.length; i++)
    {
      speed[i] = random(1,3);
    }
}

void draw()
{
  background(0,50,155);
  
    for(int i = 0; i < startX.length; i++)
    {
      drawCloud(startX[i],cloudY[i],cloudR[i]);
      
      startX[i] -= speed[i];
      
      if(startX[i] + cloudR[i] * 3 < 0)
      {
       startX[i] = width;
      }
    }
    
    plane(planeX, height * 0.25f);
    
    planeX += planeS;
    
    if(planeX - 80 > width)
    {
      planeX = -100;
    }
  
  
}

void drawCloud(float x,float y, float r)
{
  float centerC = r * 3;
  float cloudW = r * 2;

  fill(255);
  //cloud shape
  ellipse(x + r, y, cloudW, cloudW);
  ellipse(x,y,centerC,centerC);
  ellipse(x - r,y,cloudW, cloudW);
  
}

void plane(float x, float y)
{
  
  fill(0,0,0,155);
  //cockpit
  ellipse(x,y,40,20);
 
  fill(255,0,0);
  //main Body
  rect(x - 20,y,40,20);
  triangle(x-20,y,x - 80,y,x-20, y + 20);
  triangle(x-80,y,x-80,y-20,x-40,y);
  ellipse(x + 20, y + 10,80,20);
  
  //shadows+highlights
  fill(155,0,0);
  ellipse(x-40,y + 10,40,10);
  

 
  
}
