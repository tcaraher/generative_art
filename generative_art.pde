String Name = "Tom Caraher";
String studentNumber = "20108883";

float goldenRatio = 1.61803398875;

// Green something
int c1 = #00261C;
int c2 = #044D29;
int c3 = #168039;
int c4 = #45BF55;
int c5 = #96ED89;


int c5Red = 150;
int c5Green = 237;
int c5Blue = 137;

// https://color.adobe.com/search?q=universe
// int c1 = #0D0D0D;
// int c2 = #2C3540;
// int c3 = #A65851;
// int c4 = #BF5841;
// int c5 = #D98D62;


// int c5Red = 191;
// int c5Green = 88;
// int c5Blue = 65;

// https://color.adobe.com/search?q=sky
// int c1 = #0D8BD9;
// int c2 = #0FB2F2;
// int c3 = #41C0F2;
// int c4 = #77CFF2;
// int c5 = #BDE3F2;


// int c1Red = 13;
// int c1Green = 139;
// int c1Blue = 217;

// int c2Red = 15;
// int c2Green = 178;
// int c2Blue = 242;

// int c3Red = 65;
// int c3Green = 192;
// int c3Blue = 242;

// int c4Red = 119;
// int c4Green = 207;
// int c4Blue = 242;

// int c5Red = 189;
// int c5Green = 227;
// int c5Blue = 242;

boolean spiralToggle = false;
int spiralVisible = 0; 
int fibNumVisibility = 20;

int elementSizesFromMouse = 10;

int startingFibNum = 15;
int numOfBoxes = 9;

int randomColorA = getRandomColor();
int randomColorB = getRandomColor();
int randomColorC = getRandomColor();
int randomColorD = getRandomColor();
int randomColorE = getRandomColor();
int randomColorF = getRandomColor();
int randomColorG = getRandomColor();
int randomColorH = getRandomColor();
int randomColorI = getRandomColor();

void setup() {
    size(1280,720);
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
    
    int longFibPosition = 0;
    fill(c5Red,c5Green,c5Blue,fibNumVisibility);
    textSize(32);
    textAlign(LEFT,CENTER);
    for (int fibStringRowNum = 0;fibStringRowNum < 9; fibStringRowNum ++) {
        for (int fibStringElementNum = 0;fibStringElementNum < 16; fibStringElementNum ++) {
            String fibString = String.valueOf(longFibNum(longFibPosition));
            // println(fibString);
            int maxCharNum = 5;
            if (fibString.length() >= maxCharNum) {
                int index = 0;
                int fibStringLength = fibString.length();
                
                String subFibString = fibString.substring(index,maxCharNum);
                text(subFibString,fibStringElementNum * 80,fibStringRowNum * 80,80,80);
                
                fibStringLength = fibString.length() - maxCharNum;
                
                while(fibStringLength > 0) {
                    index += maxCharNum;
                    
                    if (fibStringLength < maxCharNum) {
                        subFibString = fibString.substring(index);
                    } else {
                        subFibString = fibString.substring(index,index + maxCharNum);
                    }
                    
                    fibStringElementNum ++;
                    fibStringLength -= maxCharNum;
                    
                    text(subFibString,fibStringElementNum * 80,fibStringRowNum * 80,80,80);
                }
            } else  {
                text(fibString,fibStringElementNum * 80,fibStringRowNum * 80,80,80);
            }
            longFibPosition++;
        }
    }
    
    translate((width - fibNum(16)) / 2,(height - fibNum(15)) / 2 + 40);
    int spiralFib = 15;
    int numOfArcs = 9;
    
    int startingFibNum = 15;
    int numOfBoxes = 9;
    // Set fibonacci boxes / layout. starting from bottom left to facilitate portrait orientation, hence the below translate 
    
    translate(0,fibNum(spiralFib));
    rotate(radians( -90));
    
    for (int count = 0; count < numOfBoxes;count++) {
    
        fill(c1);        
        stroke(c3);
    
        int elementSize = getElementSize(startingFibNum,8);
    
        int rowNum = 0;
        for (int yElementPosition = 0; yElementPosition <= fibNum(startingFibNum) - elementSize; yElementPosition += elementSize) {
            int elementNum = 0; 
            // print(elementSize);
            //print(fibNum(fibBoxSize));
            for (int xElementPosition = 0; xElementPosition <= fibNum(startingFibNum) - elementSize; xElementPosition += elementSize) {
                // ellipseMode(CORNER);
                // ellipse(xElementPosition, yElementPosition, elementSize, elementSize);
                getEllipses(xElementPosition,yElementPosition,elementSize,rowNum,elementNum,4);
                elementNum ++;
    
                }
            rowNum ++;
            }
    
        ellipseMode(CENTER);
        noFill();
        stroke(c5Red,c5Green,c5Blue,spiralVisible);
        strokeWeight(5);
        rect(0, 0,fibNum(startingFibNum),fibNum(startingFibNum));
        strokeWeight(10);
        arc(0,fibNum(spiralFib),2 * fibNum(spiralFib),2 * fibNum(spiralFib),radians( -90),radians(0));
        rotate(radians(90));
        translate(fibNum(startingFibNum), -fibNum(startingFibNum));
    
        startingFibNum --;
        spiralFib--;        
        }
        
        translate(-840,-570);
        fill(255);
        textSize(36);
        textAlign(LEFT,CENTER);
        String upperCaseName = Name.toUpperCase();
        for (int i = 0; i< Name.length(); i++) {
            text(upperCaseName.charAt(i), i * (width / 16), (height / 9));
        }
        textSize(33);
        text(studentNumber,-15,80*9);
}

// get element size from fibindex

int getElementSize(int boxSize,float boxSizeDivisor) {
    int elementSize = int(fibNum(boxSize) / boxSizeDivisor);
    if (elementSize <= fibNum(2)) {
        return fibNum(2);
    } 
    else {
        return elementSize;
    }
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
        spiralToggle = true;
        spiralVisible = 1000;
        stroke(c1);
    } else {
        spiralToggle = false;
        spiralVisible = 0;
    }
} 

void mouseWheel(MouseEvent event) {
  float upOrDown = event.getCount();
    // if (fibNumVisibility > 10 && fibNumVisibility < 100){
        fibNumVisibility += upOrDown;
    // } 
//     if (upOrDown == -1) {
//     if (fibNumVisibility <=0) {
//         fibNumVisibility -= 1; 
//     }v
//     // return;
//   }
//   if (upOrDown == 0) {
//     if (fibNumVisibility <=100) {
//         fibNumVisibility += 1; 
//     }
    // return;
//   }

//   fibNumVisibility = int(amountMoved);
  println(fibNumVisibility);
}

// void mouseDragged() {
//     fibNumVisibility=mouseY/100;
//   println(fibNumVisibility);
// }
int getRandomColor() {
    int r = int(random(4));
    // print(r);
    int randomColor = 0;
    if (r == 0)
        {randomColor = c1;   
    } 
    else if (r ==  1) {
        randomColor = c2; 
    }
    else if (r ==  2) {
        randomColor = c3;
    }
    else if (r == 3) {
        randomColor = c4;
    }
    return randomColor;
}

// Ellipse Element

void getEllipses(int xElementPosition, int yElementPosition, int elementSize,int rowNum, int elementNum, int numOfInnerCircles) {
    // If the element falls within a diagonal line of each fibonacci frame, set fill to lightest color
    
    if (xElementPosition ==  yElementPosition + elementSize * 3 || xElementPosition ==  yElementPosition + elementSize * 4) {
        // draw ellipses that are in rough position of the fib spiral, passing static colurs in.
        drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,c4,c2,c3);
    } 
    // Select colour scheme for elements, based off a number of aesthetically pleasing conditions
    else {
        if (rowNum % 2 ==  0) {  
            if (elementNum % 3 ==  0) {
                drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,randomColorA,randomColorB,randomColorC);
            } else if (elementNum % 2 == 0) {
                drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,randomColorD,randomColorE,randomColorF);
            } else {
                drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,randomColorG,randomColorH,randomColorI);
            }
        }
        else if (rowNum % 3 ==  0) {
            if (elementNum % 3 ==  0) {
                drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,randomColorB,randomColorC,randomColorD);
            } else if (elementNum % 2 == 0) {
                drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,randomColorE,randomColorF,randomColorG);
            } else {
                drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,randomColorH,randomColorI,randomColorA);
            }
        } else {
            if (elementNum % 3 ==  0) {
                drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,randomColorC,randomColorF,randomColorI);
            } else if (elementNum % 2 == 0) {
                drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,randomColorB,randomColorE,randomColorH);
            } else {
                drawEllipses(xElementPosition,yElementPosition,elementSize,numOfInnerCircles,randomColorA,randomColorD,randomColorG);
            }
        }
        
    }  
}

void drawEllipses(float xElementPosition, float yElementPosition, float elementSize, int numOfInnerCircles, int circleColorA, int circleColorB , int circleColorC) {
    // Draw first ellipse
    ellipseMode(CORNER);
    float circleSize = elementSize / goldenRatio;
    float xCirclePosition = xElementPosition;
    float yCirclePosition = yElementPosition;
    
    int circleNumber = 1;
    while(circleNumber <= numOfInnerCircles) {
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
        ellipse(xElementPosition, yElementPosition, elementSize,elementSize);
        
        elementSize = elementSize / goldenRatio;
        xElementPosition = xElementPosition + elementSize / 2;
        yElementPosition = yElementPosition + elementSize / 2;
        
        circleNumber ++;
    }
}

// Get fibonacci number from provided index

int fibNum(int fibPosition) {
    if (fibPosition <= 1) {
        return fibPosition;
    }
    return fibonacciHelper(0,1,fibPosition - 1);
}

int fibonacciHelper(int prev, int current, int fibPosition) {
    if (fibPosition ==  0) {
        return current;
    }
    return fibonacciHelper(current, prev + current, fibPosition - 1);
} 




long longFibNum(int fibPosition) {
    if (fibPosition <= 1) {
        return fibPosition;
    }
    return longFibonacciHelper(0,1,fibPosition - 1);
}

long longFibonacciHelper(long prev, long current, long fibPosition) {
    if (fibPosition ==  0) {
        return current;
    }
    return longFibonacciHelper(current, prev + current, fibPosition - 1);
} 

// Set up grid in randomorientation

void setupGrid(int startingFibNum, int numOfBoxes) {
    noFill();
    stroke(255);
    // Initial Box
    translate(0,fibNum(startingFibNum));
    rotate(radians( -90));
    rect(0, 0,fibNum(startingFibNum), fibNum(startingFibNum));
    
    int fibRelativeXY = startingFibNum;
    int fibBoxSize = fibRelativeXY - 1;
    while(numOfBoxes > 0) {
        rotate(radians(90));
        translate(fibNum(fibRelativeXY), -fibNum(fibRelativeXY));
        rect(0, 0,fibNum(fibBoxSize),fibNum(fibBoxSize));
        fibRelativeXY--;
        fibBoxSize--;
        numOfBoxes--;
    }
    
    
}
