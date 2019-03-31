
class SmokeParticle {
  PVector pos;
  PVector vel;
  PVector pseudograv;
  float life;

  SmokeParticle(PVector _pos) {
    //pseudograv makes it go a little more downwards
    pseudograv = new PVector(0.08, 0.5);
    float vx = randomGaussian()*0.5;
    float vy = randomGaussian()*0.5;
    vel = new PVector(vx, vy);
    pos = _pos.copy(); //copy otherwise it changes it
    life = 100;
  }

  void run() {
    update();
    display();
  }

  void update() {
    vel.add(pseudograv);
    pos.add(vel);
    life -= 3;
  }

  void display() {
    ellipseMode(CENTER);
    color c1 = color(255, 156, 0);
    color c2 = color(0);
    color c3 = lerpColor(c1, c2, (1 - life/100));
    fill(c3, life);
    noStroke();
    ellipse(pos.x,pos.y, 50, 25);
  }
  
  boolean ranOut() {
    if (life <= 0){
      return true;}
    return false;
  }
}
