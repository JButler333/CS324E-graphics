
Rocket rocket;

void setup() {
  size(1000, 1000);
  rocket = new Rocket(0, height, 5);
  }

void draw() {
  background(111);
  
  rocket.display();
  rocket.update();
}
