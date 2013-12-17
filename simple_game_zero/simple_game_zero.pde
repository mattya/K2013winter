
Display display;
State state;


void setup(){
  display = new Display();
  state = new State();
}

void draw(){
  state.update();
  display.draw(state);
}

void keyPressed(){
  state.keyPressed(key, keyCode);
}
