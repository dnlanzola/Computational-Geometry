import math
from PythonGeometry import  focusObject, objMode, pointsArray, lineArray, curveArray, segmentArray, ellipseArray, triangleArray, circleArray, polygonArray
class FuncObject:
    # Distance function
    def distanceFormula(self, x1, x2, y1, y2):
        dist_sqt1 = (x1 - x2) * (x1 - x2)
        dist_sqt2 = (y1 - y2) * (y1 - y2)
        dist = math.sqrt(dist_sqt1 + dist_sqt2)
        return dist

    # export function to the csv file
    def exportObjMode(self):
        x = 1

    def distanceBetweenObjects(self):

        # create method of printing to csv

        # variables used
        ins = 0
        insAux = 0
        vark = 0
        distance = 0
        minDistance = 0
        maxDistance = 0
        distances = []



        # test if the focusObject is atleast present
        if focusObject > 0:
            #### Point Comparison ####
            for i in range(0, len(objMode)):
                if objMode[i].get(focusObject -1) == "Point":
                    ins = 0
                    for j in range(0, len(focusObject)):
                        if objMode.get[j] == "Point":
                            ins += 1

            #Point - Point
            if len(pointsArray) > 0:
                distances.clear()
                for i in range(0, len(pointsArray)):
                    if i != ins-1:
                        # distance formula required
                        distance = distanceFormula(pointsArray[ins-1].x1, pointsArray[ins-1].x2, pointsArray[i].x2, pointsArray[i].y2)
                        distances.append(distance)

                        #code to traverse through objMode
                        insAux = 0
                        for k in range(0, len(objMode)):
                            if objMode.get(k) == "Point":
                                insAux += 1
                                if insAux == i+1:
                                    vark = k
                                    break


                        #Add to the CSV file
                        if len(distances) != 0:
                            TableRow newRow = table.addRow()
                            newRow.setInt("id", varK + 1)
                            newRow.setString("type", "Point")
                            newRow.setFloat("min distance", distance)
                            newRow.setFloat("max distance", 0)


            # Point - Line
            if len(lineArray) > 0:
                distances.clear()
                for i in range(0, len(lineArray)):
                    #distance formula
                    distance = distanceFormula()
                    distances.append(distance)
                    distance = distanceFormula()
                    distances.append(distance)

            # code to traverse through objMode

            # Add to the CSV file

            # Point - Segment
            if len(segmentArray) > 0:
                distances.clear()
                for i in range(0, len(segmentArray)):
                # distance formula
                    distance = distanceFormula()
                    distances.append(distance)
                    distance = distanceFormula()
                    distances.append(distance)

            # code to traverse through objMode

            # Add to the CSV file

            # Point - Triangle

            #Point - Circle

            #Point - Curve
            #Point - Ellipse
            #Point - Polygon



            #### Circle Comparison ####

            #Circle - Circle
            #Circle - Point
            #Circle - Curve
            #Circle - Ellipse
            #Circle - Line
            #Circle - Polygon
            #Circle - Segment
            #Circle - Triangle

            #### Curve Comparison ####

            #Curve - Curve
            #Curve - Point
            #Curve - Circle
            #Curve - Ellipse
            #Curve - Line
            #Curve - Polygon
            #Curve - Segment
            #Curve - Triangle

            #### Ellipse Comparison ####

            #Ellipse - Ellipse
            #Ellipse - Point
            #Ellipse - Circle
            #Ellipse - Curve
            #Ellipse - Line
            #Ellipse - Polygon
            #Ellipse - Segment
            #Ellipse - Triangle

            #### Line Comparison ####

            #Line - Line
            #Line - Point
            #Line - Circle
            #Line - Curve
            #Line - Ellipse
            #Line - Polygon
            #Line - Segment
            #Line - Triangle

            #### Polygon Comparison ####

            #Polygon - Polygon
            #Polygon - Point
            #Polygon - Circle
            #Polygon - Curve
            #Polygon - Ellipse
            #Polygon - Line
            #Polygon - Segment
            #Polygon - Triangle

            #### Segment Comparison ####

            #Segment - Segment
            #Segment - Point
            #Segment - Circle
            #Segment - Curve
            #Segment - Ellipse
            #Segment - Line
            #Segment - Polygon
            #Segment - Triangle

            #### Triangle Comparison ####

            #Triangle - Triangle
            #Triangle - Point
            #Triangle - Circle
            #Triangle - Curve
            #Triangle - Ellipse
            #Triangle - Line
            #Triangle - Polygon
            #Triangle - Segment


