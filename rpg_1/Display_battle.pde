// 戦闘画面の描画を行うクラス
// 必要なデータは主にgame.state.s_battleから

class Display_battle{
  
  Display_battle(){
    
  }
  
  void update(Game game){
    background(0);
    stroke(100);
    strokeWeight(3);
    
    textAlign(CENTER);
    
    if(game.state.s_battle.state==0){
      noFill();
      if(game.state.s_battle.command==0) rect(30, 30, 30, 30);
      fill(255, 0, 0);
      text("攻撃", 45, 50);
      noFill();
      if(game.state.s_battle.command==1) rect(60, 30, 30, 30);
      fill(0, 0, 255);
      text("防御", 75, 50);
      
      fill(255);
      text("enemy", 100, height/2);
      text(game.state.s_battle.enemy.hp + " / " + game.state.s_battle.enemy.maxhp, 100, height/2+30);
      
      text("player", width-100, height/2);
      text(game.state.s_battle.player.hp + " / " + game.state.s_battle.player.maxhp, width-100, height/2+30);
      
    }else if(game.state.s_battle.state==1){
      fill(255, 255, 0);
      text("勝利", width/2, height/2);
    }else if(game.state.s_battle.state==2){
      fill(255, 255, 0);
      text("敗北", width/2, height/2);
    }
//    if(game.state.s_battle.command==2) rect(90, 30, 30, 30);
//    if(game.state.s_battle.command==3) rect(120, 30, 30, 30);
  }
}
