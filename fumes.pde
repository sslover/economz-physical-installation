//
//// A simple Particle class, renders the particle as an image
//
//class Particle {
//  PVector loc;
//  PVector vel;
//  PVector acc;
//  float lifespan;
//  PImage img;
//
//  Particle(PVector l,PImage img_) {
//    acc = new PVector(0,0);
//    float vx = (float) generator.nextGaussian()*0.3;
//    float vy = (float) generator.nextGaussian()*0.3 - 1.0;
//    vel = new PVector(vx,vy);
//    loc = l.get();
//    lifespan = 150.0;
//    img = img_;
//  }
//
//  void run() {
//    update();
//    render();
//  }
//  
//  // Method to apply a force vector to the Particle object
//  // Note we are ignoring "mass" here
//  void applyForce(PVector f) {
//    acc.add(f);
//  }  
//
//  // Method to update location
//  void update() {
//    vel.add(acc);
//    loc.add(vel);
//    acc.mult(0); // clear Acceleration
//    lifespan -= 2.5;
//  }
//
//  // Method to display
//  void render() {
//    imageMode(CENTER);
//    tint(255,lifespan);
//    image(img,loc.x,loc.y);
//  }
//
//  // Is the particle still useful?
//  boolean dead() {
//    if (lifespan <= 0.0) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//}
//

