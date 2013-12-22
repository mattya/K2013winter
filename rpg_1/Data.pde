// ファイルからデータを読み込み、記録するのに用いるクラス
// 画像、音声、マップ、敵一覧、道具一覧、さらにセーブデータなどを扱う

class Data{
  Data_enemy[] data_enemy;

  
  Data(){
    
  }
  
  void load_all(){
    
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

