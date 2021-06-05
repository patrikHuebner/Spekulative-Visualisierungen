float fortschritt = 0; // Variable um den Fortschritt der Scroll-Animation festzustellen

void setup() {
  size(800, 800);
  rectMode(CENTER);
}


void draw() {
  // Alles im Draw-Loop wird abhängig von der <fortschritt>-Variable gezeichnet
  // Ist der <fortschritt> bei 0, sind wir ganz am Anfang der Interaktion.
  // Ist der <fortschritt> bei 100, sind wir ganz am Ende der Interaktion.

  // Hintergrund und Füllfarbe werden durch den Fortschritt gesteuert
  // ---------------------------------------------------------------------------------------------------------
  background(map(fortschritt, 0, 100, 255, 0));
  fill(map(fortschritt, 0, 100, 0, 255));
  stroke(map(fortschritt, 0, 100, 0, 255));


  // Die X-Position des Kreises wird durch den Fortschritt gesteuert
  // ---------------------------------------------------------------------------------------------------------
  ellipse(map(fortschritt, 0, 100, 0, width), height/2, width*0.2, width*0.2);


  // Die Linie wird abhängig durch den Fortschritt gezeichnet: Von oben Links (0,0) bis unten Rechts (width,height)
  // ---------------------------------------------------------------------------------------------------------
  strokeWeight(map(fortschritt, 0, 100, 1, 20));
  line(0, 0, map(fortschritt, 0, 100, 0, width), map(fortschritt, 0, 100, 0, height));


  // Die Rotation des Rechtecks wird durch den Fortschritt gesteuert
  // ---------------------------------------------------------------------------------------------------------
  // Da wir rotieren, müssen wir pushMatrix() und popMatrix() nutzen um nur dieses Rechect zu beeinflussen
  pushMatrix();
  // Y-Position abhängig vom Fortschritt berechnen
  float yPosition = map(fortschritt, 0, 100, 0, height); 
  // Dieser Translate sowie der zwei Zeilen darunter ist notwendig, damit sich das Rechteck um die eigene Achse dreht
  translate(width/2, yPosition);
  // Rotation zwischen 0 und 180 Grad, abhäbgig vom Fortschritt
  rotate(radians(map(fortschritt, 0, 100, 0, 180)));
  translate(-width/2, -yPosition);
  // Rechteck zeichnen
  float rechteckGroesse = map(fortschritt, 0, 100, width*0.1, width*0.4);
  rect(width/2, yPosition, rechteckGroesse, rechteckGroesse);
  popMatrix();
}


float mausSensitivitaet = 0.3; // Wie sensibel reagiert das System auf die Scroll-Geste? Kleinere Werte = weniger sensibel
void mouseWheel(MouseEvent event) {
  float aenderungDurchMaus = event.getCount() * mausSensitivitaet;

  // Anders als im vorherigen Beispiel führen wir jetzt eine Variable <fortschritt> ein
  // Der Fortschritt findet gibt den Punkt innerhalb der Interaktion zwischen 0% und 100% an
  // So können wir jederzeit feststellen wie weit fortgeschritten die Scroll-Interaktion ist
  if (fortschritt+aenderungDurchMaus >= 0 && fortschritt+aenderungDurchMaus <= 100) {
    fortschritt += aenderungDurchMaus;
  }
}
