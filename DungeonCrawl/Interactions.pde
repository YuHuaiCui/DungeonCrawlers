void mouseReleased() {
  if (mode == HOME) {
    homeReleased();
  } else if (mode == GAME) {
    gameReleased();
  } else if (mode == GAMEOVER) {
    gameoverReleased();
  } else if (mode == PAUSE) {
    pauseReleased();
  } else {
    println("MODE FRAMEWORK ERROR!");
  }
}

void keyPressed() {
  if (keyCode == UP)    upkey    = true;
  if (keyCode == DOWN)  downkey  = true;
  if (keyCode == LEFT)  leftkey  = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == ' ')   spacekey = true;
  if (keyCode == 'W' || keyCode == 'w' )   wkey = true;
  if (keyCode == 'S' || keyCode == 's' )   skey = true;
  if (keyCode == 'A' || keyCode == 'a' )   akey = true;
  if (keyCode == 'D' || keyCode == 'd' )   dkey = true;
}

void keyReleased() {
  if (keyCode == UP)    upkey    = false;
  if (keyCode == DOWN)  downkey  = false;
  if (keyCode == LEFT)  leftkey  = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == ' ')   spacekey = false;
  if (keyCode == 'W' || keyCode == 'w' )   wkey = false;
  if (keyCode == 'S' || keyCode == 's' )   skey = false;
  if (keyCode == 'A' || keyCode == 'a' )   akey = false;
  if (keyCode == 'D' || keyCode == 'd' )   dkey = false;
}
