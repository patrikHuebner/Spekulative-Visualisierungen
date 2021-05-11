// SV#01.BONUS #1 - Arbeiten mit Daten 
// Die map()-Funktion, Generierung von zufälligen Daten
// Spekulative Visualisierung, FH Bielefeld

void setup() {
  size(800, 800);
  createData();
}


float[] daten;
int datenSaetze = 30;
void createData() {
  daten = new float[datenSaetze];
  for (int i = 0; i < datenSaetze; i++) {
    float zahl = random(-1, 1);
    daten[i] = zahl;
  }
}


void draw() {
  background(255);

  stroke(0);
  line(0, height/2, width, height/2);

  float positionX = 0;
  for (int i = 0; i < daten.length; i++) {
    float hoehe = map(daten[i], -1, 1, 10, 300);
    float breite = map(daten[i], -1, 1, 3, 20);

    if (daten[i] > 0) {
      fill(0);
      hoehe*=-1;
    } else {
      noFill();
    }

    textSize(8);
    rect(positionX, height/2, breite, hoehe);
    text(nf(daten[i],1,2), positionX, height/2+hoehe);

    positionX += width/datenSaetze;
  }
}



void keyReleased() {
  createData();
}
