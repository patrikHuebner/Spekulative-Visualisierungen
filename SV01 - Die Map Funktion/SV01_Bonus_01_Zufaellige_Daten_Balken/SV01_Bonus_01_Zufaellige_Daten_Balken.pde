// SV#01.BONUS #1 - Arbeiten mit Daten 
// Die map()-Funktion, Generierung von zufälligen Daten
// Spekulative Visualisierung, FH Bielefeld

void setup() {
  size(800, 800);
  fill(0);
  stroke(0);

  generiereDaten();
}


float[] daten;
int datensaetze = 30;
void generiereDaten() {
  daten = new float[datensaetze];
  for (int i = 0; i < datensaetze; i++) {
    float zahl = random(-1, 1);
    daten[i] = zahl;
  }
}


void draw() {
  background(255);

  line(0, height/2, width, height/2);

  float positionX = 0;
  for (int i = 0; i < daten.length; i++) {
    // Balken
    float groessenMultiplikator = map(mouseY, 0, height, 50, 300);
    float hoehe = daten[i]*groessenMultiplikator;
    float breite = map(daten[i], -1, 1, 3, 20);
    rect(positionX, height/2, breite, hoehe);

    // Text label
    textSize(8);
    float versatz = hoehe-15;
    if (daten[i] > 0) {
      versatz = hoehe+15;
    }
    text(nf(daten[i], 1, 2), positionX, height/2+versatz);

    positionX += width/datensaetze;
  }

  textSize(10);
  text("Beliebige Taste drücken um eine neue Version zu generieren", width-320, height-30);
}



void keyReleased() {
  generiereDaten();
}
void mouseReleased() {
  generiereDaten();
}
