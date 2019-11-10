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

///////////////////////////////        POINT COMPARISONS         ///////////////////////////////         



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

    // COMPARING POINT - LINE
    if (lineObjects.size() > 0) 
      for (int j = 0; j < lineObjects.size(); j++){


            distances.clear();
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y);      
            distances.append(distance);
      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Line")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Line");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
      }    
    
    
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
      
      
      // COMPARING POINT - TRIANGLE
    if (triangleObjects.size() > 0) 
      for (int j = 0; j < triangleObjects.size(); j++){


            distances.clear();
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p1.p.y);      
            distances.append(distance);
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p2.p.y);      
            distances.append(distance);
      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Triangle")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Triangle");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());      
      
      }
      
      
      // COMPARING POINT - ELLIPSE
    if (ellipseObjects.size() > 0) 
      for (int j = 0; j < ellipseObjects.size(); j++){


            distances.clear();
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y);
            distances.append(distance);       

      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Ellipse")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Ellipse");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", 0);      
      
      }      

      
      // COMPARING POINT - CIRCLE
    if (circleObjects.size() > 0) 
      for (int j = 0; j < circleObjects.size(); j++){


            distances.clear();
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y);
            distances.append(distance);       

      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Circle")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Circle");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", 0);      
      
      }         
      

      // COMPARING POINT - POLYGON
    if (polygonObjects.size() > 0) 
      for (int j = 0; j < polygonObjects.size(); j++){

        distances.clear();
        for (int m=0; m < polygonObjects.get(j).p.size(); m++)
        {
          distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
        }
    
      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Polygon")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Polygon");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());      
      
      }           
      
      
      // COMPARING POINT - CURVE
    if (curveObjects.size() > 0) 
      for (int j = 0; j <curveObjects.size(); j++){

        distances.clear();
        for (int m=0; m < curveObjects.get(j).p.size(); m++)
        {
          distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
        }
    
      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());      
      
      }             
    }
      
///////////////////////////////        LINE COMPARISONS         ///////////////////////////////               
      
      
///////////////////////////////        SEGMENT COMPARISONS         ///////////////////////////////               
     if (objMode2.get(focusObject-1) == "Segment")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Segment")
          ins++;
          
    // COMPARING SEGMENT - POINT
    if (pointObjects.size() > 0) 
      for (int j = 0; j < pointObjects.size(); j++){


            distances.clear();
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
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
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
      }      
      
      
     // COMPARING SEGMENT - LINE
    if (lineObjects.size() > 0) 
      for (int j = 0; j < lineObjects.size(); j++){


            distances.clear();
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.x);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.x);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.x);
            distances.append(distance);
            
            
      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Line")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Line");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
      }       
  
     // COMPARING SEGMENT - SEGMENT
    if (segmentObjects.size() > 0) 
      for (int j = 0; j < segmentObjects.size(); j++){
          if (j != ins-1)
          {

            distances.clear();
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.x);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.x);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.x);
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
      }       
  
     // COMPARING SEGMENT - CURVE
    if (curveObjects.size() > 0) 
      for (int j = 0; j < curveObjects.size(); j++){



            
        distances.clear();
        for (int m=0; m < curveObjects.get(j).p.size(); m++)
        {
          distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
          distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
          distances.append(distance);           
        }

                      
      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
      }       

     // COMPARING SEGMENT - POLYGON
    if (polygonObjects.size() > 0) 
      for (int j = 0; j < polygonObjects.size(); j++){


            distances.clear();
            
        distances.clear();
        for (int m=0; m < polygonObjects.get(j).p.size(); m++)
        {
          distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
          distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
          distances.append(distance);           
        }

                      
      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Polygon")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Polygon");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
      } 


    // COMPARING SEGMENT - ELLIPSE
    if (ellipseObjects.size() > 0) 
      for (int j = 0; j < ellipseObjects.size(); j++){


            distances.clear();
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, ellipseObjects.get(j).p1.p.x,ellipseObjects.get(j).p1.p.y);
            distances.append(distance);
      
            TableRow newRow = table.addRow();
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Ellipse")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Ellipse");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
      }      

//////////////// REPAIR ALL ABOVE

     // COMPARING SEGMENT - TRIANGLE
    if (triangleObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){


            
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);  
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);              

     
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Triangle")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Triangle");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
            }
      }    


    // COMPARING SEGMENT - CIRCLE
    if (circleObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < circleObjects.size(); j++){


            
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, circleObjects.get(j).p1.p.x,circleObjects.get(j).p1.p.y);
            distances.append(distance);
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Circle")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
      
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Circle");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
            }
      } 


} // END SEGMENT COMPARISONS
      
      
      
///////////////////////////////        CURVE COMPARISONS         ///////////////////////////////               
     if (objMode2.get(focusObject-1) == "Curve")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Curve")
          ins++;      
      
      // COMPARING CURVE - POINT
    if (pointObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < pointObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y );
            distances.append(distance); 

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Point")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Point");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      }
                 
          
    // COMPARING CURVE - LINE
    if (lineObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y );
            distances.append(distance); 
            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y );
            distances.append(distance); 
            

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Line")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Line");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      }    
      
 
     // COMPARING CURVE - SEGMENT
    if (segmentObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y );
            distances.append(distance); 
            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y );
            distances.append(distance); 
            

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Segment")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Segment");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      } 
 
 
      // COMPARING CURVE - ELLIPSE
    if (ellipseObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < ellipseObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y );
            distances.append(distance); 

            

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Ellipse")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Ellipse");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      } 
 
 
       // COMPARING CURVE - CIRCLE
    if (circleObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < circleObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y );
            distances.append(distance); 

            

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Circle")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Circle");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      }     
      
      
     // COMPARING CURVE - TRIANGLE
    if (triangleObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y );
            distances.append(distance); 
            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p1.p.y );
            distances.append(distance); 
            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p2.p.y );
            distances.append(distance); 

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Triangle")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Triangle");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      }      
      
      
     // COMPARING CURVE - Polygon
    if (polygonObjects.size() > 0){
      distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(ins-1).p.size(); m++)
        {

          for (int n=0; n < polygonObjects.get(j).p.size();n++){
            
            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, polygonObjects.get(j).p.get(n).p.x,polygonObjects.get(j).p.get(n).p.y );
            distances.append(distance); 

          }

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Polygon")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Polygon");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      }         
      
      
      // COMPARING CURVE - CURVE
    if (curveObjects.size() > 0){
      distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){
        if (j != ins-1)
        {
        
        for (int m=0; m < curveObjects.get(ins-1).p.size(); m++)
        {

          for (int n=0; n < curveObjects.get(j).p.size();n++){
            
            distance = dist(curveObjects.get(ins-1).p.get(m).p.x,curveObjects.get(ins-1).p.get(m).p.y, curveObjects.get(j).p.get(n).p.x,curveObjects.get(j).p.get(n).p.y );
            distances.append(distance); 

          }

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Polygon")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Polygon");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      }
      }       
      
      
      
      
      
    } // END CURVE COMPARISONS
      
      // SAVE ALL ELEMENTS
      
      saveTable(table, "data/distancesFocus" + focusObject + ".csv");






    
    
          
    
    }
    
}
    

public void pointInsideObjects()
{
  
  
}


public void intersectionBetweenObjects()
{
  
  
  
  
  
  
  
}
