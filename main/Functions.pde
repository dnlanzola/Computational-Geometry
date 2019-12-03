import java.text.ParseException;
import java.util.concurrent.TimeUnit;

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
    long startTime = System.nanoTime();
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
            distance = dist(pointObjects.get(ins-1).p.x,pointObjects.get(ins-1).p.y, pointObjects.get(j).p.x,pointObjects.get(j).p.y);
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


            
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p0.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p0.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p1.p.x,triangleObjects.get(j).p0.p.y);
            distances.append(distance);  
            distance = dist(lineObjects.get(ins-1).p1.p.x,lineObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p0.p.y);
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


            
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, lineObjects.get(j).p0.p.x,lineObjects.get(j).p0.p.y);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, lineObjects.get(j).p1.p.x,lineObjects.get(j).p1.p.y);
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

            
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y);
            distances.append(distance);       
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p0.p.x,segmentObjects.get(j).p0.p.y);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p0.p.x,segmentObjects.get(ins-1).p0.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y);
            distances.append(distance);
            distance = dist(segmentObjects.get(ins-1).p1.p.x,segmentObjects.get(ins-1).p1.p.y, segmentObjects.get(j).p1.p.x,segmentObjects.get(j).p1.p.y);
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
            distance = dist(ellipseObjects.get(ins-1).p0.p.x,ellipseObjects.get(ins-1).p0.p.y,triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p2.p.y );
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
            distance = dist(circleObjects.get(ins-1).p0.p.x,circleObjects.get(ins-1).p0.p.y,triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p2.p.y );
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
            distance = dist(triangleObjects.get(ins-1).p0.p.x,triangleObjects.get(ins-1).p0.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p2.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p1.p.x,triangleObjects.get(ins-1).p1.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p2.p.y);
            distances.append(distance);      
            distance = dist(triangleObjects.get(ins-1).p2.p.x,triangleObjects.get(ins-1).p2.p.y, triangleObjects.get(j).p2.p.x,triangleObjects.get(j).p2.p.y);
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



      long finishTime = System.nanoTime();

      println("Runtime: " + (finishTime - startTime));
    
    
          
    
    }
    
}
    

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
  ///////////////////////////////        INTERSECTION BETWEEN OBJECTS         ///////////////////////////////    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////








public void intersectionBetweenObjects()
{
    long startTime = System.nanoTime();
    int ins = 0;
    int insAux = 0;
    int varK = 0;
    float distance = 0;
    float minDistance = 0;
    float maxDistance = 0;
    FloatList distances = new FloatList();
    Boolean interResult = false;
    
    Table table = new Table();
    
    table.addColumn("id");
    table.addColumn("type");
    table.addColumn("intersection");

  ///////////////////////////////        SEGMENT COMPARISONS         ///////////////////////////////               
     
    interResult = false;
    if (objMode2.get(focusObject-1) == "Segment")
    {
      println("It is segment");
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Segment")
          ins++;
              
      
      
       // COMPARING SEGMENT - LINE
       if (lineObjects.size() > 0) 
       {
          for (int j = 0; j < lineObjects.size(); j++)
          {
            if (segmentObjects.get(ins-1).intersectionTest(lineObjects.get(j).toSeg()))
                interResult = true;
            else
                interResult = false;

            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++)
            {
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
            if (interResult == true)
               newRow.setString("intersection", "true");
            if (interResult == false)
               newRow.setString("intersection", "false");
         }  
      }       
  
     // COMPARING SEGMENT - SEGMENT
       interResult = false;
       if (segmentObjects.size() > 0) 
       {
          for (int j = 0; j < segmentObjects.size(); j++)
          {
              if (j != ins-1)
              {
            
                  if (segmentObjects.get(ins-1).intersectionTest(segmentObjects.get(j)))
                      interResult = true;
                  else
                      interResult = false;            

                  insAux = 0;
                  for (int k = 0; k < objMode2.size(); k++)
                  {
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
                  if (interResult == true)
                    newRow.setString("intersection", "true");
                  if (interResult == false)
                      newRow.setString("intersection", "false");
                }
            }
          
        }       
  
 
     // COMPARING SEGMENT - TRIANGLE
     interResult = false;
    if (triangleObjects.size() > 0) 
    {
      for (int j = 0; j < triangleObjects.size(); j++)
      {
            Segment t1 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p1);
            Segment t2 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p2);
            Segment t3 = new Segment (triangleObjects.get(j).p1, triangleObjects.get(j).p2);
            
            if (segmentObjects.get(ins-1).intersectionTest(t1) || segmentObjects.get(ins-1).intersectionTest(t2) || segmentObjects.get(ins-1).intersectionTest(t3))
                interResult = true;
            else
                interResult = false;
            
        
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++)
            {
              if (objMode2.get(k) == "Triangle")
                insAux++;
              if (insAux == j+1)
              {
                varK = k;
                break;
              }
            }  
      
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Triangle");
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
      }  
    }       
  
     // COMPARING SEGMENT - CURVE
    interResult = false;
    if (curveObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){



        for (int m=0; m < curveObjects.get(j).p.size()-1; m++)
        {

          Point p1 = new Point(  curveObjects.get(j).p.get(m).p.x,  curveObjects.get(j).p.get(m).p.y);
          Point p2 = new Point ( curveObjects.get(j).p.get(m+1).p.x,  curveObjects.get(j).p.get(m+1).p.x);
          
          Segment c1 = new Segment (p1,p2);
          
          if (segmentObjects.get(ins-1).intersectionTest(c1) && interResult == false)
            interResult = true;
          
          
          
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    }  
    }
    

     // COMPARING SEGMENT - POLYGON
     interResult = false;
    if (polygonObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){


        for (int m=0; m < polygonObjects.get(j).bdry.size(); m++)
        {
          
              if (segmentObjects.get(ins-1).intersectionTest(polygonObjects.get(j).bdry.get(m)) && interResult == false)
                interResult = true;
        
          
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
      
    }
  } 
  saveTable(table, "data/intersectionFocus" + focusObject + ".csv");
    }
  
   ///////////////////////////////        LINE COMPARISONS         ///////////////////////////////               
     
     interResult = false;
     if (objMode2.get(focusObject-1) == "Line")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Line")
          ins++;
              
      
      
     // COMPARING LINE - LINE
    if (lineObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){
          if (j != ins-1)
          {
            
            if (lineObjects.get(ins-1).toSeg().intersectionTest(lineObjects.get(j).toSeg()))
                interResult = true;
            else
                interResult = false;
            
        
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
  }  
  }  
    }                   
    
  
     // COMPARING LINE - SEGMENT
     interResult = false;
    if (segmentObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){

            
            if (lineObjects.get(ins-1).toSeg().intersectionTest(segmentObjects.get(j)))
                interResult = true;
            else
                interResult = false;            
      
           
            
            
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
       } 
      }
          
             
  
     // COMPARING LINE - TRIANGLE
     interResult = false;
    if (triangleObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){

            
            Segment t1 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p1);
            Segment t2 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p2);
            Segment t3 = new Segment (triangleObjects.get(j).p1, triangleObjects.get(j).p2);
            
        
            if (lineObjects.get(ins-1).toSeg().intersectionTest(t1) || lineObjects.get(ins-1).toSeg().intersectionTest(t2) || lineObjects.get(ins-1).toSeg().intersectionTest(t3))
                interResult = true;
            else
                interResult = false;
            
        
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    }  
    }       


     // COMPARING LINE - CURVE
    interResult = false;
    if (curveObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){
        interResult = false;


        for (int m=0; m < curveObjects.get(j).p.size()-1; m++)
        {

          Point p1 = new Point(  curveObjects.get(j).p.get(m).p.x,  curveObjects.get(j).p.get(m).p.y);
          Point p2 = new Point ( curveObjects.get(j).p.get(m+1).p.x,  curveObjects.get(j).p.get(m+1).p.x);
          
          Segment c1 = new Segment (p1,p2);
          
          if (lineObjects.get(ins-1).toSeg().intersectionTest(c1) && interResult == false)
            interResult = true;
          
          
          
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    }  
    }     

 




     // COMPARING LINE - POLYGON
     interResult = false;
    if (polygonObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){
        interResult = false;

        for (int m=0; m < polygonObjects.get(j).bdry.size(); m++)
        {
          
              if (lineObjects.get(ins-1).toSeg().intersectionTest(polygonObjects.get(j).bdry.get(m)) && interResult == false)
                interResult = true;
        
          
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
      
    }
  }  


 saveTable(table, "data/intersectionFocus" + focusObject + ".csv");

} // END OBJMODE = LINE

   ///////////////////////////////        TRIANGLE COMPARISONS         ///////////////////////////////               
     
     interResult = false;
     if (objMode2.get(focusObject-1) == "Triangle")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Triangle")
          ins++;
          
          
     // COMPARING TRIANGLE - LINE
     interResult = false;
    if (lineObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){

            
            Segment t1 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p1);
            Segment t2 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p2);
            Segment t3 = new Segment (triangleObjects.get(ins-1).p1, triangleObjects.get(ins-1).p2);
            
        
            if (lineObjects.get(j).toSeg().intersectionTest(t1) || lineObjects.get(j).toSeg().intersectionTest(t2) || lineObjects.get(j).toSeg().intersectionTest(t3))
                interResult = true;
            else
                interResult = false;
            
        
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    }  
    }           
          
 
     // COMPARING TRIANGLE - SEGMENT
     interResult = false;
    if (segmentObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){

            
            Segment t1 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p1);
            Segment t2 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p2);
            Segment t3 = new Segment (triangleObjects.get(ins-1).p1, triangleObjects.get(ins-1).p2);
            
        
            if (segmentObjects.get(j).intersectionTest(t1) || segmentObjects.get(j).intersectionTest(t2) || segmentObjects.get(j).intersectionTest(t3))
                interResult = true;
            else
                interResult = false;
            
        
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    }  
    }            
          
       // COMPARING TRIANGLE - TRIANGLE
     interResult = false;
    if (triangleObjects.size() > 0) {

      for (int j = 0; j < triangleObjects.size(); j++){
          if (j != ins-1)
          {
            
            Segment t1 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p1);
            Segment t2 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p2);
            Segment t3 = new Segment (triangleObjects.get(ins-1).p1, triangleObjects.get(ins-1).p2);
            
            Segment t4 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p1);
            Segment t5 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p2);
            Segment t6 = new Segment (triangleObjects.get(j).p1, triangleObjects.get(j).p2);
            

            
        
            if ( t1.intersectionTest(t4) || t1.intersectionTest(t5) || t1.intersectionTest(t6) ||
            t2.intersectionTest(t4) || t2.intersectionTest(t5) || t2.intersectionTest(t6) ||
            t3.intersectionTest(t4) || t3.intersectionTest(t5) || t3.intersectionTest(t6))
            
                interResult = true;
            else
                interResult = false;
            
        
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    } 
      }
    }          
          
          
     // COMPARING TRIANGLE - CURVE
    interResult = false;
    if (curveObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < curveObjects.size(); j++){
        interResult = false;


        for (int m=0; m < curveObjects.get(j).p.size()-1; m++)
        {

          Point p1 = new Point(  curveObjects.get(j).p.get(m).p.x,  curveObjects.get(j).p.get(m).p.y);
          Point p2 = new Point ( curveObjects.get(j).p.get(m+1).p.x,  curveObjects.get(j).p.get(m+1).p.x);
          
          Segment c1 = new Segment (p1,p2);
          
            Segment t1 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p1);
            Segment t2 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p2);
            Segment t3 = new Segment (triangleObjects.get(ins-1).p1, triangleObjects.get(ins-1).p2);          
          
          
          
          if (    ( t1.intersectionTest(c1) ||  t2.intersectionTest(c1) || t3.intersectionTest(c1) )        
              && interResult == false )
            interResult = true;
          
          
          
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    }  
    }     
          
          
     // COMPARING TRIANGLE - POLYGON
     interResult = false;
    if (polygonObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < polygonObjects.size(); j++){
        interResult = false;

        for (int m=0; m < polygonObjects.get(j).bdry.size(); m++)
        {
          
            Segment t1 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p1);
            Segment t2 = new Segment (triangleObjects.get(ins-1).p0, triangleObjects.get(ins-1).p2);
            Segment t3 = new Segment (triangleObjects.get(ins-1).p1, triangleObjects.get(ins-1).p2);             
          
          
              if (  (  t1.intersectionTest(polygonObjects.get(j).bdry.get(m)) || t2.intersectionTest(polygonObjects.get(j).bdry.get(m)) || t3.intersectionTest(polygonObjects.get(j).bdry.get(m)) )
              
              && interResult == false)
                interResult = true;
        
          
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
      
    }
  }            

          
     saveTable(table, "data/intersectionFocus" + focusObject + ".csv");          
          
          
    } // END OBJMODE = TRIANGLE





   ///////////////////////////////        POLYGON COMPARISONS         ///////////////////////////////               
     
     interResult = false;
     if (objMode2.get(focusObject-1) == "Polygon")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Polygon")
          ins++;
              

     // COMPARING POLYGON - LINE
     interResult = false;
    if (lineObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){
        interResult = false;

        for (int m=0; m < polygonObjects.get(ins-1).bdry.size(); m++)
        {
          
              if (lineObjects.get(j).toSeg().intersectionTest(polygonObjects.get(ins-1).bdry.get(m)) && interResult == false)
                interResult = true;
        
          
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
      
    }
  }  

  

     // COMPARING POLYGON - SEGMENT
     interResult = false;
    if (segmentObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){
        interResult = false;

        for (int m=0; m < polygonObjects.get(ins-1).bdry.size(); m++)
        {
          
              if (segmentObjects.get(j).intersectionTest(polygonObjects.get(ins-1).bdry.get(m)) && interResult == false)
                interResult = true;
        
          
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
      
    }
  } 




     // COMPARING POLYGON - TRIANGLE
     interResult = false;
    if (triangleObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){
        interResult = false;

        for (int m=0; m < polygonObjects.get(ins-1).bdry.size(); m++)
        {
          
            Segment t1 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p1);
            Segment t2 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p2);
            Segment t3 = new Segment (triangleObjects.get(j).p1, triangleObjects.get(j).p2);             
          
          
              if (  (  t1.intersectionTest(polygonObjects.get(ins-1).bdry.get(m)) || t2.intersectionTest(polygonObjects.get(ins-1).bdry.get(m)) || t3.intersectionTest(polygonObjects.get(ins-1).bdry.get(m)) )
              
              && interResult == false)
                interResult = true;
        
          
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
      
    }
  }   


     // COMPARING POLYGON - POLYGON
    if (polygonObjects.size() > 0){
        
      for (int j = 0; j < polygonObjects.size(); j++){
        interResult = false;
        if (j != ins-1)
        {
        
        for (int m=0; m < polygonObjects.get(ins-1).bdry.size(); m++)
        {

          for (int n=0; n < polygonObjects.get(j).bdry.size();n++){
            
             if (   polygonObjects.get(j).bdry.get(n).intersectionTest(polygonObjects.get(ins-1).bdry.get(m)) && interResult == false)
                interResult = true;
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
        }
        }
      }  


     // COMPARING POLYGON - CURVE
     interResult = false;
    if (curveObjects.size() > 0) {

      for (int j = 0; j < curveObjects.size(); j++){
        interResult = false;

        for (int m=0; m < polygonObjects.get(ins-1).bdry.size(); m++)
        {
          for (int n=0; n < curveObjects.get(j).p.size()-1;n++){
              
              Point p1 = new Point(  curveObjects.get(j).p.get(n).p.x,  curveObjects.get(j).p.get(n).p.y);
              Point p2 = new Point ( curveObjects.get(j).p.get(n+1).p.x,  curveObjects.get(j).p.get(n+1).p.x);
              
              Segment c1 = new Segment (p1,p2);
            
            
            if (c1.intersectionTest(polygonObjects.get(ins-1).bdry.get(m)) && interResult == false)
                interResult = true;
        
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
      
    }
  } 




     saveTable(table, "data/intersectionFocus" + focusObject + ".csv");  

    } // END OBJMODE = POLYGON

  ///////////////////////////////        SEGMENT COMPARISONS         ///////////////////////////////               
     
    interResult = false;
    if (objMode2.get(focusObject-1) == "Curve")
    {
      println("It is Curve");
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Curve")
          ins++;




     // COMPARING CURVE - SEGMENT
    interResult = false;
    if (segmentObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < segmentObjects.size(); j++){



        for (int m=0; m < curveObjects.get(ins-1).p.size()-1; m++)
        {

          Point p1 = new Point(  curveObjects.get(ins-1).p.get(m).p.x,  curveObjects.get(ins-1).p.get(m).p.y);
          Point p2 = new Point ( curveObjects.get(ins-1).p.get(m+1).p.x,  curveObjects.get(ins-1).p.get(m+1).p.x);
          
          Segment c1 = new Segment (p1,p2);
          
          if (segmentObjects.get(j).intersectionTest(c1) && interResult == false)
            interResult = true;

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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    }  
    }


     // COMPARING CURVE - LINE
    interResult = false;
    if (lineObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < lineObjects.size(); j++){



        for (int m=0; m < curveObjects.get(ins-1).p.size()-1; m++)
        {

          Point p1 = new Point(  curveObjects.get(ins-1).p.get(m).p.x,  curveObjects.get(ins-1).p.get(m).p.y);
          Point p2 = new Point ( curveObjects.get(ins-1).p.get(m+1).p.x,  curveObjects.get(ins-1).p.get(m+1).p.x);
          
          Segment c1 = new Segment (p1,p2);
          
          if (lineObjects.get(j).toSeg().intersectionTest(c1) && interResult == false)
            interResult = true;

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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    }  
    }




     // COMPARING CURVE - TRIANGLE
    interResult = false;
    if (triangleObjects.size() > 0) {
      distances.clear();
      for (int j = 0; j < triangleObjects.size(); j++){



        for (int m=0; m < curveObjects.get(ins-1).p.size()-1; m++)
        {

          Point p1 = new Point(  curveObjects.get(ins-1).p.get(m).p.x,  curveObjects.get(ins-1).p.get(m).p.y);
          Point p2 = new Point ( curveObjects.get(ins-1).p.get(m+1).p.x,  curveObjects.get(ins-1).p.get(m+1).p.x);
          
          Segment c1 = new Segment (p1,p2);
          
            Segment t1 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p1);
            Segment t2 = new Segment (triangleObjects.get(j).p0, triangleObjects.get(j).p2);
            Segment t3 = new Segment (triangleObjects.get(j).p1, triangleObjects.get(j).p2);             
          
          
              if (  (  t1.intersectionTest(c1) || t2.intersectionTest(c1) || t3.intersectionTest(c1) )
              
              && interResult == false)
                interResult = true;

        }                      

            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Tringle")
                insAux++;
              if (insAux == j+1){
                varK = k;
                break;
              }
            }  
      
      TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Triangle");
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
    }  
    }




     // COMPARING CURVE - POLYGON
     interResult = false;
    if (curveObjects.size() > 0) {

      for (int j = 0; j < curveObjects.size(); j++){
        interResult = false;

        for (int m=0; m < polygonObjects.get(j).bdry.size(); m++)
        {
          for (int n=0; n < curveObjects.get(ins-1).p.size()-1;n++){
              
              Point p1 = new Point(  curveObjects.get(ins-1).p.get(n).p.x,  curveObjects.get(ins-1).p.get(n).p.y);
              Point p2 = new Point ( curveObjects.get(ins-1).p.get(n+1).p.x,  curveObjects.get(ins-1).p.get(n+1).p.x);
              
              Segment c1 = new Segment (p1,p2);
            
            
            if (c1.intersectionTest(polygonObjects.get(j).bdry.get(m)) && interResult == false)
                interResult = true;
        
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
            if (interResult == true)
              newRow.setString("intersection", "true");
            if (interResult == false)
                newRow.setString("intersection", "false");
      
    }
  } 



     // COMPARING CURVE - POLYGON
     interResult = false;
    if (curveObjects.size() > 0) {

      for (int j = 0; j < curveObjects.size(); j++){
        interResult = false;
        if (j != ins-1)
        {
            for (int m=0; m < curveObjects.get(j).p.size()-1; m++)
            {
              for (int n=0; n < curveObjects.get(ins-1).p.size()-1;n++){
                  
                  Point p1 = new Point(  curveObjects.get(ins-1).p.get(n).p.x,  curveObjects.get(ins-1).p.get(n).p.y);
                  Point p2 = new Point ( curveObjects.get(ins-1).p.get(n+1).p.x,  curveObjects.get(ins-1).p.get(n+1).p.x);
                  
                  Segment c1 = new Segment (p1,p2);
 
                
                   Point p3 = new Point(  curveObjects.get(j).p.get(m).p.x,  curveObjects.get(j).p.get(m).p.y);
                  Point p4 = new Point ( curveObjects.get(j).p.get(m+1).p.x,  curveObjects.get(j).p.get(m+1).p.x);
                  
                  Segment c2 = new Segment (p3,p4);               
                
                
                
                if (c1.intersectionTest(c2) && interResult == false)
                    interResult = true;
            
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
                if (interResult == true)
                  newRow.setString("intersection", "true");
                if (interResult == false)
                    newRow.setString("intersection", "false");
        }
    }
  } 






     saveTable(table, "data/intersectionFocus" + focusObject + ".csv");  

    } // END OBJMODE = CURVE







} // END FUNCTION





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
  ///////////////////////////////        POINT INSIDE OBJECTS         ///////////////////////////////    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






public void pointInsideObjects()
{
    long startTime = System.nanoTime();
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
  
      if (objMode2.get(focusObject-1) == "Triangle")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Triangle")
          ins++;      
      
      
      // COMPARING TRIANGLE - POINT
    if (pointObjects.size() > 0) {
      distances.clear();
      for (int m = 0; m < pointObjects.size(); m++){
      boolean pointInside = false;  
        
        
        Polygon tPoly = triangleObjects.get(ins-1).toPoly();
        
     for (int i = 0, j = tPoly.p.size() - 1; i < tPoly.p.size(); j = i++) { 
        if (((tPoly.p.get(i).p.y > pointObjects.get(m).p.y) != (tPoly.p.get(j).p.y > pointObjects.get(m).p.y)) && 
        
        (pointObjects.get(m).p.x < (tPoly.p.get(j).p.x - tPoly.p.get(i).p.x)
        
        * (pointObjects.get(m).p.y - tPoly.p.get(i).p.y) / 
       
        (tPoly.p.get(j).p.y - tPoly.p.get(i).p.y) +
        
        tPoly.p.get(i).p.x))
          pointInside = !pointInside;
    }

            

            
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Point")
                insAux++;
              if (insAux == m+1){
                varK = k;
                break;
              }
            }  
      
      TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Point");
                if (pointInside == true)
                  newRow.setString("Point inside", "true");
                if (pointInside == false)
                    newRow.setString("Point inside", "false");  
      }
      }
      
    } // END FOCUS = TRIANGLE
    
    
     if (objMode2.get(focusObject-1) == "Polygon")
    {
      ins = 0;
      for (int i = 0; i < focusObject; i++)
        if (objMode2.get(i) == "Polygon")
          ins++;      
      
      // COMPARING POLYGON - POINT
    if (pointObjects.size() > 0){
    distances.clear();
      for (int m = 0; m < pointObjects.size(); m++){
      boolean pointInside = false;  
        
     for (int i = 0, j = polygonObjects.get(ins-1).p.size() - 1; i < polygonObjects.get(ins-1).p.size(); j = i++) { 
        if (((polygonObjects.get(ins-1).p.get(i).p.y > pointObjects.get(m).p.y) != (polygonObjects.get(ins-1).p.get(j).p.y > pointObjects.get(m).p.y)) && 
        
        (pointObjects.get(m).p.x < (polygonObjects.get(ins-1).p.get(j).p.x - polygonObjects.get(ins-1).p.get(i).p.x)
        
        * (pointObjects.get(m).p.y - polygonObjects.get(ins-1).p.get(i).p.y) / 
       
        (polygonObjects.get(ins-1).p.get(j).p.y - polygonObjects.get(ins-1).p.get(i).p.y) +
        
        polygonObjects.get(ins-1).p.get(i).p.x))
          pointInside = !pointInside;
    }
      
            
            
            
            insAux = 0;
            for (int k = 0; k < objMode2.size(); k++){
              if (objMode2.get(k) == "Point")
                insAux++;
              if (insAux == m+1){
                varK = k;
                break;
              }
            }  
      
    
            TableRow newRow = table.addRow();
            newRow.setInt("id", varK+1);
            newRow.setString("type", "Point");
                if (pointInside == true)
                  newRow.setString("Point inside", "true");
                if (pointInside == false)
                    newRow.setString("Point inside", "false");
        }    
        }
      }// END FOCUS = POLY
     saveTable(table, "data/pointInsideFocus" + focusObject + ".csv");  
  }
    
  
  
  
