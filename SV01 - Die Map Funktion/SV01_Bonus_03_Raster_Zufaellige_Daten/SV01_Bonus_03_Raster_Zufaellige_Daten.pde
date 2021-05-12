// SV#01.BONUS #3 - Arbeiten mit Daten 
// Die map()-Funktion, Formen im Raster mit zufälligen Daten
// Spekulative Visualisierung, FH Bielefeld

// Ein PVector-Objekt kann zwei Werte speichern.
// Der erste Wert wird über <grid.x> angesprochen, der Zweite über <grid.y>
PVector grid = new PVector(15, 15); 
float gridAbstand;

void setup() {
  size(800, 800);
  gridAbstand = width/(grid.x+1);
  generiereDaten();
}


float[] daten;
void generiereDaten() {
  int datensaetze = int(grid.x*grid.y);
  daten = new float[datensaetze];
  for (int i = 0; i < datensaetze; i++) {
    float zahl = random(0, 1);
    daten[i] = zahl;
  }
}

void draw() {
  background(255);

  for (int x = 0; x < grid.x; x++) {
    for (int y = 0; y < grid.y; y++) {
      fill(0);
      
      float groessenMultiplikator = map(mouseX, 0, width, 10, 100);
      float circleSize = daten[x*y]*groessenMultiplikator;

      PVector position = new PVector(
        x*gridAbstand+gridAbstand, 
        y*gridAbstand+gridAbstand
        );

      rectMode(CENTER);
      rect(position.x, position.y, circleSize, circleSize);
    }
  }
}


void keyReleased() {
  generiereDaten();
}
void mouseReleased() {
  generiereDaten();
}
