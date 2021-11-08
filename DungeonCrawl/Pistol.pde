class Pistol extends Weapon {

  Pistol() {
    gunRight = loadImage("pistolRight.png");
    gunLeft = loadImage("pistolLeft.png");
    imageWidth = 39;
    imageHeight = 24;
    offsetX = 9.5;
    offsetY = 20;
    gun = 6;
    shootTimer = 8;
    m = 1;
  }

  void update() {
    super.update();
  }

  void shoot() {
    super.shoot();
  }
}
