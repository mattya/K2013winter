
Display display;
State state;
KeyState ks;


void setup(){
  size(400, 400);
  display = new Display();
  state = new State();
  ks = new KeyState();
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
