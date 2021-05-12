// SV#01.BONUS #2 - Arbeiten mit Daten 
// Die map()-Funktion, Mehrere Objekte, radiale Anordnung, generiert durch zufällige Daten
// Spekulative Visualisierung, FH Bielefeld

int datensaetze = 40;

void setup() {
  size(800, 800);
  stroke(0);
  generiereDaten();
}


float[] daten;
void generiereDaten() {
  daten = new float[datensaetze];
  for (int i = 0; i < datensaetze; i++) {
    float zahl = random(0, 1);
    daten[i] = zahl;
  }
}

void draw() {
  background(255);
  noFill();

  for (int i = 0; i < datensaetze; i++) {
    float radius = map(daten[i], 0, 1, 20, 150);
    radius += map(mouseX, 0, width, 30, 200);
    strokeWeight(map(daten[i], 0, 1, 0.5, 10));

    float schrittGroesse = 360/datensaetze;

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
  
  
  textSize(10);
  fill(0);
  text("Beliebige Taste drücken um eine neue Version zu generieren.", width-320, height-40);
  text("Maus bewegen um die Form zu verändern.", width-228, height-25);
}



void keyReleased() {
  generiereDaten();
}
void mouseReleased() {
  generiereDaten();
}
