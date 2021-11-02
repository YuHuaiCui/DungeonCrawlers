class Bullet extends GameObject {
  boolean faceLeft, faceRight;
  float offsetX, offsetY;
  float leftRotate, rightRotate;
  float r;
  int current;
  final int RIFLE = 1;
  final int SHOTGUN = 2;
  final int SMG = 3;
  final int SNIPER = 4;
  int timer;
  PVector nudge;

  Bullet() {
    timer = 60;
    hp = 1;
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = new PVector(0, -1);
    vel.setMag(10);
    if (loc.x < myHero.loc.x + 28 && myHero.faceRight) {
      loc.x = myHero.loc.x + 28;
    }
    if (loc.x > myHero.loc.x - 28 && myHero.faceLeft) {
      loc.x = myHero.loc.x - 28;
    }
    size = 10;
  }

  Bullet(int c, float leftR, float rightR) {
    current = c;
    hp = 1;
    vel = new PVector(mouseX - myHero.loc.x, mouseY - myHero.loc.y);
    size = 5;
    for (int i = 0; i < myWeapon.size(); i++) {
      Weapon gun = myWeapon.get(i);
      if (current == RIFLE) {
        vel.setMag(28);
        timer = 60;

        if (gun instanceof Rifle) {
          if (gun.faceRight) {
            faceLeft = false;
            faceRight = true;
            loc = new PVector(myHero.loc.x+20, myHero.loc.y+20);
            rightRotate = rightR;
          } else if (gun.faceLeft) {
            faceLeft = true;
            faceRight = false;
            loc = new PVector(myHero.loc.x-20, myHero.loc.y+20);
            leftRotate = leftR;
          }
        }
      } else if (current == SHOTGUN) {
        vel.setMag(15);
        timer = 20;

        r = random(-PI/6, PI/6);
        vel.rotate(r);
        if (gun instanceof Shotgun) {
          if (gun.faceRight) {
            faceLeft = false;
            faceRight = true;
            loc = new PVector(myHero.loc.x+gun.offsetX, myHero.loc.y+gun.offsetY);
            rightRotate = rightR;
          } else if (gun.faceLeft) {
            faceLeft = true;
            faceRight = false;
            loc = new PVector(myHero.loc.x-gun.offsetX, myHero.loc.y+gun.offsetY);
            leftRotate = leftR;
          }
        }
      } else if (current == SMG) {
        vel.setMag(20);
        timer = 20;

        r = random(-PI/20, PI/20);
        vel.rotate(r);
        if (gun instanceof SMG) {
          if (gun.faceRight) {
            faceLeft = false;
            faceRight = true;
            loc = new PVector(myHero.loc.x+gun.offsetX, myHero.loc.y+gun.offsetY);
            rightRotate = rightR;
          } else if (gun.faceLeft) {
            faceLeft = true;
            faceRight = false;
            loc = new PVector(myHero.loc.x-gun.offsetX, myHero.loc.y+gun.offsetY);
            leftRotate = leftR;
          }
        }
      } else if (current == SNIPER) {
        vel.setMag(50);
        timer = 100;

        if (gun instanceof Sniper) {
          if (gun.faceRight) {
            faceLeft = false;
            faceRight = true;
            loc = new PVector(myHero.loc.x+20, myHero.loc.y+20);
            rightRotate = rightR;
          } else if (gun.faceLeft) {
            faceLeft = true;
            faceRight = false;
            loc = new PVector(myHero.loc.x-20, myHero.loc.y+20);
            leftRotate = leftR;
          }
        }
      } else {
        println("Bullet(int) ERROR!");
      }
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
    } else if (current == SMG) {
      smgShow();
    } else if (current == SNIPER) {
      sniperShow();
    } else {
      println("Bullet.SHOW ERROR!");
    }
  }

  void act() {

    if (current == RIFLE) {
      rifleAct();
    } else if (current == SHOTGUN) {
      shotgunAct();
    } else if (current == SMG) {
      smgAct();
    } else if (current == SNIPER) {
      sniperAct();
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
      offsetX = 31.5;
      offsetY = -5.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(rightRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI);
      image(rifleBullet, 0, 0, 4, 7.5);
      popMatrix();
      popMatrix();
    } else if (faceLeft) {
      offsetX = -31.5;
      offsetY = -5.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(leftRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI*3);
      image(rifleBullet, 0, 0, 4, 7.5);
      popMatrix();
      popMatrix();
    }
  } //End of rifleShow

  void shotgunShow() {
    if (faceRight) {
      offsetX = 29;
      offsetY = -4.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(rightRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI + r);
      image(rifleBullet, 0, 0, 4, 7.5);
      popMatrix();
      popMatrix();
    } else if (faceLeft) {
      offsetX = -29;
      offsetY = -4.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(leftRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI*3 + r);
      image(rifleBullet, 0, 0, 4, 7.5);
      popMatrix();
      popMatrix();
    }
  } //End of shotgunShow

  void smgShow() {
    if (faceRight) {
      offsetX = 27.5;
      offsetY = -0.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(rightRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI);
      image(rifleBullet, 0, 0, 4, 7.5);
      popMatrix();
      popMatrix();
    } else if (faceLeft) {
      offsetX = -27.5;
      offsetY = -0.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(leftRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI*3);
      image(rifleBullet, 0, 0, 4, 7.5);
      popMatrix();
      popMatrix();
    }
  } //End of SMGShow
  
  void sniperShow() {
    if (faceRight) {
      offsetX = 35.5;
      offsetY = -3.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(rightRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI);
      image(rifleBullet, 0, 0, 4, 7.5);
      popMatrix();
      popMatrix();
    } else if (faceLeft) {
      offsetX = -35.5;
      offsetY = -3.5;

      pushMatrix();
      translate(loc.x, loc.y);
      rotate(leftRotate);
      strokeWeight(2);
      stroke(255);
      noFill();
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI*3);
      image(rifleBullet, 0, 0, 4, 7.5);
      popMatrix();
      popMatrix();
    }
  }

  void rifleAct() {
    loc.add(vel);
    if (loc.x < width*0.1 + size/2 + 32.5) hp = 0;
    if (loc.x > width*0.9 + size/2 - 32.5) hp = 0;
    if (loc.y < height*0.1 + size/2 + 32.5) hp = 0;
    if (loc.y > height*0.9 + size/2 - 32.5) hp = 0;
  } //End of rifleAct

  void shotgunAct() {
    loc.add(vel);
    if (loc.x < width*0.1 + size/2 + 32.5) hp = 0;
    if (loc.x > width*0.9 + size/2 - 32.5) hp = 0;
    if (loc.y < height*0.1 + size/2 + 32.5) hp = 0;
    if (loc.y > height*0.9 + size/2 - 32.5) hp = 0;
  } //End of shotgunAct

  void smgAct() {
    loc.add(vel);
    if (loc.x < width*0.1 + size/2 + 32.5) hp = 0;
    if (loc.x > width*0.9 + size/2 - 32.5) hp = 0;
    if (loc.y < height*0.1 + size/2 + 32.5) hp = 0;
    if (loc.y > height*0.9 + size/2 - 32.5) hp = 0;
  } //End of smgAct
  
  void sniperAct() {
    loc.add(vel);
    if (loc.x < width*0.1 + size/2 + 32.5) hp = 0;
    if (loc.x > width*0.9 + size/2 - 32.5) hp = 0;
    if (loc.y < height*0.1 + size/2 + 32.5) hp = 0;
    if (loc.y > height*0.9 + size/2 - 32.5) hp = 0;
  } //End of sniperAct
}//End of bullet
