float progress = 0;


void setup() {
  // Init sketch
  size(554, 1200);
  frameRate(60);
}



void draw() {
  background(#141414);
  
  drawProgress();
  drawBottomTimeline();
}



void drawBottomTimeline() {
  int ticks = 101;
  float tickSeparation = (width-width*0.14)/ticks;
  strokeWeight(1);
  noFill();
  stroke(128);
  for (int i = 0; i < ticks; i++) {
    float tickHeight = height*0.995;
    if (i%10 == 0) {
      tickHeight = height*0.985;
    }
    line(width*0.07+i*tickSeparation, height, width*0.07+i*tickSeparation, tickHeight);
  }
}




// Draw the vertical progress bar
void drawProgress() {
  noFill();
  stroke(255);
  strokeWeight(6);
  float lineWidth;

  if (progress <= 50) {
    lineWidth = map(progress, 0, 50, width/2, width*0.07);
    float positionLeft = map(progress, 0, 50, width*0.07, width/2);
    line(positionLeft, height*0.98, positionLeft+lineWidth-width*0.07, height*0.98);
  } else {
    lineWidth = map(progress, 50, 100, width/2, width-width*0.07);
    line(width/2, height*0.98, lineWidth, height*0.98);
  }
}



// Map mouse wheel event to <progress> variable
float mouseSensitivity = 0.1;
void mouseWheel(MouseEvent event) {
  float change = event.getCount() * mouseSensitivity;
  if (progress+change >= 0 && progress+change <= 100) {
    progress += change;
  }
}
