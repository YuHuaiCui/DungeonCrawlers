class Block {
  PVector loc;
  PImage block;
  float size;
  int roomX, roomY; 

  Block() {
  }

  void show() {
    imageMode(CORNER);
    rectMode(CORNER);
    if (roomX == myHero.roomX && roomY == myHero.roomY) {
      rect(100 + loc.x*size, 100 + loc.y*size, size, size);
      image(block, 100 + loc.x*size, 100 + loc.y*size, size, size);
    }
  }

  void act() {
  }
}
