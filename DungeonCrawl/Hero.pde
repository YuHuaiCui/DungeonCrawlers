class Hero extends GameObject {
  float speed;
  int roomX, roomY; 
  boolean faceLeft, faceRight;

  Hero() {
    super();
    roomX = 1;
    roomY = 1;
    speed = 5;
    size = 50;
    faceRight = true;
    faceLeft = false;
  }

  void show() {
    //circle(loc.x, loc.y, size);

    //this rect will be the hitbox
    //rect(loc.x, loc.y, 50, 60);
    if (vel.x > 1 || vel.y > 1 || vel.x < -1 || vel. y < -1) {
      if (faceRight) {
        movingRight.centerMovingShow(loc.x, loc.y, 60, 60);
      } else if (faceLeft) {
        movingLeft.centerMovingShow(loc.x, loc.y, 60, 60);
      }
    } else {
      if (faceRight) standingRight.centerMovingShow(loc.x, loc.y, 60, 60);
      else if (faceLeft) standingLeft.centerMovingShow(loc.x, loc.y, 60, 60); 
    }
  }

  void act() {
    super.act();

    //Moving
    vel.limit(speed);
    if (wkey || upkey) vel.y = -5;
    if (skey || downkey) vel.y = 5;
    if (akey || leftkey) {
      vel.x = -5;
      faceLeft = true;
      faceRight = false;
    }
    if (dkey || rightkey) {
      vel.x = 5;
      faceRight = true;
      faceLeft = false;
    }
    if (!wkey && !skey && !upkey && !downkey) vel.y = vel.y * 0.75;
    if (!akey && !dkey && !leftkey && !rightkey) vel.x = vel.x * 0.75;

    //wall collisions
    if (northRoom == #FFFFFF && loc.y < height*0.125) loc.y = height*0.125;
    if (southRoom == #FFFFFF && loc.y > height*0.875) loc.y = height*0.875;
    if (eastRoom == #FFFFFF && loc.x > width*0.875) loc.x = width*0.875;
    if (westRoom == #FFFFFF && loc.x < width*0.125) loc.x = width*0.125;
    if (northRoom != #FFFFFF && loc.y < height*0.125 && (loc.x < width/2-50 || loc.x > width/2+50)) loc.y = height*0.125;
    if (southRoom != #FFFFFF && loc.y > height*0.875 && (loc.x < width/2-50 || loc.x > width/2+50)) loc.y = height*0.875;
    if (eastRoom != #FFFFFF && loc.x > width*0.875 && (loc.y < height/2-50 || loc.y > height/2+50)) loc.x = width*0.875;
    if (westRoom != #FFFFFF && loc.x < width*0.125 && (loc.y < height/2-50 || loc.y > height/2+50)) loc.x = width*0.125;

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
  }
}
