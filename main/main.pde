
import java.util.*;

// KEEPS TRACK OF ALL THE POINTS
ArrayList<Point>    points     = new ArrayList<Point>();
ArrayList<Point>    allPoints  = new ArrayList<Point>();

// LISTS FOR OBJECTS
ArrayList<Point>    pointObjects     = new ArrayList<Point>();
ArrayList<Line>     lineObjects      = new ArrayList<Line>();
ArrayList<Segment>  segmentObjects   = new ArrayList<Segment>();
ArrayList<Circle>   circleObjects    = new ArrayList<Circle>();
ArrayList<Ellipse>  ellipseObjects   = new ArrayList<Ellipse>();
ArrayList<Triangle> triangleObjects  = new ArrayList<Triangle>();
ArrayList<Polygon>  polygonObjects   = new ArrayList<Polygon>();


int numberObjects = 2;
int selectedObject = 0;
String[] objMode = new String[100];
String[] objStatus = new String[100];



Boolean active = false;
Boolean stopPoint = false;


String selectedMode = "";




boolean saveImage = false;



void setup(){
  size(1400,800,P3D);
  frameRate(30);
  for (int i = 0; i < objStatus.length; i++)
  objStatus[i] = "";
  
}


void draw(){
  background(255);
  
  translate( 0, height, 0);
  scale( 1, -1, 1 );
  
  strokeWeight(3);
  
  fill(0);
  noStroke();
  
  
  // PRINT OBJECTS
  
  for( Point p : allPoints ){
    p.draw();
  }  
  
  for( Point p : pointObjects ){
    p.draw();
  }  
  
  for( Segment s : segmentObjects ){
    stroke(1);
    s.draw();
  }    
  
   for( Triangle t : triangleObjects ){
    stroke(1);
    t.draw();
  }    

   for( Circle c : circleObjects ){
    stroke(1);
    c.draw();
  }  
  
   for( Ellipse e : ellipseObjects ){
    stroke(1);
    e.draw();
  }  
  
     for( Polygon po : polygonObjects ){
    stroke(1);
    po.draw();
  }  
  
  noFill();
  stroke(100);

  
  noStroke();

  
  stroke( 100, 100, 100 );

  
  


  
  
  fill(0);
  stroke(0);
  textSize(18);
  
  textRHC( "Controls", 10, height-20 );
  textRHC( "1: Point", 10, height-40 );
  textRHC( "2: Line", 10, height-60 );
  textRHC( "3: Segment", 10, height-80 );
  textRHC( "4: Curve", 10, height-100 );
  textRHC( "5: Ellipse", 10, height-120 );  
  textRHC( "6: Triangle", 10, height-140 );
  textRHC( "7: Polygon", 10, height-160 );
  textRHC( "8: Circle", 10, height-180 ); 
  textRHC( "c: Clear", 10, height-220 );   
  textRHC( "Selected Mode: " + selectedMode, width - 240, height - 20 ); 
  textRHC( "+/- Number of Objects: " + numberObjects, width - 240, height - 40 ); 
  

  
  
  for (int i = 1; i < numberObjects+1; i++)
  {
    textRHC( "Object " + i + ": " + objMode[i-1], width - 190, height - 50-(i*20) ); 
    
    
    if (objStatus[i-1] == "")
      fill(255,0,0);

    if (objStatus[i-1] == "Filled")
      fill(0,255,0);
 
    if (objStatus[i-1] == "Active")
      fill(255,128,0);

    
    noStroke();
    ellipse( width - 200, (height+5) - 50-(i*20), 10,10);
    fill(0);
  }
  
  
  for( int i = 0; i < points.size(); i++ ){
    textRHC( i+1, points.get(i).p.x+5, points.get(i).p.y+15 );
  }
  
  if( saveImage ) saveFrame( ); 
  saveImage = false;
  
}


void keyPressed(){
  if( key == '1' ) selectedMode = "Point";
  if( key == '2' ) selectedMode = "Line";
  if( key == '3' ) selectedMode = "Segment";
  if( key == '4' ) selectedMode = "Curve";
  if( key == '5' ) selectedMode = "Ellipse";
  if( key == '6' ) selectedMode = "Triangle";
  if( key == '7' ) selectedMode = "Polygon";
  if( key == '8' ) selectedMode = "Circle";
  
  if( key == ' ')  stopPoint = true;
  
  if( key == '+' ) numberObjects++;
  if( key == '-' ) if (numberObjects > 2) numberObjects--;
  
  
  if( key == 'c' )
  {

    selectedMode = "";
    
    allPoints.clear();

    setEmpty(objMode);
    setEmpty(objStatus);
    selectedObject = 0;
    
    pointObjects.clear();
    segmentObjects.clear();
    lineObjects.clear();
    circleObjects.clear();
    triangleObjects.clear();
    ellipseObjects.clear();

    
  }
  
}


void textRHC( int s, float x, float y ){
  //textRHC( Integer.toString(s), x, y );
}


void textRHC( String s, float x, float y ){
  pushMatrix();
  translate(x,y);
  scale(1,-1,1);
  text( s, 0, 0 );
  popMatrix();
}

Point sel = null;

void mousePressed(){

    if (selectedObject < numberObjects)
    {
        int mouseXRHC = mouseX;
        int mouseYRHC = height-mouseY;
        
        points.add(new Point(mouseXRHC,mouseYRHC));
        allPoints.add(new Point(mouseXRHC,mouseYRHC));
    }

}

void mouseDragged(){
  int mouseXRHC = mouseX;
  int mouseYRHC = height-mouseY;
  if( sel != null ){
    sel.p.x = mouseXRHC;   
    sel.p.y = mouseYRHC;   
  }
}

void mouseReleased(){
    if (selectedObject < numberObjects)
    {
      if (selectedMode == "Point")
      {
        
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));

        pointObjects.add(points.get(0));
        objMode[selectedObject] = "Point";
        objStatus[selectedObject] = "Filled";

        selectedObject++;
        objStatus[selectedObject] = "Active";
        points.clear();
  
      }

      if (selectedMode == "Line")
      {
        
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Line";
        if (points.size() == 2)
        {
          println(points.get(0));
          println(points.get(1));
          
          lineObjects.add(new Line (points.get(0),points.get(1)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
        }

      }   
  
  
  
  
  
      if (selectedMode == "Segment")
      {
        
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Segment";
        if (points.size() == 2)
        {
          println(points.get(0));
          println(points.get(1));
          
          segmentObjects.add(new Segment (points.get(0),points.get(1)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
        }

      }  

  
      if (selectedMode == "Curve")
      {
        


      }    
  
  
      if (selectedMode == "Ellipse")
      {
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Ellipse";
        if (points.size() == 3)
        {
          println(points.get(0));
          println(points.get(1));
          println(points.get(2));
          
          ellipseObjects.add(new Ellipse (points.get(0),points.get(1),points.get(2)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
        }         


      }    
  

      if (selectedMode == "Triangle")
      {
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Triangle";
        if (points.size() == 3)
        {
          println(points.get(0));
          println(points.get(1));
          println(points.get(2));
          
          triangleObjects.add(new Triangle (points.get(0),points.get(1),points.get(2)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
        }        


      }  
  
      if (selectedMode == "Polygon")
      {
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Polygon";
        if (stopPoint == true)
        {
          println("main points: ", points.size());
          polygonObjects.add(new Polygon (points));
          println("polygonObjects size: ", polygonObjects.size());
          println(polygonObjects.get(0));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
          stopPoint = false;
        }          


      }    
  
      if (selectedMode == "Circle")
      {
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Circle";
        if (points.size() == 2)
        {
          println(points.get(0));
          println(points.get(1));
          
          circleObjects.add(new Circle (points.get(0),points.get(1)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
        }        


      }  
  



}
  
  
  
  
  
  
}




  
