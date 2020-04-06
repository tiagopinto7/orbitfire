class Orbit
{
  private
    float t= 0;
    int moonx;
    int moony;
    boolean shader = false;
  
  public
    int x;
    int y;
    int radius = 20;
    float angvel = 0.05;
    float phase = 0;
    int dist = 15;
    boolean dinamicRadius = false;
    
    
    
    Orbit(int xval, int yval, float angvelval, float phaseval)
    {
      x = xval;
      y = yval;
      angvel = angvelval;
      phase = phaseval;
    }
    
    Orbit(int xval, int yval, int radiusval, float angvelval, float phaseval, int distval)
    {
      x = xval;
      y = yval;
      radius = radiusval;
      phase = phaseval;
      angvel = angvelval;
      dist = distval;
    }
    
    void Draw()
    {
      if(shader)
      {
        this.DisplayShader();
      }
      else
      {
        DisplaySimple();
      }
     
    }
    
    void DisplaySimple()
    {
      float dinamic_radius = radius;
      float dinamic_value = (cos(t+phase) + sin(t+phase));
      if(dinamicRadius)
      {
        dinamic_radius = radius - dinamic_value*5 ;
      }
      noStroke();
      colorMode(RGB, 100);
      fill(255,255,0);
      
      moonx = (int)(x + dist*cos(t+phase));
      moony = (int)((float)y + sin(t+phase)*(float)dist);
      circle(moonx, moony, dinamic_radius);
      //square(moonx, moony, dinamic_radius);
      //circle(moonx, moony, radius);
      t = t + angvel;
    }
    
    void DisplayShader()
    {
      float dinamic_value = (cos(t+phase) + sin(t+phase));
      float dinamic_radius = radius - dinamic_value*5 ;
      noStroke();
      //noFill();
      //circle(x, y, radius);
      //colorMode(HSB, 100);
      //fill(dinamic_value*50 + 100 ,255,255, 255);
      //fill(255,255,0, 20);
      colorMode(RGB);
      //fill(255,230,0, 30);
      int increment = 0;
      
      moonx = (int)(x + dist*cos(t+phase));
      moony = (int)((float)y + sin(t+phase)*(float)dist);
      float coef = 0.1;
      for(int i=0; i<6; i++)
      {
        fill(255, 150 - increment,0, 30);
        circle(moonx + random(5), moony + random(5), dinamic_radius * coef);
        //circle(moonx, moony, radius * coef);
        coef += 0.1;
        increment += 25;
      }
      t = t + angvel;
      fill(255,255,255, 100);
      circle(moonx, moony, radius*coef*0.5);
    }
};
