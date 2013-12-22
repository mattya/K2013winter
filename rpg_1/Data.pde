// ファイルからデータを読み込み、記録するのに用いるクラス
// 画像、音声、マップ、敵一覧、道具一覧、さらにセーブデータなどを扱う

class Data{
  Data_enemy[] data_enemy;
  Data_field field;
  
  Data(){
  }
  
  void load_all(){
    field = new Data_field();
  }
}

class Data_field{
  PImage img;
  PImage mask;
  int start_x, start_y;
  
  int npc_start_x, npc_start_y;
  
  Data_field(){
    img = loadImage("./images/field_0.png");
    mask = loadImage("./images/mask_0.png");
    start_x = 600;
    start_y = 400;
//    img.loadPixels();
    mask.loadPixels();
    
    npc_start_x = 600;
    npc_start_y = 300;
    
  }
  
  int can_enter(int x, int y){
    if(x>=0&&x<img.width&&y>=0&&y<img.height){
      if(mask.pixels[y*mask.width+x]==color(255)){
        return 1;
      }
    }
    return 0;
  }
}


class Data_enemy{
  String name;
  PImage img;
  int maxhp;
  int att;
  int def;
  int spd;
}

