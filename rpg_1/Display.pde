// 描画に関わるクラス
// フィールドと戦闘で内容は大きく変わるので、Display_battle, Display_fieldクラスで行い、
// ここではその統括と、全体に関わる描画処理を行う

class Display{
  Display_battle d_battle;
  Display_field d_field;
  
  Display(){
    d_battle = new Display_battle();
    d_field = new Display_field();
  }
  
  void update(Game game){
//    background(255);
    if(game.state.meta_state==0) d_field.update(game);
    else if(game.state.meta_state==1) d_battle.update(game);
  }
}
