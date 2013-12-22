
class Display{
  
  PImage bullet0, bullet1, bulletp, player, enemy0, enemy1, bg;
  
  Display(){
    bg = loadImage("./images/bg.png");
    bullet0 = loadImage("./images/bullet_0.png");
    bullet1 = loadImage("./images/bullet_1.png");
    bulletp = loadImage("./images/bullet_p.png");
    player = loadImage("./images/player.png");
    enemy0 = loadImage("./images/enemy_0.png");
    enemy1 = loadImage("./images/enemy_1.png");
  }
  
  void draw(State state){
    if(state.meta_state==0){
      background(255);
      fill(0);
      textAlign(CENTER);
      text("press z key to start", width/2, height/2);
    }else if(state.meta_state==1){
      background(255);
      imageMode(CENTER);
      image(bg, width/2, height/2);
      
      // 弾
      for(int i=0; i<state.e_num; i++){
        imageMode(CENTER);
        if(state.bs[i].type==0){
          pushMatrix();
          translate(state.bs[i].x, state.bs[i].y);
          rotate(PI/2 + atan2(state.bs[i].vy, state.bs[i].vx));
          scale(0.7);
          image(bullet0, 0, 0);
          popMatrix();
        }
        if(state.bs[i].type==1){
          pushMatrix();
          translate(state.bs[i].x, state.bs[i].y);
          rotate(PI/2 + atan2(state.bs[i].vy, state.bs[i].vx));
          scale(0.7);
          image(bullet1, 0, 0);
          popMatrix();
        }
        if(state.bs[i].type==20){
          pushMatrix();
          translate(state.bs[i].x, state.bs[i].y);
          rotate(PI/2 + atan2(state.bs[i].vy, state.bs[i].vx));
          scale(1);
          image(enemy0, 0, 0);
          popMatrix();
        }
        if(state.bs[i].type==21){
          pushMatrix();
          translate(state.bs[i].x, state.bs[i].y);
          rotate(PI/2 + atan2(state.bs[i].vy, state.bs[i].vx));
          scale(1);
          image(enemy1, 0, 0);
          popMatrix();
        }
//        stroke(0);
//        if(state.bs[i].type==0) fill(255, 0, 0, 100);
//        if(state.bs[i].type==1) fill(0, 255, 0, 100);
//        ellipse(state.bs[i].x, state.bs[i].y, state.bs[i].r*2, state.bs[i].r*2);
      }
      for(int i=0; i<state.p_b_num; i++){
        pushMatrix();
        translate(state.pbs[i].x, state.pbs[i].y);
        rotate(PI/2 + atan2(state.pbs[i].vy, state.pbs[i].vx));
        image(bulletp, 0, 0);
        popMatrix();
//        stroke(0);
//        fill(0, 255, 255, 100);
//        ellipse(state.pbs[i].x, state.pbs[i].y, state.pbs[i].r*2, state.pbs[i].r*2);
      }
      
      // 自機
      pushMatrix();
      translate(state.px, state.py);
      rotate(PI/2 + atan2(mouseY-state.py, mouseX-state.px));
      scale(2);
      image(player, 0, 0);
      popMatrix();
//      fill(0, 0, 255, 100);
//      ellipse(state.px, state.py, 6, 6);
      
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
