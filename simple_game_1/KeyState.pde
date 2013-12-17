class KeyState{
  int u, d, l, r;
  KeyState(){
    u=0;
    d=0;
    l=0;
    r=0;
  }
  void keyPressed(int k, int kc){
    if(k==CODED){
      if(kc==UP) u = 1;
      if(kc==DOWN) d = 1;
      if(kc==RIGHT) r = 1;
      if(kc==LEFT) l = 1;
    }
  }
  
  void keyReleased(int k, int kc){
    if(k==CODED){
      if(kc==UP) u = 0;
      if(kc==DOWN) d = 0;
      if(kc==RIGHT) r = 0;
      if(kc==LEFT) l = 0;
    }
  }
}
