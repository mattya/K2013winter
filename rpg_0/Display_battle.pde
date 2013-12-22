// 戦闘画面の描画を行うクラス
// 必要なデータは主にgame.state.s_battleから

class Display_battle{
  
  Display_battle(){
    
  }
  
  void update(Game game){
    background(0);
    stroke(100);
    strokeWeight(3);
    if(game.state.s_battle.command==0) rect(30, 30, 30, 30);
    if(game.state.s_battle.command==1) rect(60, 30, 30, 30);
    if(game.state.s_battle.command==2) rect(90, 30, 30, 30);
    if(game.state.s_battle.command==3) rect(120, 30, 30, 30);
  }
}
