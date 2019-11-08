

class Triangle {
  
   Point p0,p1,p2;
     
   Triangle(Point _p0, Point _p1, Point _p2 ){
     // TODO: Fill in this function
     p0 = _p0;
     p1 = _p1;
     p2 = _p2;
   }
   
   void draw(){
    
    //if (ccw(p0.p.x, p0.p.y, p1.p.x, p1.p.y, p2.p.x, p2.p.y) == true)
    //{
    //  fill(0,255,0);
    //  //println("Triangle's orientation is counterclockwise");
    //}

    //if (cw(p0.p.x, p0.p.y, p1.p.x, p1.p.y, p2.p.x, p2.p.y) == true)
    //{
    //  fill(255,255,0);
    //  //println("Triangle's orientation is clockwise");
    //}
     
     
     triangle(  p0.p.x, p0.p.y, 
               p1.p.x, p1.p.y,
               p2.p.x, p2.p.y );   
   }
   
}
