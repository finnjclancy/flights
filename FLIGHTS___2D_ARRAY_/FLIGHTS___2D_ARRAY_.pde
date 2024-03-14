//import controlP5;
public final  int SCREENY = 1000;
public final int SCREENX = 1000;
public final int THREE = 3;

PrintWriter output;

void settings()
{
  // size(SCREENX, SCREENY);
}

void setup() {
    frameRate(1);
    output = createWriter("txtcopy.txt");
}

void draw() {
  // GIVEN FILE
  String[] lines = loadStrings("flights2k(1).csv");
  
  // DIMENSIONS OF 2D ARRAY
  String splitLine[] = lines[1].split(",");
  int COLUMNS  = splitLine.length;
  int ROWS = lines.length;
  String linesSplit[][] = new String[ROWS][COLUMNS];
  
  // CONVERT FILE INTO 2D ARRAY
  // ROW INDEX REPRESENTS THE FLIGHTS
  // COLUMN INDEX REPRESENTS THE ELEMENTS OF THE FLIGHT
  for(int rowIndex = 1; rowIndex < lines.length; rowIndex++)
  {
    String tmpSplitLine[] = lines[rowIndex].split(",");
    
    for(int columnIndex = 0; columnIndex < splitLine.length; columnIndex++)
    {
      linesSplit[rowIndex][columnIndex] = tmpSplitLine[columnIndex];
    }
  }
  
  // CHANGE THE INPUT TEXT FILE TO READ FLIGHT INFORMATION
  for (int rowIndex = 0; rowIndex < ROWS; rowIndex++)
  {
    output.println("NUMBER " + rowIndex + ", " + lines[rowIndex]);
    if (rowIndex % 10 == 0)
    {
      output.println("-------");
    }
  }
  
  // CLEAR AND CLOSE FILE
  output.flush(); 
  output.close(); 
  
  // STOP THE PROGRAM
  exit();
}
