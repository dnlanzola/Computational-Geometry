
import java.util.*;

ArrayList<Point>    points     = new ArrayList<Point>();



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
  for( Point p : points ){
    p.draw();
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
  textRHC( "3: Line Segment", 10, height-80 );
  textRHC( "4: Curve", 10, height-100 );
  textRHC( "5: Ellipse", 10, height-120 );  
  textRHC( "6: Triangle", 10, height-140 );
  textRHC( "7: Polygon", 10, height-160 );
  textRHC( "8: Circle", 10, height-180 );  
  
  
  for( int i = 0; i < points.size(); i++ ){
    textRHC( i+1, points.get(i).p.x+5, points.get(i).p.y+15 );
  }
  
  if( saveImage ) saveFrame( ); 
  saveImage = false;
  
}


void keyPressed(){
  if( key == 's' ) saveImage = true;
//  if( key == 'c' ){ points.clear(); poly = new Polygon(); }
//  if( key == 'p' ) showPotentialDiagonals = !showPotentialDiagonals;
//  if( key == 'd' ) showDiagonals = !showDiagonals;
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
    points.add( sel );
    //poly.addPoint( sel );
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




  
