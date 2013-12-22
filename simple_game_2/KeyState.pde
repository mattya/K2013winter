class KeyState{
  int u, d, l, r;
  int reset, z;
  KeyState(){
    u=0;
    d=0;
    l=0;
    r=0;
    reset = 0;
    z = 0;
  }
  void keyPressed(int k, int kc){
    if(k=='r'){
      reset = 1;
    }else if(k=='z'){
      z = 1;
    }else if(k=='w') u=1;
    else if(k=='a') l=1;
    else if(k=='s') d=1;
    else if(k=='d') r=1;
    if(k==CODED){
      if(kc==UP) u = 1;
      if(kc==DOWN) d = 1;
      if(kc==RIGHT) r = 1;
      if(kc==LEFT) l = 1;
    }
  }
  
  void keyReleased(int k, int kc){
    if(k=='r'){
      reset = 0;
    }else if(k=='z'){
      z = 0;
    }else if(k=='w') u=0;
    else if(k=='a') l=0;
    else if(k=='s') d=0;
    else if(k=='d') r=0;
    if(k==CODED){
      if(kc==UP) u = 0;
      if(kc==DOWN) d = 0;
      if(kc==RIGHT) r = 0;
      if(kc==LEFT) l = 0;
    }
  }
}
