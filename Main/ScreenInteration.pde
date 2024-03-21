Scrint buttonAir, buttonDate, buttonDelay, buttonDisplay, buttonExit;
PFont buttonFont;
/* constants to identify what to o for each button */
public final int NOT_PRESSED = 0;
public final int SCR1PRESSED = 1;
public final int SCR2PRESSED = 2;
public final int SCR3PRESSED = 3;
public final int SCR4PRESSED = 4;
//int screenPressed;
ArrayList screenList = new ArrayList();
class Scrint {
  boolean isCircle;
  int x, y, width, height;
  String label;
  int screenPressed;
  public color buttonColor, labelColor, buttonStroke;
  PFont buttonFont;
  Scrint()
  {
  }
  //constructor for all the widgets in main
  Scrint(int x, int y, int width, int height, String label,
    color buttonColor, color buttonStroke, PFont buttonFont, int screenPressed, boolean isCircle)
  {
    this.isCircle = isCircle;
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.screenPressed=screenPressed;
    this.buttonColor=buttonColor;
    this.buttonFont=buttonFont;
    this.buttonStroke = buttonStroke;
    labelColor= color(0);
  }
  //code for all the buttons, this system can work for any shape only requires a change to the constructor
  void draw() {
    fill(buttonColor);
    stroke(buttonStroke);
    if (isCircle) {
      ellipse(x, y, width, height);
      fill(labelColor);
      text(label, x, y);
    } else
    {
      rect(x, y, width, height);
      fill(labelColor);
      text(label, x+10, y+height-10);
    }
  }
  //the pressed function for main and the widgets
  int gotPressed(int mX, int mY) {
    if ((mX>x && mX < x+width) && (mY >y && mY <y+height))
    {
      return screenPressed;
    } else return NOT_PRESSED;
  }
  //switch statement for all the buttons in the main
  void  mousePressed()
  {
    int screenPressed;
    background(0);
    for (int i = 0; i< screenList.size(); i++)
    {
      Scrint aScreen = (Scrint) screenList.get(i);
      screenPressed = aScreen.gotPressed(mouseX, mouseY);
      switch(screenPressed) {
      case SCR1PRESSED:
        mainGo = false;
        airGo = true;
        airport.programRunning = true;
        println("In switch(): mainGo = " + mainGo + ", airGo = " + airGo);
        break;
      case SCR2PRESSED:
        dateGo =  true;
        mainGo =  false;
        break;
      case SCR3PRESSED:
        delayGo = true;
        mainGo = false;
        println("In switch(): mainGo = " + mainGo + ", delayGo = " + delayGo);
        break;
      case SCR4PRESSED:
        delayGo = false;
        dateGo = false;
        airGo = false;
        mainGo = true;
        break;
      }
    }
  }
}
