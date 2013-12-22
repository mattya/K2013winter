// フィールド画面の描画を行うクラス
// 必要なデータは主にgame.state.s_fieldから

class Display_field{
  
  Display_field(){
    
  }
  
  void update(Game game){
    background(255);
    
    image(game.state.s_field.field.img, 
      -game.state.s_field.px + width/2, 
      -game.state.s_field.py + height/2);
    
    stroke(0);
    strokeWeight(1);
    ellipse(width/2, height/2, 10, 10);
    
  }
}
