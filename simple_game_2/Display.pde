
class Display{
  
  void draw(State state){
    if(state.meta_state==0){
      background(255);
      fill(0);
      textAlign(CENTER);
      text("press z key to start", width/2, height/2);
    }else if(state.meta_state==1){
      background(255);
      
      // 弾
      for(int i=0; i<state.e_num; i++){
        stroke(0);
        if(state.bs[i].type==0) fill(255, 0, 0, 100);
        if(state.bs[i].type==1) fill(255, 255, 0, 100);
        if(state.bs[i].type==20) fill(255, 0, 0, 200);
        if(state.bs[i].type==21) fill(0, 255, 0, 200);
        ellipse(state.bs[i].x, state.bs[i].y, state.bs[i].r*2, state.bs[i].r*2);
      }
      for(int i=0; i<state.p_b_num; i++){
        stroke(0);
        fill(0, 255, 255, 100);
        ellipse(state.pbs[i].x, state.pbs[i].y, state.pbs[i].r*2, state.pbs[i].r*2);
      }
      
      // 自機
      fill(0, 0, 255, 100);
      ellipse(state.px, state.py, 6, 6);
      
      // HP表示
      fill(0, 255, 0, 100);
      noStroke();
      rect(10, 10, map(state.php, 0, 100, 0, width-20), 10);
      stroke(0);
      noFill();
      rect(10, 10, width-20, 10);
    }else if(state.meta_state==2){      
      background(0);
      fill(255);
      textAlign(CENTER);
      text("game over", width/2, height/2);
      text("your score: "+state.time, width/2, height/2+20);
    }
  }
}
