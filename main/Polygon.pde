

class Polygon {
  
   ArrayList<Point> p     = new ArrayList<Point>();
   ArrayList<Segment>  bdry = new ArrayList<Segment>();
     
   Polygon( ){  }
   
   
   boolean isClosed(){ return p.size()>=3; }
   
   
   boolean isSimple(){
     // TODO: Check the boundary to see if it is simple or not.
     ArrayList<Segment> bdry = getBoundary();
     return false;
   }
   
   
   boolean pointInPolygon( Point p ){
     // TODO: Check if the point p is inside of the 
     ArrayList<Segment> bdry = getBoundary();
     return false;
   }
   
   
   ArrayList<Segment> getDiagonals(){
     // TODO: Determine which of the potential diagonals are actually diagonals
     ArrayList<Segment> bdry = getBoundary();
     ArrayList<Segment> diag = getPotentialDiagonals();
     ArrayList<Segment> ret  = new ArrayList<Segment>();

     return ret;
   }
   
   
   boolean ccw(){
     // TODO: Determine if the polygon is oriented in a counterclockwise fashion
     if( !isClosed() ) return false;
     if( !isSimple() ) return false;
     
     return false;
   }
   
   
   boolean cw(){
     // TODO: Determine if the polygon is oriented in a clockwise fashion
     if( !isClosed() ) return false;
     if( !isSimple() ) return false;
     
     return false;
   }
      
   
   
   
   ArrayList<Segment> getBoundary(){
     return bdry;
   }


   ArrayList<Segment> getPotentialDiagonals(){
     ArrayList<Segment> ret = new ArrayList<Segment>();
     int N = p.size();
     for(int i = 0; i < N; i++ ){
       int M = (i==0)?(N-1):(N);
       for(int j = i+2; j < M; j++ ){
         ret.add( new Segment( p.get(i), p.get(j) ) );
       }
     }
     return ret;
   }
   

   void draw(){
     println( bdry.size() );
     for( Segment e : bdry ){
       e.draw();
     }
   }
   
   
   void addPoint( Point _p ){ 
     p.add( _p );
     if( p.size() == 2 ){
       bdry.add( new Segment( p.get(0), p.get(1) ) );
       bdry.add( new Segment( p.get(1), p.get(0) ) );
     }
     if( p.size() > 2 ){
       bdry.set( bdry.size()-1, new Segment( p.get(p.size()-2), p.get(p.size()-1) ) );
       bdry.add( new Segment( p.get(p.size()-1), p.get(0) ) );
     }
   }

}
