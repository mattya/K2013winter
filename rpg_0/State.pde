// ゲームの状態を表すクラス
// 戦闘時、あるいはマップに居る時のみに必要な情報はs_battle, s_fieldで書くことにして
// ここでは全体を通して必要な情報を記録、更新する


class State{
  State_battle s_battle;
  State_field s_field;
  
  // この変数が0ならフィールド、1なら戦闘中
  int meta_state;
  
  State(){
    meta_state = 0;
    s_battle = new State_battle();
    s_field = new State_field();
  }
  
  void update(Game game){
    
    // 現在マップに居るか戦闘中かで場合分け
    if(meta_state==0) s_field.update(game);
    else if(meta_state==1) s_battle.update(game);
  }
}
