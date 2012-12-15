class Food {
  PImage main;
  boolean isSelected;
  float carbonFootprint;
  int category;
  int mainX;
  int mainY;
  int plateOrder;

  Food (PImage tempMain, boolean tempIsSelected, float tempCarbonFootprint, int tempCategory, int tempMainX, int tempMainY, int tempPlateOrder) {
    main = tempMain;  
    isSelected = tempIsSelected;
    carbonFootprint = tempCarbonFootprint; 
    category = tempCategory;
    mainX = tempMainX;
    mainY = tempMainY;
    plateOrder = tempPlateOrder;
  }
  // what category is the food item in
  int setCategory(int options) {
    if (options == 1) {
      category = 1; //veggie
    }
    else if (options == 2) {
      category = 2; //meat
    }
    else if (options == 3) {
      category = 3; //dairy
    } 
    else if (options == 4) {
      category = 4; //starch
    }
    else if (options == 5) {
      category = 5; //other
    }   
    return category;
  }

  void foodDisplay() {    
    // if an item has been selected, then show it on the plate
    // if the item is deselected, then hide it 
    if (isSelected == true) {
      image(main, mainX, mainY);
    }
  }
  void plateOrderFunction() {
    // immediately give it the food a plate location
    if (plateOrder == 1) {
      mainX = 190;
      mainY = 70;
    } 
    else if (plateOrder == 2) {
      mainX = 385;
      mainY = 260;
    } 
    else if (plateOrder == 3) {
      mainX = 430;
      mainY = 20;
    } 
    else if (plateOrder == 4) {
      mainX = 125;
      mainY = 250;
    }
    else if (plateOrder == 5) {
      mainX = 237;
      mainY = 400;
    }
    else if (plateOrder == 6) {
      mainX = 600;
      mainY = 170;
    }
    else if (plateOrder == 7) {
      mainX = 15;
      mainY = 15;
    }
    else if (plateOrder == 8) {
      mainX = 745;
      mainY = 345;
    }
    else if (plateOrder == 9) {
      mainX = 397 + int(random(-15, 15));
      mainY = 70 + int(random(-15, 15));
    } 
    else if (plateOrder == 10) {
      mainX = 585 + int(random(-15, 15));
      mainY = 260 + int(random(-15, 15));
    } 
    else if (plateOrder == 11) {
      mainX = 85 + int(random(-15, 15));
      mainY = 215 + int(random(-15, 15));
    } 
    else if (plateOrder == 12) {
      mainX = 450 + int(random(-15, 15));
      mainY = 20 + int(random(-15, 15));
    }
    else if (plateOrder == 13) {
      mainX = 97 + int(random(-15, 15));
      mainY = 240 + int(random(-15, 15));
    }
    else if (plateOrder == 14) {
      mainX = 580 + int(random(-15, 15));
      mainY = 400 + int(random(-15, 15));
    }
    else if (plateOrder == 15) {
      mainX = 45 + int(random(-15, 15));
      mainY = 445 + int(random(-15, 15));
    }
    else if (plateOrder == 16) {
      mainX = 575 + int(random(-15, 15));
      mainY = 15 + int(random(-15, 15));
    }
    else if (plateOrder == 17) {
      mainX = 497 + int(random(-15, 15));
      mainY = 70 + int(random(-15, 15));
    } 
    else if (plateOrder == 18) {
      mainX = 485 + int(random(-15, 15));
      mainY = 460 + int(random(-15, 15));
    } 
    else if (plateOrder == 19) {
      mainX = 25 + int(random(-15, 15));
      mainY = 15 + int(random(-15, 15));
    } 
    else if (plateOrder == 20) {
      mainX = 600 + int(random(-15, 15));
      mainY = 170 + int(random(-15, 15));
    }
    else if (plateOrder == 21) {
      mainX = 97 + int(random(-15, 15));
      mainY = 40 + int(random(-15, 15));
    }
    else if (plateOrder == 22) {
      mainX = 580 + int(random(-15, 15));
      mainY = 70 + int(random(-15, 15));
    }
    else if (plateOrder == 23) {
      mainX = 45 + int(random(-15, 15));
      mainY = 445 + int(random(-15, 15));
    }
  }

  void isFoodSelected() {
    isSelected =! isSelected;
    // keep track of how many items are currently on plate with plateItemCounter
    // keep track of global "food miles" for the plate with totalMilesTracker
    if (isSelected == true) {
      plateItemCounter++;
      totalMilesTracker = totalMilesTracker + carbonFootprint;
      plateOrder = plateItemCounter;
      // re-oder plate give new order
      plateOrderFunction();
    }
    if (isSelected == false) {
      plateItemCounter--;
      totalMilesTracker = totalMilesTracker - carbonFootprint;
      // check what item is getting removed so we can reorder properly
      int removedItem = plateOrder;
      // reset this item to 0 
      plateOrder = 0;
      // algorithm to re-order the entire plate. everything slides down by 1, if it's above the value of the removedItem.
      for (int i = 0; i < food.length; i++) {
        if (food[i].isSelected == true) {
          if (food[i].plateOrder > 1 && food[i].plateOrder > removedItem) {
            food[i].plateOrder = food[i].plateOrder - 1;
            food[i].plateOrderFunction();
          }
        }
      }
      plateOrderFunction();
    }
  }
}   

