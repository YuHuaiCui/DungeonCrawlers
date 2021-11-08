class Hero extends GameObject {
  float speed;
  float sizeX, sizeY;
  int roomX, roomY; 
  boolean faceLeft, faceRight;
  int current;
  final int RIFLE = 1;
  final int SHOTGUN = 2;
  final int SMG = 3;
  final int SNIPER = 4;
  final int LAUNCHER = 5;
  final int PISTOL = 6;
  Weapon currentGun;

  Hero() {
    super();
    roomX = 1;
    roomY = 1;
    speed = 5;
    size = 90;
    sizeX = 60;
    sizeY = 90;
    faceRight = true;
    faceLeft = false;
    current = 1;
  }

  void show() {
    //rectMode(CENTER);
    //rect(loc.x, loc.y, 60, 90);
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
    } else if (fivekey) {
      current = LAUNCHER;
    } else if (sixkey) {
      current = PISTOL;
    } 

    //Show weapon
    currentGun = myWeapon.get(current-1);
    currentGun.update();
    currentGun.shoot();

    //circle(loc.x, loc.y, 10);
    //show center of Hero
  } //End of show


  void act() {
    loc.add(vel);

    //Moving
    if (!shiftkey) {
      vel.limit(speed);
    } else vel.limit(speed*2);
    if (wkey || upkey) {
      if (!shiftkey) vel.y = -speed;
      else if (shiftkey) vel.y = -speed * 2;
    }
    if (skey || downkey) {
      if (!shiftkey) vel.y = speed;
      else if (shiftkey) vel.y = speed * 2;
    }
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
    if (northRoom == #FFFFFF && loc.y < height*0.1 + sizeY/2) loc.y = height*0.1 + sizeY/2;
    if (southRoom == #FFFFFF && loc.y > height*0.9 - sizeY/2) loc.y = height*0.9 - sizeY/2;
    if (eastRoom == #FFFFFF && loc.x > width*0.9 - sizeX/2) loc.x = width*0.9 - sizeX/2;
    if (westRoom == #FFFFFF && loc.x < width*0.1 + sizeX/2) loc.x = width*0.1 + sizeX/2;

    if (northRoom != #FFFFFF && loc.y < height*0.1 + sizeY/2 && (loc.x < width/2-20 || loc.x > width/2+20)) {
      loc.y = height*0.1 + sizeY/2;
    }
    if (southRoom != #FFFFFF && loc.y > height*0.9 - sizeY/2 && (loc.x < width/2-20 || loc.x > width/2+20)) {
      loc.y = height*0.9 - sizeY/2;
    }
    if (eastRoom != #FFFFFF && loc.x > width*0.9 - sizeX/2 && (loc.y < height/2-20 || loc.y > height/2+20)) {
      loc.x = width*0.9 - sizeX/2;
    }
    if (westRoom != #FFFFFF && loc.x < width*0.1 + sizeX/2 && (loc.y < height/2-20 || loc.y > height/2+20)) {
      loc.x = width*0.1 + sizeX/2;
    }

    //check exits
    //north
    if (northRoom != #FFFFFF && loc.y < height*0.1 + sizeY/2 && loc.x >= width/2-20 && loc.x <= width/2+20) {
      roomY--;
      loc = new PVector (width/2, height*0.9 - sizeY/2 - 10);
    }

    //south
    else if (southRoom != #FFFFFF && loc.y > height*0.9 - sizeY/2 && loc.x >= width/2-20 && loc.x <= width/2+20) {
      roomY++;
      loc = new PVector (width/2, height*0.1 + sizeY/2 + 10);
    }

    //east
    else if (eastRoom != #FFFFFF && loc.x > width*0.9 - sizeX/2 && loc.y >= height/2-20 && loc.y <= height/2+20) {
      roomX++;
      loc = new PVector (width*0.1 + sizeX/2 + 10, width/2);
    }

    //west
    else if (westRoom != #FFFFFF && loc.x < width*0.1 + sizeX/2 && loc.y >= height/2-20 && loc.y <= height/2+20) {
      roomX--;
      loc = new PVector (width*0.9 - sizeX/2 - 10, width/2);
    }
  } //End of act
} //End of Hero class
