
class State{
  // 0: title
  // 1: game
  // 2: gameover
  int meta_state;
  
  float px, py;
  float php;
  
  int e_num;
  int e_num_max = 1000;
  float[] ex, ey;
  float[] evx, evy;
  
  float time;
  
  State(){
    ex = new float[e_num_max];
    ey = new float[e_num_max];
    evx = new float[e_num_max];
    evy = new float[e_num_max];
    
    init();
  }
  
  void init(){
    meta_state = 0;
    
    px = width/2;
    py = height/2;
    // プレイヤー初期HP
    php = 100;
    
    e_num = 0;
    
    time = 0;
  }
  
  void update(KeyState ks){
    if(meta_state==0){
      if(ks.z==1){
        init();
        meta_state=1;
      }
    }
    else if(meta_state==1){
      // 弾を進行させる
      for(int i=0; i<e_num; i++){
        ex[i] += evx[i];
        ey[i] += evy[i];
      }
      
      // プレイヤーとの当たり判定
      for(int i=0; i<e_num; i++){
        if(dist(px, py, ex[i], ey[i]) < 5){
          php--;
        }
      }
      if(php<=0) meta_state = 2;
      
      // プレイヤーの移動
      if(ks.u==1) py-=3;
      if(ks.d==1) py+=3;
      if(ks.l==1) px-=3;
      if(ks.r==1) px+=3;
      
      // 1秒ごとに弾を増やす
      do{
        ex[e_num] = random(0, width);
        ey[e_num] = random(0, height);
      }while(dist(ex[e_num], ey[e_num], px, py) < 30);
      evx[e_num] = random(-2, 2);
      evy[e_num] = random(-2, 2);
      e_num++;
      
      // 場外に出た弾を消す
      for(int i=e_num-1; i>=0; i--){
        if(ex[i]<0 || ex[i]>width || ey[i]<0 || ey[i]>height){
          ex[i] = ex[e_num-1];
          ey[i] = ey[e_num-1];
          evx[i] = evx[e_num-1];
          evy[i] = evy[e_num-1];
          e_num--;
        }
      }
      time += 1.0;
    }
    else if(meta_state==2){
      if(ks.reset==1){
        meta_state = 0;
      }
    }
  }
}
