class Button{
  int x, y, w, h;
  PImage btn;
  
  
  // ## CONSTRUCTOR ##
  Button (String btnObjectName, int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.btn = loadImage(btnObjectName); 
  }
  

  
  // ## METHODS ##
  boolean isMouseOver(int x, int y, int w, int h){
    return (mouseX >= x && mouseX <= x + w && mouseY >= y && 
      mouseY <= y + h) ? true : false;
  }
  
  //void mousePressed(){
  //  if(isMouseOver(width/2,height/2,100,50) == true){
  //    println("Mouse pressed button");
  //    // do something on button press
  //  }
  //}
  
  void draw() {
    image(btn, x, y);
  }

}
