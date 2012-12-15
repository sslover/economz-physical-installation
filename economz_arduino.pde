// economz - visualzing your carbon foodprint
// by Sam Slover in the fall of 2012
// for NYU's Interactive Telecommunications Program
// this is the arduino version (food items are powered by RFID tags)
// icons designed using open source images from The Noun Project and ITP colleague Maria Paul Saba
// code ideas and suggestions contributed by Processing wizard Dan Shiffman (all mistakes are my own)

import processing.serial.*;     // import the Processing serial library
Serial myPort;                  // The serial port

int numItems = 23;
Food food[] = new Food[numItems];

// bottom animation
boolean animate = false;

// car object
Car car;
int carTracker = 0; //tracks how many times a car has cycled through each animation

// fumes
//ParticleSystem ps;
//Random generator;

// main images
PImage bg;
PImage plateReset;
PImage bottom;
PImage splash1;
PImage prompt1;
PImage prompt2;
PImage prompt3;

// fonts
PFont tradeGothic;
boolean textDisplay = false;

// to keep track of the plate items
int plateItemCounter = 0;

// to keep track of the total "carbon miles" travelled for all food on plate
float totalMilesTracker = 0;
int yearlyMilesRounded = 0;

// arrays for data
// the entire spreadsheet
String [] cells;
// split it in this array
String [] splits;
// just the carmiles
Float [] carMiles;

void setup() {
  size (1024, 768);
  // font
  tradeGothic = loadFont("TradeGothicLT-Bold-48.vlw");
  // load panel images
  bg = loadImage("economz-bg.jpg"); 
  plateReset = loadImage("plate-reset.jpg");
  bottom = loadImage("bottom-panel.jpg");
  splash1 = loadImage("splash1.png");
  prompt1 = loadImage("prompt1.png");
  prompt2 = loadImage("prompt2.png");
  prompt3 = loadImage("prompt3.png");
  // load fume system
  //  generator = new Random();
  //  PImage img = loadImage("texture.png");
  //  ps = new ParticleSystem(0,new PVector(width/2,height-60),img);
  // load and bring in the car object
  PImage carImage = loadImage("car.png");
  car = new Car (carImage, 50, height-120, 0, 0);
  //load data
  cells = loadStrings("economz.csv");
  carMiles = new Float[cells.length];
  for (int i = 0; i < cells.length; i++) {
    splits = cells[i].split(",");
    carMiles[i] = float(splits[5]);
  }
  // load images for the food items
  PImage[] mainImages = new PImage[numItems];
  for (int i = 0; i < mainImages.length; i++) {
    mainImages[i] = loadImage(i + ".png");
  }
  // bring in the food objects!
  for (int i = 0; i < food.length; i++) {
    food[i] = new Food(mainImages[i], false, carMiles[i], 0, width/2, height/2, 0);
  }
  println(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  // read bytes into a buffer until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');
}
void draw() {
  imageMode(CORNER);
  // load and show initial panel images
  background(bg);
  // if no food items, show initial splash screen
  if (plateItemCounter == 0) {
    splash1();
  }
  imageMode(CORNER);
  for (int i = 0; i < food.length; i++) {
    food[i].foodDisplay();
  }
  // lower part of the program display goes here
  car.display();
  if (plateItemCounter >= 1 && animate == false) {
    prompts();
  }
  yearlyMilesRounded = round(365*totalMilesTracker);
  if (animate == true) {
    car.display();
    //    float dx = -0.2;
    //    PVector wind = new PVector(dx, 0);
    //    ps.applyForce(wind);
    //    ps.run();
    //    for (int i = 0; i < 4; i++) {
    //      ps.addParticle();
    //    }
  }
  if (textDisplay == true) {
    fill(29, 91, 46);
    textFont(tradeGothic, 28);
    text("If you ate this meal once a day for a year", width-575, height-65);
    fill(64, 64, 65);
    text("it's the carbon equivalent of driving", width-575, height-35);
    fill(211, 33, 50);
    text(yearlyMilesRounded + " miles", width-158, height-35);
  }
}


void textDisplay() {
  fill(29, 91, 46);
  textFont(tradeGothic, 84);
  text("If you ate this meal once a day for a year", width-200, height-120);
}

void serialEvent (Serial myPort){
  // get the ASCII string:
  String stringID = myPort.readStringUntil('\n');
  if (stringID != null) {
    // trim off any whitespace:
    stringID= trim(stringID);
    // convert to an int
    int foodID = int(stringID);
    println(foodID);
    // if it is the car ID, run the animation
    if (foodID == 44 && plateItemCounter >=1) {
      animate = true;
      textDisplay = true;
    }
    // if it is the sponge ID, reset the plate 
    if (foodID == 88) {
      plateItemCounter = 0;
      totalMilesTracker = 0;
      carTracker = 0;
      textDisplay = false;
      for (int i = 0; i < food.length; i++) {
        food[i].isSelected = false;
        food[i].plateOrder = 0;
      }
      // reset bottom attributes too
      animate = false;
      car.carX =  50; 
      car.carY = height-120;
    }
    // otherwise, add a foood item given the ID    
    for (int i = 0; i < food.length; i++) {
      if (foodID == i) {
        food[i].isFoodSelected();
      }
    }
    if (plateItemCounter == 0) {
      plateItemCounter = 0;
      totalMilesTracker = 0;
      carTracker = 0;
      textDisplay = false;
      for (int i = 0; i < food.length; i++) {
        food[i].isSelected = false;
        food[i].plateOrder = 0;
      }
      // reset bottom attributes too
      animate = false;
      car.carX =  50; 
      car.carY = height-120;
    }
  }
}

void splash1() {
  noStroke();
  fill(88, 88, 91, 160);
  rect(0, 0, width, height);
  imageMode(CENTER);
  image(splash1, width/2, height/2-75);
}

void splash2() {
}

void prompts() {
  image(prompt1, 430, height-123);
  image(prompt2, 630, height-123);
  image(prompt3, 830, height-123);
}

