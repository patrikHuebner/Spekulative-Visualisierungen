Table tabelle;
Datenpunkt[] datenpunkte;

void setup() {
  size(800, 800);

  // Daten als Tabelle laden
  // "header" gibt an, dass die Tabelle eine Kopfzeile besitzt
  tabelle = loadTable("werte.csv", "header");

  // Datenpunkte-Array initialisieren mit der Größe der Tabelle
  datenpunkte = new Datenpunkt[tabelle.getRowCount()];

  // Alle Zeilen druchgehen
  for (int i = 0; i < tabelle.getRowCount(); i++) {
    // Spezifische Zeile laden
    TableRow datensatz = tabelle.getRow(i);

    // Daten aus der Zeile extrahieren
    PVector position = new PVector(
      datensatz.getFloat("x"), 
      datensatz.getFloat("y")
      );
    float durchmesser = datensatz.getFloat("Durchmesser");
    String titel = datensatz.getString("Titel");
    color farbe = color(map(durchmesser, 0, 255, 0, 255));

    // Neues Datensatz-Objekt generieren
    Datenpunkt dieserDatenpunkt = new Datenpunkt(position, durchmesser, titel, farbe);
    datenpunkte[i] = dieserDatenpunkt;
  }
}


void draw() {
  background(255);

  // Alle Einträge des Arrays <datenpunkte> durchgehen
  for (int i = 0; i < datenpunkte.length; i++) {
    // Jedes Objekt in dem Array besitzt die Funktion <anzeigen>
    datenpunkte[i].anzeigen();
  }

}
