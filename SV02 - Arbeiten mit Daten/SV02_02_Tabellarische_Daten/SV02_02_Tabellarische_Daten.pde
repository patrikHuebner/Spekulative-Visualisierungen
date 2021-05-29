Table tabelle;

void setup() {
  size(800, 800);

  // Daten als Tabelle laden
  // "header" gibt an, dass die Tabelle eine Kopfzeile besitzt
  tabelle = loadTable("werte.csv", "header");
}


void draw() {
  background(255);
  stroke(0);  
  
  // Alle Zeilen aus der Tabelle durchgehen
  for (int i = 0; i < tabelle.getRowCount(); i++) {
    // Spezifische Zeile laden
    TableRow datensatz = tabelle.getRow(i);
    
    // Daten aus der Zeile extrahieren
    float x = datensatz.getFloat("x");
    float y = datensatz.getFloat("y");
    float durchmesser = datensatz.getFloat("Durchmesser");
    String titel = datensatz.getString("Titel");
    
    // Ellipse zeichnen
    fill(map(durchmesser,0,255,0,255));
    ellipse(x,y,durchmesser,durchmesser);
    
    // Titel zeichnen
    fill(0);
    text(titel,x+durchmesser/2,y+durchmesser/2);
  }

  noLoop();
}
