class Hero extends GameObject {
  float speed;
  int roomX, roomY; 
  boolean faceLeft, faceRight;
  int current;
  final int RIFLE = 1;
  final int SHOTGUN = 2;
  final int SMG = 3;
  final int SNIPER = 4;

  Hero() {
    super();
    roomX = 1;
    roomY = 1;
    speed = 5;
    size = 0;
    faceRight = true;
    faceLeft = false;
    current = 1;
  }

  void show() {
    //circle(loc.x, loc.y, size);

    //this rect will be the hitbox
    //rect(loc.x, loc.y, 50, 60);

    //Show Hero
    float a = atan2(mouseX-myHero.loc.x, mouseY-myHero.loc.y) - (HALF_PI * 3);
    if (a < -HALF_PI && a > -HALF_PI*3) {
      faceRight = true;
      faceLeft = false;
    } else {
      faceRight = false;
      faceLeft = true;
    }
    if (vel.x > 1 || vel.y > 1 || vel.x < -1 || vel. y < -1) {
      if (faceRight) {
        movingRight.centerMovingShow(loc.x, loc.y, 90, 90);
      } else if (faceLeft) {
        movingLeft.centerMovingShow(loc.x, loc.y, 90, 90);
      }
    } else {
      if (faceRight) standingRight.centerMovingShow(loc.x, loc.y, 90, 90);
      else if (faceLeft) standingLeft.centerMovingShow(loc.x, loc.y, 90, 90);
    }

    //Select Weapon
    if (onekey) {       
      current = RIFLE;
    } else if (twokey) {  
      current = SHOTGUN;
    } else if (threekey) {
      current = SMG;
    } else if (fourkey) {
      current = SNIPER;
    }

    //Show weapon
    if (current == RIFLE) {
      for (int i = 0; i < myWeapon.size(); i++) {
        Weapon myWeps = myWeapon.get(i);
        if (myWeps instanceof Rifle) {
          myWeps.update();
          myWeps.shoot();
        }
      }
    } else if (current == SHOTGUN) {
      for (int i = 0; i < myWeapon.size(); i++) {
        Weapon myWeps = myWeapon.get(i);
        if (myWeps instanceof Shotgun) {
          myWeps.update();
          myWeps.shoot();
        }
      }
    } else if (current == SMG) {
      for (int i = 0; i < myWeapon.size(); i++) {
        Weapon myWeps = myWeapon.get(i);
        if (myWeps instanceof SMG) {
          myWeps.update();
          myWeps.shoot();
        }
      }
    } else if (current == SNIPER) {
      for (int i = 0; i < myWeapon.size(); i++) {
        Weapon myWeps = myWeapon.get(i);
        if (myWeps instanceof Sniper) {
          myWeps.update();
          myWeps.shoot();
        }
      }
    }
  } //End of show


  void act() {
    super.act();

    //Moving
    if (!shiftkey) {
      vel.limit(speed);
    } else vel.limit(speed*2);
    if (wkey || upkey && !shiftkey) vel.y = -speed;
    else if (wkey || upkey && shiftkey) vel.y = -speed * 2;
    if (skey || downkey && !shiftkey) vel.y = speed;
    else if (skey || downkey && shiftkey) vel.y = speed * 2;
    if (akey || leftkey) {
      if (!shiftkey) vel.x = -speed;
      else if (shiftkey) vel.x = -speed * 2;
      faceLeft = true;
      faceRight = false;
    }
    if (dkey || rightkey) {
      if (!shiftkey) vel.x = speed;
      else if (shiftkey) vel.x = speed * 2;
      faceRight = true;
      faceLeft = false;
    }
    if (!wkey && !skey && !upkey && !downkey) vel.y = vel.y * 0.75;
    if (!akey && !dkey && !leftkey && !rightkey) vel.x = vel.x * 0.75;

    //wall collisions
    if (northRoom == #FFFFFF && loc.y < height*0.125) loc.y = height*0.129;
    if (southRoom == #FFFFFF && loc.y > height*0.875) loc.y = height*0.871;
    if (eastRoom == #FFFFFF && loc.x > width*0.875) loc.x = width*0.871;
    if (westRoom == #FFFFFF && loc.x < width*0.125) loc.x = width*0.129;
    if (northRoom != #FFFFFF && loc.y < height*0.125 && (loc.x < width/2-90 || loc.x > width/2+90)) loc.y = height*0.129;
    if (southRoom != #FFFFFF && loc.y > height*0.875 && (loc.x < width/2-90 || loc.x > width/2+90)) loc.y = height*0.871;
    if (eastRoom != #FFFFFF && loc.x > width*0.875 && (loc.y < height/2-90 || loc.y > height/2+90)) loc.x = width*0.871;
    if (westRoom != #FFFFFF && loc.x < width*0.125 && (loc.y < height/2-90 || loc.y > height/2+90)) loc.x = width*0.129;

    //check exits
    //north
    if (northRoom != #FFFFFF && loc.y <= height*0.1 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY--;
      loc = new PVector (width/2, height*0.875-10);
    }

    //south
    else if (southRoom != #FFFFFF && loc.y >= height*0.9 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY++;
      loc = new PVector (width/2, height*0.125+10);
    }

    //east
    else if (eastRoom != #FFFFFF && loc.x >= width*0.9 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX++;
      loc = new PVector (width*0.125+10, width/2);
    }

    //west
    else if (westRoom != #FFFFFF && loc.x <= width*0.1 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX--;
      loc = new PVector (width*0.875-10, width/2);
    }
  } //End of act
} //End of Hero class
