// SV#01.BONUS #2 - Arbeiten mit Daten 
// Die map()-Funktion, Mehrere Objekte, Radial, generiert durch zufällige Daten
// Spekulative Visualisierung, FH Bielefeld

int amountOfForms = 40;

void setup() {
  size(800, 800);
  stroke(0);
  createData();
}


float[] daten;
void createData() {
  daten = new float[amountOfForms];
  for (int i = 0; i < amountOfForms; i++) {
    float zahl = random(0, 1);
    daten[i] = zahl;
  }
}

void draw() {
  background(255);

  for (int i = 0; i < amountOfForms; i++) {
    float radius = map(daten[i], 0, 1, 20, 150);
    radius += map(mouseX, 0, width, 30, 200);
    strokeWeight(map(daten[i], 0, 1, 0.5, 10));

    float schrittGroesse = 360/amountOfForms;

    PVector ursprung = new PVector(
      width/2, height/2
      );

    PVector ziel = new PVector(
      sin(radians(i*schrittGroesse))*radius, 
      cos(radians(i*schrittGroesse))*radius
      );

    line(ursprung.x, ursprung.y, width/2+ziel.x, height/2+ziel.y);

    strokeWeight(1);
    float kreissGroesse = radius*0.1;
    ellipse(width/2+ziel.x, height/2+ziel.y, kreissGroesse, kreissGroesse);
  }
}



void keyReleased() {
  createData();
}
