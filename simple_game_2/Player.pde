class Player{
  float score;
  int[] level;
  float[] upgrade_cost_base = {300, 100, 500, 300, 300};
  String[] upgrade_text = {
    "主砲威力強化",
    "主砲発射速度上昇",
    "副武装追加",
    "装甲強化",
    "機動力強化"};
  
  Player(){
    score = 10000;
    level = new int[5];
    for(int i=0; i<5; i++) level[i] = 0;
    level[0] = 1;
  }
  
}

