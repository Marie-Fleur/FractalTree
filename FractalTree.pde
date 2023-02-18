
private double fractionLength = .8; 
private int smallestBranch = 6; 
private double branchAngle = .5;  
int COLOR_VALUE = 0;
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(92, 64, 51);  
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);
} 
public void mousePressed() {
  branchAngle = Math.random()*.4;
  drawBranches(320,380,100,3*Math.PI/2);
  redraw();
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + 2*branchAngle;
  double angle2 = angle - 2*branchAngle;
  branchLength*= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  if (branchLength > 40) {
    stroke(92, 64, 51); 
  }
  else {
    //stroke(0,0,(int)(Math.random()*156)+100);
    stroke(0,0,(int)(Math.random()*255+100));
  }
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
/*void mouseDragged() 
{
  COLOR_VALUE = COLOR_VALUE + 5;
  if (COLOR_VALUE > 255) {
    COLOR_VALUE = 0;
  }
}*/
