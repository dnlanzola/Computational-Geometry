
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
ArrayList<Curve>    curveObjects     = new ArrayList<Curve>();

Polygon             poly             = new Polygon();
Polygon             polyAux          = new Polygon();
Curve               cur              = new Curve();
Curve               curAux           = new Curve();


int numberObjects = 0;
int selectedObject = 0;

int focusObject = 0;
int instances = 0;

String[] objMode = new String[100];
StringList objMode2 = new StringList();
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
  
  for (Point p : points){    
    noStroke();
    fill(255,128,0);
    p.draw();
  }
    
  polyAux.draw();
  curAux.draw();
  
  for (Polygon po : polygonObjects){
    stroke(1);
    po.draw();
  }
  
  for (Curve c : curveObjects){
    stroke(1);
    c.draw();
  }  
  
  for( Point p : allPoints ){
    fill(1);
    p.draw();
  }  
  
  for( Point p : pointObjects ){
    p.draw();
  } 
  
  for( Line l : lineObjects ){
    stroke(1);
    l.draw();
  }    
  
  for( Segment s : segmentObjects ){
    stroke(1);
    s.draw();
  }    
  
   for( Triangle t : triangleObjects ){
    stroke(1);
    noFill();
    t.draw();
    fill(1);
  }    

   for( Circle c : circleObjects ){
    stroke(1);
    noFill();
    c.draw();
    fill(1);
  }  
  
   for( Ellipse e : ellipseObjects ){
    stroke(1);
    noFill();
    e.draw();
    fill(1);
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
  
  textRHC( "p: Print Calculations", 10, height-240 ); 
  textRHC( "e: Export Data", 10, height-220 ); 

  textRHC( "c: Clear", 10, height-260 ); 
  
  textRHC( "Selected Mode: " + selectedMode, width - 240, height - 20 ); 
  textRHC( "Number of Objects: " + numberObjects, width - 240, height - 40 ); 
  textRHC( "+/- Focus Object: " + focusObject, width - 240, height - 60 ); 
  if (focusObject > 0){
    textRHC( "Type: " + objMode2.get(focusObject-1), width - 240, height - 80 ); 
    
    if (objMode2.get(focusObject-1) == "Point"){
      instances = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Point")
          instances++;
      textRHC( "X: " + pointObjects.get(instances-1).p.x, width - 240, height - 100 );
      textRHC( "Y: " + pointObjects.get(instances-1).p.y, width - 240, height - 120 );
      
      textRHC("SELECTED", pointObjects.get(instances-1).p.x, (pointObjects.get(instances-1).p.y)-20);
    }
    
    
    if (objMode2.get(focusObject-1) == "Line"){
      instances = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Line")
          instances++;
      textRHC( "Slope: "  , width - 240, height - 180 );
      
      textRHC("SELECTED", lineObjects.get(instances-1).p0.p.x, (lineObjects.get(instances-1).p0.p.y)-20);
      
    }
    
      if (objMode2.get(focusObject-1) == "Segment"){
      instances = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Segment")
          instances++;
      textRHC( "X1: " + segmentObjects.get(instances-1).p0.p.x, width - 240, height - 100 );
      textRHC( "Y1: " + segmentObjects.get(instances-1).p0.p.y, width - 240, height - 120 );
      textRHC( "X2: " + segmentObjects.get(instances-1).p1.p.x, width - 240, height - 140 );
      textRHC( "Y2: " + segmentObjects.get(instances-1).p1.p.y, width - 240, height - 160 );
      textRHC( "Distance: " + dist(segmentObjects.get(instances-1).p0.p.x,segmentObjects.get(instances-1).p0.p.y,segmentObjects.get(instances-1).p1.p.x,segmentObjects.get(instances-1).p1.p.y)  , width - 240, height - 180 );
      
      textRHC("SELECTED", segmentObjects.get(instances-1).p0.p.x, (segmentObjects.get(instances-1).p0.p.y)-20);
      
      
    }
  
  
      if (objMode2.get(focusObject-1) == "Curve"){
      instances = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Curve")
          instances++;
      textRHC( "Slope: "  , width - 240, height - 180 );
      
      textRHC("SELECTED", curveObjects.get(instances-1).p.get(0).p.x, (curveObjects.get(instances-1).p.get(0).p.y)-20);  
      
    }
  
  
      if (objMode2.get(focusObject-1) == "Ellipse"){
      instances = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Ellipse")
          instances++;
      textRHC( "Center Point"  , width - 240, height - 180 );
      textRHC( "X"  , width - 240, height - 180 );
      textRHC( "Y"  , width - 240, height - 180 );
      
      textRHC("SELECTED", ellipseObjects.get(instances-1).p0.p.x, (ellipseObjects.get(instances-1).p0.p.y)-20);
      }
      
      if (objMode2.get(focusObject-1) == "Triangle"){
      instances = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Ellipse")
          instances++;
      textRHC( "Area: "  , width - 240, height - 180 );
      textRHC( "Orientation: "  , width - 240, height - 180 );
  
      textRHC("SELECTED", triangleObjects.get(instances-1).p0.p.x, (triangleObjects.get(instances-1).p0.p.y)-20);
      
    }  
  
      if (objMode2.get(focusObject-1) == "Circle"){
      instances = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Circle")
          instances++;
      textRHC( "Area: "  , width - 240, height - 180 );

  
      textRHC("SELECTED", circleObjects.get(instances-1).p0.p.x, (circleObjects.get(instances-1).p0.p.y)-20);
 
      }
      if (objMode2.get(focusObject-1) == "Polygon"){
      instances = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Polygon")
          instances++;
      textRHC( "Area: "  , width - 240, height - 180 );

  
      textRHC("SELECTED", polygonObjects.get(instances-1).p.get(0).p.x, (polygonObjects.get(instances-1).p.get(0).p.y)-20);      
      
      
    }   
  
  
  

  
  
  
  
  
  
  
  
  
  for( int i = 0; i < points.size(); i++ ){
    textRHC( i+1, points.get(i).p.x+5, points.get(i).p.y+15 );
  }
  
  if( saveImage ) saveFrame( ); 
  saveImage = false;
  
}
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
  
  if( key == ' '){  stopPoint = true; mouseReleased();
  }
  if( key == '+' ) if (focusObject < numberObjects) focusObject++;
  if( key == '-' ) if (focusObject > 1) focusObject--;
  
  if (key == 'e') printResults();
  if (key == 'p') distanceBetweenObjects();
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
    polygonObjects.clear();
    curveObjects.clear();
    
    numberObjects = 0;
    
    objMode2.clear();
    
    poly = new Polygon();
    
    focusObject = 0;

    
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

      if (selectedMode != ""){
        int mouseXRHC = mouseX;
        int mouseYRHC = height-mouseY;
        
        points.add(new Point(mouseXRHC,mouseYRHC));
        allPoints.add(new Point(mouseXRHC,mouseYRHC));
        
        if (selectedMode == "Polygon"){
          polyAux.addPoint(new Point(mouseXRHC,mouseYRHC));
          polyAux.draw();
        }
        if (selectedMode == "Curve"){
          curAux.addPoint(new Point(mouseXRHC,mouseYRHC));
          curAux.draw();
        }
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

      if (selectedMode == "Point")
      {
        
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));

        pointObjects.add(points.get(0));
        objMode[selectedObject] = "Point";
        objMode2.append("Point");
        objStatus[selectedObject] = "Filled";

        selectedObject++;
        objStatus[selectedObject] = "Active";
        points.clear();
        
        numberObjects++;
  
      }

      if (selectedMode == "Line")
      {
        
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Line";
        if (points.size() == 2)
        {
          //println(points.get(0));
          //println(points.get(1));
          
          objMode2.append("Line");
          
          lineObjects.add(new Line (points.get(0),points.get(1)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
          
          
          numberObjects++;
        }

      }   
  
  
  
  
  
      if (selectedMode == "Segment")
      {
        
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Segment";
        if (points.size() == 2)
        {
          //println(points.get(0));
          //println(points.get(1));
          
          objMode2.append("Segment");
          
          segmentObjects.add(new Segment (points.get(0),points.get(1)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
          
          
          
          numberObjects++;
        }

      }  

  
      if (selectedMode == "Curve")
      {
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Curve";

        if (stopPoint == true)
        {
          //println("main points: ", points.size());
          //polygonObjects.add(new Polygon (points));
           for( Point p : points )
                cur.addPoint(p);
           curveObjects.add(cur);
           cur = new Curve();
           
           objMode2.append("Curve");
           
           curAux = new Curve();
           
          //println("polygonObjects size: ", polygonObjects.size());
          //println(polygonObjects.get(0));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
          stopPoint = false;
          
          
          numberObjects++;
        }         


      }    
  
  
      if (selectedMode == "Ellipse")
      {
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Ellipse";
        if (points.size() == 3)
        {
          //println(points.get(0));
          //println(points.get(1));
          //println(points.get(2));
          
          objMode2.append("Ellipse");
          
          ellipseObjects.add(new Ellipse (points.get(0),points.get(1),points.get(2)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
          
          
          
          numberObjects++;
        }         


      }    
  

      if (selectedMode == "Triangle")
      {
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Triangle";
        if (points.size() == 3)
        {
          //println(points.get(0));
          //println(points.get(1));
          //println(points.get(2));
          
          objMode2.append("Triangle");
          
          triangleObjects.add(new Triangle (points.get(0),points.get(1),points.get(2)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
          
          
          
          numberObjects++;
        }        


      }  
  
      if (selectedMode == "Polygon")
      {
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Polygon";

        if (stopPoint == true)
        {
          //println("main points: ", points.size());
          //polygonObjects.add(new Polygon (points));
           for( Point p : points )
                poly.addPoint(p);
           polygonObjects.add(poly);
           poly = new Polygon();
           
           objMode2.append("Polygon");
           
           polyAux = new Polygon();
           
          //println("polygonObjects size: ", polygonObjects.size());
          //println(polygonObjects.get(0));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
          stopPoint = false;
          
          
          numberObjects++;
        }          


      }    
  
      if (selectedMode == "Circle")
      {
        println("Selected Mode: " + selectedMode);
        println("Selected object: " + (selectedObject+1));
        objMode[selectedObject] = "Circle";
        if (points.size() == 2)
        {
          //println(points.get(0));
          //println(points.get(1));
          
          objMode2.append("Circle");
          
          circleObjects.add(new Circle (points.get(0),points.get(1)));
          objStatus[selectedObject] = "Filled";
          points.clear(); 
          selectedObject++;
          objStatus[selectedObject] = "Active";
          
          
          numberObjects++;
        }        


      }
  




  
  
  
  
  
  
}




  
