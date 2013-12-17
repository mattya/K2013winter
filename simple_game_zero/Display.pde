
class Display{
  
  void draw(State state){
    background(255);
    
    // 弾
    for(int i=0; i<state.e_num; i++){
      stroke(0);
      fill(255, 0, 0, 100);
      ellipse(state.ex[i], state.ey[i], 4, 4);
    }
    
    // 自機
    fill(0, 0, 255, 100);
    ellipse(state.px, state.py, 6, 6);
  }
}
