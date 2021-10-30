class GameObject {
  int hp;
  int size;
  PVector loc;
  PVector vel;

  GameObject() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 1;
  }

  void show() {
  }

  void act() {
    //move
    loc.add(vel);

    //check for hittin walls
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject obj = myObjects.get(i);
      if (obj != myHero) {
        if (loc.x < width*0.125) loc.x = width*0.125;
        if (loc.x > width*0.875) loc.x = width*0.875;
        if (loc.y < height*0.125) loc.y = height*0.125;
        if (loc.y > height*0.875) loc.y = height*0.875;
      } 
    }
  }
}
