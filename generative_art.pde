String Name = "Tom Caraher";
String studentNumber = "20108883";

String Title = "Ode To Fibo";

// Constants
float goldenRatio = 1.61803398875;
int rows = 9;
int columns = 16;

// Colors
// https://color.adobe.com/This-Green-color-theme-fadb0fab-4777-45c0-a4fe-658b2b84af75
int c1 = #348888;
int c2 = #22BABB;
int c3 = #9EF8EE;
int c4 = #FA7F08;
int c5 = #F24405;

// For use with opacity changes on some elements
int c5Red = 242;
int c5Green = 68;
int c5Blue = 5;

// // Colors
// // https://color.adobe.com/This-Green-color-theme-fadb0fab-4777-45c0-a4fe-658b2b84af75
// int c1 = #00261C;
// int c2 = #044D29;
// int c3 = #168039;
// int c4 = #45BF55;
// int c5 = #96ED89;

// // For use with opacity changes on some elements
// int c5Red = 150;
// int c5Green = 237;
// int c5Blue = 137;

// "random" color variables. Calls custom method choosing from 5 colors above

int randomColorA = getRandomColor();
int randomColorB = getRandomColor();
int randomColorC = getRandomColor();
int randomColorD = getRandomColor();
int randomColorE = getRandomColor();
int randomColorF = getRandomColor();
int randomColorG = getRandomColor();
int randomColorH = getRandomColor();
int randomColorI = getRandomColor();

// Mouse Method Variables
int spiralVisible = 0;
int fibNumVisibility = 20;

void setup() {
  size(1280, 720);
  surface.setLocation(0, 0);

  randomColorA = getRandomColor();
  randomColorB = getRandomColor();
  randomColorC = getRandomColor();
  randomColorD = getRandomColor();
  randomColorE = getRandomColor();
  randomColorF = getRandomColor();
  randomColorG = getRandomColor();
  randomColorH = getRandomColor();
  randomColorI = getRandomColor();
}

void draw() {
  background(c1);

  // Call custom method to create the fibonacci number grid
  drawFibonacciNumberGrid();

  // Fibonacci boxes,sprials, and ellipses using the golden ratio.
  translate((width - fibNum(16)) / 2, (height - fibNum(15)) / 2 + 40);
  int startingFibNum = 15;
  int numOfBoxes = 11;

  // Set fibonacci boxes / layout. starting from bottom left to facilitate portrait orientation, hence the below translate and rotate

  translate(0, fibNum(startingFibNum));
  rotate(radians( -90));

  // Loop and count each time a box is drawn, stop at set number of boxes (smallest)
  for (int count = 0; count < numOfBoxes; count++) {

    fill(c1);
    stroke(c3);

    // Get element size to scale down along with the relative fibonacci position
    int elementSize = getElementSize(startingFibNum, startingFibNum-7);

    // Set grids and ellipse elements inside each fibonacci box, scaling to the elementSizes
    int rowNum = 0;
    for (int yElementPosition = 0; yElementPosition <= fibNum(startingFibNum) - elementSize; yElementPosition += elementSize) {
      int elementNum = 0;
      for (int xElementPosition = 0; xElementPosition <= fibNum(startingFibNum) - elementSize; xElementPosition += elementSize) {
        int numOfInnerEllipses = 4;
        // Draw each ellipse/inner ellipses.
        if (count > 6) {
          numOfInnerEllipses = 3;
        }
        setUpEllipses(xElementPosition, yElementPosition, elementSize, rowNum, elementNum, numOfInnerEllipses);
        elementNum ++;
      }
      rowNum ++;
    }

    noFill();
    // Set fib boxes and spirals to 0 opacity, controlling spiralVisible with mouseMoved()
    stroke(c5Red, c5Green, c5Blue, spiralVisible);
    strokeWeight(5);
    // Draw fib boxes and spirals(arcs)
    rect(0, 0, fibNum(startingFibNum), fibNum(startingFibNum));
    ellipseMode(CENTER);
    strokeWeight(10);
    arc(0, fibNum(startingFibNum), 2 * fibNum(startingFibNum), 2 * fibNum(startingFibNum), radians( -90), radians(0));

    // move/rotate/twist the canvas for next loop/fib box/arc/ellipse grid
    rotate(radians(90));
    translate(fibNum(startingFibNum), -fibNum(startingFibNum));

    //Work down to smallest fibonacci numbers
    startingFibNum --;
  }

  // Reposition canvas with translate to draw name etc in correct locations
  translate(840, 580);
  rotate(radians( 180));
  displayInfo();
}



void mouseClicked() {
  if (mouseButton == LEFT) {
    randomColorA = getRandomColor();
    randomColorB = getRandomColor();
    randomColorC = getRandomColor();
    randomColorD = getRandomColor();
    randomColorE = getRandomColor();
    randomColorF = getRandomColor();
    randomColorG = getRandomColor();
    randomColorH = getRandomColor();
    randomColorI = getRandomColor();
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    save(Name + "-" + studentNumber + ".PNG");
  }
}

void mouseMoved() {
  if (mouseX <= width / 2 && mouseY <= height / 2) {
    spiralVisible = 1000;
    // stroke(c1);
  } else {
    spiralVisible = 0;
  }
}

void mouseWheel(MouseEvent event) {
  float upOrDown = event.getCount();
  fibNumVisibility += upOrDown;
}

/*
 Write fibonacci numbers as part of backing grid.
 Each number overflows into the next cell as it grows.
 Calls a separate function returning a Long
 */

void drawFibonacciNumberGrid() {
  int longFibPosition = 0;
  fill(c5Red, c5Green, c5Blue, fibNumVisibility);
  textSize(30);
  textAlign(LEFT, CENTER);

  // Iterate over 16:9 grid, putting a fib number in each.
  // When the number grows too large for font size, split it and place in next cell
  for (int fibStringRowNum = 0; fibStringRowNum < rows; fibStringRowNum ++) {
    for (int fibStringElementNum = 0; fibStringElementNum < columns; fibStringElementNum ++) {

      // str() processing method does not seem to work properly converting a long. bug? Possibly my error
      String fibString = String.valueOf(longFibNum(longFibPosition));
      int maxCharNum = 5;

      // Checks for fib number(in string format) above the max char amount for that font size(5)
      if (fibString.length() >= maxCharNum) {
        int index = 0;
        int fibStringLength = fibString.length();

        // Splits and draws first part of number
        String subFibString = fibString.substring(index, maxCharNum);
        text(subFibString, fibStringElementNum * 80, fibStringRowNum * 80, 80, 80);

        fibStringLength = fibString.length() - maxCharNum;

        // for rest of the number, iterate and draw the new strings
        while (fibStringLength > 0) {
          index += maxCharNum;

          // Checks if we're on the last part of the string, and applies correct .substring param, or continues
          if (fibStringLength < maxCharNum) {
            subFibString = fibString.substring(index);
          } else {
            subFibString = fibString.substring(index, index + maxCharNum);
          }

          fibStringElementNum ++;
          fibStringLength -= maxCharNum;

          text(subFibString, fibStringElementNum * 80, fibStringRowNum * 80, 80, 80);
        }
      } else {
        text(fibString, fibStringElementNum * 80, fibStringRowNum * 80, 80, 80);
      }
      longFibPosition++;
    }
  }
}

// Gets a random color from my pallate defined with global variables, Only want first 4, not 5 colors, as I have another application for the 5th color
int getRandomColor() {
  int r = int(random(4));
  int randomColor = 0;
  if (r == 0)
  {
    randomColor = c1;
  } else if (r ==  1) {
    randomColor = c2;
  } else if (r ==  2) {
    randomColor = c3;
  } else if (r == 3) {
    randomColor = c4;
  }
  return randomColor;
}

// get element size from fibindex, Ensures that no matter what box divisor param is entered it wont return too small
int getElementSize(int boxSize, float boxSizeDivisor) {
  int elementSize = int(fibNum(boxSize) / boxSizeDivisor);
  if (elementSize <= fibNum(3)) {
    return fibNum(5);
  } else {
    return elementSize;
  }
}

// Ellipse Element set up and color conditionals
void setUpEllipses(int xElementPosition, int yElementPosition, int elementSize, int rowNum, int elementNum, int numOfInnerCircles) {
  // draw ellipses that are in rough position of the fib spiral, passing static colurs in.
  if (elementSize < fibNum(9) && xElementPosition ==  yElementPosition) {
    drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, c5, c4, c3);
  } else if (elementSize > fibNum(9) && xElementPosition ==  yElementPosition + elementSize || elementSize > fibNum(9) && xElementPosition ==  yElementPosition + elementSize*2) {
    drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, c5, c4, c3);
  }
  // Select colour scheme for rest of elements, based off a number of aesthetically pleasing conditions
  else {
    if (rowNum % 2 ==  0) {
      if (elementNum % 3 ==  0) {
        drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, randomColorA, randomColorB, randomColorC);
      } else if (elementNum % 2 == 0) {
        drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, randomColorD, randomColorE, randomColorF);
      } else {
        drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, randomColorG, randomColorH, randomColorI);
      }
    } else if (rowNum % 3 ==  0) {
      if (elementNum % 3 ==  0) {
        drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, randomColorB, randomColorC, randomColorD);
      } else if (elementNum % 2 == 0) {
        drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, randomColorE, randomColorF, randomColorG);
      } else {
        drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, randomColorH, randomColorI, randomColorA);
      }
    } else {
      if (elementNum % 3 ==  0) {
        drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, randomColorC, randomColorF, randomColorI);
      } else if (elementNum % 2 == 0) {
        drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, randomColorB, randomColorE, randomColorH);
      } else {
        drawEllipses(xElementPosition, yElementPosition, elementSize, numOfInnerCircles, randomColorA, randomColorD, randomColorG);
      }
    }
  }
}

/*
Drawing the actual ellipse, and inner ellipses. Passes in the chosen color from setUpEllipses as colorA,B,C
 Instead of choosing to use the fibNum method here to determine ellipse sizes, I have chosen another approach
 with the golden ratio, the resulting ratio average from the fibonacci sequence.
 */
void drawEllipses(float xElementPosition, float yElementPosition, float elementSize, int numOfInnerCircles, int circleColorA, int circleColorB, int circleColorC) {
  ellipseMode(CORNER);

  int circleNumber = 1;
  while (circleNumber <= numOfInnerCircles) {
    // Select color based on location, using modulo operator by amount of colours passed into the method

    if (circleNumber % 3 == 1) {
      fill(circleColorA);
    } else if (circleNumber % 3 == 2) {
      fill(circleColorB);
    } else {
      fill(circleColorC);
    }

    // draw the ellipses
    noStroke();
    ellipse(xElementPosition, yElementPosition, elementSize, elementSize);

    // Make successive ellipses smaller incrementally based on the golden ratio.
    elementSize = elementSize / goldenRatio;
    xElementPosition = xElementPosition + elementSize / 2;
    yElementPosition = yElementPosition + elementSize / 2;

    circleNumber ++;
  }
}

// Gets fibonacci number from provided index using recursion. This is a faster approach as compared with a standard loop.
// First function returns the position itself as they don't need to be added together
int fibNum(int fibPosition) {
  if (fibPosition <= 1) {
    return fibPosition;
  }
  return fibonacciHelper(0, 1, fibPosition - 1);
}

// Helper method passes in the previous and current result and calls itself, adding the previous and current each time.
// returns the final added number when the position reaches zero
int fibonacciHelper(int prev, int current, int fibPosition) {
  if (fibPosition ==  0) {
    return current;
  }
  return fibonacciHelper(current, prev + current, fibPosition - 1);
}

// Separated long version of above method. I only use this for the fib number grid displaying each number, as it goes far beyond the int limit.
// (in fact I hit the long limit as well without some optimization!)
// More efficient to use the int version in the majority of the code as it takes less bytes and its more than enough.
long longFibNum(int fibPosition) {
  if (fibPosition <= 1) {
    return fibPosition;
  }
  return longFibonacciHelper(0, 1, fibPosition - 1);
}

long longFibonacciHelper(long prev, long current, long fibPosition) {
  if (fibPosition ==  0) {
    return current;
  }
  return longFibonacciHelper(current, prev + current, fibPosition - 1);
}

// Displays name and student number
void displayInfo() {
  fill(255);
  textSize(36);
  textAlign(LEFT, CENTER);
  String upperCaseName = Name.toUpperCase();
  for (int i = 0; i < Name.length(); i++) {
    text(upperCaseName.charAt(i), i * (width / columns), (height / rows));
  }
  textSize(33);
  text(studentNumber, -15, (height/rows)*rows);
}
