float fortschritt = 0;
Table tabelle;
float datensaetze;

int[] DMX;
int[] Fotografie;
int[] Gestaltung;
int[] Jahr;

void setup() {
  size(800, 800);
  tabelle = loadTable("werte.csv", "header");

  // Wir speichern die Daten der Tabelle in vier einzelne Arrays
  // Hier werden die Arrays mit der Anzahl der Zeilen in der Tabelle initialisiert
  Jahr = new int[tabelle.getRowCount()];
  DMX = new int[tabelle.getRowCount()];
  Fotografie = new int[tabelle.getRowCount()];
  Gestaltung = new int[tabelle.getRowCount()];
  
  // Für diverse Berechnungen speichern wir auch noch einmal, wie viele Datensätze die Tabelle hat
  datensaetze = tabelle.getRowCount();

  // Nun gehen wir die Tabelle durch und speichern die Daten jeweils in den vorbereiteten Arrays
  // So können wir später auf die Daten einfacher zugreifen
  for (int i = 0; i < tabelle.getRowCount(); i++) {
    // Zeile laden
    TableRow datensatz = tabelle.getRow(i);
    
    // Daten in die jeweiligen Arrays speichern
    Jahr[i] = datensatz.getInt("Jahr");
    DMX[i] = datensatz.getInt("DMX");
    Fotografie[i] = datensatz.getInt("Fotografie");
    Gestaltung[i] = datensatz.getInt("Gestaltung");
  }
}



void draw() {
  background(#121e50);

  // Um die Veränderung der Daten kontinuierlich zeichnen zu können müssen wir immer zwischen zwei Datensätze interpolieren
  float prozentsatz = (1/datensaetze);
  // Dafür benötigen wir den Abschnitt in dem wir uns befinden (hier: Abschnitt 0 = Jahr 2010, Abschnitt 1 = Jahr 2011, etc.)
  int abschnitt = int(fortschritt/prozentsatz/100);
  // Und einen Anteil, der zwischen 0-1 berechnet wird
  // Diesen Anteil brauchen wir für die fließende Berechnung der Zahlen während des Scrollens 
  float anteil = (fortschritt-(abschnitt*(prozentsatz*100)))/100 *datensaetze;

  // Um den Code nicht 3x schreiben zu müssen, gibt es eine Funktion in die wir die jeweiligen Parameter übergeben
  zeichneDaten(Gestaltung, new PVector(width*0.25, height/2), abschnitt, anteil, color(#16a4f4), color(0));
  zeichneDaten(Fotografie, new PVector(width*0.75, height/2), abschnitt, anteil, color(#e51a60), color(0));
  zeichneDaten(DMX, new PVector(width*0.5, height/2), abschnitt, anteil, color(#f3fdf0), color(0));

  // Zeichnen des Jahres
  zeichneJahr(abschnitt);

  // Legende zeichnen
  zeichneLegende();

  // Fortschrittsindikator zeichnen 
  zeichneIndiaktor();
}


void zeichneDaten(int[] input, PVector position, int abschnitt, float anteil, color farbe, color textfarbe) {
  float daten;
  
  // Der "Trick" besteht hier darin, das wir -abhängig vom Fortschritt und dem Abschnitt in dem wir uns befinden-
  // zwischen dem aktuellen Datensatz und dem nächsten Datensatz über die lerp()-Funktion interpolieren.
  // vgl. https://processing.org/reference/lerp_.html
  //
  // Konkretes Beispiel: Datensatz #1 hat den Wert 10, Datensatz #2 den Wert 20
  // Sind wir ganz am Anfang des Abschnitss, hat unser <anteil> den Wert 0. Sind wir am Ende hat der <anteil> den Wert 1.
  // Die lerp()-Funktion erlaubt es nun zu berechnen, welchen Wert wir bei z.B. 50% zwischen den beiden Werten haben.
  // 50% dem Datensatz #1 und Datensatz #2 ist dann konkret 15.
  
  if (abschnitt < round(datensaetze-1)) {
    daten = lerp(input[abschnitt], input[abschnitt+1], anteil);
  } else {
    daten = input[round(datensaetze-1)];
  }
  fill(farbe);
  ellipse(position.x, position.y, daten, daten);
  fill(textfarbe);
  textSize(14);
  text(int(daten), position.x-textWidth(str(int(daten)))/2, position.y+5);
}



void zeichneJahr(int abschnitt) {
  fill(255);
  textSize(24);
  text(Jahr[abschnitt], width*0.87, height*0.936);
}


void zeichneLegende() {
  textSize(10);
  text("Entwicklung der Studierendenzahlen über die Jahre 2010 bis 2021", width*0.05, height*0.1); 
   
  textSize(14);

  fill(#16a4f4);
  ellipse(width*0.05, height*0.93, 20, 20);
  fill(255);
  text("Gestaltung", width*0.08, height*0.936);

  fill(#f3fdf0);
  ellipse(width*0.25, height*0.93, 20, 20);
  fill(255);
  text("DMX", width*0.28, height*0.936);

  fill(#e51a60);
  ellipse(width*0.4, height*0.93, 20, 20);
  fill(255);
  text("Fotografie", width*0.43, height*0.936);
}



void zeichneIndiaktor() {  
  fill(#db341a);
  noStroke();
  float rechteckBreite = map(fortschritt, 0, 100, 0, width);
  rect(0, height-10, rechteckBreite, 10);
}



float mausSensitivitaet = 0.1; // Wie sensibel reagiert das System auf die Scroll-Geste? Kleinere Werte = weniger sensibel
void mouseWheel(MouseEvent event) {
  float aenderungDurchMaus = event.getCount() * mausSensitivitaet;
  if (fortschritt+aenderungDurchMaus >= 0 && fortschritt+aenderungDurchMaus <= 100) {
    fortschritt += aenderungDurchMaus;
  }
}
