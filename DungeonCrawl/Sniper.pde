class Sniper extends Weapon {

  Sniper() {
    gunRight = loadImage("sniperRight.png");
    gunLeft = loadImage("sniperLeft.png");
    imageWidth = 78;
    imageHeight = 33;
    offsetX = 20;
    offsetY = 20;
    gun = 4;
    shootTimer = 25;
    m = 2;
  }

  void update() {
    super.update();
  }

  void shoot() {
    super.shoot();
  }
}
