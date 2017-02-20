import peasy.*;
PeasyCam cam;

Table table;


void setup() {
  fullScreen(P3D);
  table = loadTable("TestData.csv", "header");
  lights();
  cam = new PeasyCam(this, 500);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);
 
}

void draw() {
  background(0);
  for ( int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);

    int year = row.getInt("Year");
    int number = row.getInt("Number");

    int yPos = (height * 7/8) - (int) map(number, 0, 50, 0, height *3/4);
    int xPos = (i+1)*width/(table.getRowCount() + 1);
  
    stroke(100);
    line(xPos, height*7/8,0, xPos, height*1/8,0);
    text(year, xPos, height*7/8 + 5, 0);
    

    if (i > 0) {
      TableRow prevRow = table.getRow(i-1);

      int prevYear = prevRow.getInt("Year");
      int prevNumber = prevRow.getInt("Number");

      int prevYPos = (height * 7/8) - (int) map(prevNumber, 0, 50, 0, height *3/4);
      println("prevY:" + prevNumber);
      int prevXPos = (i)*width/(table.getRowCount() + 1);

      stroke(255);
      line(prevXPos, prevYPos,0, xPos, yPos,0);
    }
    
    pushMatrix();
    translate(xPos, yPos);
    sphere(10);
    popMatrix();
    //ellipse(xPos, yPos, 10, 10);
  }
}