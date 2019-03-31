class Spring {
  float M = 1;
  float K = 0.2;
  float l = 100;
  float w = 100;
  float xb1 = 200;
  float xb2 = 400;
  float y = 150;
  float b1Vel = 0;
  float b2Vel = 0;
  float springLMax = 250;
  float springL, springW, springF, acc, temp;
  
  Spring() {
    this.springL = xb1-20;
    this.springW = 4000/springL;
  }
  
  void display() {
    springF = -K*(springL-springLMax);
    acc = springF/M;
    b1Vel = b1Vel + acc/60;
    if (xb1+w >= xb2){
      temp = b2Vel;
      b2Vel = b1Vel;
      b1Vel = temp;
    }
    if (xb2 + w >= width){
      b2Vel = -b2Vel;
    }
    xb2 = xb2 + b2Vel;
    xb1 = xb1 + b1Vel;
    rect(xb1,y,l,w);
    rect(xb2,y,l,w);
    fill(110);
    rect(20,200-springW/2,springL,springW);
    springL = xb1-20;
    springW = 4000/springL;
    fill(0);
    rect(0,100,20,200);
    fill(0,0,255);
  }
  
}
