// color c2 = color(13,139,217);
// color c3 = color(13,139,217);
// color c4 = color(189,227,242);
float goldenRatio = 1.61803398875;


int c1 = #0D8BD9;
int c2 = #41C0F2;
int c3 = #77CFF2;
int c4 = #BDE3F2;

// in case i want rgbs
int c1Red = 13;
int c1Green = 139;
int c1Blue = 217;

int c2Red = 65;
int c2Green = 192;
int c2Blue = 242;

int c3Red = 119;
int c3Green = 207;
int c3Blue = 242;

int c4Red = 189;
int c4Green = 227;
int c4Blue = 242;

int r;
void setup() {
    // int fibNum_17 = 987;
    // int fibNum_16 = 610;
    size(1280,720);
    
    // noStroke();
    
    // size(1597,987);
}
void draw() {
    // translate(293 / 2,110 / 2);
    
    background(0);
    
    // Set fibonacci boxes / layout. starting from bottom left to facilitate portrait orientation. 
    
    int startingFibNum = 15;
    int numOfBoxes = 9;
    // below needs refactored
    int fibBoxSize = startingFibNum;
    
    translate(0,fibNum(startingFibNum));
    rotate(radians( -90));
    
    for (int count = 0; count < numOfBoxes;count++) {
        ellipseMode(CENTER);
        stroke(255);
        fill(c1);
        
        rect(0, 0,fibNum(startingFibNum),fibNum(startingFibNum));
        
        
        int translateTracker = fibNum(startingFibNum);
        int rotateTracker = 90;
        
        // drawSpirals(0,0,fibBoxSize - 2,5);
        
        // draw elements inside frames
        int elementSize = getElementSize(fibBoxSize,2); 
        int rowNum = 0;
        for (int yElementPosition = 0; yElementPosition <= fibNum(startingFibNum) - elementSize; yElementPosition += elementSize) {
            int elementNum = 0; 
            // print(elementSize);
            //print(fibNum(fibBoxSize));
            for (int xElementPosition = 0; xElementPosition <= fibNum(startingFibNum) - elementSize; xElementPosition += elementSize) {
                // ellipseMode(CORNER);
                // ellipse(xElementPosition, yElementPosition, elementSize, elementSize);
                // getEllipses(xElementPosition,yElementPosition,elementSize,3);
                drawSpirals(xElementPosition,yElementPosition,fibBoxSize - 2,5);
            }
            rowNum ++;
        }
            
            rotate(radians(90));
            translate(fibNum(startingFibNum), -fibNum(startingFibNum));
            
            startingFibNum --;
            fibBoxSize--;   
            noLoop();     
        }
        }
            
            // draw spirals
            
           void drawSpirals(int xElementPosition,int yElementPosition, int startingFibNum,int numOfRevolutions) {
                int translateTracker = 0;
                int rotateTracker = 0;
               int resetFib = startingFibNum;
                // translate(0,fibNum(startingFibNum));
                // rotate(radians( -90));
                // pushMatrix();
                
                // for (int count = 0; count < numOfRevolutions;count++) {
                    while(numOfRevolutions > 0) {
                        ellipseMode(CENTER);
                        
                        rect(xElementPosition, yElementPosition,fibNum(startingFibNum),fibNum(startingFibNum));
                        
                        rotate(radians(90));
                        translate(fibNum(startingFibNum), -fibNum(startingFibNum));
                        // arc(xElementPosition + fibNum(startingFibNum),yElementPosition + fibNum(startingFibNum),2 * fibNum(startingFibNum),2 * fibNum(startingFibNum),radians( - 90),radians(0));        
                       rotateTracker += 90;
                       translateTracker += fibNum(startingFibNum);
                        // println("sfn " + startingFibNum + "cnt" + numOfRevolutions);
                        startingFibNum --;
                        numOfRevolutions--;
                    }
                       translateTracker += fibNum(startingFibNum);
                
                // popMatrix();
                        // resets translate
                        translate( - fibNum(resetFib) - fibNum(resetFib - 4),fibNum(resetFib - 2));
                        
                        
                        // popMatrix();
                        // println(translateTracker);
                        
                        // translate( - fibNum(resetFib - 9),fibNum(resetFib - 2));
                        // translate( - fibNum(resetFib - 4),fibNum(resetFib - 2));
                        
                        
                        // translate( - fibNum(resetFib),fibNum(resetFib));
                        // translate( - fibNum(resetFib - 1),fibNum(resetFib - 1));
                        
                        // translate( - fibNum(resetFib - 1),fibNum(resetFib - 1));
                        // translate( - fibNum(resetFib - 2),fibNum(resetFib - 2));
                        
                        // translate(0,fibNum(resetFib));
                        // translate(0,fibNum(resetFib - 1));
                        
                        // translate( -fibNum(resetFib),fibNum(resetFib));
                       // for (int i = 0; i < 7;i++) {
                         //     translate( -fibNum(resetFib),fibNum(resetFib));
                         //     // translate(-fibNum(resetFib-1)-fibNum(resetFib),fibNum(resetFib) + fibNum(resetFib-1));
                        //     // translate( -fibNum(resetFib-1)-fibNum(resetFib-2), fibNum(resetFib-1)+fibNum(resetFib-2)); 
                         //     println(resetFib);
                         //     resetFib--;
                        // }
                            //  translate( - fibNum(resetFib - 1) - fibNum(resetFib),fibNum(resetFib) + fibNum(resetFib - 1));
                            
                            // println(rotateTracker);
                            // rotate(radians(90));
                            // translate( - fibNum(startingFibNum) - fibNum(startingFibNum - 1), fibNum(startingFibNum) + fibNum(startingFibNum - 1)); // this works for one box in each box, for first two big boxes
                            // translate( - translateTracker, translateTracker);
                            // rotate(radians( -rotateTracker));
                            
                        }
                            
                           // get element size from fibindex
                            
                            int getElementSize(int boxSize,float boxSizeDivisor) {
                                int elementSize = int(fibNum(boxSize) / boxSizeDivisor);
                            if (elementSize <= fibNum(1)) {
                                    return fibNum(1);
                            } else {
                                    return elementSize;
                                }
                                }
                                    
                                    
                                    
                               int getRandomColor() {
                                        int r = int(random(3));
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
                                                return randomColor;
                                            }
                                                
                                                // Ellipse Element
                                                
                                              void getEllipses(int xElementPosition, int yElementPosition, int elementSize,int numOfInnerCircles) {
                                                   // If the element falls within a diagonal line of each fibonacci frame, set fill to lightest color
                                                    int i = 1;
                                                while(i <= numOfInnerCircles) {
                                                        // noStroke(); 
                                                        ellipseMode(CORNER);
                                                     if (xElementPosition ==  yElementPosition || xElementPosition ==  yElementPosition + elementSize || xElementPosition ==  yElementPosition - elementSize) {
                                                      fill(c4);         
                                                } else {    
                                                     fill(getRandomColor());        
                                                        }
                                                            
                                                       if (i == 1) {
                                                                ellipse(xElementPosition, yElementPosition, elementSize,elementSize);
                                                        } else {
                                                              ellipse(xElementPosition + elementSize / 2, yElementPosition + elementSize / 2,(elementSize / 1.61) / 1.61,(elementSize / 1.61) / 1.61);
                                                               // ellipse(xElementPosition + elementSize * 1.6, yElementPosition + elementSize * goldenRatio, elementSize / (goldenRatio / 2 * i), elementSize / (goldenRatio / 2 * i));
                                                            }
                                                                i++;
                                                                numOfInnerCircles--;
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
                                                                                        
                                                                                   //      ellipse(xSquarePosition, rowPosition, elementSize, elementSize);
                                                                                        // fill(getRandomColor());
                                                                                       // ellipse(xSquarePosition + elementSize / 3, rowPosition + elementSize / 3, elementSize / 1.61, elementSize / 1.61);
                                                                                        // fill(getRandomColor());
                                                                                       // ellipse(xSquarePosition + elementSize / 2, rowPosition + elementSize / 2,(elementSize / 1.61) / 1.61,(elementSize / 1.61) / 1.61);
                                                                                      //  ellipse(xSquarePosition + elementSize / 3, rowPosition + elementSize / 3, elementSize / 1.61, elementSize / 1.61);
                                                                                        
                                                                                        
                                                                                        //Get randomColor rgb version
                                                                                        
                                                                                        
                                                                                    // int getRed() {
                                                                                       //  if (r == 0)
                                                                                    //  {
                                                                                        //  return c1Red;   
                                                                            //     } 
                                                                                   //  else if (r ==  1) {
                                                                                            //  return c2Red; 
                                                                                 //     }
                                                                                       //  else if (r ==  2) {
                                                                                                //  return c3Red;
                                                                                     //     }
                                                                                           // } 
                                                                                            // int getGreen() {
                                                                                               //  if (r == 0)
                                                                                         //  {return c1Green;   
                                                                                    //     } 
                                                                                           //  else if (r ==  1) {
                                                                                                //  return c2Green; 
                                                                                     //     }
                                                                                           //  else if (r ==  2) {
                                                                                                //  return c3Green;
                                                                                     //     }
                                                                                           // } 
                                                                                                
                                                                                           // int getBlue() {
                                                                                               //  if (r == 0)
                                                                                          //  {return c1Blue;   
                                                                                    //     } 
                                                                                           //  else if (r ==  1) {
                                                                                                //  return c2Blue; 
                                                                                     //     }
                                                                                           //  else if (r ==  2) {
                                                                                                //  return c3Blue;
                                                                                     //     }
                                                                                           // } 
                                                                                                
                                                                                                // rotate(radians(90));
                                                                                               // translate(fibNum(14), -fibNum(14));
                                                                                                // rect(0, 0,fibNum(13),fibNum(13));
                                                                                                // rect(0,0,50,50);
                                                                                                
                                                                                                // rotate(radians(90));
                                                                                               // translate(fibNum(13), -fibNum(13));
                                                                                                // rect(0, 0,fibNum(12),fibNum(12));
                                                                                                // rect(0,0,50,50);
                                                                                                
                                                                                                // rotate(radians(90));
                                                                                               // translate(fibNum(12), -fibNum(12));
                                                                                                // rect(0, 0,fibNum(11),fibNum(11));
                                                                                                
                                                                                                // rotate(radians(90));
                                                                                               // translate(fibNum(11), -fibNum(11));
                                                                                                // rect(0, 0,fibNum(10),fibNum(10));
                                                                                                
                                                                                                //  rotate(radians(90));
                                                                                               // translate(fibNum(10), -fibNum(10));
                                                                                                // rect(0, 0,fibNum(9),fibNum(9));
                                                                                                
                                                                                               // //arc attempts
                                                                                                //  rect(0, 0,fibNum(15), fibNum(15));
                                                                                            //  translate(fibNum(15) / 2 + 50,fibNum(15) / 2 + 50);
                                                                                                //  rotate(radians( -45));
                                                                                               //  arc(0,0,sqrt(sq(fibNum(15)) + sq(fibNum(15))) + 120,300,radians( -180),radians( -20));
                                                                                                //  rotate(radians(45));
                                                                                           //  translate( -fibNum(15) / 2 - 50, -fibNum(15) / 2 - 50);
                                                                                                
                                                                                               //  rect(fibNum(15), 0,fibNum(14) , fibNum(14));
                                                                                              //  translate(fibNum(15) + fibNum(14) / 2,fibNum(14) / 2);
                                                                                                //  rotate(radians(45));
                                                                                                //  arc(0,0,sqrt(sq(fibNum(14)) + sq(fibNum(14))),100,radians( -160),radians(0));
                                                                                                //  rotate(radians( -45));
                                                                                               //  translate( -(fibNum(15) + fibNum(14) / 2), -(fibNum(14) / 2));
                                                                                                // //straight forward boxes
                                                                                              //  rect(width - fibNum(13), height - fibNum(13),fibNum(13) , fibNum(13));
                                                                                              //  rect(width - fibNum(14), height - fibNum(12),fibNum(12) , fibNum(12));
                                                                                              //  rect(width - fibNum(14), height - fibNum(13),fibNum(11) , fibNum(11));
                                                                                                //  rect(fibNum(15) + fibNum(11), height - fibNum(13),fibNum(10) , fibNum(10));
                                                                                              //  rect(width - fibNum(13) - fibNum(9),fibNum(14) + fibNum(10),fibNum(9) , fibNum(9));
                                                                                              //  rect(fibNum(15) + fibNum(11), height - fibNum(12) - fibNum(8),fibNum(8) , fibNum(8));
                                                                                              //  rect(fibNum(15) + fibNum(11), height - fibNum(12) - fibNum(9),fibNum(7) , fibNum(7));
                                                                                             //  rect(width - fibNum(13) - fibNum(9) - fibNum(6), height - fibNum(12) - fibNum(9),fibNum(6) ,fibNum(6));
                                                                                                
                                                                                                
                                                                                                // noFill();
                                                                                              // translate(377 / 2,610 / 2);
                                                                                                // rotate(radians( -58));
                                                                                                
                                                                                                // attempt at arc with corners mode
                                                                                                // ellipseMode(CORNERS);
                                                                                               // ellipse(100, 100, 200, 200);
                                                                                               // arc(0,height, fibNum(15) ,0, radians(0), radians(180));
                                                                                                
                                                                                                
                                                                                                
                                                                                                // attempt at finding a pattern for a loop  
                                                                                                    // rect(xStart, yStart, fibNum(8) , fibNum(8));
                                                                                             // rect(xStart + fibNum(8), yStart - fibNum(7),fibNum(9) , fibNum(9));
                                                                                             // rect(xStart, yStart - fibNum(7) - fibNum(10),fibNum(10) , fibNum(10));
                                                                                              // rect(xStart - fibNum(11), yStart - fibNum(7) - fibNum(10),fibNum(11) , fibNum(11));
                                                                                             // rect(xStart - fibNum(11), yStart + fibNum(8),fibNum(12) , fibNum(12));
                                                                                              // rect(xStart + fibNum(10), yStart - fibNum(7) - fibNum(10),fibNum(13) , fibNum(13));
                                                                                                
                                                                                                
                                                                                                
                                                                                                // line(fibNum(15), 0, fibNum(15), fibNum(16));
                                                                                                // line(fibNum(15), fibNum(14), fibNum(16), fibNum(14));
                                                                                                // line(fibNum(15), fibNum(14), fibNum(16), fibNum(14));
                                                                                                // line(width - fibNum(13),height - fibNum(14),
                                                                                                }
                                                                                                    