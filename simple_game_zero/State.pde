
class State{
  float px, py;
  
  int e_num;
  int e_num_max = 1000;
  float[] ex, ey;
  float[] evx, evy;
  
  float time;
  
  State(){
    px = width/2;
    py = height/2;
    
    e_num = 0;
    ex = new float[e_num_max];
    ey = new float[e_num_max];
    evx = new float[e_num_max];
    evy = new float[e_num_max];
    
    time = 0;
  }
  
  void update(){
    
  }
}
