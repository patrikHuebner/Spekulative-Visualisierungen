float fortschritt = 0;

void setup() {
  size(800, 800);
  noStroke();
}


void draw() {
  background(255);
  fill(0);

  // BEREICH: 0% - 100%
  // ---------------------------------------------------------------------------------------------------------
  float kreisGroesse = width*0.2;
  // Abhängig vom Fortschritt zwischen 0% und 25%: Zwischen Schwarz und Blau die Füllfarbe wählen
  fill(0, 0, map(fortschritt, 0, 25, 0, 255));
  // Der Kreis wird im Bereich zwischen 0% und 25% gefüllt.
  // Die Map-Funktion gibt zwischen 0% und 25% also Werte zwischen 0° und 360° Kreisradius aus
  arc(width/2, height/2, kreisGroesse, kreisGroesse, 0, radians(map(fortschritt, 0, 25, 0, 360)));


  // BEREICH: 25% - 50%
  // ---------------------------------------------------------------------------------------------------------
  if (fortschritt >= 25) {
    textSize(40);
    // Deckkraft, abhängig vom Fortschritt zwischen 25% (transparent) und 50% (100% Deckkraft) setzen
    fill(0, map(fortschritt, 25, 50, 0, 255));
    // Die X-Position des Textes wird durch den Fortschritt gesteuert
    text("Daten", width/2+map(fortschritt, 25, 50, 50, 120), height/2);

    textSize(12);
    // Die X-Position des Textes wird durch den Fortschritt gesteuert
    // Die Werte sind allerdings leicht versetzt. So entsteht ein kleiner Parallax-Effekt
    text("Lorem ipsum dolor sit", width/2+map(fortschritt, 25, 50, 30, 120), height/2+12);
  }


  // BEREICH: 50% - 100%
  // ---------------------------------------------------------------------------------------------------------
  if (fortschritt >= 50) {
    fill(0, 0, 255);
    // Ab 50% zeichnen wir einen Kreis der immer größer wird. Bis er den Bildschirm ganz füllt
    kreisGroesse = map(fortschritt, 50, 100, width*0.2, width*2);
    ellipse(width/2, height/2, kreisGroesse, kreisGroesse);
  }


  // BEREICH: 75% - 100%
  // ---------------------------------------------------------------------------------------------------------
  if (fortschritt >= 75) {
    textSize(100);
    // Deckkraft, abhängig vom Fortschritt zwischen 75% (transparent) und 100% (100% Deckkraft) setzen
    fill(255, map(fortschritt, 75, 100, 0, 255));
    String anzeigeText = "Daten";
    // Mit der Funktion textWidth() kann man die Breite des Textes in Pixeln errechnen.
    // Zieht man die errechnete Textbreite von der Breite des Bildschirms ab und teilt dies durch die Zahl 2,
    // so positioniert man den Text horizontal zentriert
    text(anzeigeText, (width-textWidth(anzeigeText))/2, height/2);

    textSize(18);
    // Text zeigt die Variable <fortschritt> an.
    // Die Zentrierung funktioniert wie oben beschrieben
    anzeigeText = round(fortschritt)+"% Fortschritt";
    text(anzeigeText, (width-textWidth(anzeigeText))/2, height/2+30);

    // Abhängig vom Fortschritt zeichnen wir einen Balken von der Mitte aus
    // Die Zentrierung funktioniert inhaltlich wie auch beim Text: Breite des Balkens von der Fensterbreite abziehen und durch 2 teilen
    float rechteckBreite = map(fortschritt, 75, 100, 0, width);
    rect((width-rechteckBreite)/2, height/2+50, rechteckBreite, 5);
  }
}


float mausSensitivitaet = 0.1; // Wie sensibel reagiert das System auf die Scroll-Geste? Kleinere Werte = weniger sensibel
void mouseWheel(MouseEvent event) {
  float aenderungDurchMaus = event.getCount() * mausSensitivitaet;
  if (fortschritt+aenderungDurchMaus >= 0 && fortschritt+aenderungDurchMaus <= 100) {
    fortschritt += aenderungDurchMaus;
  }
}
