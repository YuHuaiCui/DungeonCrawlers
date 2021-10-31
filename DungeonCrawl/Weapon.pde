class Weapon extends GameObject {
  int current;
  final int RIFLE = 1;
  final int SHOTGUN = 2;
  final int RICOCHET = 3;
  //final int KNIFE = 4;

  Weapon() {
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = new PVector(0, 0);
    hp = 1;
    current = 1;
  }

  void show() {
    if (current == RIFLE) {
      rifleShow();
    } else if (current == SHOTGUN) {
      shotgunShow();
    } else if (current == RICOCHET) {
      ricochetShow();
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
    } else if (current == RICOCHET) {
      ricochetAct();
    } else {
      println("WEAPONS.SHOW ERROR!");
    }
  } //End of act

  void rifleShow() {
    rectMode(CENTER);
    noStroke();
    fill(yellow);
    if (myHero.faceRight) {
      rect(myHero.loc.x + 10, myHero.loc.y + 10, 30, 10);
    } else if (myHero.faceLeft) {
      rect(myHero.loc.x - 10, myHero.loc.y + 10, 30, 10);
    }
    rectMode(CORNER);
  } //End of rifleShow

  void shotgunShow() {
  } //End of shotgunShow

  void ricochetShow() {
  } //End of ricochetShow

  void rifleAct() {
    if (spacekey) myObjects.add(new Bullet());
  } //End of rifleAct

  void shotgunAct() {
  } //End of shotgunAct

  void ricochetAct() {
  } //End of ricochetAct
}
