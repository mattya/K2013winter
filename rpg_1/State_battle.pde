// 戦闘中の状態を表すクラス
// 戦闘が開始されたら敵のデータをgame.dataから読み込む
// 自分の状態はgame.stateから取ってくる
// 戦闘が終わったらgame.stateの自分の状態を更新する


class State_battle{
  // 0なら戦闘中、1なら自分の勝ちで戦闘終了、2なら相手の勝ち
  int state;
  // 通常0で、描画処理中のときに1にする。ふつう描画処理中には入力は受け付けない
  int wait;
  
  int command;
  
  Battle_character player;
  Battle_character enemy;
  
  State_battle(){
  }
  
  void init(Game game, int enemy_id){
    state = 0;
    wait = 0;
    command = 0;
    player = new Battle_character();
    enemy = new Battle_character();
//    player = new Battle_character(game.state.s_player);
//    enemy = new Battle_character(game.data.enemies[enemy_id]);
  }
  
  void update(Game game){
    if(state==0){
      if(wait==0){
        // コマンド選択
        if(game.event.key_right==1 && command<1) command++;
        if(game.event.key_left==1 && command>=1) command--;
        if(game.event.key_z==1 && command==0){
          battle_turn();
        }
      }
    }else if(state>=1){
      if(game.event.key_x==1){
        game.state.meta_state = 0;
      }
    }
  }
  
  void battle_turn(){
    if(player.spd > enemy.spd){
      enemy.damage(player.att);
      if(enemy.hp==0){
        end_battle(0);
      }
      player.damage(enemy.att);
      if(player.hp==0){
        end_battle(1);
      }
    }else{
      player.damage(enemy.att);
      if(player.hp==0){
        end_battle(1);
      }
      enemy.damage(player.att);
      if(enemy.hp==0){
        end_battle(0);
      }
    }
    
  }
  
  // f==0: player won, f==1: enemy won
  void end_battle(int f){
    if(f==0) state = 1;
    else if(f==1) state = 2;
    
    
  }
}

class Battle_character{
  int hp, maxhp;
  int att;
  int def;
  int spd;
  
  Battle_character(){
    hp = 100;
    maxhp = 100;
    att = (int)random(5, 20);
    def = (int)random(0, 5);
    spd = (int)random(0, 100);
  }
  
  Battle_character(State_player sp){
    hp = sp.hp;
    maxhp = sp.maxhp;
    att = sp.att;
    def = sp.def;
    spd = sp.spd;
  }
  
  Battle_character(Data_enemy de){
    hp = de.maxhp;
    maxhp = de.maxhp;
    att = de.att;
    def = de.def;
    spd = de.spd;
  }
  
  void damage(int e){
    hp -= (int)(max(e-def, 0)*random(0.8, 1.2));
    if(hp<0) hp = 0;
  }
}

