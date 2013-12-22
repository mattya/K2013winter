// フィールド画面の描画を行うクラス
// 必要なデータは主にgame.state.s_fieldから

class Display_field{
  
  Display_field(){
    
  }
  
  void update(Game game){
    background(255);
    stroke(0);
    strokeWeight(1);
    ellipse(game.state.s_field.px, game.state.s_field.py, 10, 10);
    
  }
}
