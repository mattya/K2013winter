// 戦闘中の状態を表すクラス
// 戦闘が開始されたら敵のデータをgame.dataから読み込む
// 自分の状態はgame.stateから取ってくる
// 戦闘が終わったらgame.stateの自分の状態を更新する


class State_battle{
  // 0なら味方ターン、1なら敵ターン
  int turn;
  // 通常0で、描画処理中のときに1にする。ふつう描画処理中には入力は受け付けない
  int wait;
  
  int command;
  
  State_battle(){
    turn = 0;
    wait = 0;
    command = 0;
  }
  
  void update(Game game){
    if(turn==0){
      if(wait==0){
        // コマンド選択
        if(game.event.key_right==1) command++;
      }
    }
  }
}
