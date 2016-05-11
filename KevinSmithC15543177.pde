
int amt = 20;

float [] startX = new float[amt];
float [] cloudR = new float[amt];
float [] cloudY = new float[amt];
float [] speed = new float[amt];

float planeX = -100;
float planeY = 150;
float planeS = 3;

float boxX;
float boxY;
float boxS = 3;

float playerX = 100;
float playerY = 400;

Player player = new Player(100,420,20,60);

Box box;



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
      cloudY[i] = random(50,height * 0.25f);
    }
    
    for(int i = 0; i < speed.length; i++)
    {
      speed[i] = random(1,3);
    }
}

void draw()
{
  
   
    world();
    
    player.update();

    
    if(key ==' ')
    {
      boxX = planeX;
      box = new Box(boxX,boxY,20,20);
      
      if(boxY < height * 0.8f)
      {
        boxY += boxS;
        
      }
      
      box.update();
      
    }
    
    else
    boxY = 150;
    
  
    for(int i = 0; i < startX.length; i++)
    {
      drawCloud(startX[i],cloudY[i],cloudR[i]);
      
      startX[i] -= speed[i];
      
      if(startX[i] + cloudR[i] * 3 < 0)
      {
       startX[i] = width + cloudR[i] * 3;
      }
    }
    
    plane(planeX,planeY);
    
    planeX += planeS;
    
    if(planeX - 80 > width)
    {
      planeX = -100;
    }
}

void drawCloud(float x,float y, float r)
{
  //this gives the clouds different sizes
  float centerC = r * 3;
  float cloudW = r * 2;

  fill(255,255,255,250);
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
 // ellipse(x-40,y + 10,25,5);
  quad(x-10,y+10,x - 20, y+ 15, x - 10, y + 30, x + 30,y+10);
  triangle(x - 60,y,x -30, y+10, x - 50, y + 20);
}


void world()
{
  //sky and ground
  background(0,50,155);
  fill(30,155,20);
  rect(0,height * 0.75f,width, height * 0.75f);
}
