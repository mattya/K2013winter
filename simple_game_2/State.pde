
class State{
  // 0: title
  // 1: game
  // 2: gameover
  int meta_state;
  
  float px, py;
  float php;
  
  int e_num;
  int e_num_max = 1000;
  Bullet[] bs;
  
  int p_b_num;
  int p_b_num_max = 100;
  Bullet[] pbs;
  
  float time;
  
  State(){
    bs = new Bullet[e_num_max];
    pbs = new Bullet[p_b_num_max];
    
    init();
  }
  
  void init(){
    meta_state = 0;
    
    px = width/2;
    py = height/2;
    // プレイヤー初期HP
    php = 100;
    
    e_num = 0;
    p_b_num = 0;
    
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
        bs[i].move();
      }
      for(int i=0; i<p_b_num; i++){
        pbs[i].move();
      }
      
      // プレイヤーとの当たり判定
      for(int i=0; i<e_num; i++){
        if(dist(px, py, bs[i].x, bs[i].y) < 2+bs[i].r){
          php--;
        }
      }
      if(php<=0) meta_state = 2;
      
      // プレイヤーの移動
      if(ks.u==1) py-=3;
      if(ks.d==1) py+=3;
      if(ks.l==1) px-=3;
      if(ks.r==1) px+=3;
      
      // プレイヤーの攻撃
      if(mousePressed && (int)time%10==0 && p_b_num<p_b_num_max){
        pbs[p_b_num] = new Bullet();
        pbs[p_b_num].init(1, px, py, mouseX, mouseY);
        p_b_num++;
      }
      
      // 1/5の確率で弾を増やす
      float tx, ty;
      if(random(0, 1)<0.2 && e_num<e_num_max){
        do{
          tx = random(0, width);
          ty = random(0, height);
        }while(dist(tx, ty, px, py) < 30 || dist(tx, ty, width/2, height/2)<width/2);
        bs[e_num] = new Bullet();
        bs[e_num].init((int)random(0, 2), tx, ty, px, py);
        e_num++;
      }
      
      // 場外に出た弾を消す
      for(int i=e_num-1; i>=0; i--){
        if(bs[i].hp<=0){
          bs[i] = bs[e_num-1];
          e_num--;
        }
      }
      for(int i=p_b_num-1; i>=0; i--){
        if(pbs[i].hp<=0){
          pbs[i] = pbs[p_b_num-1];
          p_b_num--;
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
