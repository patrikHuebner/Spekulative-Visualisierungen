// SV#01.01 - Arbeiten mit Daten 
// Die map()-Funktion, Einführung
// Spekulative Visualisierung, FH Bielefeld

// Mehr Informationen: https://processing.org/reference/map_.html 

float hintergrundFarbe = 0;

void setup() {
  // Legt die Größe des Sketches fest (also: wie groß ist das Fenster)
  size(800, 800);
}


void draw() {
  // Die Hintergrundfarbe wird durch die Variable <backgroundColor> bestimmt.
  background(hintergrundFarbe);

  // Die Variable <backgroundColor> wird durch die <X-Position der Maus> gesteuert.
  // Dabei wird der Wertebereich <Fensterbreite> auf den <Zahlenbereich von 0 bis 255> übertragen.
  // Ist die Maus ganz links -also bei <Fensterbreite 0>- ist der <Zahlenbereich> auch 0.
  // Ist die Maus ganz rechts -in diesem Fall also bei <Fensterbreite 800> ist der <Zahlenbereich> 255.
  hintergrundFarbe = map(mouseX, 0, width, 0, 255);

  // Dieser Code zeichnet einen kleinen Kreis an der Stelle der Mausposition und kann ignoriert werden.
  fill(0);
  stroke(255);
  ellipse(mouseX, mouseY, 20, 20);
}
