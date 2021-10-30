class DarknessCell {
  float opacity;
  float x, y, size;

  DarknessCell(float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 0;
  }

  void show() {
    opacity = map(dist(myHero.loc.x, myHero.loc.y, x, y), 0, 500, 0, 255);
    //fill(0, opacity);
    fill(0, 0);
    noStroke();
    rectMode(CORNER);
    square(x, y, size);
  }

  void act() {
    
  }
}
