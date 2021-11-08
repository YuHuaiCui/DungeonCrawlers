//"DBUTTONS" VERSION 1.0 BY DANIEL CUI - ALL RIGHTS RESERVED © 2021 (hahahahaha)

//THANK YOU FOR USING "DRY BUTTONS (AKA DButtons)" BY DANIEL CUI :D

//Manual:

//IMPORTANT!: Must initialize a "base" color. Put "color base;" before void setup() {}. 

//Rectangular DButtons: 

//Requires parameters such as (text, x-coordinate, y-coordinate, width, height, base color, hovered color)

//Optional:
//If you would like to set a stroke, it requires parameters such as (text, x-coordinate, y-coordinate, width, height, base color, hovered color)

//If you would like to have your stroke change upon mouse hover, it requires parameters such as (text, x-coordinate, y-coordinate, width, height, base color, hovered color, base stroke color, hovered stroke color)

//Circular DButtons: 

//Requires parameters such as (text, x-coordinate, y-coordinate, diameter, base color, hovered color)

//Optional:
//If you would like to set a stroke, it requires parameters such as (text, x-coordinate, y-coordinate, diameter, base color, hovered color)

//If you would like to have your stroke change upon mouse hover, it requires parameters such as (text, x-coordinate, y-coordinate, diameter, base color, hovered color, base stroke color, hovered stroke color)

class Button { //Start of Buttons Class
  boolean clicked;
  color c = #26ADE4;

  //calling Base Buttons
  Button(String t, float x, float y, float d, color baseColor, color hoverColor) {
    showCircle(t, x, y, d, baseColor, hoverColor);
    actCircle(x, y, d);
  }

  Button(String t, float x, float y, float w, float h, color baseColor, color hoverColor) {
    showRect(t, x, y, w, h, baseColor, hoverColor);
    actRect(x, y, w, h);
  }
  //End of calling Base Buttons

  //calling Set Stroke Buttons
  Button(String t, float x, float y, float d, color baseColor, color hoverColor, color strokeColor) {
    showCircleSStroke(t, x, y, d, baseColor, hoverColor, strokeColor);
    actCircle(x, y, d);
  }

  Button(String t, float x, float y, float w, float h, color baseColor, color hoverColor, color strokeColor) {
    showRectSStroke(t, x, y, w, h, baseColor, hoverColor, strokeColor);
    actRect(x, y, w, h);
  }
  //End of calling Set Stroke Buttons

  //calling Changing Stroke Buttons
  Button(String t, float x, float y, float d, color baseColor, color hoverColor, color baseStrokeColor, color hoverStrokeColor) {
    showCircleCStroke(t, x, y, d, baseColor, hoverColor, baseStrokeColor, hoverStrokeColor);
    actCircle(x, y, d);
  }

  Button(String t, float x, float y, float w, float h, color baseColor, color hoverColor, color baseStrokeColor, color hoverStrokeColor) {
    showRectCStroke(t, x, y, w, h, baseColor, hoverColor, baseStrokeColor, hoverStrokeColor);
    actRect(x, y, w, h);
  }
  //End of calling Changing Stroke Buttons

  //Base Buttons
  void showCircle(String _t, float x, float y, float d, color baseColor, color hoverColor) {
    strokeWeight(5);
    stroke(c);
    if (dist(mouseX, mouseY, x, y) <= d/2) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    circle(x, y, d);
    fill(0);
    textAlign(CENTER, CENTER);
    text(_t, x, y);
  }

  void actCircle(float x, float y, float d) {
    if (mouseReleased && (dist(mouseX, mouseY, x, y) <= d/2)) {
      clicked = true;
    } else {
      clicked = false;
    }
  }

  void showRect(String _t, float x, float y, float w, float h, color baseColor, color hoverColor) {
    rectMode(CENTER);
    strokeWeight(5);
    stroke(c);
    if (mouseX >= x - w/2 && mouseY >= y - h/2 && mouseX <= x + w/2 && mouseY <= y + h/2) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(_t, x, y);
  }

  void actRect(float x, float y, float w, float h) {
    if (mouseReleased && mouseX >= x - w/2 && mouseY >= y - h/2 && mouseX <= x + w/2 && mouseY <= y + h/2) {
      clicked = true;
    } else {
      clicked = false;
    }
  } //End of Base Buttons

  //Buttons with SET stroke
  void showCircleSStroke(String _t, float x, float y, float d, color baseColor, color hoverColor, color strokeColor) {
    strokeWeight(5);
    if (strokeColor == base) {
      stroke(c);
    } else {
      stroke(strokeColor);
    }
    if (dist(mouseX, mouseY, x, y) <= d/2) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    circle(x, y, d);
    fill(0);
    textAlign(CENTER, CENTER);
    text(_t, x, y);
  }

  void showRectSStroke(String _t, float x, float y, float w, float h, color baseColor, color hoverColor, color strokeColor) {
    rectMode(CENTER);
    strokeWeight(5);
    if (strokeColor == base) {
      stroke(c);
    } else {
      stroke(strokeColor);
    } 
    if (mouseX >= x - w/2 && mouseY >= y - h/2 && mouseX <= x + w/2 && mouseY <= y + h/2) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(_t, x, y);
  }
  //End of Buttons with SET Stroke

  //Buttons with Changing Strokes
  void showCircleCStroke(String _t, float x, float y, float d, color baseColor, color hoverColor, color baseStrokeColor, color hoverStrokeColor) {
    strokeWeight(5);
    if (baseStrokeColor == base) {
      stroke(c);
    } else {
      stroke(baseStrokeColor);
    }
    if (dist(mouseX, mouseY, x, y) <= d/2) {
      if (hoverStrokeColor != base) {
        stroke(hoverStrokeColor);
      }
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    circle(x, y, d);
    fill(0);
    textAlign(CENTER, CENTER);
    text(_t, x, y);
  }

  void showRectCStroke(String _t, float x, float y, float w, float h, color baseColor, color hoverColor, color baseStrokeColor, color hoverStrokeColor) {
    rectMode(CENTER);
    strokeWeight(5);
    if (baseStrokeColor == base) {
      stroke(c);
    } else {
      stroke(baseStrokeColor);
    } 
    if (mouseX >= x - w/2 && mouseY >= y - h/2 && mouseX <= x + w/2 && mouseY <= y + h/2) {
      if (hoverStrokeColor != base) {
        stroke(hoverStrokeColor);
      }
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(_t, x, y);
  }
  //End of Buttons with Changing Strokes
} //End of Buttons Class
