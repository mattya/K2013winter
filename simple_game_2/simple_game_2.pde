
Display display;
State state;
KeyState ks;
Data data;


void setup(){
  size(400, 400);
  display = new Display();
  state = new State();
  ks = new KeyState();
  data = new Data();
  data.load_bullet_data();
}

void draw(){
  state.update(ks);
  display.draw(state);
}

void keyPressed(){
  ks.keyPressed(key, keyCode);
}

void keyReleased(){
  ks.keyReleased(key, keyCode);
}
