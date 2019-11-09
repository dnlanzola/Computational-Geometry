public void distanceBetweenObjects()
{
    int ins = 0;
    int insAux = 0;
    int varK = 0;
    float distance = 0;
    float minDistance = 0;
    float maxDistance = 0;
    FloatList distances = new FloatList();
    
    Table table = new Table();
    
    table.addColumn("id");
    table.addColumn("type");
    table.addColumn("min distance");
    table.addColumn("max distance");
    
    if (focusObject > 0){


    if (objMode2.get(focusObject-1) == "Point")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Point")
          ins++;
          
          

              
          
    // COMPARING POINT - POINT
    if (pointObjects.size() > 0) 
      for (int j = 0; j < pointObjects.size(); j++)
          if (j != ins-1)
          {
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.x);
            distances.append(distance);       
            TableRow newRow = table.addRow();
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Point")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
                
            
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Point");
            newRow.setFloat("min distance", distance);
            newRow.setFloat("max distance", 0);


          }
      minDistance = distances.min();
      maxDistance = distances.max();

    
    
    
    // COMPARING POINT - SEGMENT
    if (segmentObjects.size() > 0) 
      for (int j = 0; j < segmentObjects.size(); j++){


            distances.clear();
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y);      
            distances.append(distance);
      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Segment")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Segment");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
      }
      saveTable(table, "data/distancesFocus" + focusObject + ".csv");






    }
    
          
    
    }
    
}
    

public void pointInsideObjects()
{
  
  
}


public void intersectionBetweenObjects()
{
  
  
  
  
  
  
  
}
