
class State{
  float px, py;
  float php;
  
  int e_num;
  int e_num_max = 1000;
  float[] ex, ey;
  float[] evx, evy;
  
  float time;
  
  State(){
    px = width/2;
    py = height/2;
    // プレイヤー初期HP
    php = 100;
    
    e_num = 0;
    ex = new float[e_num_max];
    ey = new float[e_num_max];
    evx = new float[e_num_max];
    evy = new float[e_num_max];
    
    time = 0;
  }
  
  void update(){
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
    
    // 1秒ごとに弾を増やす
    ex[e_num] = random(0, width);
    ey[e_num] = random(0, height);
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
  }
}
