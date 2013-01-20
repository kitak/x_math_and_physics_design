int[] COLORS = {
  color(249, 33, 81),
  color(125, 218, 249),
  color(201, 230, 90),
  color(180, 121, 239),
  color(251, 220, 75),
  color(88, 224, 176),
  color(255, 166, 234),
  color(226, 193, 168),
  color(71, 122, 246),
  color(255, 170, 59)
};

class Ball{
  float x, y;
  color c;
  
  Ball () {}
  
  void draw() {
    fill(c);
    noStroke();
    ellipse(x, y, 70, 70);
  }
}

Ball[] balls = new Ball[10];

void clearField() {
  background(0);
  
  stroke(255);
  fill(255);
  ellipse(100, height/2, 70, 70);
  line(0, height/2, width, height/2);
}

boolean rollOvered() {
  if (sqrt(pow(100-mouseX, 2)+pow(height/2-mouseY,2)) < 98) {
    return true;
  } 
  return false;
}

void setup() {
  size(1024, 640);
  smooth();
  
  clearField();
  for (int i=0; i < 10; i++) {
    Ball ball = new Ball();
    ball.x = 100 + 80*(i+1);
    ball.y = height/2;
    ball.c = COLORS[i];
    balls[i] = ball; 
  }
  
  frameRate(30);
}

void draw() {
  float x, y;
  
  clearField();
  
  for (int i=0; i < 10; i++) {
    if (rollOvered()) {
      if (i == 0) {
        x = 100 + 80;
        y = height / 2;
      } else {
        x = balls[i-1].x + 80;
        y = balls[i-1].y;
      }
    } else {
      if (i == 0) {
        x = width + 140;
        y = height/2 - 140;
      } else {
        x = balls[i-1].x;
        y = balls[i-1].y;
      }
    }
    
    balls[i].x += (x - balls[i].x)/8;
    balls[i].y += (y - balls[i].y)/8;
    
    balls[i].draw();
  }
}
