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
   
public boolean triangleOrientation(int ins)
{
     if (ccw(triangleObjects.get(ins-1).p0.p.x, triangleObjects.get(ins-1).p0.p.y, triangleObjects.get(ins-1).p1.p.x, triangleObjects.get(ins-1).p1.p.y, triangleObjects.get(ins-1).p2.p.x, triangleObjects.get(ins-1).p2.p.y) == true)
    {
      //println("Triangle's orientation is counterclockwise");
      return true;
    }

    if (cw(triangleObjects.get(ins-1).p0.p.x, triangleObjects.get(ins-1).p0.p.y, triangleObjects.get(ins-1).p1.p.x, triangleObjects.get(ins-1).p1.p.y, triangleObjects.get(ins-1).p2.p.x, triangleObjects.get(ins-1).p2.p.y) == true)
    {
      //println("Triangle's orientation is clockwise");
      return false;
    } 
  
  return false;
}
   
   
public float triangleArea(int ins)
{
   float area = abs((( triangleObjects.get(ins-1).p0.p.x * (triangleObjects.get(ins-1).p1.p.y - triangleObjects.get(ins-1).p2.p.y) ) + ( triangleObjects.get(ins-1).p1.p.x * (triangleObjects.get(ins-1).p2.p.y - triangleObjects.get(ins-1).p0.p.y) ) + (triangleObjects.get(ins-1).p2.p.x * (triangleObjects.get(ins-1).p0.p.y - triangleObjects.get(ins-1).p1.p.y)) ) / 2);
   
    return area;   
}
   
public float slope(float x1, float y1, float x2, float y2){
  
  return (y2 - y1) / (x2 - x1);
  
}


public float circleArea(int ins)
{
    return PI * sq(circleRadius(ins));

}

public float circleRadius(int ins)
{
  return circleObjects.get(ins-1).p0.distance(circleObjects.get(ins-1).p1);
  
}

public void printResults()
{
  JSONObject json;
  int ins = 0;
  
  json = new JSONObject();
  
  JSONArray jsonArr = new JSONArray();

  for (int i = 1; i < objMode2.size()+1; i++)
  {
      json = new JSONObject();
      ins = 0;
      
      if (objMode2.get(i-1) == "Point")
      {
        ins = 0;
        for (int j = 0; j < i; j++)
          if (objMode2.get(j) == "Point")
            ins++;

         json.setInt("id", i);
         json.setString("type", "Point");
         
         json.setFloat("x", pointObjects.get(ins-1).p.x);
         json.setFloat("y", pointObjects.get(ins-1).p.y);
         
         jsonArr.append(json);
   
       }
 
      if (objMode2.get(i-1) == "Line")
      {
        ins = 0;
        for (int j = 0; j < i; j++)
          if (objMode2.get(j) == "Line")
            ins++;

         json.setInt("id", i);
         json.setString("type", "Line");
         json.setFloat("x1", lineObjects.get(ins-1).p0.p.x);
         json.setFloat("y1", lineObjects.get(ins-1).p0.p.y);      
         json.setFloat("x2", lineObjects.get(ins-1).p1.p.x);
         json.setFloat("y2", lineObjects.get(ins-1).p1.p.y);
         
         jsonArr.append(json);
   
       }    
    
      if (objMode2.get(i-1) == "Segment")
      {
        ins = 0;
        for (int j = 0; j < i; j++)
          if (objMode2.get(j) == "Segment")
            ins++;

         json.setInt("id", i);
         json.setString("type", "Segment");
         
         json.setFloat("x1", segmentObjects.get(ins-1).p0.p.x);
         json.setFloat("y1", segmentObjects.get(ins-1).p0.p.y);      
         json.setFloat("x2", segmentObjects.get(ins-1).p1.p.x);
         json.setFloat("y2", segmentObjects.get(ins-1).p1.p.y);
         
         jsonArr.append(json);
   
       } 
    
      if (objMode2.get(i-1) == "Curve")
      {
        ins = 0;
        for (int j = 0; j < i; j++)
          if (objMode2.get(j) == "Curve")
            ins++;

         json.setInt("id", i);
         json.setString("type", "Curve");
         
          for (int k = 0; k < curveObjects.get(ins-1).p.size(); k++)
          {        
              json.setFloat("x" + (k+1), curveObjects.get(ins-1).p.get(k).p.x);
              json.setFloat("y" + (k+1), curveObjects.get(ins-1).p.get(k).p.y);           
          }
         
         jsonArr.append(json);
   
       }     
    
      if (objMode2.get(i-1) == "Ellipse")
      {
        ins = 0;
        for (int j = 0; j < i; j++)
          if (objMode2.get(j) == "Ellipse")
            ins++;

         json.setInt("id", i);
         json.setString("type", "Ellipse");
         
         json.setFloat("x1", ellipseObjects.get(ins-1).p0.p.x);
         json.setFloat("y1", ellipseObjects.get(ins-1).p0.p.y);      
         json.setFloat("x2", ellipseObjects.get(ins-1).p1.p.x);
         json.setFloat("y2", ellipseObjects.get(ins-1).p1.p.y);
         json.setFloat("x3", ellipseObjects.get(ins-1).p2.p.x);
         json.setFloat("y3", ellipseObjects.get(ins-1).p2.p.y);
         
         jsonArr.append(json);
   
       }     
    
      if (objMode2.get(i-1) == "Circle")
      {
        ins = 0;
        for (int j = 0; j < i; j++)
          if (objMode2.get(j) == "Circle")
            ins++;

         json.setInt("id", i);
         json.setString("type", "Circle");
         
         json.setFloat("x1", circleObjects.get(ins-1).p0.p.x);
         json.setFloat("y1", circleObjects.get(ins-1).p0.p.y);      
         json.setFloat("x2", circleObjects.get(ins-1).p1.p.x);
         json.setFloat("y2", circleObjects.get(ins-1).p1.p.y);
         
         jsonArr.append(json);
   
       } 
    
    
      if (objMode2.get(i-1) == "Polygon")
      {
        ins = 0;
        for (int j = 0; j < i; j++)
          if (objMode2.get(j) == "Polygon")
            ins++;

         json.setInt("id", i);
         json.setString("type", "Polygon");
         
          for (int k = 0; k < polygonObjects.get(ins-1).p.size(); k++)
          {        
              json.setFloat("x" + (k+1), polygonObjects.get(ins-1).p.get(k).p.x);
              json.setFloat("y" + (k+1), polygonObjects.get(ins-1).p.get(k).p.y);           
          }

         
         jsonArr.append(json);
   
       }     
    
      if (objMode2.get(i-1) == "Triangle")
      {
        ins = 0;
        for (int j = 0; j < i; j++)
          if (objMode2.get(j) == "Triangle")
            ins++;

         json.setInt("id", i);
         json.setString("type", "Triangle");
         
         json.setFloat("x1", triangleObjects.get(ins-1).p0.p.x);
         json.setFloat("y1", triangleObjects.get(ins-1).p0.p.y);      
         json.setFloat("x2", triangleObjects.get(ins-1).p1.p.x);
         json.setFloat("y2", triangleObjects.get(ins-1).p1.p.y);
         json.setFloat("x3", triangleObjects.get(ins-1).p2.p.x);
         json.setFloat("y3", triangleObjects.get(ins-1).p2.p.y);

                 
         jsonArr.append(json);
   
       }     
    
    
    
  }






  saveJSONArray(jsonArr, "data/objects.json");
  
}
