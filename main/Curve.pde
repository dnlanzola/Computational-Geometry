

class Curve {
  
   ArrayList<Point> p     = new ArrayList<Point>();
   ArrayList<Segment>  bdry = new ArrayList<Segment>();
     
   Curve( ){  }
   
   

   
   void draw(){
     //println( bdry.size() );
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
       //bdry.set( bdry.size()-1, new Segment( p.get(p.size()-2), p.get(p.size()-1) ) );
       bdry.add( new Segment( p.get(p.size()-2), p.get(p.size()-1) ) );
     }
   }















}
