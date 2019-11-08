

class Line {
  
   Point p0, p1;

   Line( Point _p0, Point _p1 ){
     p0 = _p0; p1 = _p1;    
     
   }
 
  void draw(){
     
     float s = slope(p0.p.x,p0.p.y,p1.p.x,p1.p.y);
     float b = (p0.p.y) - (s*p0.p.x);
     
     float xMin = -50;
     float yMin = (s*xMin)+b;
     float xMax = 1500;
     float yMax = (s*xMax)+b;
     
     
     
     line( xMin, yMin, 
           xMax, yMax );
   }
   

  public String toString(){
    return "<" + p0 + "" + p1 + ">";
  }
}
