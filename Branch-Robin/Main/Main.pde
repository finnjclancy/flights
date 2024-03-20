//import controlP5;
public final  int SCREENY = 1000;
public final int SCREENX = 1000;
public final int THREE = 3;

String linesSplit[][];
PrintWriter output;
Date userDate;
Charts dataCharts;

void settings()
{
  size(SCREENX, SCREENY);
}


//for (int rowIndex = 1; rowIndex < linesSplit.length; rowIndex++)
//{
//  //for (int coloumnIndex = 0; coloumnIndex < numOfColoumns; coloumnIndex++)
//  //{
//  //  output.println(linesSplit[rowIndex][coloumnIndex]);
//  //}
//  output.println("------------------------------------");
//}
//userDate = new Date(linesSplit);
//userDate.getDates(linesSplit);

//dataCharts = new Charts(userDate.monthOcc);
//dataCharts.drawDates(userDate.monthOcc);
//dataCharts.drawAirports();




void setup() {
  output = createWriter("txtcopy.txt");
  //size(800, 600);
  background(255);



  String[] lines = loadStrings("flights2k(1).csv");
  String splitLine[] = lines[1].split(",");

  int numOfColoumns  = splitLine.length;
  int numOfRows = lines.length;

  linesSplit = new String[lines.length][splitLine.length];
  println("There are " + lines.length + " lines.");

  for (int rowIndex = 1; rowIndex < lines.length; rowIndex++)
  {
    String tmpSplitLine[] = lines[rowIndex].split(",");
    for (int coloumnIndex = 0; coloumnIndex < splitLine.length; coloumnIndex++)
    {
      linesSplit[rowIndex][coloumnIndex] = tmpSplitLine[coloumnIndex];
    }
  }
}



void draw() {

  //output.flush(); // Writes the remaining data to the file
  //output.close(); // Finishes the file
  //exit(); // Stops the program
}
