class Gif {
  boolean leadingZero;
  int frames;
  int currentFrame;
  int startingFrame;
  int speed;
  int speedTimer;
  float x, y, w, h;
  PImage[] gif;
  String zero;

  Gif(int f, String end, boolean leadingZero) {
    frames = f;
    currentFrame = 0;
    gif = new PImage[frames];
    for (int i = 0; i < frames; i++) {
      if (i < 10 &&  leadingZero) zero = "0";
      else zero = "";
      gif[i] = loadImage(zero + i + end);
    }
  }

  Gif(int f, String end, int sT, boolean leadingZero) {
    frames = f;
    speedTimer = sT;
    speed = 0;
    currentFrame = 0;
    gif = new PImage[frames];
    for (int i = 0; i < frames; i++) {
      if (i < 10 &&  leadingZero) zero = "0";
      else zero = "";
      gif[i] = loadImage(zero + i + end);
    }
  }

  Gif(int f, String end, float _x, float _y, float _w, float _h, boolean leadingZero) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    frames = f;
    currentFrame = 0;
    gif = new PImage[frames];
    for (int i = 0; i < frames; i++) {
      if (i < 10 &&  leadingZero) zero = "0";
      else zero = "";
      gif[i] = loadImage(zero + i + end);
    }
  }

  Gif(int f, String end, int sT, float _x, float _y, float _w, float _h, boolean leadingZero) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    frames = f;
    speedTimer = sT;
    speed = 0;
    currentFrame = 0;
    gif = new PImage[frames];
    for (int i = 0; i < frames; i++) {
      if (i < 10 &&  leadingZero) zero = "0";
      else zero = "";
      gif[i] = loadImage(zero + i + end);
    }
  }
  
  Gif(int sF, int f, String end, int sT, float _x, float _y, float _w, float _h, boolean leadingZero) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    frames = f;
    speedTimer = sT;
    speed = 0;
    currentFrame = sF;
    startingFrame = sF;
    gif = new PImage[frames];
    for (int i = sF; i < frames; i++) {
      if (i < 10 &&  leadingZero) zero = "0";
      else zero = "";
      gif[i] = loadImage(zero + i + end);
    }
  }
  
  Gif(int sF, int f, String beginning, String end, int sT, float _x, float _y, float _w, float _h, boolean leadingZero) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    frames = f;
    speedTimer = sT;
    speed = 0;
    currentFrame = sF;
    startingFrame = sF;
    gif = new PImage[frames];
    for (int i = sF; i < frames; i++) {
      if (i < 10 &&  leadingZero) zero = "0";
      else zero = "";
      gif[i] = loadImage(beginning + zero + i + end);
    }
  }

  void Show() {
    imageMode(CORNER);
    image(gif[currentFrame], 0, 0, width, height);
    currentFrame++;
    if (currentFrame == frames) {
      currentFrame = 0;
    }
  }

  void speedShow() {
    imageMode(CORNER);
    image(gif[currentFrame], 0, 0, width, height);
    speed++;
    if (speed > speedTimer) {
      currentFrame++;
      speed = 0;
    }
    if (currentFrame == frames) {
      currentFrame = 0;
    }
  }

  void sizeShow() {
    imageMode(CORNER);
    image(gif[currentFrame], x, y, w, h);
    currentFrame++;
    if (currentFrame == frames) {
      currentFrame = 0;
    }
  }

  void sizeSpeedShow() {
    imageMode(CORNER);
    image(gif[currentFrame], x, y, w, h);
    speed++;
    if (speed > speedTimer) {
      currentFrame++;
      speed = 0;
    }
    if (currentFrame == frames) {
      currentFrame = 0;
    }
  }
  
  void sizeSpeedStartShow() {
    imageMode(CORNER);
    image(gif[currentFrame], x, y, w, h);
    speed++;
    if (speed > speedTimer) {
      currentFrame++;
      speed = 0;
    }
    if (currentFrame == frames) {
      currentFrame = startingFrame;
    }
  }
  
  void centerMovingShow(float a, float b, float c, float d) {
    imageMode(CENTER); 
    image(gif[currentFrame], a, b, c, d);
    speed++;
    if (speed > speedTimer) {
      currentFrame++;
      speed = 0;
    }
    if (currentFrame == frames) {
      currentFrame = startingFrame;
    }
  }
}
