/*********** HOME PAGE ***********/

class HomePage extends Interface{
  // ## VARIABLES ##
  // constants
  private static final int BTN_HEIGHT  = 355;
  private static final int BTN_WIDTH = 294;
  
  private boolean isOnPage;
  PFont titleFont;
  Button airportsBtn, datesBtn, delaysBtn;
  

  
  // ## METHODS ##
  // getter methods  
  public boolean isOnPage() {
    return this.isOnPage;
  }
  
  // font methods
  private void setTitleFont() {
    titleFont = createFont("PPSupplyMono-Regular.otf", 20);
    textFont(titleFont);
  }
  
  private void drawTitle() {
    fill(WHITE_SWATCH);
    text("FLIGHTS VISUALIZER", 45, 135);
    fill(GREY_SWATCH);
    text("SEARCH BY:", 45, 164);
  }
  
  // button methods
  private void drawButtons() {
    airportsBtn.draw();
    datesBtn.draw();
    delaysBtn.draw();
  }
  
  // standard methods
  void setup() {
    background(BG_COLOR);
    isOnPage = true;
    
    // text
    setTitleFont();
    
    // buttons
    airportsBtn = new Button ("airportsBtn.png", 45, 228, BTN_WIDTH, BTN_HEIGHT);
    datesBtn = new Button ("datesBtn.png", 365, 228, BTN_WIDTH, BTN_HEIGHT);
    delaysBtn = new Button ("delaysBtn.png", 685, 228, BTN_WIDTH, BTN_HEIGHT);
  }
  
  void draw() {
    background(BG_COLOR);
    drawTitle();
    drawButtons();
  }
}
