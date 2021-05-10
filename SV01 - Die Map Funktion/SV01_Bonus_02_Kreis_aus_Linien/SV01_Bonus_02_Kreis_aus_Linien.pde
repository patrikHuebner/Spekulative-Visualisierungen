// SV#01.05 - Arbeiten mit Daten 
// Die map()-Funktion, Mehrere Objekte, Radial
// Spekulative Visualisierung, FH Bielefeld

int amountOfForms = 40;

void setup() {
  size(800, 800);
  noFill();
  stroke(0);
  strokeWeight(8);
}


void draw() {
  background(255);

  for (int i = 1; i <= amountOfForms; i++) {

    float radius = map(mouseX, 0, width, 150, 150+(i%10*20));
    float schrittGroesse = 360/amountOfForms;

    PVector ursprung = new PVector(
      width/2, height/2
      );

    PVector ziel = new PVector(
      sin(radians(i*schrittGroesse))*radius, 
      cos(radians(i*schrittGroesse))*radius
      );

    line(ursprung.x, ursprung.y, width/2+ziel.x, height/2+ziel.y);
  }
}
