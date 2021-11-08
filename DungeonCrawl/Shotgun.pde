class Shotgun extends Weapon {

  Shotgun() {
    gunRight = loadImage("shotgunRight.png");
    gunLeft = loadImage("shotgunLeft.png");
    imageWidth = 51;
    imageHeight = 21;
    offsetX = 15;
    offsetY = 20;
    gun = 2;
    shootTimer = 15;
    m = 2.5;
  }

  void update() {
    super.update();
  }

  void shoot() {
    super.shoot();
  }
}
