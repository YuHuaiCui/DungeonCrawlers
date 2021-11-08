class TNT extends Block {
  
  TNT() {
    block = loadImage("tntTop.png");
    loc = new PVector(0, 0);
    size = 80;
    roomX = 1;
    roomY = 1;
  }
  
  TNT(int x, int y) {
    block = loadImage("tntTop.png");
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
