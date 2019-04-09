
class Block{
  float w,h,x,y;
  int value;
  color c;
  
  Block(float x, float y, int value){
    this.w = 100;
    this.h = 100;
    this.x = x;
    this.y = y;
    this.value = value;
    this.c = color(255,0,0);
  }
  
  void display() {
    fill(c);
    rect(x,y,w,h);
    fill(0);
    textSize(28);
    textAlign(CENTER, CENTER);
    text(str(value),x+50,y+50);
  }
  
}
