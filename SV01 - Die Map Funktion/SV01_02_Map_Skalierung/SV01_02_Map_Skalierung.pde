// SV#01.02 - Arbeiten mit Daten 
// Die map()-Funktion, Kontrolle über die Skalierung
// Spekulative Visualisierung, FH Bielefeld

float circleSize = 100;

void setup() {
  size(800, 800);
}


void draw() {
  background(255);
  fill(0);
  
  // Die Variable <circleSize> wird durch die X-Position der Maus gesteuert.
  circleSize = map(mouseX, 0, width, 50, 400);  
  
  // Von der Mitte des Fensters ausgehend zeichnen wir einen Kreis mit dem Radius <circleSize>
  ellipse(width/2, height/2, circleSize, circleSize);
}
