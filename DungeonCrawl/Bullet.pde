class Bullet extends GameObject {
  boolean faceLeft, faceRight;
  float offsetX, offsetY;
  float leftRotate, rightRotate;
  int current;
  final int RIFLE = 1;
  final int SHOTGUN = 2;
  int timer;
  PVector nudge;

  Bullet() {
    timer = 60;
    hp = 1;
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = new PVector(0, -1);
    vel.setMag(10);
    //nudge = myHero.vel.copy();
    //nudge.setMag(28);
    //loc.add(nudge.x, 0);
    if (loc.x < myHero.loc.x + 28 && myHero.faceRight) {
      loc.x = myHero.loc.x + 28;
    }
    if (loc.x > myHero.loc.x - 28 && myHero.faceLeft) {
      loc.x = myHero.loc.x - 28;
    }
    size = 10;
  }

  Bullet(int c) {
    current = c;
    timer = 60;
    hp = 1;
    vel = new PVector(myHero.vel.x, myHero.vel.y);
    vel.setMag(15);
    size = 5;

    if (current == RIFLE) {
      if (myHero.faceRight) {
        faceLeft = false;
        faceRight = true;
        loc = new PVector(myHero.loc.x+20, myHero.loc.y+20);
        rightRotate = -atan2(myHero.vel.x, myHero.vel.y) - (HALF_PI * 3);
      } else if (myHero.faceLeft) {
        faceLeft = true;
        faceRight = false;
        loc = new PVector(myHero.loc.x-20, myHero.loc.y+20);
        leftRotate = -atan2(myHero.vel.x, myHero.vel.y) + (HALF_PI * 3);
      }
    } else if (current == SHOTGUN) {
    } else {
      println("Bullet(int) ERROR!");
    }
  }

  void show() {
    //strokeWeight(3);
    //stroke(255);
    //noFill();
    //ellipse(loc.x, loc.y, size, size);

    if (current == RIFLE) {
      rifleShow();
    } else if (current == SHOTGUN) {
      shotgunShow();
    } else {
      println("Bullet.SHOW ERROR!");
    }
  }

  void act() {
    super.act();

    if (current == RIFLE) {
      rifleAct();
    } else if (current == SHOTGUN) {
      shotgunAct();
    } else {
      println("Bullet.ACT ERROR!");
    }

    timer--;
    if (timer == 0) {
      hp = 0;
    }
  }

  void rifleShow() {
    if (faceRight) {
      offsetX = 32.5;
      offsetY = -6.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(rightRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI);
      image(rifleBullet, 0, 0);
      popMatrix();
      popMatrix();
    } else if (faceLeft) {
      offsetX = -32.5;
      offsetY = -6.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(leftRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI*3);
      image(rifleBullet, 0, 0);
      popMatrix();
      popMatrix();
    }
  } //End of rifleShow

  void shotgunShow() {
  } //End of shotgunShow

  void rifleAct() {
    if (loc.x < width*0.1 + size/2 + 32.5) hp = 0;
    if (loc.x > width*0.9 + size/2 - 32.5) hp = 0;
    if (loc.y < height*0.1 + size/2 + 32.5) hp = 0;
    if (loc.y > height*0.9 + size/2 - 32.5) hp = 0;
  } //End of rifleAct

  void shotgunAct() {
  } //End of shotgunAct
}//End of bullet
