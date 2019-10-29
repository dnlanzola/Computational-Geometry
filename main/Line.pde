

class Line {
  
   Point p0, p1;

   Line( Point _p0, Point _p1 ){
     p0 = _p0; p1 = _p1;    
     
   }
 
   public void draw(){
     line( p0.p.x, p0.p.y, 
           p1.p.x, p1.p.y );
   }
   

  public String toString(){
    return "<" + p0 + "" + p1 + ">";
  }
}
