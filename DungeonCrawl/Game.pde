void game() {
  drawRoom();
  drawGameObjects();
  drawDarkness();
  drawMap();
}

void drawRoom() {
  //background
  rectMode(CENTER);
  imageMode(CORNER);
  image(dwall, 0, -50, width, height + 100);
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
  if (northRoom != #FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  //corner lines
  strokeWeight(5);
  stroke(violet);
  fill(violet);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  //playable area
  strokeWeight(5);
  stroke(0);
  fill(blueGray);
  rect(width/2, height/2, 800, 800);
}

void drawGameObjects() {
  //Objects
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
  //southRoom = map.get(myHero.roomX, myHero.roomY+1);
  pushMatrix();
  translate(30, 30);
  fill(gray);
  strokeWeight(5);
  stroke(orange);
  rectMode(CENTER);
  rect(50, 50, 120, 120);
  rectMode(CORNER);
  for (int y = 0; y < 10; y++) {
    for (int x = 0; x < 10; x++) {
      noStroke();
      color a = map.get(x, y);
      fill(a);
      if (a != #FFFFFF) square(x * 10, y * 10, 10);
    }
  }
  fill(green);
  square(myHero.roomX * 10, myHero.roomY * 10, 10);
  popMatrix();
}

void gameReleased() {
  mode = GAMEOVER;
}
