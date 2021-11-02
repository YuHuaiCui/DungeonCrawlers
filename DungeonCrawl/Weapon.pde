class Weapon {
  boolean faceRight, faceLeft;
  float leftRotate, rightRotate;
  PVector loc, vel;
  float imageWidth, imageHeight;
  float offsetX, offsetY;
  int shoot, shootTimer;
  int gun;
  final int RIFLE = 1;
  final int SHOTGUN = 2;
  final int SMG = 3;
  final int SNIPER = 4;

  Weapon() {
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = new PVector(0, 0);
    shoot = 0;
  }

  void update() {
    
  } //End of update()

  void shoot() {
    if (gun == RIFLE) {
      shoot++;
      if (shoot >= shootTimer) {
        if (spacekey) myObjects.add(new Bullet(gun, leftRotate, rightRotate));
        shoot = 0;
      }
    } else if (gun == SHOTGUN) {
      shoot++;
      if (shoot >= shootTimer) {
        if (spacekey) {
          myObjects.add(new Bullet(gun, leftRotate, rightRotate));
          myObjects.add(new Bullet(gun, leftRotate, rightRotate));
          myObjects.add(new Bullet(gun, leftRotate, rightRotate));
          myObjects.add(new Bullet(gun, leftRotate, rightRotate));
          myObjects.add(new Bullet(gun, leftRotate, rightRotate));
          myObjects.add(new Bullet(gun, leftRotate, rightRotate));
          myObjects.add(new Bullet(gun, leftRotate, rightRotate));
          myObjects.add(new Bullet(gun, leftRotate, rightRotate));
        }
        shoot = 0;
      }
    } else if (gun == SMG) {
      shoot++;
      if (shoot >= shootTimer) {
        if (spacekey) myObjects.add(new Bullet(gun, leftRotate, rightRotate));
        shoot = 0;
      }
    } else if (gun == SNIPER) {
      shoot++;
      if (shoot >= shootTimer) {
        if (spacekey) myObjects.add(new Bullet(gun, leftRotate, rightRotate));
        shoot = 0;
      }
    }
  } //End of shoot()
}
