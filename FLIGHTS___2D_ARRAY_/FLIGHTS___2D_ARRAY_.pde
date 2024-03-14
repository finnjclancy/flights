//import controlP5;
public final  int SCREENY = 1000;
public final int SCREENX = 1000;
public final int THREE = 3;

PrintWriter output;

void settings()
{
  //size(SCREENX, SCREENY);
}

void setup() {
    frameRate(1);
    output = createWriter("txtcopy.txt");

}


void draw() {
  String[] lines = loadStrings("flights2k(1).csv");
  String splitLine[] = lines[1].split(",");
  
  int numOfColoumns  = splitLine.length;
  int numOfRows = lines.length;
  
  String linesSplit[][] = new String[lines.length][splitLine.length];
  println("there are " + lines.length + " lines.");
  
  for(int rowIndex = 1; rowIndex < lines.length; rowIndex++)
  {
    String tmpSplitLine[] = lines[rowIndex].split(",");
    for(int coloumnIndex = 0; coloumnIndex < splitLine.length; coloumnIndex++)
    {
      linesSplit[rowIndex][coloumnIndex] = tmpSplitLine[coloumnIndex];
    }
  }
  
  for(int rowIndex = 1; rowIndex < linesSplit.length; rowIndex++)
  {
    for(int coloumnIndex = 0; coloumnIndex < numOfColoumns; coloumnIndex++)
    {
      output.println(linesSplit[rowIndex][coloumnIndex]);
    }
    output.println("------------------------------------");
  }
  
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}
