// SV#01.04 - Arbeiten mit Daten 
// Die map()-Funktion, Mehrere Objekte
// Spekulative Visualisierung, FH Bielefeld

int anzahlFormen = 4;

void setup() {
  size(800, 800);
}


void draw() {
  background(255);

  // Die For-Schleife wird für die Anzahl <anzahlFormen> durchgeführt
  for (int i = 1; i <= anzahlFormen; i++) {
    // Die Füllfarbe ist Schwarz mit einer Deckkraft von ca. 40%.
    fill(0, 100);
    noStroke();

    // Die Variable <kreissGroesse> wird durch die X-Position der Maus gesteuert.
    // Der kleinere Wertebereich ist linear für alle Formen
    float kreisGroesse = map(mouseX, 0, width, i*30, i*150);  
    //float kreisGroesse = map(mouseX, 0, width, i*30, i*i*40);  


    // Von der Mitte des Fensters ausgehend zeichnen wir einen Kreis mit dem Radius <kreisGroesse>
    ellipse(width/2, height/2, kreisGroesse, kreisGroesse);
  }
}
