class Pistol extends Weapon{
  
  Pistol() {
    imageWidth = 39;
    imageHeight = 24;
    offsetX = 9.5;
    offsetY = 20;
    gun = 6;
    shootTimer = 8;
    m = 1;
  }
  
  void update() {
    rectMode(CENTER);
    imageMode(CENTER);
    noStroke();
    fill(yellow);
    float a = atan2(mouseX-myHero.loc.x, mouseY-myHero.loc.y) - (HALF_PI * 3);
    if (a < -HALF_PI && a > -HALF_PI*3) {
      faceRight = true;
      faceLeft = false;
    } else {
      faceRight = false;
      faceLeft = true;
    }
    if (faceRight) {
      pushMatrix();
      translate(myHero.loc.x+offsetX, myHero.loc.y+offsetY);
      rightRotate = -atan2(mouseX-myHero.loc.x, mouseY-myHero.loc.y) - (HALF_PI * 3);
      rotate(rightRotate);
      image(pistolRight, 0, 0, imageWidth, imageHeight);
      popMatrix();
    } else if (faceLeft) {
      pushMatrix();
      translate(myHero.loc.x-offsetX, myHero.loc.y+offsetY);
      leftRotate = -atan2(mouseX-myHero.loc.x, mouseY-myHero.loc.y) + (HALF_PI * 3);
      rotate(leftRotate);
      image(pistolLeft, 0, 0, imageWidth, imageHeight);
      popMatrix();
    }
    imageMode(CENTER);
    rectMode(CORNER);
  }
  
  void shoot() {
    super.shoot();
  }
  
}
