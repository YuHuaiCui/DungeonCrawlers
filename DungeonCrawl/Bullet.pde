class Bullet extends GameObject {
  
  int timer;
  PVector nudge;
  
  Bullet() {
    timer = 60;
    hp = 1;
    loc = new PVector(myHero.loc.x, myHero.loc.y + 10);
    vel = new PVector(myHero.vel.x, myHero.vel.y);
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

  void show() {
    strokeWeight(3);
    stroke(255);
    noFill();
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();
    
    timer--;
    if (timer == 0) {
     hp = 0; 
    }
  }
}//End of bullet
