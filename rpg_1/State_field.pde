// マップ上の状態を表すクラス
// 自分とNPC(町の人とか)の位置情報や、会話状態、マップのギミックの状態などなど


class State_field{
  // 現在のマップ
  Data_field field;
  
  // プレイヤーのマップ上の位置
  int px, py;
  
  // NPC位置
  int npc_x, npc_y;
  
  
  State_field(){
  }
  
  // マップfからスタート
  void init(Data_field f){
    field = f;
    px = field.start_x;
    py = field.start_y;
    npc_x = field.npc_start_x;
    npc_y = field.npc_start_y;
  }
  
  void update(Game game){
    if(game.event.key_up==1){
      if(field.can_enter(px, py-4) == 1) py-=4;
    }
    if(game.event.key_down==1){
      if(field.can_enter(px, py+4) == 1) py+=4;
    }
    if(game.event.key_right==1){
      if(field.can_enter(px+4, py) == 1) px+=4;
    }
    if(game.event.key_left==1){
      if(field.can_enter(px-4, py) == 1) px-=4;
    }
    if(game.event.key_z==1){
      if(dist(px, py, npc_x, npc_y)<30){
        game.state.meta_state = 1;
        game.state.s_battle.init(game, 0);
      }
    }
    
    int dx = (int)random(-5, 5);
    int dy = (int)random(-5, 5);
    if(field.can_enter(npc_x+dx, npc_y+dy) == 1){
      npc_x += dx;
      npc_y += dy;
    }
  }
}
