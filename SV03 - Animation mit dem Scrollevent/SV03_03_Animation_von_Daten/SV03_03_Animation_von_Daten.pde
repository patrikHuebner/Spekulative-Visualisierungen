float fortschritt = 0;
Table tabelle;


void setup() {
  size(800, 800);
  tabelle = loadTable("werte.csv", "header");
}



void draw() {
  background(54, 59, 63);
  stroke(250, 251, 220);

  float abstandDerElemente = width/tabelle.getRowCount();
  int anzahlAnDatenpunkten = round(map(fortschritt, 0, 100, 1, tabelle.getRowCount()));

  // Alle Zeilen aus der Tabelle durchgehen
  for (int i = 0; i < anzahlAnDatenpunkten; i++) {
    // Spezifische Zeile laden
    TableRow datensatz = tabelle.getRow(i);

    // Daten aus der Zeile extrahieren
    int jahr = datensatz.getInt("Jahr");
    float studenten = datensatz.getFloat("Studenten")*0.1;

    // Äußere Umrandung zeichnen
    noFill();
    stroke(250, 251, 220);
    ellipse(i*abstandDerElemente, height/2, studenten, studenten);

    // Inneren, gefüllten Kreis zeichnen
    fill(83, 160, 190);
    noStroke();
    ellipse(i*abstandDerElemente, height/2, studenten*0.2, studenten*0.2);

    // Titel zeichnen
    fill(250, 251, 220);
    text(jahr, i*abstandDerElemente, height/2+studenten);
  }



  // Abhängig vom Fortschritt, einen Indiaktor zeichnen
  fill(83, 160, 190);
  noStroke();
  float rechteckHoehe = 5;
  float rechteckBreite = map(fortschritt, 0, 100, 0, width);
  rect(0, height/2-rechteckHoehe/2, rechteckBreite, rechteckHoehe);



  // Text zeichnen
  fill(240, 245, 241);

  textSize(8);
  text("FH Bielefeld        Spekulative Visualisierungen        Tutorium No.3", width*0.1, height*0.15); 

  textSize(16);
  text("10 Jahres-Entwicklung des Studiengangs Gestaltung", width*0.1, height*0.2);
}




float mausSensitivitaet = 0.3; // Wie sensibel reagiert das System auf die Scroll-Geste? Kleinere Werte = weniger sensibel
void mouseWheel(MouseEvent event) {
  float aenderungDurchMaus = event.getCount() * mausSensitivitaet;
  if (fortschritt+aenderungDurchMaus >= 0 && fortschritt+aenderungDurchMaus <= 100) {
    fortschritt += aenderungDurchMaus;
  }
}
