class SMG extends Weapon {

  SMG() {
    gunRight = loadImage("smgRight.png");
    gunLeft = loadImage("smgLeft.png");
    imageWidth = 51;
    imageHeight = 30;
    offsetX = 20;
    offsetY = 20;
    gun = 3;
    shootTimer = 2;
    m = 1.2;
  }

  void update() {
    super.update();
  }

  void shoot() {
    super.shoot();
  }
}
