class Weapon {
  boolean faceRight, faceLeft;
  float leftRotate, rightRotate;
  PVector loc, vel;
  PImage gunRight, gunLeft;
  float imageWidth, imageHeight;
  float offsetX, offsetY;
  float offsetMX, offsetMY;
  float m;
  int shoot, shootTimer;
  int gun;
  final int RIFLE = 1;
  final int SHOTGUN = 2;
  final int SMG = 3;
  final int SNIPER = 4;
  final int LAUNCHER = 5;
  final int PISTOL = 6;
  Weapon currentGun;

  Weapon() {
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = new PVector(0, 0);
    shoot = 0;
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
      image(gunRight, 0, 0, imageWidth, imageHeight);
      popMatrix();
    } else if (faceLeft) {
      pushMatrix();
      translate(myHero.loc.x-offsetX, myHero.loc.y+offsetY);
      leftRotate = -atan2(mouseX-myHero.loc.x, mouseY-myHero.loc.y) + (HALF_PI * 3);
      rotate(leftRotate);
      image(gunLeft, 0, 0, imageWidth, imageHeight);
      popMatrix();
    }
    imageMode(CENTER);
    rectMode(CORNER);
    
    
    
  } //End of update()

  void shoot() {
    if (gun == RIFLE) {
      shootBullet(1);
    } else if (gun == SHOTGUN) {
      shootBullet(8);
    } else if (gun == SMG) {
      shootBullet(1);
    } else if (gun == SNIPER) {
      shootBullet(1);
    } else if (gun == LAUNCHER) {
      shootBullet(1);
    } else if (gun == PISTOL) {
      shootBullet(1);
    }
    //muzzleFlash(gun);
    //^^^^^turn this on for making sure the muzzleFlash is on point
  } //End of shoot()

  void muzzleFlash(int g) {
    currentGun = myWeapon.get(g-1);
    if (g == RIFLE) {
      offsetMY = -5.5;
      if (faceRight) offsetMX = 32.5 + m*8.5;
      else if (faceLeft) offsetMX = -32.5 - m*8.5;
    } else if (g == SHOTGUN) {
      offsetMY = -4.5;
      if (faceRight) offsetMX = 29 + m*8.5;
      else if (faceLeft) offsetMX = -29 - m*8.5;
    } else if (g == SMG) {
      offsetMY = -0.5;
      if (faceRight) offsetMX = 27.5 + m*8.5;
      else if (faceLeft) offsetMX = -27.5 - m*8.5;
    } else if (g == SNIPER) {
      offsetMY = -1.5;
      if (faceRight) offsetMX = 40.5 + m*8.5;
      else if (faceLeft) offsetMX = -40.5 - m*8.5;
    } else if (g == LAUNCHER) {
      offsetMY = -9;
      if (faceRight) offsetMX = 50 + m*8.5;
      else if (faceLeft) offsetMX = -50 - m*8.5;
    } else if (g == PISTOL) {
      offsetMY = -6;
      if (faceRight) offsetMX = 21 + m*8.5;
      else if (faceLeft) offsetMX = -21 - m*8.5;
    }
    
    if (spacekey) {
      if (faceRight) {
        pushMatrix();
        translate(myHero.loc.x+currentGun.offsetX, myHero.loc.y+currentGun.offsetY);
        rotate(rightRotate);
        strokeWeight(2);
        stroke(255);
        noFill();
        pushMatrix();
        translate(offsetMX, offsetMY);
        image(muzzleFlash, 0, 0, 24 * m, 20 * m);
        popMatrix();
        popMatrix();
      } else if (faceLeft) {
        pushMatrix();
        translate(myHero.loc.x-currentGun.offsetX, myHero.loc.y+currentGun.offsetY);
        rotate(leftRotate);
        strokeWeight(2);
        stroke(255);
        noFill();
        pushMatrix();
        translate(offsetMX, offsetMY);
        rotate(HALF_PI*2);
        image(muzzleFlash, 0, 0, 24 * m, 20 * m);
        popMatrix();
        popMatrix();
      }
    }
  } //End of muzzleFlash

  void shootBullet(int n) {
    shoot++;
    if (shoot >= shootTimer && spacekey) {
      for (int i = 0; i < n; i++) {
        myObjects.add(new Bullet(gun, leftRotate, rightRotate));
        muzzleFlash(gun);
      }
      shoot = 0;
    }
  }
} //End of Weapon
