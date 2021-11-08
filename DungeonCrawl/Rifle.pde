class Rifle extends Weapon{
  
  Rifle() {
    gunRight = loadImage("rifleRight.png");
    gunLeft = loadImage("rifleLeft.png");
    imageWidth = 60;
    imageHeight = 30;
    offsetX = 20;
    offsetY = 20;
    gun = 1;
    shootTimer = 8;
    m = 1.5;
  }
  
  void update() {
    super.update();
  }
  
  void shoot() {
    super.shoot();
  }
  
}
