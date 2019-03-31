class Rocket {
  
  ParticleSystem smoke;
  float mass;
  float angle;
  float initYSpeed;
  PVector pos;
  PVector vel;
  PVector fric;
  PVector drag;
  PVector grav;
  PShape rocket, nose, body, exhaust;
  
  
  float xWidthRocket = 25;
  float yHeightRocket = 50;
  float xSpeed = 5;
  float ySpeed = -15;
  
  // change rocket to a pshape so i can rotate it as it moves
  Rocket (float _x, float _y, float _mass) {
    _x += xWidthRocket;
    _y -= yHeightRocket;
    mass = _mass;
    
    //initialize particles
    smoke = new ParticleSystem(0, new PVector(_x, _y + 10));
    
    pos = new PVector(_x, _y);
    mass = _mass;    

    vel = new PVector(xSpeed, ySpeed);
    
    //friction for when object hits the ground
    fric = new PVector(-0.5/mass, 0);
    
    //air drag acting backwards and based on mass & speed of object
    drag = new PVector(-(xSpeed*0.0015)/mass, (ySpeed*0.002)/mass); 
    
    //gravity acting downwards, based on screen space and mass
    grav = new PVector(0, (height/1000)/mass);
  }
  
  //returns pvector consisting of exhaust positions
  //PVector getPos() {
  //  PVector exhaustPos = new PVector(pos.x, pos.y + 25 + 10);
  //  return exhaustPos;
  //}
  
  PVector getCenter() {
    PVector position = pos.copy();
    return position;
  }
  void display(){
    getRocket();
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    shape(rocket, 0, 0);
    makeSmoke();
    //translate(0,0);
    popMatrix();
    
    //factor to multiply velocity by
    if (vel.x != 0){
      angle += 0.0025*vel.x;
    }
    
  }
  
  void getRocket(){
    rocket = createShape(GROUP);
    nose = createShape(TRIANGLE, 0 - (xWidthRocket/2), 0 - (yHeightRocket/2), 0, 0 - (yHeightRocket) - (xWidthRocket/2), 0 + (xWidthRocket/2), 0 - (yHeightRocket/2));
    //nose = createShape(TRIANGLE, pos.x - (xWidthRocket / 2), pos.y - (yHeightRocket / 2), pos.x, pos.y - (yHeightRocket) - (xWidthRocket / 2), pos.x + (xWidthRocket/2), pos.y - (yHeightRocket/2));
    nose.setFill(color(0, 0, 255));
    
    rectMode(CENTER);
    body = createShape(RECT, 0, 0, xWidthRocket, yHeightRocket);
    //body = createShape(RECT, pos.x, pos.y, xWidthRocket, yHeightRocket);
    body.setFill(color(255, 255, 255));
    
    exhaust = createShape(TRIANGLE, 0-(3*xWidthRocket/4),0+(yHeightRocket*0.8), 0,0, 0+(3*xWidthRocket/4),0 + (yHeightRocket*0.8));
    //exhaust = createShape(TRIANGLE, pos.x - (3*xWidthRocket/4), pos.y + (yHeightRocket * 0.8), pos.x, pos.y, pos.x + (3*xWidthRocket/4), pos.y + (yHeightRocket*0.8));  
    exhaust.setFill(color(255,0 ,0));
    
    rocket.addChild(nose);
    rocket.addChild(exhaust);
    rocket.addChild(body);
  }
  
  void makeSmoke(){
    smoke.update();
    if (vel.y <= (-ySpeed/4) && (pos.y <= height - yHeightRocket)){
        smoke.addParticle(new PVector(0,0 + (yHeightRocket)), 3);
      }
    //if (vel.x !=0 || vel.y != 0){

    //}
  }
  
  PVector getExhaustPos(){
    
    PVector exhaustSpawn = pos.copy();;
    exhaustSpawn.y += (yHeightRocket*0.8);
    
    return exhaustSpawn;
  }
    
  
  void update() {
    
    vel.add(grav);
    vel.add(drag);
    
    pos.add(vel);

    // stopping friction & drag from moving object backwards
    if (vel.x <= 0){
      fric.mult(0);
      drag.x = 0;
    }
    
    // air drag resists falling
    if (vel.y > 0){
      drag.y *= -drag.y;
    }
    
    //stop the rocket from going right of the screen
    if (pos.x >= width - (3*xWidthRocket/4)){
      vel.x = 0;
      drag.x = 0;
      pos.x = width - (3*xWidthRocket/4) - (xWidthRocket/2);

    }
    
    //stop the rocket from going below the screen
    if (pos.y >= height - (yHeightRocket * 0.8)){
      pos.y = height - (yHeightRocket * 0.8);
      
      drag.y = 0;
      grav.mult(0);
      
      vel.add(fric);
      vel.y = 0;
    }
  }
  
}
