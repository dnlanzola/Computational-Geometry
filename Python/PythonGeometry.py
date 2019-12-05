import json
import csv
import sys,os
import math
import time

#from shapely.geometry import Point, Polygon

from Polygon import Polygon
from Circle import Circle
from Curve import Curve
from Ellipse import Ellipse
from Line import Line
from Point import Point
from Segment import Segment
from Triangle import Triangle


#############################################################################
##################### FUNCTIONS #################################################
#############################################################################

def distanceFormula(x1, y1, x2, y2):

    dist = math.sqrt(( (y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1) ))
    
    return dist

def distanceBetweenObjects():
    filename = "pdistancesFocus" + str(focusObject) + ".csv"
    fields = ['Id', 'Type', 'minDistance', 'maxDistance']

    # create method of printing to csv

    # variables used
    ins = 0
    insAux = 0
    vark = 0
    distance = 0
    minDistance = 0
    maxDistance = 0
    distances = []

    print("FUNCOBJECT CALL")
    print(objMode)

    with open(filename, 'w') as csvfile:
        # writer object
        csvwriter = csv.writer(csvfile)

        # write the fields
        csvwriter.writerow(fields)

        # test if the focusObject is atleast present
        if focusObject > 0:

    ############################### Point Comparison ########################
            print(objMode[focusObject-1])
            if (objMode[focusObject-1] == "{'Point'}"):
                ins = 0
                for i in range(0, focusObject):
                    if (objMode[i] == "{'Point'}"):
                        ins = ins + 1

            print(ins)

            #Point - Point
            if len(pointsArray) > 0:
                distances.clear()
                for i in range(0, len(pointsArray)):
                    if i != ins-1:
                        # distance formula required
                        distance = distanceFormula(pointsArray[ins-1].x1, pointsArray[ins-1].y1, pointsArray[i].x1, pointsArray[i].y1)

                        # print("x1:" + str(pointsArray[ins-1].x1))
                        # print("y1:" + str(pointsArray[ins-1].y1))
                        # print("x2:" + str(pointsArray[i].x1))
                        # print("y2:" + str(pointsArray[i].y1))
                        # print("Distance: " + str(distance))
                        # print("--")
                        distances.append(distance)

                        #code to traverse through objMode
                        insAux = 0
                        for k in range(0, len(objMode)):
                            if objMode[k] == "{'Point'}":
                                insAux += 1
                                if insAux == i+1:
                                    vark = k
                                    break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Point"], [distance], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)

            # Point - Line
            if len(lineArray) > 0:
                distances.clear()
                for i in range(0, len(lineArray)):
                    distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)

                    #Print Statements to print the values

                    #code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Line'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Line"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)


            #Point - Segment
            if len(segmentArray) > 0:
                distances.clear()
                for i in range(0, len(segmentArray)):
                    distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Segment'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Segment"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)


            #Point - Triangle
            if len(triangleArray) > 0:
                distances.clear()
                for i in range(0, len(triangleArray)):
                    distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Triangle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Triangle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)

            #Points - Ellipse
            if len(ellipseArray) > 0:
                distances.clear()
                for i in range(0, len(ellipseArray)):
                    distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Ellipse'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Ellipse"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)

            #Points - Circle
            if len(circleArray) > 0:
                distances.clear()
                for i in range(0, len(circleArray)):
                    distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Circle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Circle"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)

            #Points - Polygon
            if len(polygonArray) > 0:
                distances.clear()
                for i in range(0, len(polygonArray)):
                    for j in range(0, len(polygonArray[i].value)):
                        distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Polygon'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

            #Points - Curve
            if len(curveArray) > 0:
                distances.clear()
                for i in range(0, len(curveArray)):
                    for j in range(0, len(curveArray[i].value)):
                        distance = distanceFormula(pointsArray[ins - 1].x1, pointsArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Curve'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Curve"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)

    ###############################################################################

    ######################### Line COMPARISON ############################
            print(objMode[focusObject - 1])
            if (objMode[focusObject - 1] == "{'Line'}"):
                ins = 0
                for i in range(0, focusObject):
                    if (objMode[i] == "{'Line'}"):
                        ins = ins + 1

            print(ins)

            #line to Point
            if len(pointsArray) > 0:
                distances.clear()
                for i in range(0, len(pointsArray)):
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Point'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Point"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            #line to line
            if len(lineArray) > 0:
                distances.clear()
                for i in range(0, len(lineArray)):
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Line'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Line"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            #line to segment
            if len(segmentArray) > 0:
                distances.clear()
                for i in range(0, len(segmentArray)):
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Segment'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Segment"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            #line to curve
            if len(curveArray) > 0:
                distances.clear()
                for i in range(0, len(curveArray)):
                    for j in range(0, len(curveArray[i].value)):
                        distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)
                        distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Curve'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Curve"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)


            #line to polygon
            if len(polygonArray) > 0:
                distances.clear()
                for i in range(0, len(polygonArray)):
                    for j in range(0, len(polygonArray[i].value)):
                        distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)
                        distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Polygon'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Polygon"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            #line to ellipse
            if len(ellipseArray) > 0:
                distances.clear()
                for i in range(0, len(ellipseArray)):
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Ellipse'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Ellipse"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            #line to Triangle
            if len(triangleArray) > 0:
                distances.clear()
                for i in range(0, len(triangleArray)):
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Triangle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Triangle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            #line to circle
            if len(circleArray) > 0:
                distances.clear()
                for i in range(0, len(circleArray)):
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(lineArray[ins - 1].x1, lineArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Circle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break

                    if len(distances) != 0:
                        rows = [[vark+1], ["Circle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)


    ############################### END OF LINE COMPARISON #########################################

    ######################### SEGMENT COMPARISON ############################
            print(objMode[focusObject - 1])
            if (objMode[focusObject - 1] == "{'Segment'}"):
                ins = 0
                for i in range(0, focusObject):
                    if (objMode[i] == "{'Segment'}"):
                        ins = ins + 1

            print(ins)


            # segment to Point
            if len(pointsArray) > 0:
                distances.clear()
                for i in range(0, len(pointsArray)):
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Point'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Point"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # segment to line
            if len(lineArray) > 0:
                distances.clear()
                for i in range(0, len(lineArray)):
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Line'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Line"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # segment to segment
            if len(segmentArray) > 0:
                distances.clear()
                for i in range(0, len(segmentArray)):
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Segment'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Segment"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # segment to curve
            if len(curveArray) > 0:
                distances.clear()
                for i in range(0, len(curveArray)):
                    for j in range(0, len(curveArray[i].value)):
                        distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)
                        distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Curve'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Curve"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # segment to polygon
            if len(polygonArray) > 0:
                distances.clear()
                for i in range(0, len(polygonArray)):
                    for j in range(0, len(polygonArray[i].value)):
                        distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)
                        distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Polygon'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Polygon"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # segment to ellipse
            if len(ellipseArray) > 0:
                distances.clear()
                for i in range(0, len(ellipseArray)):
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Ellipse'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Ellipse"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # segment to Triangle
            if len(triangleArray) > 0:
                distances.clear()
                for i in range(0, len(triangleArray)):
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Triangle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Triangle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # segment to circle
            if len(circleArray) > 0:
                distances.clear()
                for i in range(0, len(circleArray)):
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(segmentArray[ins - 1].x1, segmentArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Circle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Circle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)


    ############################### END OF SEGMENT COMPARISON #########################################

    ######################### CURVE COMPARISON ############################
            print(objMode[focusObject - 1])
            if (objMode[focusObject - 1] == "{'Curve'}"):
                ins = 0
                for i in range(0, focusObject):
                    if (objMode[i] == "{'Curve'}"):
                        ins = ins + 1

            print(ins)


            # curve to Point
            if len(pointsArray) > 0:
                distances.clear()
                for i in range(0, len(pointsArray)):
                    for j in range(0, len(curveArray[ins - 1].value)):
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, pointsArray[i].x1, pointsArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Point'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Point"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # curve to line (line to curve)
            if len(lineArray) > 0:
                distances.clear()
                for i in range(0, len(lineArray)):
                    for j in range(0, len(curveArray[ins - 1].value)):
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, lineArray[i].x1, lineArray[i].y1)
                        distances.append(distance)
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, lineArray[i].x1, lineArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Line'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Line"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # curve to segment
            if len(segmentArray) > 0:
                distances.clear()
                for i in range(0, len(segmentArray)):
                    for j in range(0, len(curveArray[ins - 1].value)):
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, segmentArray[i].x1, segmentArray[i].y1)
                        distances.append(distance)
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, segmentArray[i].x1, segmentArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Segment'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Segment"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # curve to curve
            if len(curveArray) > 0:
                distances.clear()
                for i in range(0, len(curveArray)):
                    if i != ins - 1:
                        for j in range(0, len(curveArray[ins - 1].value)):
                            for k in range(0, len(curveArray[i].value)):
                                distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, curveArray[i].value[k].x1, curveArray[i].value[k].y1)
                                distances.append(distance)

                            # Print Statements to print the values

                            # code to traverse through objMode
                            insAux = 0
                            for k in range(0, len(objMode)):
                                if objMode[k] == "{'Curve'}":
                                    insAux += 1
                                    if insAux == i + 1:
                                        vark = k
                                        break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Curve"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # curve to polygon
            if len(polygonArray) > 0:
                distances.clear()
                for i in range(0, len(polygonArray)):
                    for j in range(0, len(curveArray[ins - 1].value)):
                        for k in range(0, len(polygonArray[i].value)):
                            distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, polygonArray[i].value[k].x1, polygonArray[i].value[k].y1)
                            distances.append(distance)

                        # Print Statements to print the values

                        # code to traverse through objMode
                        insAux = 0
                        for k in range(0, len(objMode)):
                            if objMode[k] == "{'Polygon'}":
                                insAux += 1
                                if insAux == i + 1:
                                    vark = k
                                    break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Polygon"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # curve to ellipse
            if len(ellipseArray) > 0:
                distances.clear()
                for i in range(0, len(ellipseArray)):
                    for j in range(0, len(curveArray[ins - 1].value)):
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Ellipse'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Ellipse"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)

            # curve to Triangle
            if len(triangleArray) > 0:
                distances.clear()
                for i in range(0, len(triangleArray)):
                    for j in range(0, len(curveArray[ins - 1].value)):
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, triangleArray[i].x1, triangleArray[i].y1)
                        distances.append(distance)
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, triangleArray[i].x1, triangleArray[i].y1)
                        distances.append(distance)
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, triangleArray[i].x1, triangleArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Triangle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Triangle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # curve to circle
            if len(circleArray) > 0:
                distances.clear()
                for i in range(0, len(circleArray)):
                    for j in range(0, len(curveArray[ins - 1].value)):
                        distance = distanceFormula(curveArray[ins - 1].value[j].x1, curveArray[ins - 1].value[j].y1, circleArray[i].x1, circleArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Circle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Triangle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)


    ############################### END OF CURVE COMPARISON #########################################

    ######################### POLYGON COMPARISON ############################
            print(objMode[focusObject - 1])
            if (objMode[focusObject - 1] == "{'Polygon'}"):
                ins = 0
                for i in range(0, focusObject):
                    if (objMode[i] == "{'Polygon'}"):
                        ins = ins + 1

            print(ins)


            # Polygon to Point
            if len(pointsArray) > 0:
                distances.clear()
                for i in range(0, len(pointsArray)):
                    for j in range(0, len(polygonArray[ins - 1].value)):
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, pointsArray[i].x1, pointsArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Point'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Point"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # Polygon to line
            if len(lineArray) > 0:
                distances.clear()
                for i in range(0, len(lineArray)):
                    for j in range(0, len(polygonArray[ins - 1].value)):
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, lineArray[i].x1, lineArray[i].y1)
                        distances.append(distance)
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, lineArray[i].x1, lineArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Line'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Line"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # Polygon to segment
            if len(segmentArray) > 0:
                distances.clear()
                for i in range(0, len(segmentArray)):
                    for j in range(0, len(polygonArray[ins - 1].value)):
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, segmentArray[i].x1, segmentArray[i].y1)
                        distances.append(distance)
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, segmentArray[i].x1, segmentArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Segment'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Segment"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # Polygon to curve
            if len(curveArray) > 0:
                distances.clear()
                for i in range(0, len(curveArray)):
                    for j in range(0, len(polygonArray[ins - 1].value)):
                        for k in range(0, len(curveArray[i].value)):
                            distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, curveArray[i].value[k].x1, curveArray[i].value[k].y1)
                            distances.append(distance)

                        # Print Statements to print the values

                        # code to traverse through objMode
                        insAux = 0
                        for k in range(0, len(objMode)):
                            if objMode[k] == "{'Curve'}":
                                insAux += 1
                                if insAux == i + 1:
                                    vark = k
                                    break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Curve"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # Polygon to polygon
            if len(polygonArray) > 0:
                distances.clear()
                for i in range(0, len(polygonArray)):
                    if i != ins - 1:
                        for j in range(0, len(polygonArray[ins - 1].value)):
                            for k in range(0, len(polygonArray[i].value)):
                                distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, polygonArray[i].value[k].x1, polygonArray[i].value[k].y1)
                                distances.append(distance)

                            # Print Statements to print the values

                            # code to traverse through objMode
                            insAux = 0
                            for k in range(0, len(objMode)):
                                if objMode[k] == "{'Polygon'}":
                                    insAux += 1
                                    if insAux == i + 1:
                                        vark = k
                                        break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Polygon"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # Polygon to ellipse
            if len(ellipseArray) > 0:
                distances.clear()
                for i in range(0, len(ellipseArray)):
                    for j in range(0, len(polygonArray[ins - 1].value)):
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Ellipse'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Ellipse"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # Polygon to Triangle
            if len(triangleArray) > 0:
                distances.clear()
                for i in range(0, len(triangleArray)):
                    for j in range(0, len(polygonArray[ins - 1].value)):
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, triangleArray[i].x1, triangleArray[i].y1)
                        distances.append(distance)
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, triangleArray[i].x1, triangleArray[i].y1)
                        distances.append(distance)
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, triangleArray[i].x1, triangleArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Triangle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Triangle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # Polygon to circle
            if len(circleArray) > 0:
                distances.clear()
                for i in range(0, len(circleArray)):
                    for j in range(0, len(polygonArray[ins - 1].value)):
                        distance = distanceFormula(polygonArray[ins - 1].value[j].x1, polygonArray[ins - 1].value[j].y1, circleArray[i].x1, circleArray[i].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Circle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Circle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)


    ############################### END OF POLYGON COMPARISON #########################################

    ######################### ELLIPSE COMPARISON ############################
            print(objMode[focusObject - 1])
            if (objMode[focusObject - 1] == "{'Ellipse'}"):
                ins = 0
                for i in range(0, focusObject):
                    if (objMode[i] == "{'Ellipse'}"):
                        ins = ins + 1

            print(ins)


            # ellipse to Point
            if len(pointsArray) > 0:
                distances.clear()
                for i in range(0, len(pointsArray)):
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Point'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Point"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # ellipse to line
            if len(lineArray) > 0:
                distances.clear()
                for i in range(0, len(lineArray)):
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Line'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Line"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # ellipse to segment
            if len(segmentArray) > 0:
                distances.clear()
                for i in range(0, len(segmentArray)):
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Segment'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Segment"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # ellipse to curve
            if len(curveArray) > 0:
                distances.clear()
                for i in range(0, len(curveArray)):
                    for j in range(0, len(curveArray[i].value)):
                        distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Curve'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Curve"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # ellipse to polygon
            if len(polygonArray) > 0:
                distances.clear()
                for i in range(0, len(polygonArray)):
                    for j in range(0, len(polygonArray[i].value)):
                        distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Polygon'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Polygon"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # ellipse to ellipse
            if len(ellipseArray) > 0:
                distances.clear()
                for i in range(0, len(ellipseArray)):
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Ellipse'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Ellipse"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # ellipse to Triangle
            if len(triangleArray) > 0:
                distances.clear()
                for i in range(0, len(triangleArray)):
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Triangle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Triangle"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # ellipse to circle
            if len(circleArray) > 0:
                distances.clear()
                for i in range(0, len(circleArray)):
                    distance = distanceFormula(ellipseArray[ins - 1].x1, ellipseArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Circle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Circle"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)


    ############################### END OF ELLIPSE COMPARISON #########################################

    ######################### TRIANGLE COMPARISON ############################
            print(objMode[focusObject - 1])
            if (objMode[focusObject - 1] == "{'Triangle'}"):
                ins = 0
                for i in range(0, focusObject):
                    if (objMode[i] == "{'Triangle'}"):
                        ins = ins + 1

            print(ins)


            # triangle to Point
            if len(pointsArray) > 0:
                distances.clear()
                for i in range(0, len(pointsArray)):
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Point'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Point"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # triangle to line
            if len(lineArray) > 0:
                distances.clear()
                for i in range(0, len(lineArray)):
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Line'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Line"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # triangle to segment
            if len(segmentArray) > 0:
                distances.clear()
                for i in range(0, len(segmentArray)):
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Segment'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Segment"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # triangle to curve
            if len(curveArray) > 0:
                distances.clear()
                for i in range(0, len(curveArray)):
                    for j in range(0, len(curveArray[i].value)):
                        distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)
                        distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)
                        distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Curve'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Curve"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # triangle to polygon
            if len(polygonArray) > 0:
                distances.clear()
                for i in range(0, len(polygonArray)):
                    for j in range(0, len(polygonArray[i].value)):
                        distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)
                        distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)
                        distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Polygon'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Polygon"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # triangle to ellipse
            if len(ellipseArray) > 0:
                distances.clear()
                for i in range(0, len(ellipseArray)):
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Ellipse'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Ellipse"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # triangle to Triangle
            if len(triangleArray) > 0:
                distances.clear()
                for i in range(0, len(triangleArray)):
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Triangle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Triangle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # triangle to circle
            if len(circleArray) > 0:
                distances.clear()
                for i in range(0, len(circleArray)):
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(triangleArray[ins - 1].x1, triangleArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Circle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Circle"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)


    ############################### END OF TRIANGLE COMPARISON #########################################

    ######################### CIRCLE COMPARISON ############################
            print(objMode[focusObject - 1])
            if (objMode[focusObject - 1] == "{'Circle'}"):
                ins = 0
                for i in range(0, focusObject):
                    if (objMode[i] == "{'Circle'}"):
                        ins = ins + 1

            print(ins)


            # circle to Point
            if len(pointsArray) > 0:
                distances.clear()
                for i in range(0, len(pointsArray)):
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Point'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Point"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # circle to line
            if len(lineArray) > 0:
                distances.clear()
                for i in range(0, len(lineArray)):
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, lineArray[i].x1, lineArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Line'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Line"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # circle to segment
            if len(segmentArray) > 0:
                distances.clear()
                for i in range(0, len(segmentArray)):
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, segmentArray[i].x1, segmentArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Segment'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Segment"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # circle to curve
            if len(curveArray) > 0:
                distances.clear()
                for i in range(0, len(curveArray)):
                    for j in range(0, len(curveArray[i].value)):
                        distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, curveArray[i].value[j].x1, curveArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Curve'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Curve"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # circle to polygon
            if len(polygonArray) > 0:
                distances.clear()
                for i in range(0, len(polygonArray)):
                    for j in range(0, len(polygonArray[i].value)):
                        distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, polygonArray[i].value[j].x1, polygonArray[i].value[j].y1)
                        distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Polygon'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Polygon"], [min(distance)], [max(distance)]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # circle to ellipse
            if len(ellipseArray) > 0:
                distances.clear()
                for i in range(0, len(ellipseArray)):
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, ellipseArray[i].x1, ellipseArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Ellipse'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Ellipse"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # circle to Triangle
            if len(triangleArray) > 0:
                distances.clear()
                for i in range(0, len(triangleArray)):
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, triangleArray[i].x1, triangleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Triangle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Triangle"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)
            # circle to circle
            if len(circleArray) > 0:
                distances.clear()
                for i in range(0, len(circleArray)):
                    distance = distanceFormula(circleArray[ins - 1].x1, circleArray[ins - 1].y1, circleArray[i].x1, circleArray[i].y1)
                    distances.append(distance)

                    # Print Statements to print the values

                    # code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Circle'}":
                            insAux += 1
                            if insAux == i + 1:
                                vark = k
                                break
                    if len(distances) != 0:
                        rows = [[vark+1], ["Circle"], [min(distance)], [0]]

                        # writing the rows
                        csvwriter.writerows(rows)

    ############################### END OF CIRCLE COMPARISON #########################################







######################### Point Inside Objects ################

def pointInsideObjects():
    filename = "pPointInsideFocus" + str(focusObject) + ".csv"
    fields = ['Id', 'Type', 'Intersect']
    #main section
    # start time implementation
    ins = 0
    insAux = 0
    vark = 0
    distance = 0
    minDistance = 0
    maxDistance = 0
    distances = []

    #csv file in python
    with open(filename, 'w') as csvfile:
        # writer object
        csvwriter = csv.writer(csvfile)

        # write the fields
        csvwriter.writerow(fields)
######
    if objMode.get(focusObject - 1) == "Triangle":
        ins = 0
        for i in range(0, len(focusObject)):
            if objMode.get(i) == "Triangle":
                ins = ins + 1

        # Comparing Triangle - Point
        if len(pointsArray) > 0:
            distances.clear()
            for i in range(0, len(pointsArray)):
                pointInside = False

        #Implement Function

        insAux = 0
        for k in range(0, len(objMode)):
            if objMode[k] == "{'Point'}":
                insAux += 1
                if insAux == i + 1:
                    vark = k
                    break

        rows = [[vark + 1], ["Point"], []]
        if pointInside == True:
            rows = [[], [], ["True"]]
        if pointInside == False:
            rows = [[], [], ["False"]]
        # writing the rows
        csvwriter.writerow(rows)

######        #End of comparison

#####
    if objMode.get(focusObject - 1) == "Polygon":
        ins = 0
        for i in range(0, len(focusObject)):
            if objMode.get(i) == "Polygon":
                ins = ins + 1

        # Comparing Polygon - Point
        if len(pointsArray) > 0:
            distances.clear()
            for i in range(0, len(pointsArray)):
                pointInside = False

        #Implement Function

        insAux = 0
        for k in range(0, len(objMode)):
            if objMode[k] == "{'Point'}":
                insAux += 1
                if insAux == i + 1:
                    vark = k
                    break

        rows = [[vark + 1], ["Point"], []]
        if pointInside == True:
            rows = [[], [], ["True"]]
        if pointInside == False:
            rows = [[], [], ["False"]]
        # writing the rows
        csvwriter.writerows(rows)

####        # End of comparison

#########################################################################

######################### Intersection Bewteen  Objects ################
def intersectionBetweenObjects():
    filename = "pIntersectionObjectFocus" + str(focusObject) + ".csv"
    fields = ['Id', 'Type', 'Intersect']
    # start timer position
    ins = 0
    insAux = 0
    vark = 0
    distance = 0.0
    minDistance = 0.0
    maxDistance = 0.0
    distances = [] #Same as the distances used before??
    interResult = False

    #save csv python
    with open(filename, 'w') as csvfile:
        # writer object
        csvwriter = csv.writer(csvfile)

        # write the fields
        csvwriter.writerow(fields)

    ########## Segment Comparison ##########

    interResult = False
    if objMode.get(focusObject - 1) == "Segment":
        print("it is segment")
        ins = 0
        for i in range(0, len(focusObject)):
            if objMode.get(i) == "Segment":
                ins = ins + 1

        #Comparing segment to line
        if len(lineArray) > 0:
            distance.clear
            for j in range(0, len(lineArray)):
                #using python built-in 'intersection' function
                #implement line extensions outside of segment
                if segmentArray.get(ins - 1).intersection(lineArray.get(j)):
                    interResult = True
                else:
                    interResult = False

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Line'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
            rows = [[vark + 1], ["Line"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
        # Comparing segment to segment
        interResult = False
        if len(segmentArray) > 0:
            for j in range(0, len(segmentArray)):
                if j != ins - 1:
                    #using python built-in 'intersection' function
                    if segmentArray.get(ins - 1).intersection(segmentArray.get(j)):
                        interResult = True
                    else:
                        interResult = False

                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Segment'}":
                            insAux += 1
                            if insAux == j + 1:
                                vark = k
                                break
                rows = [[vark + 1], ["Segment"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)
        #Comparing segment to Triangle
        interResult = False
        if len(triangleArray) > 0:
            distance.clear
            for j in range(0, len(triangleArray)):
                # for triangle we have to split triangle in segments to be compared
                t1 = Segment()
                t1 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
                t2 = Segment()
                t2 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
                t3 = Segment()
                t3 = (triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

                # using python built-in 'intersection' function
                if segmentArray.get(ins - 1).intersection(t1) or segmentArray.get(ins - 1).intersection(t2) or segmentArray.get(ins - 1).intersection(t3):
                    interResult = True
                else:
                    interResult = False

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Triangle'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
                rows = [[vark + 1], ["Triangle"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)
        #Comparing segment to Curve
        interResult = False
        if len(curveArray) > 0:
            distances.clear
            for j in range(0, len(curveArray)):
                for m in range(0, len(curveArray[j] - 1)):
                    # points usage in curve
                    p1 = Point()
                    p1 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                    p2 = Point()
                    p2 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                    #Point p1 = new Point(curveObjects.get(j).p.get(m).p.x, curveObjects.get(j).p.get(m).p.y);
                    #Point p2 = new Point(curveObjects.get(j).p.get(m + 1).p.x, curveObjects.get(j).p.get(m + 1).p.x);

                    #segment c1 = new segment(p1, p2);
                    c1 = Segment()
                    c1 = (p1, p2)

                    # using python built-in 'intersection' function
                    if segmentArray.get(ins - 1).intersection(c1) and interResult == False:
                        interResult = True

                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Curve'}":
                            insAux += 1
                            if insAux == j + 1:
                                vark = k
                                break
                rows = [[vark + 1], ["Curve"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)

        #Comparing segment to Polygon
        interResult = False
        if len(polygonArray) > 0:
            distances.clear
            for j in range(0, len(polygonArray)):
                for m in range(0, len(polygonArray[j] - 1)):

                    # using python built-in 'intersection' function
                    if segmentArray.get(ins - 1).intersection(polygonArray.get(j)) and interResult == False:
                        interResult = True

                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Polygon'}":
                            insAux += 1
                            if insAux == j + 1:
                                vark = k
                                break
                rows = [[vark + 1], ["Polygon"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)

    ########## Line Comparison ##########
    interResult = False
    if objMode.get(focusObject - 1) == "Line":
        ins = 0
        for i in range(0, len(focusObject)):
            if objMode.get(i) == "Line":
                ins = ins + 1

    # Comparing line to line
    if len(lineArray) > 0:
        distance.clear
        for j in range(0, len(lineArray)):
            if j != ins - 1:
                # using python built-in 'intersection' function
                # implement line extensions outside of segment
                if lineArray.get(ins - 1).intersection(lineArray.get(j)):
                    interResult = True
                else:
                    interResult = False

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Line'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
            rows = [[vark + 1], ["Line"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
    # Comparing line to segment
    interResult = False
    if len(segmentArray) > 0:
        distance.clear
        for j in range(0, len(segmentArray)):
            # using python built-in 'intersection' function
            if lineArray.get(ins - 1).intersection(segmentArray.get(j)):
                interResult = True
            else:
                interResult = False

            insAux = 0
            for k in range(0, len(objMode)):
                if objMode[k] == "{'Segment'}":
                    insAux += 1
                    if insAux == j + 1:
                        vark = k
                        break
            rows = [[vark + 1], ["Segment"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
    # Comparing line to Triangle
    interResult = False
    if len(triangleArray) > 0:
        distance.clear
        for j in range(0, len(triangleArray)):
            # for triangle we have to split triangle in segments to be compared
            t1 = Segment()
            t1 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
            t2 = Segment()
            t2 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
            t3 = Segment()
            t3 = (triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

            # using python built-in 'intersection' function
            if lineArray.get(ins - 1).intersection(t1) or lineArray.get(ins - 1).intersection(t2) or lineArray.get(ins - 1).intersection(t3):
                interResult = True
            else:
                interResult = False

            insAux = 0
            for k in range(0, len(objMode)):
                if objMode[k] == "{'Triangle'}":
                    insAux += 1
                    if insAux == j + 1:
                        vark = k
                        break
            rows = [[vark + 1], ["Triangle"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
    # Comparing line to Curve
    interResult = False
    if len(curveArray) > 0:
        distances.clear
        for j in range(0, len(curveArray)):
            for m in range(0, len(curveArray[j] - 1)):
                # points usage in curve
                p1 = Point()
                p1 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                p2 = Point()
                p2 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                # Point p1 = new Point(curveObjects.get(j).p.get(m).p.x, curveObjects.get(j).p.get(m).p.y);
                # Point p2 = new Point(curveObjects.get(j).p.get(m + 1).p.x, curveObjects.get(j).p.get(m + 1).p.x);

                # segment c1 = new segment(p1, p2);
                c1 = Segment()
                c1 = (p1, p2)

                # using python built-in 'intersection' function
                if lineArray.get(ins - 1).intersection(c1) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Curve'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
                rows = [[vark + 1], ["Curve"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)
    # Comparing line to Polygon
    interResult = False
    if len(polygonArray) > 0:
        distances.clear
        for j in range(0, len(polygonArray)):
            for m in range(0, len(polygonArray[j] - 1)):

                # using python built-in 'intersection' function
                if lineArray.get(ins - 1).intersection(polygonArray.get(j)) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Polygon'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
                rows = [[vark + 1], ["Polygon"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)

    ########## Triangle Comparison ##########
    interResult = False
    if objMode.get(focusObject - 1) == "Triangle":
        ins = 0
        for i in range(0, len(focusObject)):
            if objMode.get(i) == "Tringle":
                ins = ins + 1

    # Comparing triangle to line
    interResult = False
    if len(lineArray) > 0:
        distance.clear
        for j in range(0, len(lineArray)):
            # for triangle we have to split triangle in segments to be compared
            t1 = Segment()
            t1 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
            t2 = Segment()
            t2 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
            t3 = Segment()
            t3 = (triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

            # using python built-in 'intersection' function
            if lineArray.get(ins - 1).intersection(t1) or lineArray.get(ins - 1).intersection(t2) or lineArray.get(ins - 1).intersection(t3):
                interResult = True
            else:
                interResult = False

            insAux = 0
            for k in range(0, len(objMode)):
                if objMode[k] == "{'Line'}":
                    insAux += 1
                    if insAux == j + 1:
                        vark = k
                        break
            rows = [[vark + 1], ["Line"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
    # Comparing triangle to segment
    interResult = False
    if len(segmentArray) > 0:
        distance.clear
        for j in range(0, len(segmentArray)):
            # for triangle we have to split triangle in segments to be compared
            t1 = Segment()
            t1 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
            t2 = Segment()
            t2 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
            t3 = Segment()
            t3 = (triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

            # using python built-in 'intersection' function
            if segmentArray.get(ins - 1).intersection(t1) or segmentArray.get(ins - 1).intersection(t2) or segmentArray.get(ins - 1).intersection(t3):
                interResult = True
            else:
                interResult = False

            insAux = 0
            for k in range(0, len(objMode)):
                if objMode[k] == "{'Segment'}":
                    insAux += 1
                    if insAux == j + 1:
                        vark = k
                        break
            rows = [[vark + 1], ["Segment"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
    # Comparing triangle to Triangle
    interResult = False
    if len(segmentArray) > 0:
        distance.clear
        for j in range(0, len(segmentArray)):
            if j!= ins - 1:
                # for triangle we have to split triangle in segments to be compared
                t1 = Segment()
                t1 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
                t2 = Segment()
                t2 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
                t3 = Segment()
                t3 = (triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

                t4 = Segment()
                t4 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
                t5 = Segment()
                t5 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
                t6 = Segment()
                t6 = (triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

                # using python built-in 'intersection' function
                if t1.intersection(t4) or t1.intersection(t5) or t1.intersection(t6) or t2.intersection(t4) or t2.intersection(t5) or t2.intersection(t6) or t3.intersection(t4) or t3.intersection(t5) or t3.intersection(t6):
                    interResult = True
                else:
                    interResult = False

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Triangle'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
                rows = [[vark + 1], ["Triangle"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)
    # Comparing triangle to Curve
    interResult = False
    if len(curveArray) > 0:
        distances.clear
        for j in range(0, len(curveArray)):
            for m in range(0, len(curveArray[j] - 1)):
                # points usage in curve
                p1 = Point()
                p1 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                p2 = Point()
                p2 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                # Point p1 = new Point(curveObjects.get(j).p.get(m).p.x, curveObjects.get(j).p.get(m).p.y);
                # Point p2 = new Point(curveObjects.get(j).p.get(m + 1).p.x, curveObjects.get(j).p.get(m + 1).p.x);

                # segment c1 = new segment(p1, p2);
                c1 = Segment()
                c1 = (p1, p2)

                # for triangle we have to split triangle in segments to be compared
                t1 = Segment()
                t1 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
                t2 = Segment()
                t2 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
                t3 = Segment()
                t3 = (triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

                # using python built-in 'intersection' function
                if (t1.intersection(c1) or t2.intersection(c1) or t3.intersection(c1)) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Curve'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
                rows = [[vark + 1], ["Curve"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)
    # Comparing triangle to Polygon
    interResult = False
    if len(polygonArray) > 0:
        distances.clear
        for j in range(0, len(polygonArray)):
            for m in range(0, len(polygonArray[j] - 1)):

                # for triangle we have to split triangle in segments to be compared
                t1 = Segment()
                t1 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
                t2 = Segment()
                t2 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
                t3 = Segment()
                t3 = (triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

                # using python built-in 'intersection' function
                if (t1.intersection(polygonArray.get(j)) or t2.intersection(polygonArray.get(j)) or t3.intersection(polygonArray.get(j))) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Polygon'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
                rows = [[vark + 1], ["Polygon"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)

    ########## Curve Comparison ##########
    interResult = False
    if objMode.get(focusObject - 1) == "Curve":
        ins = 0
        for i in range(0, len(focusObject)):
            if objMode.get(i) == "Curve":
                ins = ins + 1

    # Comparing Curve to line
    interResult = False
    if len(lineArray) > 0:
        distances.clear
        for j in range(0, len(lineArray)):
            for m in range(0, len(curveArray[ins-1])):
                # points usage in curve
                p1 = Point()
                p1 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                p2 = Point()
                p2 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                # Point p1 = new Point(curveObjects.get(j).p.get(m).p.x, curveObjects.get(j).p.get(m).p.y);
                # Point p2 = new Point(curveObjects.get(j).p.get(m + 1).p.x, curveObjects.get(j).p.get(m + 1).p.x);

                # segment c1 = new segment(p1, p2);
                c1 = Segment()
                c1 = (p1, p2)

                # using python built-in 'intersection' function
                if lineArray.get(ins - 1).intersection(c1) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Line'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
                rows = [[vark + 1], ["Line"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)
    # Comparing Curve to segment
    interResult = False
    if len(segmentArray) > 0:
        distances.clear
        for j in range(0, len(segmentArray)):
            for m in range(0, len(curveArray[ins-1])):
                # points usage in curve
                p1 = Point()
                p1 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                p2 = Point()
                p2 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                # Point p1 = new Point(curveObjects.get(j).p.get(m).p.x, curveObjects.get(j).p.get(m).p.y);
                # Point p2 = new Point(curveObjects.get(j).p.get(m + 1).p.x, curveObjects.get(j).p.get(m + 1).p.x);

                # segment c1 = new segment(p1, p2);
                c1 = Segment()
                c1 = (p1, p2)

                # using python built-in 'intersection' function
                if segmentArray.get(ins - 1).intersection(c1) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Segment'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
                rows = [[vark + 1], ["Segment"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)
    # Comparing Curve to Triangle
    interResult = False
    if len(triangleArray) > 0:
        distances.clear
        for j in range(0, len(triangleArray)):
            for m in range(0, len(curveArray[ins-1]) - 1):
                # points usage in curve
                p1 = Point()
                p1 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                p2 = Point()
                p2 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                # Point p1 = new Point(curveObjects.get(j).p.get(m).p.x, curveObjects.get(j).p.get(m).p.y);
                # Point p2 = new Point(curveObjects.get(j).p.get(m + 1).p.x, curveObjects.get(j).p.get(m + 1).p.x);

                # segment c1 = new segment(p1, p2);
                c1 = Segment()
                c1 = (p1, p2)

                # for triangle we have to split triangle in segments to be compared
                t1 = Segment()
                t1 = (
                triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
                t2 = Segment()
                t2 = (
                triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
                t3 = Segment()
                t3 = (
                triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

                # using python built-in 'intersection' function
                if (t1.intersection(c1) or t2.intersection(c1) or t3.intersection(c1)) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Triangle'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
                rows = [[vark + 1], ["Triangle"], []]
                if interResult == True:
                    rows = [[], [], ["True"]]
                if interResult == False:
                    rows = [[], [], ["False"]]
                # writing the rows
                csvwriter.writerows(rows)
    # Comparing Curve to Curve
    interResult = False
    if len(curveArray) > 0:
        distances.clear
        for p in range(0, len(curveArray)):
            for j in range(0, len(polygonArray)):
                for m in range(0, len(curveArray[ins - 1])):

                    # points usage in curve
                    p1 = Point()
                    p1 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                    p2 = Point()
                    p2 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                    # Point p1 = new Point(curveObjects.get(j).p.get(m).p.x, curveObjects.get(j).p.get(m).p.y);
                    # Point p2 = new Point(curveObjects.get(j).p.get(m + 1).p.x, curveObjects.get(j).p.get(m + 1).p.x);

                    # segment c1 = new segment(p1, p2);
                    c1 = Segment()
                    c1 = (p1, p2)

                    # points usage in curve
                    p3 = Point()
                    p3 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                    p4 = Point()
                    p4 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                    # segment c1 = new segment(p1, p2);
                    c2 = Segment()
                    c2 = (p3, p4)

                    # using python built-in 'intersection' function
                    if c1.intersection(c2) and interResult == False:
                        interResult = True

                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Curve'}":
                            insAux += 1
                            if insAux == j + 1:
                                vark = k
                                break
                    rows = [[vark + 1], ["Curve"], []]
                    if interResult == True:
                        rows = [[], [], ["True"]]
                    if interResult == False:
                        rows = [[], [], ["False"]]
                    # writing the rows
                    csvwriter.writerows(rows)
    # Comparing Curve to Polygon
    interResult = False
    if len(curveArray) > 0:
        distances.clear
        for p in range(0, len(curveArray)):
            for j in range(0, len(polygonArray)):
                for m in range(0, len(curveArray[ins - 1])):

                    # points usage in curve
                    p1 = Point()
                    p1 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                    p2 = Point()
                    p2 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                    # Point p1 = new Point(curveObjects.get(j).p.get(m).p.x, curveObjects.get(j).p.get(m).p.y);
                    # Point p2 = new Point(curveObjects.get(j).p.get(m + 1).p.x, curveObjects.get(j).p.get(m + 1).p.x);

                    # segment c1 = new segment(p1, p2);
                    c1 = Segment()
                    c1 = (p1, p2)

                    # using python built-in 'intersection' function
                    if c1.intersection(polygonArray.get(j)) and interResult == False:
                        interResult = True

                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Polygon'}":
                            insAux += 1
                            if insAux == j + 1:
                                vark = k
                                break
                    rows = [[vark + 1], ["Polygon"], []]
                    if interResult == True:
                        rows = [[], [], ["True"]]
                    if interResult == False:
                        rows = [[], [], ["False"]]
                    # writing the rows
                    csvwriter.writerows(rows)

    ########## Polygon Comparison ##########
    interResult = False
    if objMode.get(focusObject - 1) == "Polygon":
        ins = 0
        for i in range(0, len(focusObject)):
            if objMode.get(i) == "Polygon":
                ins = ins + 1

    # Comparing Polygon to line
    interResult = False
    if len(lineArray) > 0:
        distances.clear
        for j in range(0, len(lineArray)):
            for m in range(0, len(polygonArray[ins-1])):

                # using python built-in 'intersection' function
                if lineArray.get(ins - 1).intersection(polygonArray.get(j)) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Line'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
            rows = [[vark + 1], ["Line"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
    # Comparing Polygon to Segment
    interResult = False
    if len(segmentArray) > 0:
        distances.clear
        for j in range(0, len(segmentArray)):
            for m in range(0, len(polygonArray[ins-1])):

                # using python built-in 'intersection' function
                if segmentArray.get(j).intersection(polygonArray.get(ins - 1)) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Segment'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
            rows = [[vark + 1], ["Segment"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
    # Comparing Polygon to Triangle
    interResult = False
    if len(triangleArray) > 0:
        distances.clear
        for j in range(0, len(triangleArray)):
            for m in range(0, len(polygonArray[ins-1])):

                # for triangle we have to split triangle in segments to be compared
                t1 = Segment()
                t1 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x2, triangleArray.get(j).y2)
                t2 = Segment()
                t2 = (triangleArray.get(j).x1, triangleArray.get(j).y1, triangleArray.get(j).x3, triangleArray.get(j).y3)
                t3 = Segment()
                t3 = (triangleArray.get(j).x2, triangleArray.get(j).y2, triangleArray.get(j).x3, triangleArray.get(j).y3)

                # using python built-in 'intersection' function
                if (t1.intersection(polygonArray.get(ins-1)) or t2.intersection(polygonArray.get(ins-1)) or t3.intersection(
                        polygonArray.get(ins-1))) and interResult == False:
                    interResult = True

                insAux = 0
                for k in range(0, len(objMode)):
                    if objMode[k] == "{'Polygon'}":
                        insAux += 1
                        if insAux == j + 1:
                            vark = k
                            break
            rows = [[vark + 1], ["Polygon"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
    # Comparing Polygon to Curve
    interResult = False
    if len(curveArray) > 0:
        distances.clear
        for p in range(0, len(curveArray)):
            for j in range(0, len(polygonArray[ins - 1])):
                for m in range(0, len(curveArray[m] - 1)):

                    # points usage in curve
                    p1 = Point()
                    p1 = (curveArray.get(j).get(m).x1, curveArray.get(j).get(m).y1)
                    p2 = Point()
                    p2 = (curveArray.get(j).get(m + 1).x1, curveArray.get(j).get(m + 1).y1)

                    # Point p1 = new Point(curveObjects.get(j).p.get(m).p.x, curveObjects.get(j).p.get(m).p.y);
                    # Point p2 = new Point(curveObjects.get(j).p.get(m + 1).p.x, curveObjects.get(j).p.get(m + 1).p.x);

                    # segment c1 = new segment(p1, p2);
                    c1 = Segment()
                    c1 = (p1, p2)

                    # using python built-in 'intersection' function
                    if c1.intersection(polygonArray.get(ins-1)) and interResult == False:
                        interResult = True

                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Curve'}":
                            insAux += 1
                            if insAux == j + 1:
                                vark = k
                                break
            rows = [[vark + 1], ["Curve"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)
    # Comparing Polygon to Polygon
    interResult = False
    if len(curveArray) > 0:
        distances.clear
        for p in range(0, len(polygonArray)):
            for j in range(0, len(polygonArray[ins - 1])):
                for m in range(0, len(polygonArray[m])):

                    # using python built-in 'intersection' function
                    if polygonArray.get(p).get(m).intersection(polygonArray.get(ins - 1).get(m)) and interResult == False:
                        interResult = True

                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Polygon'}":
                            insAux += 1
                            if insAux == j + 1:
                                vark = k
                                break
            rows = [[vark + 1], ["Polygon"], []]
            if interResult == True:
                rows = [[], [], ["True"]]
            if interResult == False:
                rows = [[], [], ["False"]]
            # writing the rows
            csvwriter.writerows(rows)


#########################################################################


###########################################################################################
################################### MAIN     ##########################################               
##################################################################################################

# distance between objects function
focusObject = 0
objMode = []

#  the array for the inputted objects from the json files
pointsArray = []
lineArray = []
curveArray = []
segmentArray = []
ellipseArray = []
triangleArray = []
circleArray = []
polygonArray = []






# Read focus object from user
inp = input("Enter ID of Focus Object: ")
print(focusObject)
focusObject = int(inp)

# Read objMode csv file
with open("objMode.csv", "r") as csv_file:
    csv_reader = csv.DictReader(csv_file)
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        
        name = str({row["type"]})
        objMode.append(name)
        line_count += 1

print(objMode)

# Read json file 
with open("objects.json", "r") as json_file:
    fileobject = json.load(json_file)
    print("Total JSON List:")
    print(fileobject)


print("Points List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Point':
        auxPoint = Point(fileobject[i].get('id'), fileobject[i].get('x'), fileobject[i].get('y'))
        pointsArray.append(auxPoint)
#for x in range(len(pointsArray)):
    # print("ID: " + str(pointsArray[x].ID))
    # print(pointsArray[x].x1)
    # print(pointsArray[x].y1)
    # print("\n")


print("Line List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Line':
        auxLine = Line(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'), fileobject[i].get('x2'), fileobject[i].get('y2'))
        lineArray.append(auxLine)
#for x in range(len(lineArray)):
    # print(lineArray[x].ID)
    # print(lineArray[x].x1)
    # print(lineArray[x].y1)
    # print(lineArray[x].x2)
    # print(lineArray[x].y2)
    # print("\n")


print("Curve List:")
for i in range(0, len(fileobject)):
    auxCurve = Curve(0,[])

    if fileobject[i].get('type') == 'Curve':

        curvetotal = len(fileobject[i])
        curvetotal = curvetotal - 2
        curvetotal = int(curvetotal / 2)
        auxListC = []
        for y in range(1, curvetotal+1):
            value = "x" + str(y)
            val = "y" + str(y)

            auxC = Point(fileobject[i].get('id'), fileobject[i].get(value),fileobject[i].get(val))

            auxListC.append(auxC)

        auxCurve.ID = fileobject[i].get('id')
       # print("AuxListP LEN")
        #print(len(auxListC))
        auxCurve.value = auxListC

        curveArray.append(auxCurve)



print("Segment List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Segment':
        auxSeg = Segment(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'), fileobject[i].get('x2'), fileobject[i].get('y2'))
        segmentArray.append(auxSeg)
#for x in range(len(segmentArray)):
   # print(segmentArray[x].ID)
   #  print(segmentArray[x].x1)
   # print(segmentArray[x].y1)
   # print(segmentArray[x].x2)
   # print(segmentArray[x].y2)
   # print("\n")


print("Ellipse List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Ellipse':
        auxEllipse = Ellipse(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'), fileobject[i].get('x2'), fileobject[i].get('y2'), fileobject[i].get('x3'), fileobject[i].get('y3'))
        ellipseArray.append(auxEllipse)
#for x in range(len(ellipseArray)):
 #   print(ellipseArray[x].ID)
#    print(ellipseArray[x].x1)
  #  print(ellipseArray[x].y1)
   # print(ellipseArray[x].x2)
   # print(ellipseArray[x].y2)
    #print(ellipseArray[x].x3)
    #print(ellipseArray[x].y3)
    #print("\n")


print("Circle List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Circle':
        auxCircle = Circle(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'),
                        fileobject[i].get('x2'), fileobject[i].get('y2'))
        circleArray.append(auxCircle)
# for x in range(len(circleArray)):
#     print(circleArray[x].ID)
#     print(circleArray[x].x1)
#     print(circleArray[x].y1)
#     print(circleArray[x].x2)
#     print(circleArray[x].y2)
#     print("\n")
#

print("Triangle List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Triangle':
        auxTriangle = Triangle(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'),
                        fileobject[i].get('x2'), fileobject[i].get('y2'), fileobject[i].get('x3'), fileobject[i].get('y3'))
        triangleArray.append(auxTriangle)
# for x in range(len(triangleArray)):
#     print(triangleArray[x].ID)
#     print(triangleArray[x].x1)
#     print(triangleArray[x].y1)
#     print(triangleArray[x].x2)
#     print(triangleArray[x].y2)
#     print(triangleArray[x].x3)
#     print(triangleArray[x].y3)
#     print("\n")


print("Polygon List:")
for i in range(0, len(fileobject)):
    auxPoly = Polygon(0,[])

    if fileobject[i].get('type') == 'Polygon':

        polytotal = len(fileobject[i])
        polytotal = polytotal - 2
        polytotal = int(polytotal / 2)
        auxListP = []
        for y in range(1, polytotal+1):
            value = "x" + str(y)
            val = "y" + str(y)

            auxP = Point(fileobject[i].get('id'), fileobject[i].get(value),fileobject[i].get(val))

            auxListP.append(auxP)

        auxPoly.ID = fileobject[i].get('id')
        # print("AuxListP LEN")
        # print(len(auxListP))
        auxPoly.value = auxListP

        polygonArray.append(auxPoly)



json_file.close()

print("SUMMARY")
print("Points: " + str(len(pointsArray)))


print("JSON FILE CLOSED.")

# test the time of python calculation
test_time = time.time()
distanceBetweenObjects()
#pointInsideObjects()
#intersectionBetweenObjects()
print("--- %s seconds ---"%(time.time() - test_time))












