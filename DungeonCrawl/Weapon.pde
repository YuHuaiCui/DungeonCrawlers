class Weapon {
  boolean faceRight, faceLeft;
  float leftRotate, rightRotate;
  PVector loc, vel;
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
  } //End of update()

  void shoot() {
    if (gun == RIFLE) {
      shoot++;
      if (shoot >= shootTimer && spacekey) {
        myObjects.add(new Bullet(gun, leftRotate, rightRotate));
        muzzleFlash(gun);
        shoot = 0;
      }
    } else if (gun == SHOTGUN) {
      shoot++;
      if (shoot >= shootTimer && spacekey) {
        for (int i = 0; i < 8; i++) {
        myObjects.add(new Bullet(gun, leftRotate, rightRotate));
        muzzleFlash(gun);
        }
        shoot = 0;
      }
    } else if (gun == SMG) {
      shoot++;
      if (shoot >= shootTimer && spacekey) {
        myObjects.add(new Bullet(gun, leftRotate, rightRotate));
        muzzleFlash(gun);
        shoot = 0;
      }
    } else if (gun == SNIPER) {
      shoot++;
      if (shoot >= shootTimer && spacekey) {
        myObjects.add(new Bullet(gun, leftRotate, rightRotate));
        muzzleFlash(gun);
        shoot = 0;
      }
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
  }
} //End of Weapon
