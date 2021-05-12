// SV#01.03 - Arbeiten mit Daten 
// Die map()-Funktion, Mehrere Eigenschaften zur gleichen Zeit
// Spekulative Visualisierung, FH Bielefeld

float kreisGroesse = 100;
float kreisFarbe = 255;

void setup() {
  size(800, 800);
}


void draw() {
  background(255);
  
  // Die Variable <kreisGroesse> wird durch die X-Position der Maus gesteuert.
  kreisGroesse = map(mouseX, 0, width, 50, 400);

  // Die Farbe <kreisFarbe> wird durch die Y-Position der Maus gesteuert.
  kreisFarbe = map(mouseY, 0, height, 0, 255);
  
  // Die Farbe für die Form basiert auf der Variable <kreisFarbe>
  fill(kreisFarbe);

  // Von der Mitte des Fensters ausgehend zeichnen wir einen Kreis mit dem Radius <kreisGroesse>
  ellipse(width/2, height/2, kreisGroesse, kreisGroesse);
}
