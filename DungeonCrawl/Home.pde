void home() {
  //corridor gif
  corridor.sizeSpeedStartShow();
  
  //text
  textFont(dark);
  textSize(100);
  fill(brown);
  text("DUNGEON\nCRAWLER", width/2, height/2 + 100);
  
  textSize(50);
  playButton = new Button("PLAY", width/2 - 200, height/2 + 300, 250, 100, orange, yellow, brown, gray);
  if (playButton.clicked) mode = GAME;
  
  exitButton = new Button("EXIT", width/2 + 200, height/2 + 300, 250, 100, orange, yellow, brown, gray);
  if (exitButton.clicked) exit();
}

void homeReleased() {

}
