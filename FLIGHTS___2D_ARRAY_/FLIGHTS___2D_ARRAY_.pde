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
  int count = 0;
  String[] lines = loadStrings("flights2k(1).csv");
  String splitLine[] = lines[1].split(",");
  
  int COLUMNS  = splitLine.length;
  int ROWS = lines.length;
  
  String linesSplit[][] = new String[lines.length][splitLine.length];
  println("there are " + lines.length + " lines.");
  
  for (int i = 1; i < lines.length; i++)
  {
    output.println("NUMBER " + i + ", " + lines[i]);
    count++;
    if (i % 10 == 0)
    {
      output.println("-------");
    }
  }
  
  for(int i = 1; i < lines.length; i++)
  {
    String tmpSplitLine[] = lines[i].split(",");
    for(int j = 0; j < splitLine.length; j++)
    {
      linesSplit[i][j] = tmpSplitLine[j];
    }
  }
  
  // EXAMPLE OF HOW TO PRINT EVERY ELEMENT FROM A SPECIFIC FLIGHT
  for(int i = 0; i < COLUMNS; i++)
  {
    System.out.println(linesSplit[1][i]);
  }
  
  // EXAMPLE OF HOW TO PRINT EVERY ELEMENT FROM A COlUMN SUCH AS DATE
  for(int i = 0; i < ROWS; i++)
  {
    System.out.println(linesSplit[i][0]);
  }

  output.println(count);
  
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}

  //  switch {
  //    case 1:
  //    if (widget1 == true)
  //    draw.page1;
  //    else
  //    break;
  //    case 2:
  //     if (widget1 == true)
  //    draw.page2;
  //    else break;
  //    case 3:
  //     if (widget1 == true)
  //    draw.page3;
  //    else break;
  //    default
  //    //for(i = 0; i < widget.length; i++) {
  //    //  widget<i>  = false;




//  }
//}
