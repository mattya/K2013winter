
class Display{
  
  void draw(State state){
    if(state.meta_state==0){
      background(255);
      fill(0);
      textAlign(CENTER);
      text("press any key to start", width/2, height/2);
    }else if(state.meta_state==1){
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
