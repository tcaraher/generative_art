/*
This is a generative art piece entitled, "Pingala".

It is entirely based on the Fibonacci sequece and dedicated to Pingala,
who was the first to describe (in around 200 BC) what is now known as 
the Fibonacci sequence,which was named after Leonardo of Pisa (Fibonacci).
Every grid,layout and element is devised by or directly related to the sequence in some way.
*/

String Name = "Tom Caraher";
String studentNumber = "20108883";

String Title = "Pingala";
String fibonacciNumbers = "0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765 10946 17711 28657 46368 75025 121393 196418 317811 514229 832040 1346269 2178309 3524578 5702887 9227465 14930352 24157817 39088169 63245986 102334155 165580141 267914296 433494437 701408733 1134903170 1836311903 2971215073 4807526976 7778742049 12586269025 20365011074 32951280099 53316291173 86267571272 139583862445 225851433717 365435296162 591286729879 956722026041 1548008755920 2504730781961 4052739537881 6557470319842 10610209857723 17167680177565 27777890035288 44945570212853 72723460248141 117669030460994 190392490709135 308061521170129 498454011879264 806515533049393 1304969544928657 ";

// Constants
float goldenRatio = 1.61803398875;
int rows = 9;
int columns = 16;

// Colors
// https://color.adobe.com/s://adobe.ly/2ynad3s
int c1 = color(70,137,102);
int c2 = color(142,40,0);
int c3 = color(182,73,38);
int c4 = color(255,176,59);
int c5 = color(255,240,165);
color invisible = color(255,240,165,0);

// For use with opacity changes on spiral and numbers, both controlled with different variables via mouse
int c5Red = 255;
int c5Green = 240;
int c5Blue = 165;



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
        // Draw each ellipse/inner ellipses. Check first which fib box we're on, and draw less ellipses
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
  translate(835, 580);
  rotate(radians(180));
  // Calls custom method to display my id information - name and student number
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
    save(Title + ".PNG");
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
  int upOrDown = event.getCount();
  fibNumVisibility += upOrDown;
}

/*
 Write fibonacci numbers as part of backing grid.
 Each number overflows into the next cell as it grows.
 Uses a hard coded string unfortunately, due to project constraints regarding casting. 
 */

void drawFibonacciNumberGrid() {
  fill(c5Red, c5Green, c5Blue, fibNumVisibility);
  textSize(31);
  textAlign(LEFT, CENTER);
  String newFibNumbers = fibonacciNumbers;

  // Iterate over 16:9 grid, putting a fib number in each.
  // When the number grows too large for font size, split it and place in next cell
  for (int fibStringRowNum = 0; fibStringRowNum < rows; fibStringRowNum ++) {
    for (int fibStringElementNum = 0; fibStringElementNum < columns; fibStringElementNum ++) {
      int maxCharNum = 5;
      // Iterates over the string of fibonacci numbers to find the spaces separating each number and updating to the new string.
      int fibonacciSpaceIndex = newFibNumbers.indexOf(" ");
      String fibonacciSplit = newFibNumbers.substring(0,fibonacciSpaceIndex);
      newFibNumbers = newFibNumbers.substring(fibonacciSpaceIndex+1);
      // Checks for fib number(in string format) above the max char amount for my chosen font size(5) - hard coded unfortunately
      if (fibonacciSplit.length() >= maxCharNum) {
        int index = 0;
        int fibStringLength = fibonacciSplit.length();

        // Splits and draws first part of number
        String subFibString = fibonacciSplit.substring(index, maxCharNum);
        text(subFibString, fibStringElementNum * (width/columns) , fibStringRowNum * (height/rows), (width/columns), (height/rows));

        fibStringLength = fibonacciSplit.length() - maxCharNum;

        // for rest of the number, iterate and draw the new strings
        while (fibStringLength > 0) {
          index += maxCharNum;

          // Checks if we're on the last part of the string, and applies correct .substring param, or continues
          if (fibStringLength < maxCharNum) {
            subFibString = fibonacciSplit.substring(index);
          } else {
            subFibString = fibonacciSplit.substring(index, index + maxCharNum);
          }

          fibStringElementNum ++;
          fibStringLength -= maxCharNum;

          text(subFibString, fibStringElementNum * (width/columns) , fibStringRowNum * (height/rows), (width/columns), (height/rows));
        }
      } else {
        text(fibonacciSplit, fibStringElementNum * (width/columns) , fibStringRowNum * (height/rows), (width/columns), (height/rows));
      }

    }
  }
}

// Gets a random color from my palette defined with global variables, Only want first 4, not 5 colors, as I have another application for the 5th color
int getRandomColor() {
  int r = int(random(5));
  int randomColor = 0;
  if (r == 0)
  {
    randomColor = c2;
  } else if (r ==  1) {
    randomColor = c3;
  } else if (r ==  2) {
    randomColor = c4;
  } else {
    randomColor = invisible;
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
Drawing the actual ellipses and inner ellipses. Passes in the chosen color from setUpEllipses as colorA,B,C
 Instead of choosing to use the fibNum method here to determine ellipse sizes, I have chosen another approach
 using the golden ratio, which is the resulting ratio average from the fibonacci sequence.
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

// Displays name and student number
void displayInfo() {
  fill(255);
  textSize(50);
  textAlign(LEFT, CENTER);
  String upperCaseName = Name.toUpperCase();
  for (int i = 0; i < Name.length(); i++) {
    text(upperCaseName.charAt(i), i * (width / columns), (height / rows));
  }
  textSize(36);
  text(studentNumber, -23, (height/rows)*rows+23);
}