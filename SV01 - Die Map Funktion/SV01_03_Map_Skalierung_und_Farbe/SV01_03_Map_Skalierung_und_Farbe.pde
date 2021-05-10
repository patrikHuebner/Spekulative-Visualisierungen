// SV#01.03 - Arbeiten mit Daten 
// Die map()-Funktion, Mehrere Eigenschaften zur gleichen Zeit
// Spekulative Visualisierung, FH Bielefeld

float circleSize = 100;
float circleColor = 255;

void setup() {
  size(800, 800);
}


void draw() {
  background(255);
  
  // Die Variable <circleSize> wird durch die X-Position der Maus gesteuert.
  circleSize = map(mouseX, 0, width, 50, 400);

  // Die Farbe <circleColor> wird durch die Y-Position der Maus gesteuert.
  circleColor = map(mouseY, 0, height, 0, 255);
  
  // Die Farbe für die Form basiert auf der Variable <circleColor>
  fill(circleColor);

  // Von der Mitte des Fensters ausgehend zeichnen wir einen Kreis mit dem Radius <circleSize>
  ellipse(width/2, height/2, circleSize, circleSize);
}
