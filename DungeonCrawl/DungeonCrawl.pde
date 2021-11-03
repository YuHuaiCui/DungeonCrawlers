//Daniel Cui
//10.20.2021
//

//!! - FX2D
import processing.javafx.*;

//booleans
boolean mouseReleased;
boolean hadPressed;
boolean upkey, downkey, leftkey, rightkey, spacekey, wkey, skey, akey, dkey, shiftkey;
boolean onekey, twokey, threekey, fourkey, fivekey, sixkey;

//colors
color base;
color red = #DF151A;
color orange = #FD8603;
color yellow = #F4F328;
color green = #00DA3C;
color blue = #00CBE7;
color violet = #22081E;
color blueGray = #2F4553;
color brown = #FFB174;
color gray = #556B6F;
color northRoom, southRoom, eastRoom, westRoom;

//gifs
Gif corridor;
Gif wall;
Gif standingRight;
Gif standingLeft;
Gif movingRight;
Gif movingLeft;

//ints
int mode;
final int HOME = 0;
final int GAME = 1;
final int GAMEOVER = 2;
final int PAUSE = 3;

//objects
ArrayList<GameObject> myObjects;
ArrayList<Weapon> myWeapon;
ArrayList<DarknessCell> darkness;
Hero myHero;
Button playButton;
Button exitButton;

//pfonts
PFont dark;

//pimages
PImage dwall;
PImage tile;
PImage doorClosed;
PImage doorHalfClosed;
PImage doorHalfOpened;
PImage doorOpened;
PImage map;
PImage rifleBullet;
PImage shotgunBullet;
PImage smgBullet;
PImage sniperBullet;
PImage launcherBullet;
PImage launcherShell;
PImage pistolBullet;
PImage muzzleFlash;

void setup() {
  size(1000, 1000, FX2D);
  mode = HOME;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  //create darkness
  darkness = new ArrayList<DarknessCell>();
  for (int y = 0; y < height; y += 10) {
    for (int x = 0; x < width; x += 10) {
      darkness.add(new DarknessCell(x, y, 10));
    }
  }
  //load font
  dark = createFont("pdark.ttf", 32);

  //load gif
  corridor = new Gif(1, 5, "corridor", ".png", 2, 0, 0, width, height, false);
  wall = new Gif(1, 8, "wall", ".png", 2, 0, 0, width, height, false);
  standingRight = new Gif(1, 6, "standingRight", ".png", 2, 0, 0, 60, 60, false);
  standingLeft = new Gif(1, 6, "standingLeft", ".png", 2, 0, 0, 60, 60, false);
  movingRight = new Gif(1, 6, "movingRight", ".png", 4, 0, 0, 60, 60, false);
  movingLeft = new Gif(1, 6, "movingLeft", ".png", 4, 0, 0, 60, 60, false);

  //load image
  dwall = loadImage("dwall.png");
  tile = loadImage("tile.png");
  doorClosed = loadImage("doorClosed.png");
  doorHalfClosed = loadImage("doorHalfClosed.png");
  doorHalfOpened = loadImage("doorHalfOpened.png");
  doorOpened = loadImage("doorOpened.png");
  map = loadImage("map.png");
  rifleBullet = loadImage("rifleBullet.png");
  shotgunBullet = loadImage("shotgunBullet.png");
  smgBullet = loadImage("smgBullet.png");
  sniperBullet = loadImage("sniperBullet.png");
  launcherBullet = loadImage("launcherBullet.png");
  launcherShell = loadImage("launcherShell.png");
  pistolBullet = loadImage("pistolBullet.png");
  muzzleFlash = loadImage("smgFlash.png");

  //create objects
  myObjects = new ArrayList<GameObject>(1000);
  myHero = new Hero();
  myObjects.add(myHero);
  myWeapon = new ArrayList<Weapon>();
  myWeapon.add(new Rifle());
  myWeapon.add(new Shotgun());
  myWeapon.add(new SMG());
  myWeapon.add(new Sniper());
  myWeapon.add(new Launcher());
  myWeapon.add(new Pistol());
}

void draw() {
  //mouseReleased
  if (mousePressed) hadPressed = true;
  if (!mousePressed && hadPressed) {
    mouseReleased = true;
    hadPressed = false;
  } else {
    mouseReleased = false;
  }

  if (mode == HOME) {
    home();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else {
    println("MODE FRAMEWORK ERROR!");
  }
}
