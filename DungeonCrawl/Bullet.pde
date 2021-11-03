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
  final int LAUNCHER = 5;
  final int PISTOL = 6;
  final int LAUNCHERSHELL = 7;
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
        size = 5.75;
        vel.setMag(28);
        timer = 60;

        if (gun instanceof Rifle) {
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
      } else if (current == SHOTGUN) {
        size = 7.75;
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
        size = 5.5;
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
        size = 17;
        vel.setMag(50);
        timer = 100;

        if (gun instanceof Sniper) {
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
      } else if (current == LAUNCHER) {
        size = 26;
        vel.setMag(20);
        timer = 100;
        hp = 2;

        if (gun instanceof Launcher) {
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
      } else if (current == PISTOL) {
        size = 10;
        vel.setMag(50);
        timer = 100;

        if (gun instanceof Pistol) {
          if (gun.faceRight) {
            faceLeft = false;
            faceRight = true;
            loc = new PVector(myHero.loc.x+10, myHero.loc.y+20);
            rightRotate = rightR;
          } else if (gun.faceLeft) {
            faceLeft = true;
            faceRight = false;
            loc = new PVector(myHero.loc.x-10, myHero.loc.y+20);
            leftRotate = leftR;
          }
        }
      } else {
        println("Bullet(int) ERROR!");
      }
    }
  }

  Bullet(PVector pos) {
    hp = 0;
    size = 13;
    timer = 60000;
    loc = new PVector(pos.x, pos.y);
    vel = new PVector(0, -1);
    nudge = new PVector(0, 10);
    r = PI+random(0, TWO_PI);
    nudge.rotate(r);
    nudge.setMag(23);
    loc.add(nudge);
    vel.rotate(r); //180 degrees
    vel.setMag(5);
    vel.rotate(r);
    current = LAUNCHERSHELL;
    imageMode(CENTER);
  }

  void show() {
    if (current == RIFLE) {
      rifleShow();
    } else if (current == SHOTGUN) {
      shotgunShow();
    } else if (current == SMG) {
      smgShow();
    } else if (current == SNIPER) {
      sniperShow();
    } else if (current == LAUNCHER) {
      launcherShow();
    } else if (current == PISTOL) {
      pistolShow();
    } else if (current == LAUNCHERSHELL) {
      launchershellShow();
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
    } else if (current == LAUNCHER) {
      launcherAct();
    } else if (current == PISTOL) {
      pistolAct();
    } else if (current == LAUNCHERSHELL) {
      launchershellAct();
    } else {
      println("Bullet.ACT ERROR!");
    }

    timer--;
    if (timer == 0) {
      hp = 0;
    }
  }

  void rifleShow() {
    drawBullet(31.5, -5.5, rifleBullet, 7.5, 4);
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
      image(shotgunBullet, 0, 0, 5, 10.5);
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
      image(shotgunBullet, 0, 0, 5, 10.5);
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
      image(smgBullet, 0, 0, 5, 6);
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
      image(smgBullet, 0, 0, 5, 6);
      popMatrix();
      popMatrix();
    }
  } //End of SMGShow

  void sniperShow() {
    drawBullet(45.5, -1.5, sniperBullet, 20, 14);
  } //End of sniperShow

  void launcherShow() {
    drawBullet(50, -9, launcherBullet, 26, 26);
  } //End of launcherShow

  void pistolShow() {
    drawBullet(21, -6, pistolBullet, 10, 10);
  } //End of pistolShow

  void launchershellShow() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(r);
    image(launcherShell, 0, 0, 15, 11);
    popMatrix();
    println(timer, vel, loc);
  } //End of launchershellShow

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

  void launcherAct() {
    loc.add(vel);

    if (loc.x < width*0.1 + size + 32.5) hp = 1;
    if (loc.x > width*0.9 + size - 32.5) hp = 1;
    if (loc.y < height*0.1 + size + 32.5) hp = 1;
    if (loc.y > height*0.9 + size - 32.5) hp = 1;

    /*
    if (loc.x < width*0.1 + size/2 + 32.5) hp = 1;
     if (loc.x > width*0.9 + size/2 - 32.5) hp = 1;
     if (loc.y < height*0.1 + size/2 + 32.5) hp = 1;
     if (loc.y > height*0.9 + size/2 - 32.5) hp = 1;
     */

    if (hp == 1) {
      for (int i = 0; i < 50; i++) {
        myObjects.add(new Bullet(loc));
      }
      hp = 0;
    }
  } //End of launcherAct

  void pistolAct() {
    loc.add(vel);
    if (loc.x < width*0.1 + size/2 + 32.5) hp = 0;
    if (loc.x > width*0.9 + size/2 - 32.5) hp = 0;
    if (loc.y < height*0.1 + size/2 + 32.5) hp = 0;
    if (loc.y > height*0.9 + size/2 - 32.5) hp = 0;
  } //End of pistolAct

  void launchershellAct() {
    loc.add(vel);
    if (loc.x < width*0.1 + size/2 + 32.5) hp = 0;
    if (loc.x > width*0.9 + size/2 - 32.5) hp = 0;
    if (loc.y < height*0.1 + size/2 + 32.5) hp = 0;
    if (loc.y > height*0.9 + size/2 - 32.5) hp = 0;
  } //End of launchershellAct

  void drawBullet(float OFX, float OFY, PImage bullet, float x, float y) {
    noStroke();
    noFill();
    offsetY = OFY;
    if (faceRight) {
      offsetX = OFX;
      pushMatrix();
      translate(loc.x, loc.y);
      rotate(rightRotate);
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI);
      image(bullet, 0, 0, y, x);
      popMatrix();
      popMatrix();
    } else if (faceLeft) {
      offsetX = -OFX;
      pushMatrix();
      translate(loc.x, loc.y);
      rotate(leftRotate);
      pushMatrix();
      translate(offsetX, offsetY);
      rotate(HALF_PI*3);
      image(bullet, 0, 0, y, x);
      popMatrix();
      popMatrix();
    }
  } //End of drawBullet
}//End of bullet
