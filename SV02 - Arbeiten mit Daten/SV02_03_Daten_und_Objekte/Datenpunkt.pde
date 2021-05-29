class Datenpunkt {

  // Interne Variablen
  // Diese sind für jedes generierte Objekt einzigartig befüllt
  PVector position;
  float durchmesser;
  String titel;
  color farbe;
  boolean mausHover = false;

  // Konstruktor
  Datenpunkt(PVector _position, float _durchmesser, String _titel, color _farbe) {
    // Die Daten aus dem Konstruktor müssen an die internen
    // Variablen übergeben werden
    position = _position;
    durchmesser = _durchmesser;
    titel = _titel;
    farbe = _farbe;
  }

  // Funktion welche wir aufrufen um das Objekt anzuzeigen
  void anzeigen() {
    stroke(0);
    strokeWeight(4);

    // Funktion aufrufen um zu testen, ob die Maus über dem Objekt ist
    testeHover();

    // Wenn die Maus über dem Objekt ist: Rot zeichnen, ansonsten die
    // "normale" Farbe verwenden
    if (mausHover) {
      fill(255, 0, 0);

      //Außerdem: Ziehe eine Linie zwischen allen Punkten
      zeichneVerbindungen();
    } else {
      fill(farbe);
    }
    ellipse(position.x, position.y, durchmesser, durchmesser);

    // Text zeichnen
    fill(0);
    text(titel, position.x+durchmesser/2, position.y+durchmesser/2);
  }

  void testeHover() {
    // Um zu erfahren ob die Maus über dem Objekt ist brauchen wir
    // lediglich die Distanz von der Mausposition zum Objekt zu berechnen
    float distanz = dist(mouseX, mouseY, position.x, position.y);

    // Ist die Distanz kleiner als die Größe des Objekts, ist die Maus darüber
    if (distanz < durchmesser/2) {
      mausHover = true;
    } else {
      mausHover = false;
    }
  }


  void zeichneVerbindungen() {
    // Noch einmal alle Datenpunkte durchgehen und jeweils eine Linie zeichnen
    for (int i = 0; i < datenpunkte.length; i++) {
      // Datenpunkt aufrufen
      Datenpunkt andererPunkt = datenpunkte[i];

      // Linie zwischen diesem Ojekt und dem anderen Objekt ziehen
      strokeWeight(2);
      line(position.x, position.y, andererPunkt.position.x, andererPunkt.position.y);
    }
  }
}
