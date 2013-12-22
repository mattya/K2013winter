// マウス、キーボード入力の処理を行うクラス
// マウスボタン、特定キーが押されているかどうかを記録する
// 将来的には押されている時間とかをカウントしても良いだろう
// （そうしないと、今押されたのか押しっぱなしなのかを区別できない）

class Event{
  int key_up, key_down, key_left, key_right, key_z, key_x, key_c;
  int mouse_left;
  
  Event(){
    key_up = 0;
    key_down = 0;
    key_left = 0;
    key_right = 0;
    key_z = 0;
    key_x = 0;
    key_c = 0;
    
    mouse_left = 0;
  }
  
  void keyPressed(int key, int keyCode){
    if(key==CODED){
      if(keyCode==UP) key_up = 1;
      if(keyCode==DOWN) key_down = 1;
      if(keyCode==LEFT) key_left = 1;
      if(keyCode==RIGHT) key_right = 1;
    }else{
      if(key=='z') key_z = 1;
      if(key=='x') key_x = 1;
      if(key=='c') key_c = 1;
    }
  }
  
  void keyReleased(int key, int keyCode){
    if(key==CODED){
      if(keyCode==UP) key_up = 0;
      if(keyCode==DOWN) key_down = 0;
      if(keyCode==LEFT) key_left = 0;
      if(keyCode==RIGHT) key_right = 0;
    }else{
      if(key=='z') key_z = 0;
      if(key=='x') key_x = 0;
      if(key=='c') key_c = 0;
    }
  }
  
  void mousePressed(){
    mouse_left = 1;
  }
  
  void mouseReleased(){
    mouse_left = 0;
  }
}
