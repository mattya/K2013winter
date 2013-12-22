
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
  
  float time;
  
  State(){
    bs = new Bullet[e_num_max];
    
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
      int tmp_e_num = e_num;
      for(int i=0; i<e_num; i++){
        tmp_e_num = bs[i].move(bs, tmp_e_num, e_num_max, px, py);
      }
      e_num = tmp_e_num;
      
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
      
      // 1/50の確率で敵を発生
      float tx, ty;
      if(random(0, 1)<0.02){
        do{
          tx = random(0, width);
          ty = random(0, height);
        }while(dist(tx, ty, px, py) < 30 || dist(tx, ty, width/2, height/2)<width/2);
        bs[e_num] = new Bullet();
        bs[e_num].init(20+(int)random(0, 2), tx, ty, px, py);
        e_num++;
      }
      
      // 場外に出た弾を消す
      for(int i=e_num-1; i>=0; i--){
        if(bs[i].hp<=0){
          bs[i] = bs[e_num-1];
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
