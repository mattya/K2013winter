// マップ上の状態を表すクラス
// 自分とNPC(町の人とか)の位置情報や、会話状態、マップのギミックの状態などなど


class State_field{
  // プレイヤーのマップ上の位置
  int px, py;
  
  State_field(){
    px = width/2;
    py = height/2;
  }
  
  void update(Game game){
    if(game.event.key_up==1) py-=1;
    if(game.event.key_down==1) py+=1;
    if(game.event.key_right==1) px+=1;
    if(game.event.key_left==1) px-=1;
    if(game.event.key_z==1) game.state.meta_state = 1;
  }
}
