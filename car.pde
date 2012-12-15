class Car {
  PImage car;
  float carX;
  float carY;
  float moveX;
  float moveY;

  Car (PImage _car, float _carX, float _carY, float _moveX, float _moveY) {
    car = _car;
    carX = _carX;
    carY = _carY;
    moveX = _moveX;
    moveY = _moveY;
  }
  void display() {
    if (animate == false) {
      moveX = 0;
    }
    // how fast should the car go? and where does it stop?
    if (animate == true && yearlyMilesRounded > 0 && yearlyMilesRounded <= 1000) {
      moveX = 1.2;
      moveY = random(-0.15, 0.15); 
      carX = carX + moveX;
      carY = carY + moveY;
      if (carX > 220 && carX < 222) {
        moveX = 0;
        moveY = 0;
        carX = 220;
        carY = height-120;
      }
    }
    else if (animate == true && yearlyMilesRounded > 1000 && yearlyMilesRounded <= 2000) {
      if (carTracker == 0) {
        moveX = 2.4;
      }
      moveY = random(-0.15, 0.15); 
      carX = carX + moveX;
      carY = carY + moveY;
      if (carX >= width) {
        carX = 0;
        moveX = moveX + 0.2;
        carTracker++;
        carX = 0;
      }
      if (carTracker == 1) {
        if (carX >= 220) {
          moveX = 0;
          moveY = 0;
          carX = 220;
          carY = height-120;
        }
      }
    }
    else if (animate == true && yearlyMilesRounded > 2000 && yearlyMilesRounded <= 3000) {
      if (carTracker == 0) {
        moveX = 2.8;
      }
      moveY = random(-0.15, 0.15); 
      carX = carX + moveX;
      carY = carY + moveY;
      if (carX >= width) {
        carX = 0;
        moveX = moveX + 0.2;
        carTracker++;
        carX = 0;
      }
      if (carTracker == 2) {
        if (carX >= 220) {
          moveX = 0;
          moveY = 0;
          carX = 220;
          carY = height-120;
        }
      }
    }
    else if (animate == true && yearlyMilesRounded > 3000 && yearlyMilesRounded <= 4000) {
      if (carTracker == 0) {
        moveX = 3.2;
      }
      moveY = random(-0.15, 0.15); 
      carX = carX + moveX;
      carY = carY + moveY;
      if (carX >= width) {
        carX = 0;
        moveX = moveX + 0.2;
        carTracker++;
        carX = 0;
      }
      if (carTracker == 3) {
        if (carX >= 220) {
          moveX = 0;
          moveY = 0;
          carX = 220;
          carY = height-120;
        }
      }
    }
    else if (animate == true && yearlyMilesRounded > 4000 && yearlyMilesRounded <= 10000) {
      if (carTracker == 0) {
        moveX = 3.6;
      }
      moveY = random(-0.15, 0.15); 
      carX = carX + moveX;
      carY = carY + moveY;
      if (carX >= width) {
        carX = 0;
        moveX = moveX + 0.2;
        carTracker++;
        carX = 0;
      }
      if (carTracker == 3) {
        if (carX >= 220) {
          moveX = 0;
          moveY = 0;
          carX = 220;
          carY = height-120;
        }
      }
    }
    else if (animate == true && yearlyMilesRounded > 10000 && yearlyMilesRounded <= 20000) {
      if (carTracker == 0) {
        moveX = 4.0;
      }
      moveY = random(-0.15, 0.15); 
      carX = carX + moveX;
      carY = carY + moveY;
      if (carX >= width) {
        carX = 0;
        moveX = moveX + 0.2;
        carTracker++;
        carX = 0;
      }
      if (carTracker == 4) {
        if (carX >= 220) {
          moveX = 0;
          moveY = 0;
          carX = 220;
          carY = height-120;
        }
      }
    }
    image(car, carX, carY);
  }
}

