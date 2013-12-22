// マップ上の状態を表すクラス
// 自分とNPC(町の人とか)の位置情報や、会話状態、マップのギミックの状態などなど


class State_field{
  // 現在のマップ
  Data_field field;
  
  // プレイヤーのマップ上の位置
  int px, py;
  
  
  State_field(){
  }
  
  // マップfからスタート
  void init(Data_field f){
    field = f;
    px = field.start_x;
    py = field.start_y;
  }
  
  void update(Game game){
    if(game.event.key_up==1){
      if(field.can_enter(px, py-1) == 1) py-=1;
    }
    if(game.event.key_down==1){
      if(field.can_enter(px, py+1) == 1) py+=1;
    }
    if(game.event.key_right==1){
      if(field.can_enter(px+1, py) == 1) px+=1;
    }
    if(game.event.key_left==1){
      if(field.can_enter(px-1, py) == 1) px-=1;
    }
    if(game.event.key_z==1) game.state.meta_state = 1;
  }
}
