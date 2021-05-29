int[] daten;

void setup() {
  size(800,800);
  
  // Werte aus der Datei als String-Array laden
  String[] werte = loadStrings("werte.csv");
  
  // Daten in einen Array aus Integer umwandeln.
  // Dabei wird das "," als Trennsymbol verwendet.
  daten = int(split(werte[0], ","));
}


void draw() {
  background(255);
  stroke(0);

  // Transform in die vertikale Mitte
  translate(0,height/2);

  // Die Breite jedes Blocks ergibt sich aus der Anzahl der Daten,
  // geteilt durch die Breite des Bildschirms
  int breite = width/daten.length;

  // Alle Daten auslesen
  for (int i = 0; i < daten.length; i++) {
    // Farbe, abhängig vom Wert
    fill(map(daten[i],-255,255,0,255));
    
    // Rechtecke auf Basis der Daten zeichnen, die Höhe ergibt sich aus den Daten
    rect(i*breite, 0, breite, daten[i]);
  }
}
