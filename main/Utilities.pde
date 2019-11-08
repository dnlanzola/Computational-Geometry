public void setEmpty(String[] s)
{
    for (int i = 0; i < s.length; i++)
        s[i] = "";
  
}


// check if a triangle is oriented counterclockwise
public boolean ccw(float x1, float y1, float x2, float y2, float x3, float y3){
     // TODO: Fill in this function
     
     float ax = x2 - x1;
     float ay = y2 - y1;
     float bx = x3 - x1;
     float by = y3 - y1;
     
     float sum = (ax * by) - (ay * bx);
     
     
     //println(sum);
     if (sum < 0)
        return true;
        
     return false;
   }
   
// check if a triangle is oriented clockwise
public boolean cw(float x1, float y1, float x2, float y2, float x3, float y3){
     // TODO: Fill in this function
     
     float ax = x2 - x1;
     float ay = y2 - y1;
     float bx = x3 - x1;
     float by = y3 - y1;
     
     float sum = (ax * by) - (ay * bx);     
     
     
     //println(sum);
     if (sum > 0)
        return true;
        
     return false;
     
     

   }
   
public float slope(float x1, float y1, float x2, float y2){
  
  return (y2 - y1) / (x2 - x1);
  
}
