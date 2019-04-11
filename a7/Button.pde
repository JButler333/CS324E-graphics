
class Button {
  
  float x, y, w, h;
  String text;
  color col;
  
  Button(float x, float y, String text) {
    this.col = color(0, 255, 0); 
    this.x = x;
    this.y = y;
    this.w = 150;
    this.h = 50;
    this.text = text;
    
  }
  
  void displayButton() {
    fill(col);
    stroke(5);
    rect(x, y, w, h);
    fill(0);
    textAlign(LEFT, TOP);
    textSize(20);
    text(text, x, y);
  }
    
  boolean isInside() {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h){
      return true;
    }
    return false;
  }
  
  
  
  
}
