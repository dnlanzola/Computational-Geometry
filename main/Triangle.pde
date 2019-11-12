
class Triangle {
  
   Point p0,p1,p2;
     
   Triangle(Point _p0, Point _p1, Point _p2 ){
     // TODO: Fill in this function
     p0 = _p0;
     p1 = _p1;
     p2 = _p2;
   }
   
   void draw(){
    
     
     
     triangle(  p0.p.x, p0.p.y, 
               p1.p.x, p1.p.y,
               p2.p.x, p2.p.y );   
   }
   
}
