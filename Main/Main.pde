public final  int SCREENY = 600;
public final int SCREENX = 600;
public final int THREE = 3;
public boolean airGo = false, dateGo = false, delayGo = false, mainGo = true;

PrintWriter output;
Airport airport;

Date userDate;
Delays delay;
Scrint scrint;

String lines[];
String splitLine[];
String linesSplit[][];

void settings()
{
  size(SCREENX, SCREENY);
  lines = loadStrings("flights2k(1).csv");
  splitLine = lines[1].split(",");

  //int numOfColoumns  = splitLine.length;
  //int numOfRows = lines.length;

  linesSplit = new String[lines.length][splitLine.length];
  println("there are " + lines.length + " lines.");

  for (int rowIndex = 1; rowIndex < lines.length; rowIndex++)
  {
    String tmpSplitLine[] = lines[rowIndex].split(",");
    for (int coloumnIndex = 0; coloumnIndex < splitLine.length; coloumnIndex++)
    {
      linesSplit[rowIndex][coloumnIndex] = tmpSplitLine[coloumnIndex];
    }
  }
  airport = new Airport(linesSplit);
}

void setup() {
  scrint  = new Scrint();
  //date = new Date();
  delay = new Delays();
  background(0, 0, 0);
  frameRate(100);
  /* this part of the main will preferably be moved into the screen integration page to make the Main mor organized */
  output = createWriter("txtcopy.txt");
  buttonAir = new Scrint( SCREENX/8, SCREENY/8, 100, 50, "Airport",
    color(173, 216, 230), color(255), buttonFont, SCR1PRESSED, false);
  buttonDate = new Scrint( SCREENX/8, SCREENY*2/8, 100, 50, "Date",
    color(173, 216, 230), color(255), buttonFont, SCR2PRESSED, false);
  buttonDelay = new Scrint( SCREENX/8, SCREENY*3/8, 100, 50, "Delay",
    color(173, 216, 230), color(255), buttonFont, SCR3PRESSED, false);
  buttonExit = new Scrint(SCREENX * 19 / 20, SCREENY / 40, 25, 25, "X",
    color(173, 216, 230), color(0), buttonFont, SCR4PRESSED, true);


  screenList.add(buttonAir);
  screenList.add(buttonDate);
  screenList.add(buttonDelay);
  screenList.add(buttonExit);

  // screenList.add(buttonExit);
  userDate = new Date(linesSplit);
}


void draw() {
  /* the draw portion of the code is supposed to be minimal with only the necessary parts */

  //if(airport.programRunning)
  {
    airport.draw();
  }
  if (dateGo)
  {
    if (!userDate.secondLoop)
    {

      userDate.getDates(linesSplit);
      userDate.draw();
    }
  }
  //delay.draw();
  buttonExit.draw();

  if (mainGo)
  {

    background(255);

    for (int i = 0; i< screenList.size(); i++)
    {
      Scrint aScreen = (Scrint) screenList.get(i);
      aScreen.draw();
    }
  }
}

void keyPressed()
{
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}
void mousePressed()
{
  /* mousepressed function is connected to screen integration. I found this looks more clean than having it all in main */
  scrint.mousePressed();

  /* the exit button is different than all the others because its the only one that remains on all the screens.
   if we need more buttons that are constant they will need to be applied with this
   it is currently buggy and will only return to the home screen if pressed on the lower right portion of the circle.
   */
  if (buttonExit.gotPressed(mouseX, mouseY) == SCR4PRESSED)
  {
    println("Return home");
    mainGo = true;
    airGo = false;
    airport.secondLoop = false;
    delayGo = false;
    dateGo = false;
    userDate.secondLoop = false;
  }
}
