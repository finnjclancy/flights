//import controlP5;
public final  int SCREENY = 600;
public final int SCREENX = 600;
public final int THREE = 3;

String lines[];
String splitLine[];
String linesSplit[][];
boolean programRunning = true;

PrintWriter output;
Airport theAirport;

void setup() 
{
  background(0);
  output = createWriter("txtcopy.txt");
}

void settings()
{
  size(SCREENX, SCREENY);
  lines = loadStrings("flights2k(1).csv");
  splitLine = lines[1].split(",");
  
  //int numOfColoumns  = splitLine.length;
  //int numOfRows = lines.length;
  
  linesSplit = new String[lines.length][splitLine.length];
  println("there are " + lines.length + " lines.");
  
  for(int rowIndex = 1; rowIndex < lines.length; rowIndex++)
  {
    String tmpSplitLine[] = lines[rowIndex].split(",");
    for(int coloumnIndex = 0; coloumnIndex < splitLine.length; coloumnIndex++)
    {
      linesSplit[rowIndex][coloumnIndex] = tmpSplitLine[coloumnIndex];
    }
  }
  //size(SCREENX, SCREENY);
  theAirport = new Airport(linesSplit);
}

void draw() {
 
 /* for(int rowIndex = 1; rowIndex < linesSplit.length; rowIndex++)
  {
    for(int coloumnIndex = 0; coloumnIndex < numOfColoumns; coloumnIndex++)
    {
      output.println(linesSplit[rowIndex][coloumnIndex]);
    }
    output.println("------------------------------------");
  } */
 
  //if(programRunning)  // this if statement ensures that these functions are only called once and the program exits after one iteration of the draw method
  //{
  //  ArrayList<Airport> returnedAirports = theAirport.findFlight("LAX", 1); // This is the origin airport 
  //  ArrayList<Airport> returnedAirports = theAirport.findFlight("LAX", 2); // This is the destination airport 
  //  theAirport.findFlight("SFO", "JFK");
  //  theAirport.drawBarChart(returnedAirports);
  //}
  
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  //exit(); // Stops the program
  programRunning = false;
}
