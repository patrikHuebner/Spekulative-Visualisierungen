// SV#01.05 - Arbeiten mit Daten 
// Die map()-Funktion, Formen im Raster
// Spekulative Visualisierung, FH Bielefeld

// Ein PVector-Objekt kann zwei Werte speichern.
// Der erste Wert wird über <grid.x> angesprochen, der Zweite über <grid.y>
PVector grid = new PVector(10, 10); 
float gridAbstand;

void setup() {
  size(800, 800);
  
  // Diese Variable definiert den Abstand zwischen den Formen im Raster.
  // Wir errechnen den Abstand in dem wir die Breite des Fensters durch die Anzahl der Formen+1 teilen.
  gridAbstand = width/(grid.x+1);
}


void draw() {
  background(255);

  // Zwei-Dimensionaler For-Loop für ein 2D-Raster
  for (int x = 1; x <= grid.x; x++) {
    for (int y = 1; y <= grid.y; y++) {
      fill(0);

      // Drei Ideen für unterschiedliche Raster-Füllungen
      float kreisGroesse = map(mouseX, 0, width, 10, 100); // Variante #1: Alle Formen sind gleich
      //float kreisGroesse = map(mouseX, 0, width, (x+y)*3, (x+y)*8); // Variante #2: Die Formen wachsen
      //float kreisGroesse = map(mouseX, 0, width, ((x+y)%5+1)*10, ((x+y)%5+1)*20); // Variante #3: Die Formen alternieren in 5er-Schritten

      // Dieser Vektor enthält die X- sowie Y-Position des Kreises im Raster
      // Wir errechnen die Punkte in dem wir die X-/Y-Variable des Loops mit dem Abstand im Grid multiplizieren
      PVector position = new PVector(
        x*gridAbstand, 
        y*gridAbstand
        );

      // Kreis an der errechneten Stelle mit der definierten Größe zeichnen
      ellipse(position.x, position.y, kreisGroesse, kreisGroesse);
    }
  }
}
