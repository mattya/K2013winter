// ゲーム本体を表すクラス
// 必要な物は全てここにある
// とはいえゲームの内容はこのファイル内で作られる別のクラスに書かれているので内容はあまり無い

class Game{
  Display display;
  State state;
  Event event;
  Data data;
  
  Game(){
    display = new Display();
    state = new State();
    event = new Event();
    data = new Data();

    // ファイルに書かれたデータを読み込む
    data.load_all();
    
    // 状態の初期化
    state.init(this);
    
  }
  
  void update(){
    state.update(this);
    display.update(this);
  }
  
}

