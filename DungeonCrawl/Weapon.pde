class Weapon extends GameObject {
  int current;
  final int RIFLE = 1;
  final int SHOTGUN = 2;
  //final int PISTOL = 3;
  int shoot, shootTimer;

  Weapon() {
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = new PVector(0, 0);
    hp = 1;
    current = 1;
    shoot = 0;
  }

  void show() {
    if (current == RIFLE) {
      rifleShow();
    } else if (current == SHOTGUN) {
      shotgunShow();
    } else {
      println("WEAPONS.SHOW ERROR!");
    }
  } //End of show

  void act() {
    super.act();

    if (current == RIFLE) {
      rifleAct();
    } else if (current == SHOTGUN) {
      shotgunAct();
    } else {
      println("WEAPONS.ACT ERROR!");
    }
  } //End of act

  void rifleShow() {
    //firerate
    shootTimer = 10;
    
    rectMode(CENTER);
    imageMode(CENTER);
    noStroke();
    fill(yellow);
    if (myHero.faceRight) {
      pushMatrix();
      translate(myHero.loc.x+20, myHero.loc.y+20);
      rotate(-atan2(myHero.vel.x, myHero.vel.y) - (HALF_PI * 3));
      image(rifleRight, 0, 0, 60, 30);
      popMatrix();
    } else if (myHero.faceLeft) {
      pushMatrix();
      translate(myHero.loc.x-20, myHero.loc.y+20);
      rotate(-atan2(myHero.vel.x, myHero.vel.y) + (HALF_PI * 3));
      image(rifleLeft, 0, 0, 60, 30);
      popMatrix();
    }
    imageMode(CENTER);
    rectMode(CORNER);
  } //End of rifleShow

  void shotgunShow() {
  } //End of shotgunShow

  void rifleAct() {
    shoot++;
      if (shoot >= shootTimer) {
      if (spacekey) myObjects.add(new Bullet(current));
      shoot = 0;
    }
  } //End of rifleAct

  void shotgunAct() {
  } //End of shotgunAct
}
