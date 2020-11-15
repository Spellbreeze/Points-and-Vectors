// Class: CS 3451 
// Semester: Fall 2020
// Project number: 01
// Project title: Playing with points and vectors
// Student(s): Alexander Goebel
import java.util.Collections;
//======================= My global variables
PImage PictureOfMyFace; // picture of author's face, should be: data/pic.jpg in sketch folder
PImage PictureOfBanner; // picture of banner, should be: data/pic.jpg in sketch folder

boolean lerp=true, spiral=true; // toggles to display vector interpoations
float b=0, c=0.5, d=1; // initial knots
int partShown = 3;
//String [] PartTitle = new String[10];
String [] PartTitle = {"?","?","?","?","?","?","?","?","?","?"};


int numberOfParts = PartTitle.length;
PNTS DrawnPoints = new PNTS(); // class containing array of points, used to standardize GUI
PNTS SmoothenedPoints = new PNTS(); // class containing array of points, used to standardize GUI
DUCKS DucksRow = new DUCKS(20);

//**************************** My text  ****************************
String title ="Class: 3451, Year: 2020, Project 01",            
       name ="Student: Alexander GOEBEL";
String subtitle = "Playing with points and vectors";    
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
 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

//====================================================================== PART 1
boolean showJ=false, showK=false, showL=false, showQ=false;
void showPart1(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[1] =   "Complete the parallelogram"; // https://en.wikipedia.org/wiki/Parallelogram
   
  VCT AB = V(A,B);
  if (showQ) { //Show singular, solid parallelogram if 'q' pressed
    PNT J = P(C,V(A,B)); // obtain point D from C + AB
    cwfo(dgold,5,gold,100); showLoop(A, B, J, C); //show solid parallelogram with dgold border and gold fill
    show(C,V(A,B),red,"C+AB"); show(B,V(A,C),blue,"B+AC"); //show two methods that could be used to obtain this solution
    circledLabel(J,"D"); // label point D
  } else {cwfo(dblue,5,blue,70); showLoop(A, B, C);} // show given triangle {A,B,C} with dblue border and blue fill
  if (showJ) {PNT J = P(C,V(A,B)); cwfo(dred,5,pink,70); showLoop(B, C, J); J.circledLabel("C+AB");} //Show parallelogram for Point D from C + AB
  if (showK) {PNT K = P(C,V(B,A)); cwfo(dgreen,5,green,70); showLoop(A, C, K); K.circledLabel("C+BA");} //Show parallelogram for Point D from C - AB
  if (showL) {PNT L = P(B,V(C,A)); cwfo(dmetal,5,metal,70); showLoop(A, B, L); L.circledLabel("B+CA");} // Show  Point D from B - CA
  
 
  guide="Part 1 keys: (j/k/l/q) to show/hide solutions";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C");
  }

//====================================================================== PART 2
void showPart2(PNT A, PNT B, PNT C, PNT D) //   
  {
  PartTitle[2] = "Napoleon theorem"; // https://en.wikipedia.org/wiki/Napoleon%27s_theorem
  cwf(black,3,yellow);  showLoop(A,B,C);  

  
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); // D.circledLabel("D");
  }


//====================================================================== PART 3
void showPart3(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[3] = "Fermat point"; // https://en.wikipedia.org/wiki/Fermat_point

  cwfo(dmetal,4,metal,70); showLoop(A,B,C); //Draw triangle from given points with dark metal border and metal fill
  
  VCT AB = V(A,B); VCT AC = V(A,C); VCT BC = V(B,C); //Edges of the original triangle
  PNT ABV = (angle(AC,AB) > 0) ? P(B,R(AB,2*PI/3.0)) : P(A,R(AB,5*PI/3.0)); //obtains third vertex of AB edge
  PNT ACV = (angle(AC,AB) > 0) ? P(A,R(AC,5*PI/3.0)) : P(C,R(AC,2*PI/3.0)); //obtains third vertex of AC edge
  PNT BCV = (angle(AB,AC) > 0) ? P(B,R(BC,5*PI/3.0)) : P(C,R(BC,2*PI/3.0)); //obtains third vertex of BC edge
  
  cwfo(dred,4,pink,70); //Border dark red, fill pink
  showLoop(A,ABV,B); showLoop(A,ACV,C); showLoop(B,BCV,C); //Draw outer equilateral triangles using above coloring
  if (angle(AB,AC) > 2*PI/3 || angle(AB,AC) < -2*PI/3)  //Detects if angle between AB and AC is greater than 120
    {
      cwf(black,3,black); 
      show(ABV,A); show(ACV,A); show(BCV,A); //Draw black lines from outer vertices to obtuse angle (C)
      
      B.circledLabel("B"); C.circledLabel("C"); A.circledLabel("FP"); //FP for Fermat Point
    }
  else if (angle(V(B,A),V(B,C)) > 2*PI/3 || angle(V(B,A),V(B,C)) < -2*PI/3) //Detects if angle between BA and BC is greater than 120
    {
      cwf(black,3,black);
      show(ABV,B); show(ACV,B); show(BCV,B); //Draw black lines from outer vertices to obtuse angle (B)
      
      A.circledLabel("A"); C.circledLabel("C"); B.circledLabel("FP"); //FP for Fermat Point
    }
  else if (angle(V(C,A),V(C,B)) > 2*PI/3 || angle(V(C,A),V(C,B)) < -2*PI/3) //Detects if angle between CA and CB is greater than 120
    {
      cwf(black,3,black);
      show(ABV,C); show(ACV,C); show(BCV,C); //Draw black lines from outer vertices to obtuse angle (C)
      
      A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("FP"); //FP for Fermat Point
    }
  else
    {
      cwf(black,3,black);
      show(ABV,C); show(ACV,B); show(BCV,A); //Draw lines from outer vertices to inner angles
      
      /*PNT FP = P(((ABV.x*C.y-ABV.y*C.x)*(A.x-BCV.x)-(ABV.x-C.x)*(A.x*BCV.y-A.y*BCV.x))/((ABV.x-C.x)*(A.y-BCV.y)-(ABV.y-C.y)*(A.x-BCV.x)),
        ((ABV.x*C.y-ABV.y*C.x)*(A.y-BCV.y)-(ABV.y-C.y)*(A.x*BCV.y-A.y*BCV.x))/((ABV.x-C.x)*(A.y-BCV.y)-(ABV.y-C.y)*(A.x-BCV.x))); //https://en.wikipedia.org/wiki/Line%E2%80%93line_intersection#Given_two_points_on_each_line
      FP.circledLabel("FP"); //FP for Fermat Point*/
      
      VCT QnP = V(BCV,ABV); //ABV-BCV
      VCT R = V(BCV,A); //Vector from BCV to A
      VCT S = V(ABV,C); //Vector from ABV to C
      double num = QnP.x*S.y-QnP.y*S.x; // (ABV-BCV) cross S
      double den = R.x*S.y-R.y*S.x; // R cross S
      float t = (float) num/ (float) den; //proportion of R from the equation p + tr
      VCT tR = V(t,R); //scaled R vector
      PNT FPalt = P(BCV,tR);//point at the end of scaled R vector from BCV (The Fermat Point)
      
      A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C");
      FPalt.circledLabel("FP");//https://stackoverflow.com/questions/563198/how-do-you-detect-where-two-line-segments-intersect
    }
  }
  
//====================================================================== PART 4
void showPart4(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[4] =   "Log-spiral pattern"; // https://pin.it/7wgYDeq 
  cwF(red,3); show(A,B,C);
  cwF(blue,3);
  drawSpiral(A,B,C,100);
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); //D.writeLabel("D");
  }
void drawSpiral(PNT A, PNT B, PNT C, int recursionCount)
  {
  if(recursionCount<=0) return;
  PNT D = extrapolateLogSpiral(A,B,C);
  show(C,D);
  drawSpiral(B,C,D,recursionCount - 1);
  }
PNT extrapolateLogSpiral(PNT A, PNT B, PNT C)
  {
  VCT AB = V(A,B);
  VCT BC = V(B,C);
  float angle = angle(AB,BC);
  float ratio = (n(AB) != 0) ? n(BC)/n(AB) : 1;
  return P(C, V(ratio,BC).rotateBy(angle));
  }

//====================================================================== PART 5
void showPart5(PNT A, PNT B, PNT C, PNT D) //    
  {
  /*PartTitle[5] =   "Michell truss";
  int k=11, r=11;
  PNT[][] T = new PNT[r][k];
  PNT O = ScreenCenter();
  VCT V = V(O,A);
  for(int i=0; i<k; i++) T[0][i]=P(O,R(V,TWO_PI*i/k));
  cw(green,2);*/
  
  
  // six lines of code
  
  part5helper(A,B,C,4);
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); //D.circledLabel("D");
  }
void part5helper(PNT A, PNT B, PNT C, int count)
  {
    if (count <= 0) return;
    PNT bAB, bAC, bBC;
    PNT eAB, eAC, eBC;
    bAB = P(A,V(1.0/3.0,V(A,B))); eAB = P(A,V(2.0/3.0,V(A,B)));
    bAC = P(A,V(1.0/3.0,V(A,C))); eAC = P(A,V(2.0/3.0,V(A,C)));
    bBC = P(B,V(1.0/3.0,V(B,C))); eBC = P(B,V(2.0/3.0,V(B,C)));
    PNT vAB, vAC, vBC;
    
    float det = (B.x*C.y-B.y*C.x)-(A.x*C.y-A.y*C.x)+(A.x*B.y-A.y*B.x); //https://en.wikipedia.org/wiki/Curve_orientation
    if (det < 0)
    {//Clockwise 
      vAB = P(bAB, V(A,bAB).rotateBy(PI/3));
      vAC = P(eAC, V(C,eAC).rotateBy(PI/3));
      vBC = P(bBC, V(B,bBC).rotateBy(PI/3));
    } else if (det > 0) { //CCW
      vAB = P(bAB, V(A,bAB).rotateBy(-PI/3));
      vAC = P(eAC, V(C,eAC).rotateBy(-PI/3));
      vBC = P(bBC, V(B,bBC).rotateBy(-PI/3));
    } else { //collinear
      return;
    }
    
    if (count % 2 == 0)
    {
      part5helper(bAB,eAB,vAB,count - 1);
      part5helper(bAC,eAC,vAC,count - 1);
      part5helper(bBC,eBC,vBC,count - 1);
    } else {
      PNT avgAB = P(bAB,eAB,vAB);
      PNT avgAC = P(bAC,eAC,vAC);
      PNT avgBC = P(bBC,eBC,vBC);
      part5helper(R(bAB,PI,avgAB),R(eAB,PI,avgAB),R(vAB,PI,avgAB),count - 1);
      part5helper(R(bAC,PI,avgAC),R(eAC,PI,avgAC),R(vAC,PI,avgAC),count - 1);
      part5helper(R(bBC,PI,avgBC),R(eBC,PI,avgBC),R(vBC,PI,avgBC),count - 1);
    }
    cwfo(black,2,white,0);
    showLoop(A,B,C);
  }
  
//====================================================================== PART 6
int recursionDepth=9;  
void showPart6(PNT A, PNT B, PNT C, PNT D) //    Work in progress, still generates errors
  {
  PartTitle[6] =   "Recursive tree growth";
  PNT E = P(A,V(B,C));
  part6helper(A, B, V(B,C), V(C,D), recursionDepth);

  if(showIDs)
    {
    E.circledLabel("E");
    A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
    }
  guide="I:display IDs, ,/.:recursion depth";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
void part6helper(PNT A, PNT B, VCT BC, VCT CD, int recursionCount) {
  if (recursionCount <= 0) return;
  PNT E = P(A,BC);
  PNT C = P(B,BC);
  PNT D = P(C,CD);
  float ratioDE = n(V(E,D))/n(V(A,B));
  ratioDE = (ratioDE < 1) ? ratioDE : 0.9;
  float ratioCD = n(V(C,D))/n(V(A,B));
  ratioCD = (ratioCD < 1) ? ratioCD : 0.9;
  float angleE = angle(V(E,C),V(E,D));
  float angleC = angle(V(C,E),V(C,D));
  part6helper(D,C,V(ratioCD,BC).rotateBy(angleC),V(ratioCD,CD).rotateBy(angleC),recursionCount - 1);
  part6helper(E,D,V(ratioDE,BC).rotateBy(angleE),V(ratioDE,CD).rotateBy(angleE),recursionCount - 1);
  cwf(color(161,206,94),1,color(87,44,41));
  showLoop(A,B,C,E);
  showLoop(E,D,C);
}
  
  
//====================================================================== PART 7
void showPart7(PNT A, PNT B, PNT C, PNT D) //    
  {
    PartTitle[7] =   "Sierpinski Arrowhead/Curve";
    guide="MyProject keys: 'j' to toggle arrowhead/curve, 'k' to hide/show labels";
  ArrayList<PNT> pointList = new ArrayList();
  if (showJ)
    {
    PNT C0, D0;
    if(angle(V(1,0),V(A,B)) < 0)
      {
      C0 = P(B, V(A,B).rotateBy(PI/3));
      D0 = P(C0, V(A,B).rotateBy(2*PI/3));
      } else {
      C0 = P(B, V(A,B).rotateBy(-PI/3));
      D0 = P(C0, V(A,B).rotateBy(-2*PI/3));  
      }
    sierpinskiRecurse(A,B,C0,D0,pointList,6);
    cwfo(black, 3, white, 0);
    //showLoop(A,B,C,D);
    for (int i = 0; i < pointList.size() - 1; i++)
      {
      show(pointList.get(i),pointList.get(i+1));
      }
    if (showK)
      {
      A.circledLabel("A"); B.circledLabel("B"); C0.circledLabel("C"); D0.circledLabel("D");
      }
    }
  else
    {
      sierpinskiRecurse(A,B,C,D,pointList,2);
      cwfo(black, 3, white, 0);
      //showLoop(A,B,C,D);
      for (int i = 0; i < pointList.size() - 1; i++)
        {
        show(pointList.get(i),pointList.get(i+1));
        }
        if (showK)
        {
        A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
        }
    }
  }
  void sierpinskiRecurse(PNT A, PNT B, PNT C, PNT D, ArrayList<PNT> pnts, int count) {
     if (count == 0)
    {
      pnts.add(A);
      pnts.add(B);
      pnts.add(C);
      pnts.add(D);
      return;
    }
    float ratio = d(A,B)/d(A,D);
    float angle = angle (V(A,B),V(A,D));
    PNT xAB, yAB; //Points between A & B
    xAB = P(A, V(ratio,V(A,B)).rotateBy(angle));
    yAB = P(xAB, V(ratio,V(B,C)).rotateBy(-angle));
    PNT xBC, yBC; //Points between B & C
    xBC = P(B, V(ratio,V(A,B)));
    yBC = P(xBC, V(ratio,V(B,C)));
    PNT xCD, yCD; //Points between C & D
    xCD = P(C, V(ratio,V(A,B)).rotateBy(PI));
    yCD = P(xCD, V(ratio,V(B,C).rotateBy(angle)));
    //System.out.printf("Angles AB AD:%d\tDA DC:%d\tAD BC:%d\n",toDeg(angle),toDeg(angle(V(D,A),V(D,C))),toDeg(angle(V(A,D),V(B,C))));
    
    sierpinskiRecurse(A, xAB, yAB, B, pnts, count - 1);
    sierpinskiRecurse(B, xBC, yBC, C, pnts, count - 1);
    sierpinskiRecurse(C, xCD, yCD, D, pnts, count - 1);
  }
/*void drawNeville(PNT A, PNT B, PNT C, PNT D)
  {
  beginShape();
  
  
  endShape();
  }
*/
  
//====================================================================== PART 8
VCT line;
void showPart8(PNT A, PNT B, PNT C, PNT D) //    
  {
  /*PartTitle[8] =   "Polyline smoothing";
  cwF(black,3); ControlPoints.drawPolyline(); // draws polyline joining control points
  ControlPoints.drawAllVerticesInColor(3,red); // draw dots at vertices
  //if(showIDs) {cwF(blue,1); ControlPoints.writeIDsInEmptyDisks(); }
  if(showIDs) showArrowIDs();
  cwF(red,1); ControlPoints.showPickedPoint(25);
  int n = ControlPoints.pointCount();
  if(keyPressed && key=='f' && n>4)
    {
 
    }
  guide="f:iterate smoothing, I:show/hide IDs";*/
  
  PartTitle[8] = "Fractal Tree (3 Branches)";
  int branches = 7;
  /*VCT AB = V(A,B);
  VCT AC = V(A,C);
  float w = angle(AB, AC);
  tree(A, AB.clone().rotateBy(w),w, 2.0/3,150,branches);
  tree(A, AB.clone().rotateBy(-w),w, 2.0/3,150,branches);
  tree(A, AB, w, 2.0/3,150,branches);*/
  
  //triangleTree(A,B,C,200,branches);
  //triangleTree(B,C,A,200,branches);
  //triangleTree(C,A,B,200,branches);
  
  float leftAngle = angle(V(A,B),V(A,C));
  float rightAngle = angle(V(B,C),V(B,A));
  float leftAngle2 = angle(V(A,C), V(A,B));
  float rightAngle2 = angle(V(C,B), V(C,A));
  //println("right: " +degrees(rightAngle));
  triangleTree2(A,B,C,leftAngle, rightAngle, leftAngle2, rightAngle2,10,branches);
  triangleTree2(B,C,A,leftAngle, rightAngle, leftAngle2, rightAngle2,200,branches);
  triangleTree2(C,A,B,leftAngle, rightAngle,leftAngle2, rightAngle2,100,branches);
  
  triangleTree2(A,C,B,leftAngle, rightAngle, leftAngle2, rightAngle2,200,branches);
  triangleTree2(C,B,A,leftAngle, rightAngle, leftAngle2, rightAngle2,10,branches);
  triangleTree2(B,A,C,leftAngle, rightAngle,leftAngle2, rightAngle2,100,branches);
  
  if(showJ) {A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C");}
  }
  
 //
void tree(PNT A, VCT AB, float angle, float scale, int c,  int branches)
  {
  if (branches==0)
    {
      return;
    }
  PNT brPoint = P(A, AB);
  VCT sAB = V(scale,AB);
  
  tree(brPoint, sAB.clone().rotateBy(-angle),angle, scale, c + 20, branches-1); //left branch
  tree(brPoint,sAB.clone().rotateBy(angle),angle, scale, c + 20, branches-1); //right branch
  tree(brPoint,sAB.clone(),angle, scale, c + 20, branches-1); //middle branch
  
  color c1 =c;
  stroke(c1,60,150);
  strokeWeight((branches*5)*0.3); //alter strokeweight of each branch
  show(A,brPoint); 
  }
void triangleTree(PNT A, PNT B, PNT C, int c,  int branches)
  {
  if (branches==0)
    {
      return;
    }
    float leftAngle = angle(V(A,B),V(A,C));
    float rightAngle = angle(V(B,C),V(B,A));
    PNT leftBranch, rightBranch, centerBranch;
    if(det(V(A,B),V(A,C)) > 0)
      {
      leftBranch = P(B,V((2.0/3)*d(A,B)/d(A,C),V(A,B)).rotateBy(-leftAngle));
      rightBranch = P(B,V((2.0/3)*d(B,C)/d(A,C),V(A,B)).rotateBy(rightAngle));
      centerBranch = P(B, V((2.0/3)*d(A,B)/d(A,C),V(A,B)).rotateBy((-leftAngle + rightAngle)/3));
      } else if (det(V(A,B),V(A,C)) < 0)
      {
      leftBranch = P(B,V((2.0/3)*d(A,B)/d(A,C),V(A,B)).rotateBy(leftAngle));
      rightBranch = P(B,V((2.0/3)*d(B,C)/d(A,C),V(A,B)).rotateBy(-rightAngle));
      centerBranch = P(B, V((2.0/3)*d(A,B)/d(A,C),V(A,B)).rotateBy((leftAngle + (-rightAngle))/3));
      } else {
         return; 
      }
  
    color c1 =c;
    
    triangleTree(B,leftBranch,centerBranch, c1 + 20, branches-1); //left branch
    triangleTree(B,rightBranch,centerBranch, c1 + 20, branches-1); //right branch
    triangleTree(B,centerBranch,rightBranch, c1 + 20, branches-1); //left branch
    
    
    stroke(c1,60,150);
    strokeWeight((branches*5)*0.3); //alter strokeweight of each branch
    //showLoop(A,B,C);
    show(A,B);
    show(A,C);
    //show(B,C);
  }
  void triangleTree2(PNT A, PNT B, PNT C, float leftAngle, float rightAngle, float leftAngle2, float rightAngle2,int c,  int branches)
  {
  if (branches==0)
    {
      return;
    }

    //float leftAngle = angle(V(A,B),V(A,C));
    //float rightAngle = angle(V(B,C),V(B,A));
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
  
    triangleTree2(B,leftBranch,centerBranch, leftAngle, rightAngle, leftAngle2, rightAngle2, c + 20, branches-1); //left branch
    triangleTree2(B,rightBranch,centerBranch, leftAngle, rightAngle, leftAngle2, rightAngle2, c + 20, branches-1); //right branch
    triangleTree2(B,centerBranch,centerBranch, leftAngle, rightAngle, leftAngle2, rightAngle2,c + 20, branches-1); //left branch
    color c1 =c;
    stroke(c1,60,150);
    strokeWeight((branches*5)*0.3); //alter strokeweight of each branch
    if(showJ) show(B,C);
    if (showQ) show(A,B);
    if (showL) show(A,C);
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
  if(key=='j') {showJ = !showJ; showQ = false; }
  if(key=='k') {showK = !showK; showQ = false; }
  if(key=='l') {showL = !showL; showQ = false; }
  if(key=='q') {showQ = !showQ; showJ = false; showK = false; showL = false; }
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
  
