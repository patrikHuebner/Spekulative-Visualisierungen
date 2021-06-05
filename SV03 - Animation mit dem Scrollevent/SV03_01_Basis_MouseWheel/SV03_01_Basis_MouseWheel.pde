float kreisGroesse = 100; // Initiale Größe des Kreises
float kreisGroesseMax = 500; // Wie groß darf der Kreis maximal werden?
float kreisGroesseMin = 20; // Wie klein darf der Kreis minimal werden?

void setup() {
  size(800, 800);
}


void draw() {
  background(255);
  fill(0);

  // Kreis in der Mitte mit der Groesse <kreisGroesse> zeichnen
  ellipse(width/2, height/2, kreisGroesse, kreisGroesse);
}


// Vgl: https://processing.org/reference/mouseWheel_.html
float mausSensitivitaet = 1; // Wie sensibel reagiert das System auf die Scroll-Geste? Kleinere Werte = weniger sensibel
void mouseWheel(MouseEvent event) {
  // Wenn das Mausrad benutzt wird, erhalten wir über <event.getCount()> die Richtung.
  // Scrollt der User nach oben, erhalten wir negative Werte, scrollt der User nach unten Positive.
  // Je nachdem wie schnell die Bewegung ist, erhalten wir Werte zwischen 0 und ca. 15

  // Hier berechnen wir, welche Veränderung sich durch das Scrollen ergibt
  // Dabei multiplizieren wir den Wert des Events <getCount()> mit der Variable <mausSensitivitaet>
  // So können wir steuern, wie schnell oder langsam die Änderung ausgeführt wird
  float aenderungDurchMaus = event.getCount() * mausSensitivitaet;

  // Wir wollen eine Veränderung der <kreisGroesse> nur in einem bestimmten Bereich erlauben.
  // Konkret: Zwischen <kreisGroesseMin> und <kreisGroesseMax>
  
  // Also überprüfen wir hier in einer Abfrage ob die Änderung die Schwellenwerte überschreitet.
  // Nur wenn dies nicht der Fall ist, addieren wir die <aenderungDurchMaus> auf die <kreisGroesse>
  if (
    kreisGroesse+aenderungDurchMaus >= kreisGroesseMin
    &&
    kreisGroesse+aenderungDurchMaus <= kreisGroesseMax
    )
  {
    kreisGroesse += aenderungDurchMaus;
  }
}
