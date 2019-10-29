
import java.util.*;

ArrayList<Point>    points     = new ArrayList<Point>();
ArrayList<Point>    object1     = new ArrayList<Point>();
ArrayList<Point>    object2     = new ArrayList<Point>();

ArrayList<Line>  lines1 = new ArrayList<Line>();
ArrayList<Line>  lines2 = new ArrayList<Line>();

ArrayList<Circle>  circle1 = new ArrayList<Circle>();
ArrayList<Circle>  circle2 = new ArrayList<Circle>();


String selectedMode = "";
String obj1Mode = "";
String obj2Mode = "";



boolean saveImage = false;
boolean showPotentialDiagonals = true;
boolean showDiagonals = true;


void setup(){
  size(1200,800,P3D);
  frameRate(30);
}


void draw(){
  background(255);
  
  translate( 0, height, 0);
  scale( 1, -1, 1 );
  
  strokeWeight(3);
  
  fill(0);
  noStroke();
  
  
  // PRINT OBJECTS
  
  for( Point p : object1 ){
    p.draw();
  }  
  for( Point p : object2 ){
    p.draw();
  }   
  fill(0);
    stroke(100);
  for( Line l : lines1 ){
  l.draw();
  }
  for( Line l : lines2 ){
  l.draw();
  }  
  noFill();
  for( Circle c : circle1 ){
    c.draw();
  }
  for( Circle c : circle2 ){
    c.draw();
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
  textRHC( "Selected Mode: " + selectedMode, width - 220, height - 20 );  

  
  textRHC( "Object 1: " + obj1Mode, width - 220, height - 40 );  
  textRHC( "Object 2: " + obj2Mode, width - 220, height - 60 );  
  
  
  
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
  
  if( key == 'c' )
  {
     object1.clear();
     object2.clear();
    selectedMode = "";
    obj1Mode = "";
    obj2Mode = ""; 
    lines1.clear();
    lines2.clear();
    circle1.clear();
    circle2.clear();
    
  }
  
}


void textRHC( int s, float x, float y ){
  textRHC( Integer.toString(s), x, y );
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

  
  if (selectedMode == "Point")
  {
            if (object1.size() == 0)
            {
                println("True");
                int mouseXRHC = mouseX;
                int mouseYRHC = height-mouseY;
                
                float dT = 6;
                
                for( Point p : points ){
                  float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
                  if( d < dT ){
                    dT = d;
                    sel = p;
                  }
                }
                
                if( sel == null ){
                  sel = new Point(mouseXRHC,mouseYRHC);
                  obj1Mode = selectedMode;
                  object1.add( sel );            
                 } 
            }
            
            if (object2.size() == 0 )
            {
                println("True2");
                int mouseXRHC = mouseX;
                int mouseYRHC = height-mouseY;
                
                float dT = 6;
                
                for( Point p : points ){
                  float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
                  if( d < dT ){
                    dT = d;
                    sel = p;
                  }
                }
                
                if( sel == null ){
                  sel = new Point(mouseXRHC,mouseYRHC);
                  obj2Mode = selectedMode;
                  object2.add( sel );            
                 } 
            }
  }
  
   if (selectedMode == "Line")
  {
            if (object1.size() < 2)
            {
                int mouseXRHC = mouseX;
                int mouseYRHC = height-mouseY;
                
                float dT = 6;
                
                for( Point p : points ){
                  float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
                  if( d < dT ){
                    dT = d;
                    sel = p;
                  }
                }
                
                if( sel == null ){
                  sel = new Point(mouseXRHC,mouseYRHC);
                  obj1Mode = selectedMode;
                  object1.add( sel );            
                 } 
            }
           if (object1.size() == 2 && lines1.size() < 1)
              lines1.add(new Line (object1.get(0), object1.get(1)));
              
            println(lines1);
            
            if (object2.size() < 2 )
            {
                int mouseXRHC = mouseX;
                int mouseYRHC = height-mouseY;
                
                float dT = 6;
                
                for( Point p : points ){
                  float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
                  if( d < dT ){
                    dT = d;
                    sel = p;
                  }
                }
                
                if( sel == null ){
                  sel = new Point(mouseXRHC,mouseYRHC);
                  obj2Mode = selectedMode;
                  object2.add( sel );            
                 } 
            }
           if (object2.size() == 2 && lines2.size() < 1)
              lines2.add(new Line (object2.get(0), object2.get(1)));
              
           println(lines2);
  }
  
  
  if (selectedMode == "Triangle")
  {
            if (object1.size() < 3)
            {
                println("True");
                int mouseXRHC = mouseX;
                int mouseYRHC = height-mouseY;
                
                float dT = 6;
                
                for( Point p : points ){
                  float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
                  if( d < dT ){
                    dT = d;
                    sel = p;
                  }
                }
                
                if( sel == null ){
                  sel = new Point(mouseXRHC,mouseYRHC);
                  obj1Mode = selectedMode;
                  object1.add( sel );            
                 } 
            }

            if (object1.size() == 3 && lines1.size() == 0)
            {
              lines1.add(new Line (object1.get(0), object1.get(1)));
              lines1.add(new Line (object1.get(0), object1.get(2)));
              lines1.add(new Line (object1.get(1), object1.get(2)));
            }
            
            
            if (object2.size() < 3)
            {
                println("True2");
                int mouseXRHC = mouseX;
                int mouseYRHC = height-mouseY;
                
                float dT = 6;
                
                for( Point p : points ){
                  float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
                  if( d < dT ){
                    dT = d;
                    sel = p;
                  }
                }
                
                if( sel == null ){
                  sel = new Point(mouseXRHC,mouseYRHC);
                  obj2Mode = selectedMode;
                  object2.add( sel );            
                 } 
            }
            
            if (object2.size() == 3 && lines2.size() == 0)
            {
              lines2.add(new Line (object2.get(0), object2.get(1)));
              lines2.add(new Line (object2.get(0), object2.get(2)));
              lines2.add(new Line (object2.get(1), object2.get(2)));
            }            
  }


   if (selectedMode == "Circle")
  {
            if (object1.size() < 2)
            {
                int mouseXRHC = mouseX;
                int mouseYRHC = height-mouseY;
                
                float dT = 6;
                
                for( Point p : points ){
                  float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
                  if( d < dT ){
                    dT = d;
                    sel = p;
                  }
                }
                
                if( sel == null ){
                  sel = new Point(mouseXRHC,mouseYRHC);
                  obj1Mode = selectedMode;
                  object1.add( sel );            
                 } 
            }
           if (object1.size() == 2 && circle1.size() < 1)
              circle1.add(new Circle (object1.get(0), object1.get(1)));
              
            println(circle1);
            
            if (object2.size() < 2 )
            {
                int mouseXRHC = mouseX;
                int mouseYRHC = height-mouseY;
                
                float dT = 6;
                
                for( Point p : points ){
                  float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
                  if( d < dT ){
                    dT = d;
                    sel = p;
                  }
                }
                
                if( sel == null ){
                  sel = new Point(mouseXRHC,mouseYRHC);
                  obj2Mode = selectedMode;
                  object2.add( sel );            
                 } 
            }
           if (object2.size() == 2 && circle2.size() < 1)
              circle2.add(new Circle (object2.get(0), object2.get(1)));
              
           println(circle2);
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
  sel = null;
}




  
