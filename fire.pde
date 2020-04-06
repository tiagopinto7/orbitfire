int num = 80;
int dist = 10;
float increment = 0.02;
float inc = 0.02;

float distinc = 0;

ArrayList<Orbit> orbits = new ArrayList<Orbit>();


void setup() //<>//
{
  fullScreen(P2D);
  //size(800,800, P2D);
  
  int xOff = (width - ((num-1)*dist))/2;
  int yOff = (height - ((num-1)*dist))/2;
  
  for(int i=0; i<num; i++)
  {
    for(int j=0; j<num; j++)
    {
      int orbx = i * dist + xOff;
      int orby = j * dist + yOff;
      orbits.add(new Orbit(orbx , orby , 0.1, 0));
    }
  }
  
}


void draw()
{
  fill(10,10,10);
  rect(0,0,width,height);
  
  for(Orbit orbit: orbits)
  {
    float noiseval = noise(orbit.x*0.004, orbit.y*0.004 + inc); //<>//
    float vel = noiseval*2*PI;
    orbit.angvel = 0.1;
    orbit.phase = vel;
    orbit.dist = 40;
    orbit.radius =(int) (40 * noiseval);
    orbit.shader = true;
    orbit.Draw();
  }
  inc+= 0.02;
  distinc+=1;
  
  //saveFrame("output/out####.png");
}
