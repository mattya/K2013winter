
Display display;
State state;


void setup(){
  size(400, 400);
  display = new Display();
  state = new State();
}

void draw(){
  state.update();
  display.draw(state);
}
