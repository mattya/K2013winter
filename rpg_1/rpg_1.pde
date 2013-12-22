// ここはプログラムが実行されるときに最初に見られるところである
// setup, draw命令と、マウス、キーボードの入力処理を行うが、
// その中身はgameクラスの内側にかかれており、このファイル内にはさほど内容はない。

Game game;

void setup(){
  size(600, 400);
  game = new Game();
}

void draw(){
  game.update();
  game.event.timePassed();
}

void keyPressed(){
  game.event.keyPressed(key, keyCode);
}

void keyReleased(){
  game.event.keyReleased(key, keyCode);
}

void mousePressed(){
  game.event.mousePressed();
}

void mouseReleased(){
  game.event.mouseReleased();
}
