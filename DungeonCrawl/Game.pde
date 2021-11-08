void game() {
  drawRoom();
  drawBlocks();
  drawGameObjects();
  drawDarkness();
  drawMap();
}

void drawRoom() {
  //background
  rectMode(CENTER);
  imageMode(CORNER);
  for (int y = 0; y < height; y += 80) {
    for (int x = 0; x < width; x += 80) {
      image(dwall, x, y, 80, 80);
    }
  }
  fill(0, 0, 0, 75);
  noStroke();
  rect(width/2, height/2, width, height);

  //draw exits
  //#1 - Find out which directions have exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  eastRoom = map.get(myHero.roomX+1, myHero.roomY);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);

  stroke(0);
  strokeWeight(10);
  fill(0);
  imageMode(CENTER);
  if (northRoom != #FFFFFF) {
    pushMatrix();
    translate(width/2, 50);
    if (myHero.loc.y >= width/2) image(doorClosed, 0, 0, 110, 100);
    if (myHero.loc.y <= width/2 && myHero.loc.y > width/2 - (400/3)) image(doorHalfClosed, 0, 0, 110, 100);
    if (myHero.loc.y <= width/2 - (400/3) && myHero.loc.y > width/2 - 2*(400/3)) image(doorHalfOpened, 0, 0, 110, 100);
    if (myHero.loc.y <= width/2 - 2*(400/3)) image(doorOpened, 0, 0, 110, 100);
    popMatrix();
  }
  if (southRoom != #FFFFFF) {
    pushMatrix();
    translate(width/2, height-50);
    rotate(PI);
    if (myHero.loc.y <= width/2) image(doorClosed, 0, 0, 110, 100);
    if (myHero.loc.y >= width/2 && myHero.loc.y < width/2 + (400/3)) image(doorHalfClosed, 0, 0, 110, 100);
    if (myHero.loc.y >= width/2 + (400/3) && myHero.loc.y < width/2 + 2*(400/3)) image(doorHalfOpened, 0, 0, 110, 100);
    if (myHero.loc.y >= width/2 + 2*(400/3)) image(doorOpened, 0, 0, 110, 100);
    popMatrix();
  }
  if (eastRoom != #FFFFFF) {
    pushMatrix();
    translate(width-50, height/2);
    rotate(HALF_PI);
    if (myHero.loc.x <= height/2) image(doorClosed, 0, 0, 110, 100);
    if (myHero.loc.x >= height/2 && myHero.loc.x < height/2 + (400/3)) image(doorHalfClosed, 0, 0, 110, 100);
    if (myHero.loc.x >= height/2 + (400/3) && myHero.loc.x < height/2 + 2*(400/3)) image(doorHalfOpened, 0, 0, 110, 100);
    if (myHero.loc.x >= height/2 + 2*(400/3)) image(doorOpened, 0, 0, 110, 100);
    popMatrix();
  }
  if (westRoom != #FFFFFF) {
    pushMatrix();
    translate(50, height/2);
    rotate(3*HALF_PI);
    if (myHero.loc.x >= height/2) image(doorClosed, 0, 0, 110, 100);
    if (myHero.loc.x <= height/2 && myHero.loc.x > height/2 - (400/3)) image(doorHalfClosed, 0, 0, 110, 100);
    if (myHero.loc.x <= height/2 - (400/3) && myHero.loc.x > height/2 - 2*(400/3)) image(doorHalfOpened, 0, 0, 110, 100);
    if (myHero.loc.x <= height/2 - 2*(400/3)) image(doorOpened, 0, 0, 110, 100);
    popMatrix();
  }
  imageMode(CORNER);

  //corner lines
  strokeWeight(5);
  stroke(violet);
  fill(violet);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  //playable area
  strokeWeight(5);
  stroke(0);
  noFill();
  square(width/2, height/2, 1000);
  strokeWeight(1);
  fill(blueGray);
  rectMode(CORNER);
  for (int y = 100; y < 900; y += 80) {
    for (int x = 100; x < 900; x += 80) {
      rect(x, y, 80, 80);
      image(tile, x, y, 80, 80);
    }
  }
  //rect(width/2, height/2, 800, 800);
  rectMode(CENTER);
}

void drawGameObjects() {
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    obj.show();
    obj.act();
    if (obj.hp <= 0) {
      myObjects.remove(i);
      i--;
    }
  }
}

void drawDarkness() {
  for (int i = 0; i < darkness.size(); i++) {
    DarknessCell dark = darkness.get(i);
    dark.show();
    dark.act();
  }
}

void drawMap() {
  pushMatrix();
  translate(30, 30);
  fill(gray, 150);
  strokeWeight(5);
  stroke(orange, 150);
  rectMode(CENTER);
  rect(50, 50, 120, 120);
  rectMode(CORNER);
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      noStroke();
      color a = map.get(x, y);
      fill(a, 180);
      if (a != #FFFFFF) square(x * 10, y * 10, 10);
    }
  }
  fill(green, 210);
  square(myHero.roomX * 10, myHero.roomY * 10, 10);
  popMatrix();
}

void drawBlocks() {
  for (int i = 0; i < myBlocks.size(); i++) {
    Block block = myBlocks.get(i);
    block.show();
    block.act();
  }
}

void gameReleased() {
  mode = GAMEOVER;
}
