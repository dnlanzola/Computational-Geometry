public void exportObjMode()
{
  Table table = new Table();
  table.addColumn("id");
  table.addColumn("type");
  
  for (int i = 0; i < objMode2.size(); i++)
  {
          TableRow newRow = table.addRow();
            newRow.setInt("id", i);
            newRow.setString("type", objMode2.get(i));    
  }
  
    saveTable(table, "data/objMode.csv");
  
}


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
    if (pointObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < pointObjects.size(); j++){
          if (j != ins-1)
          {
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.x);
            distances.append(distance);       
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Point")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
                
          
      
      if (distances.size() != 0){
          TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Point");
            newRow.setFloat("min distance", distance);
            newRow.setFloat("max distance", 0);
    }  
    
  }

}


          }
      //minDistance = distances.min();
      //maxDistance = distances.max();

    // COMPARING POINT - LINE
    if (lineObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){


            
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y);      
            distances.append(distance);
      
           
            
            
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
    
    
    // COMPARING POINT - SEGMENT
    if (segmentObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){


            
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y);      
            distances.append(distance);
      
            
            
            
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
      
      
      // COMPARING POINT - TRIANGLE
    if (triangleObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){


            
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p1.p.y);      
            distances.append(distance);
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p2.p.y);      
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
      
      
      // COMPARING POINT - ELLIPSE
    if (ellipseObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < ellipseObjects.size(); j++){


            
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y);
            distances.append(distance);       

      
            
            
            
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
            newRow.setFloat("max distance", 0);      
      }
      }      

      
      // COMPARING POINT - CIRCLE
    if (circleObjects.size() > 0) {
       distances.clear();
      for (int j = 0; j < circleObjects.size(); j++){


           
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y);
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
            newRow.setFloat("max distance", 0);      
      }
      }         
      

      // COMPARING POINT - POLYGON
    if (polygonObjects.size() > 0) {
       distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){

       
        for (int m=0; m < polygonObjects.get(j).p.size(); m++)
        {
          distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
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
      
      
      // COMPARING POINT - CURVE
    if (curveObjects.size() > 0) {
       distances.clear();
      for (int j = 0; j <curveObjects.size(); j++){

       
        for (int m=0; m < curveObjects.get(j).p.size(); m++)
        {
          distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
      TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());      
      }
      }             
    }
      
///////////////////////////////        LINE COMPARISONS         ///////////////////////////////               

     if (objMode2.get(focusObject-1) == "Line")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Line")
          ins++;
          
    // COMPARING LINE - POINT
    if (pointObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < pointObjects.size(); j++){


            
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p1.p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
            distances.append(distance);
      
            
            
            
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
      
      
     // COMPARING LINE - LINE
    if (lineObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){
          if (j != ins-1)
          {

            
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p1.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.x);
            distances.append(distance);
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.x);
            distances.append(distance);
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p1.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.x);
            distances.append(distance);
            
            
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Line")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  

          if (distances.size() != 0){
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Line");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());

              }
      }  
      }
      }       
  
     // COMPARING LINE - SEGMENT
    if (segmentObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){


            
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.x);
            distances.append(distance);
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.x);
            distances.append(distance);
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.x);
            distances.append(distance);
            
            
      
           
            
            
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
  
     // COMPARING LINE - CURVE
    if (curveObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){



            
        
        for (int m=0; m < curveObjects.get(j).p.size(); m++)
        {
          distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
          distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p1.p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
          distances.append(distance);           
        }

                      
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
      TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
    }  
    }       

     // COMPARING LINE - POLYGON
    if (polygonObjects.size() > 0) {
       distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){


           
            
       
        for (int m=0; m < polygonObjects.get(j).p.size(); m++)
        {
          distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
          distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p1.p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
          distances.append(distance);           
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


    // COMPARING LINE - ELLIPSE
    if (ellipseObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < ellipseObjects.size(); j++){


            
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p1.p.y, ellipseObjects.get(j).p1.p.x,ellipseObjects.get(j).p1.p.y);
            distances.append(distance);
      
            
            
            
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



     // COMPARING  LINE - TRIANGLE
    if (triangleObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){


            
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p0.p.x);
            distances.append(distance);  
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p0.p.x);
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


    // COMPARING LINE - CIRCLE
    if (circleObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < circleObjects.size(); j++){


            
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p1.p.y, circleObjects.get(j).p1.p.x,circleObjects.get(j).p1.p.y);
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


} // END LINE COMPARISONS      
      
      
      
      
      
      
      
      
      
///////////////////////////////        SEGMENT COMPARISONS         ///////////////////////////////               
     if (objMode2.get(focusObject-1) == "Segment")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Segment")
          ins++;
          
    // COMPARING SEGMENT - POINT
    if (pointObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < pointObjects.size(); j++){


            
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
            distances.append(distance);
      
            
            
            
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
      
      
     // COMPARING SEGMENT - LINE
    if (lineObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){


            
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.x);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.x);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.x);
            distances.append(distance);
            
            
      
            
            
            
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
  
     // COMPARING SEGMENT - SEGMENT
    if (segmentObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){
          if (j != ins-1)
          {

            
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.x);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.x);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.x);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.x);
            distances.append(distance);
            
            
      
           
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Segment")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
          }
      
        if (distances.size() != 0){
           TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Segment");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
      }  
      }
          
      }       
  
     // COMPARING SEGMENT - CURVE
    if (curveObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){



            
        
        for (int m=0; m < curveObjects.get(j).p.size(); m++)
        {
          distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
          distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
          distances.append(distance);           
        }

                      
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
      TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
    }  
    }       

     // COMPARING SEGMENT - POLYGON
    if (polygonObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){


            
            
        distances.clear();
        for (int m=0; m < polygonObjects.get(j).p.size(); m++)
        {
          distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
          distances.append(distance); 
          distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
          distances.append(distance);           
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


    // COMPARING SEGMENT - ELLIPSE
    if (ellipseObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < ellipseObjects.size(); j++){


            
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, ellipseObjects.get(j).p1.p.x,ellipseObjects.get(j).p1.p.y);
            distances.append(distance);
      
            
            
            
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
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    if (distances.size() != 0){
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());
    }
        }
      }
      }       
      
      
      
      
      
    } // END CURVE COMPARISONS
      



///////////////////////////////        POLYGON COMPARISONS         ///////////////////////////////               
     if (objMode2.get(focusObject-1) == "Polygon")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Polygon")
          ins++;      
      
      // COMPARING POLYGON - POINT
    if (pointObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < pointObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y );
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
                 
          
    // COMPARING POLYGON - LINE
    if (lineObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y );
            distances.append(distance); 
            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y );
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
      
 
     // COMPARING POLYGON - SEGMENT
    if (segmentObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y );
            distances.append(distance); 
            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y );
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
 
 
      // COMPARING POLYGON - ELLIPSE
    if (ellipseObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < ellipseObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y );
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
 
 
       // COMPARING POLYGON - CIRCLE
    if (circleObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < circleObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y );
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
      
      
     // COMPARING POLYGON - TRIANGLE
    if (triangleObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(ins-1).p.size(); m++)
        {

            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y );
            distances.append(distance); 
            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p1.p.y );
            distances.append(distance); 
            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p2.p.y );
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
      
      
     // COMPARING POLYGON - POLYGON
    if (polygonObjects.size() > 0){
      distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){
        if (j != ins-1)
        {
        
        for (int m=0; m < polygonObjects.get(ins-1).p.size(); m++)
        {

          for (int n=0; n < polygonObjects.get(j).p.size();n++){
            
            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, polygonObjects.get(j).p.get(n).p.x,polygonObjects.get(j).p.get(n).p.y );
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
        }
    if (distances.size() != 0){
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Polygon");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());   
    }
        }
      }         
      
      
      // COMPARING POLYGON - CURVE
    if (curveObjects.size() > 0){
      distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(ins-1).p.size(); m++)
        {

          for (int n=0; n < curveObjects.get(j).p.size();n++){
            
            distance = dist(polygonObjects.get(ins-1).p.get(m).p.x,polygonObjects.get(ins-1).p.get(m).p.y, curveObjects.get(j).p.get(n).p.x,curveObjects.get(j).p.get(n).p.y );
            distances.append(distance); 

          }

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        
      }
      }       
      
      
      
      
      
    } // END POLYGON COMPARISONS


      
      
///////////////////////////////        ELLIPSE COMPARISONS         ///////////////////////////////               
     if (objMode2.get(focusObject-1) == "Ellipse")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Ellipse")
          ins++;        
      
      // COMPARING ELLIPSE - POINT
    if (pointObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < pointObjects.size(); j++){


            
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,pointObjects.get(j).p.x,pointObjects.get(j).p.y );
            distances.append(distance);       

      
            
            
            
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
            newRow.setFloat("max distance", 0);      
      }
      }      
      
      
      
       // COMPARING ELLIPSE - LINE
    if (lineObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){


            
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y );
            distances.append(distance);       
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y );
            distances.append(distance);       

      
            
            
            
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
            newRow.setFloat("max distance", 0);      
      }
      }       
      

       // COMPARING ELLIPSE - SEGMENT
    if (segmentObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){


            
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y );
            distances.append(distance);       
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y );
            distances.append(distance);       

      
            
            
            
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
            newRow.setFloat("max distance", 0);      
      }
      }       
      
      
        // COMPARING ELLIPSE - CIRCLE
    if (circleObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < circleObjects.size(); j++){


            
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y );
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
            newRow.setFloat("max distance", 0);      
      }
      }         
      
          // COMPARING ELLIPSE - ELLIPSE
    if (ellipseObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < ellipseObjects.size(); j++){
        if (j != ins-1)
        {

            
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y );
            distances.append(distance);       
      

      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Ellipse")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
      
      if (distances.size() != 0){
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Ellipse");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", 0);    
      }
      }
      }  
    }      
      
      
       // COMPARING ELLIPSE - TRIANGLE
    if (triangleObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){


            
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y );
            distances.append(distance);       
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p1.p.y );
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
            newRow.setFloat("max distance", 0);      
      }
      }         
      
      

       // COMPARING ELLIPSE - CURVE
    if (curveObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(j).p.size(); m++)
        {

            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y );
            distances.append(distance); 

            

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      }  



       // COMPARING ELLIPSE - POLYGON
    if (polygonObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(j).p.size(); m++)
        {

            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y );
            distances.append(distance); 

            

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




} // END ELLIPSE COMPARISONS
      
      
 ///////////////////////////////        CIRCLE COMPARISONS         ///////////////////////////////               
     if (objMode2.get(focusObject-1) == "Circle")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Circle")
          ins++;        
      
      // COMPARING CIRCLE - POINT
    if (pointObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < pointObjects.size(); j++){


            
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,pointObjects.get(j).p.x,pointObjects.get(j).p.y );
            distances.append(distance);       

      
            
            
            
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
            newRow.setFloat("max distance", 0);      
      }
      }      
      
      
      
       // COMPARING CIRCLE - LINE
    if (lineObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){


            
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y );
            distances.append(distance);       
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y );
            distances.append(distance);       

      
            
            
            
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
            newRow.setFloat("max distance", 0);      
      }
      }       
      

       // COMPARING CIRCLE - SEGMENT
    if (segmentObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){


            
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y );
            distances.append(distance);       
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y );
            distances.append(distance);       

      
            
            
            
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
            newRow.setFloat("max distance", 0);      
      }
      }       
      
      
        // COMPARING CIRCLE - CIRCLE
    if (circleObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < circleObjects.size(); j++){
        if (j != ins-1)
        {

            
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y );
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
      
      
      if (distances.size() != 0){
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Circle");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", 0);  
      }
      }
      }
      }         
      
          // COMPARING CIRCLE - ELLIPSE
    if (ellipseObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < ellipseObjects.size(); j++){


            
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y );
            distances.append(distance);       
      

      
            
            
            
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
            newRow.setFloat("max distance", 0);      
      
      }
    }      
      
      
       // COMPARING CIRCLE - TRIANGLE
    if (triangleObjects.size() > 0) {
    distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){


            
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y );
            distances.append(distance);       
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p1.p.y );
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
            newRow.setFloat("max distance", 0);      
      }
      }         
      
      

       // COMPARING CIRCLE - CURVE
    if (curveObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(j).p.size(); m++)
        {

            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y );
            distances.append(distance); 

            

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      }  



       // COMPARING CIRCLE - POLYGON
    if (polygonObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(j).p.size(); m++)
        {

            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y );
            distances.append(distance); 

            

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




} // END CIRCLE COMPARISONS     
      
      
      
///////////////////////////////        TRIANGLE COMPARISONS         ///////////////////////////////         



    if (objMode2.get(focusObject-1) == "Triangle")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Triangle")
          ins++;      
      
      
      // COMPARING TRIANGLE - POINT
    if (pointObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < pointObjects.size(); j++){


            
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
            distances.append(distance);      
            
      
            
            
            
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

  

      // COMPARING TRIANGLE - LINE
    if (lineObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){


            
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y);
            distances.append(distance);              
      
            
            
            
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


      // COMPARING TRIANGLE - SEGMENT
    if (segmentObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){


            
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y);
            distances.append(distance);              
      
            
            
            
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


      // COMPARING TRIANGLE - TRIANGLE
    if (triangleObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){
       if (j != ins-1)
        {

            
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p1.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p1.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p1.p.y);
            distances.append(distance);              
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p1.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p1.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p1.p.y);
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

      if (distances.size() != 0){
      TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Triangle");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());    
      }
      }            
      }
      
      } 



      // COMPARING TRIANGLE - CIRCLE
    if (circleObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < circleObjects.size(); j++){


            
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y,circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, circleObjects.get(j).p0.p.x,circleObjects.get(j).p0.p.y);
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

      // COMPARING TRIANGLE - Ellipse
    if (ellipseObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < ellipseObjects.size(); j++){


            
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y,ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, ellipseObjects.get(j).p0.p.x,ellipseObjects.get(j).p0.p.y);
            distances.append(distance);      
         
      
            
            
            
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



     // COMPARING TRIANGLE - CURVE
    if (curveObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){

        
        for (int m=0; m < curveObjects.get(j).p.size(); m++)
        {

            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
            distances.append(distance); 
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
            distances.append(distance); 
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, curveObjects.get(j).p.get(m).p.x,curveObjects.get(j).p.get(m).p.y);
            distances.append(distance); 

        }
    
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Curve")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Curve");
            newRow.setFloat("min distance", distances.min());
            newRow.setFloat("max distance", distances.max());     
        }
      }



     // COMPARING TRIANGLE - POLYGON
    if (polygonObjects.size() > 0){
    distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){

        
        for (int m=0; m < polygonObjects.get(j).p.size(); m++)
        {

            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
            distances.append(distance); 
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
            distances.append(distance); 
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, polygonObjects.get(j).p.get(m).p.x,polygonObjects.get(j).p.get(m).p.y);
            distances.append(distance); 

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




} // END TRIANGLE COMPARISONS
    
    
    
    
      
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
