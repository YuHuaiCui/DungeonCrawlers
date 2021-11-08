class Stone extends Block {
  
  Stone() {
    block = loadImage("wall.png");
    loc = new PVector(1, 0);
    size = 80;
    roomX = 1;
    roomY = 1;
  }
  
  Stone(int x, int y) {
    block = loadImage("wall.png");
    loc = new PVector(x, y);
    size = 80;
    roomX = 1;
    roomY = 1;
  }
  
  
  void show() {
    super.show();
  }
  
  void act() {
    
  }
}
