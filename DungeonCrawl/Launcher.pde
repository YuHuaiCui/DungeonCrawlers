class Launcher extends Weapon {

  Launcher() {
    gunRight = loadImage("launcherRight.png");
    gunLeft = loadImage("launcherLeft.png");
    imageWidth = 75;
    imageHeight = 30;
    offsetX = 20;
    offsetY = 20;
    gun = 5;
    shootTimer = 50;
    m = 5.8;
  }

  void update() {
    super.update();
  }

  void shoot() {
    super.shoot();
  }
}
