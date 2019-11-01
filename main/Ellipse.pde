

class Ellipse {
  
  
   Point p0, p1, p2;

   Ellipse( Point _p0, Point _p1, Point _p2 ){
     p0 = _p0; p1 = _p1; p2 = _p2;  
     
   }
 
   public void draw(){
     //line( p0.p.x, p0.p.y, 
     //      p1.p.x, p1.p.y );
           
           
           
     ellipse(p0.p.x, p0.p.y, (p0.distance(p1)) * 2, (p0.distance(p2)) * 2);
   }
   

  public String toString(){
    return "<" + p0 + "" + p1 + ">";
  }


}
