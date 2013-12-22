class Bullet{
  float x, y, vx, vy;
  float time;
  float r;
  float att;
  float hp;
  int type;
//  XML data;
  
  void init(int t0, float x0, float y0, float px, float py){
    // type0: normal
    // type1: jiki nerai
    type = t0;
    x = x0;
    y = y0;
    time = 0;
    if(type==0){
      r = 4;
      att = 3;
      hp = 1;
      float v = 1.0;
      float th = random(0, 2.0*PI);
      vx = v*cos(th);
      vy = v*sin(th);
    }else if(type==1){
      r = 2;
      att = 2;
      hp = 1;
      float v = 2.0;
      float th = atan2(py-y0, px-x0);
      vx = v*cos(th);
      vy = v*sin(th);
    }
    /* 
    data = d;
    x = x0;
    y = y0;
    r = data.getFloatContent("radius");
    att = data.getFloatContent("attack");
    hp = data.getFloatContent("hp");
    
    float v = data.getFloatContent("speed");
    float vv = data.getFloatContent("vspeed");
    float th = data.getFloatContent("angle")/180*PI + atan2(py-y0, px-x0);
    float vth = data.getFloatContent("vangle")/180*PI;
    */
  }
  
  void move(){
    x += vx;
    y += vy;
    time += 1.0;
    
    if(x<0 || x>width || y<0 || y>height) hp = 0;
  }
  
}
