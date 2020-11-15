// Class: CS 3451
// Semester: Fall 2020
// Project number: 1
// Project title: Playing with Points and Vectors
// Student(s): Kaushi Chandraratna, Alexander Goebel, Philip Huyhn

//======================= My global variables
PImage PictureOfMyFace; // picture of author's face, should be: data/pic.jpg in sketch folder
PImage PictureOfBanner; // picture of banner, should be: data/pic.jpg in sketch folder

boolean lerp=true, spiral=true; // toggles to display vector interpoations
float b=0, c=0.5, d=1; // initial knots
int partShown = 0;
//String [] PartTitle = new String[10];
String [] PartTitle = {"?","?","?","?","?","?","?","?","?","?"};


int numberOfParts = PartTitle.length;
PNTS DrawnPoints = new PNTS(); // class containing array of points, used to standardize GUI
PNTS SmoothenedPoints = new PNTS(); // class containing array of points, used to standardize GUI
DUCKS DucksRow = new DUCKS(20);

//**************************** My text  ****************************
String title ="Class: 3451, Year: 2020, Project 1",            
       name ="Kaushi CHANDRARATNA";
String subtitle = "points and vectors";    
String guide="MyProject keys: '0' through '9' to select project parts, 'a' to start/stop animation "; // help info

//======================= my setup, executed once at the beginning 
void mySetup()
  {
  DrawnPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  SmoothenedPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  DrawnPoints.empty(); // reset pont list P
  SmoothenedPoints.empty(); // reset pont list P
  //initDucklings(); // creates Ducling[] points
  }

//======================= called in main() and executed at each frame to redraw the canvas
void showMyProject(PNT A, PNT B, PNT C, PNT D) // four points used to define 3 vectors
  {
  if(0<=partShown && partShown<numberOfParts)
    {
    switch(partShown) 
      {
      case 0: showPart0(A,B,C,D); break;
      case 1: showPart1(A,B,C,D); break;
      case 2: showPart2(A,B,C,D); break;
      case 3: showPart3(A,B,C,D); break;
      case 4: showPart4(A,B,C,D); break;
      case 5: showPart5(A,B,C,D); break;
      case 6: showPart6(A,B,C,D); break;
      case 7: showPart7(A,B,C,D); break;
      case 8: showPart8(A,B,C,D); break;
      case 9: showPart9(A,B,C,D); break;
      }
    }
  }

//====================================================================== PART 0
void showPart0(PNT A, PNT B, PNT C, PNT D) //
  {
  PartTitle[0] = "Experimenting sandbox";
  //cwf(red,4,green); 
  //VCT V = V(A,B);
  //show(A,V,dgreen,"V");
  //VCT R = R(V);
  //show(A,R,blue,"R(V)");
  //VCT W = R(V,PI/6);
  //show(A,W,dred,"R(V,π/6)");
  
  //VCT U = V(A,B);
  //VCT V = V(A,C);
  //show(A,U,dgreen,"U");
  //float w = angle(U,V);
  //float m = n(V)/n(U);
  //show(A,V,dred,"V("+nf(m,1,2)+",R(U,"+nf(w/PI,1,2)+"*PI))");
  //VCT W = V(m,R(U,w));
  //show(A,V,blue);
 
  //guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

//====================================================================== PART 1
boolean showX=true, showY=false, showZ = false;
void showPart1(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[1] =   "X,Y,Z Completions of the Parellogram "; // https://en.wikipedia.org/wiki/Parallelogram
  }

//====================================================================== PART 2
boolean showFermat=false;
void showPart2(PNT A, PNT B, PNT C, PNT D) //   
  {
  PartTitle[2] = "Napoleon Theorem & Fermat Point"; // https://en.wikipedia.org/wiki/Napoleon%27s_theorem
  }


//====================================================================== PART 3
int branches = 8;
boolean showAB=true, showBC=false, showAC = false;
void showPart3(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[3] = "Fractal Tree"; 
  float leftAngle = angle(V(A,B),V(A,C));
  float rightAngle = angle(V(B,C),V(B,A));
  float leftAngle2 = angle(V(A,C), V(A,B));
  float rightAngle2 = angle(V(C,B), V(C,A));
  triangleTree(A,B,C,leftAngle, rightAngle, leftAngle2, rightAngle2,10,branches);
  triangleTree(B,C,A,leftAngle, rightAngle, leftAngle2, rightAngle2,200,branches);
  triangleTree(C,A,B,leftAngle, rightAngle,leftAngle2, rightAngle2,100,branches);
  triangleTree(A,C,B,leftAngle, rightAngle, leftAngle2, rightAngle2,200,branches);
  triangleTree(C,B,A,leftAngle, rightAngle, leftAngle2, rightAngle2,10,branches);
  triangleTree(B,A,C,leftAngle, rightAngle,leftAngle2, rightAngle2,100,branches);
  guide="j/k/l:show/hide solutions, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C");
}
void triangleTree(PNT A, PNT B, PNT C, float leftAngle, float rightAngle, float leftAngle2, float rightAngle2,int c,  int branches)
  {
  if (branches==0)
    {
      return;
    }
    PNT leftBranch, rightBranch, centerBranch;
    if(det(V(A,B),V(A,C)) > 0)
      {
      leftBranch = P(B,V(0.5,V(A,B)).rotateBy(-leftAngle));
      rightBranch = P(B,V(0.5,V(A,B)).rotateBy(rightAngle));
      centerBranch = P(B, V(0.5,V(A,B)).rotateBy((-leftAngle + rightAngle)/3));
      } else
      {
      leftBranch = P(B,V(0.5,V(A,B)).rotateBy(leftAngle2));
      rightBranch = P(B,V(0.5,V(A,B)).rotateBy(-rightAngle2));
      centerBranch = P(B, V(0.5,V(A,B)).rotateBy((leftAngle2 + (-rightAngle2))/3));
      }
  
    color c1 =c;
    stroke(c1,60,150);
    strokeWeight((branches*5)*0.3); //alter strokeweight of each branch
    if (showAB){
      show(A,B);
    } 
    if (showBC){
      show(B,C);
    }
    if (showAC){
      show(A,C);
    }
    triangleTree(B,leftBranch,centerBranch, leftAngle, rightAngle, leftAngle2, rightAngle2, c + 20, branches-1); //left branch
    triangleTree(B,rightBranch,centerBranch, leftAngle, rightAngle, leftAngle2, rightAngle2, c + 20, branches-1); //right branch
    triangleTree(B,centerBranch,centerBranch, leftAngle, rightAngle, leftAngle2, rightAngle2,c + 20, branches-1); //left branch
    
  }
  
//====================================================================== PART 4
void showPart4(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[4] =   "Log-spiral pattern"; // https://pin.it/7wgYDeq 
  cwF(red,3); show(A,B,C);
  cwF(blue,3);
  drawSpiral(A,B,C,60);
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");

  }
    
void drawSpiral(PNT A, PNT B, PNT C, int recursionCount)
  {
  if(recursionCount==0) return;
  PNT D = extrapolateLogSpiral(A,B,C);

 
  }
PNT extrapolateLogSpiral(PNT A, PNT B, PNT C)
  {
  VCT AB = V(A,B);
  VCT BC = V(B,C);
  
  return P(   );
  }

//====================================================================== PART 5
void showPart5(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[5] =   "Michell truss";
  int k=11, r=11;
  PNT[][] T = new PNT[r][k];
  PNT O = ScreenCenter();
  VCT V = V(O,A);
  for(int i=0; i<k; i++) T[0][i]=P(O,R(V,TWO_PI*i/k));
  cw(green,2);
  
  
  // six lines of code
  
  
 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
  
//====================================================================== PART 6
int recursionDepth=9;  
void showPart6(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[6] =   "Recursive tree growth";
  PNT E = P(A,V(B,C));
  if(showIDs)
    {
    E.circledLabel("E");
    A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
    }
  guide="I:display IDs, ,/.:recursion depth";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

  
  
//====================================================================== PART 7
void showPart7(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[7] =   "Cubic interpolating motion";
  cwF(cyan,5); show(A,B,C,D);
  cwF(red,3); drawNeville(A,B,C,D);
 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
void drawNeville(PNT A, PNT B, PNT C, PNT D)
  {
  beginShape();
  
  
  endShape();
  }

  
//====================================================================== PART 8
void showPart8(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[8] =   "Polyline smoothing";
  cwF(black,3); ControlPoints.drawPolyline(); // draws polyline joining control points
  ControlPoints.drawAllVerticesInColor(3,red); // draw dots at vertices
  //if(showIDs) {cwF(blue,1); ControlPoints.writeIDsInEmptyDisks(); }
  if(showIDs) showArrowIDs();
  cwF(red,1); ControlPoints.showPickedPoint(25);
  int n = ControlPoints.pointCount();
  if(keyPressed && key=='f' && n>4)
    {
 
    }
  guide="f:iterate smoothing, I:show/hide IDs";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
    
//====================================================================== PART 9
void showPart9(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[9] =   "Smoothing while I draw";
  guide="Place. Press RMB to erase&start. Hold LMB & drag. Wait till all ducks arrive. Release.";
  PNT SmoothP = DucksRow.move(Mouse());
  if(mousePressed && (mouseButton == RIGHT))
    {
    DrawnPoints.empty(); 
    SmoothenedPoints.empty(); 
    DucksRow.init(Mouse());
    }
  if(mousePressed && (mouseButton == LEFT))
    {
    DrawnPoints.addPoint(Mouse()); 
    SmoothenedPoints.addPoint(SmoothP); 
    }
  cwF(orange,3); DrawnPoints.drawCurve();
  cwF(blue,5); SmoothenedPoints.drawCurve(); 
  DucksRow.showRow();
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
  
  


    
//======================= called when a key is pressed
void myKeyPressed()
  {
  //int k = int(key); if(47<k && k<58) partShown=int(key)-48;
  if(key=='<') {DucksRow.decrementCount(); }
  if(key=='>') {DucksRow.incrementCount(); }
  }
  
//======================= called when the mouse is dragged
void myMouseDragged()
  {
  if (keyPressed) 
    {
    //if (key=='b') b+=2.*float(mouseX-pmouseX)/width;  // adjust knot value b    
    //if (key=='c') c+=2.*float(mouseX-pmouseX)/width;  // adjust knot value c    
    //if (key=='d') d+=2.*float(mouseX-pmouseX)/width;  // adjust knot value a 
    }
  }

//======================= called when the mouse is pressed 
void myMousePressed()
  {
  if (!keyPressed) 
    {
    if(partShown==2 || partShown==3)
      {
      }
    }
  }
  
