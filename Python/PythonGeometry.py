import json
import csv
import Functions
import sys,os
import math

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
    # dist_sqt1 = (x1 - x2) * (x1 - x2)
    # dist_sqt2 = (y1 - y2) * (y1 - y2)
    # dist = math.sqrt(dist_sqt1 + dist_sqt2)
    
    

    dist = math.sqrt(( (y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1) ))
    
    return dist

# export function to the csv file
def exportObjMode():
    x = 1

def distanceBetweenObjects():

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

    # test if the focusObject is atleast present
    if focusObject > 0:
        #### Point Comparison ####
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
                    
                    print("x1:" + str(pointsArray[ins-1].x1))
                    print("y1:" + str(pointsArray[ins-1].y1))
                    print("x2:" + str(pointsArray[i].x1))
                    print("y2:" + str(pointsArray[i].y1))
                    print("Distance: " + str(distance))
                    print("--")
                    distances.append(distance)

                    #code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "{'Point'}":
                            insAux += 1
                            if insAux == i+1:
                                vark = k
                                break









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
for x in range(len(pointsArray)):
    print("ID: " + str(pointsArray[x].ID))
    print(pointsArray[x].x1)
    print(pointsArray[x].y1)
    print("\n")


print("Line List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Line':
        auxLine = Line(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'), fileobject[i].get('x2'), fileobject[i].get('y2'))
        lineArray.append(auxLine)
for x in range(len(lineArray)):
    print(lineArray[x].ID)
    print(lineArray[x].x1)
    print(lineArray[x].y1)
    print(lineArray[x].x2)
    print(lineArray[x].y2)
    print("\n")


print("Curve List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Curve':
        curvetotal = len(fileobject[i])
        curvetotal = curvetotal - 2
        curvetotal = int(curvetotal/2)
        for y in range(1, curvetotal):
            value = "x" + str(y)
            val = "y" + str(y)

            auxCurve = Curve(fileobject[i].get('id'), fileobject[i].get(value), fileobject[i].get(val))
            curveArray.append(auxCurve)

        print(curveArray[x].ID)

for x in range(len(curveArray)):
    print(curveArray[x].value)
    print(curveArray[x].val)



print("Segment List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Segment':
        auxSeg = Segment(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'), fileobject[i].get('x2'), fileobject[i].get('y2'))
        segmentArray.append(auxSeg)
for x in range(len(segmentArray)):
    print(segmentArray[x].ID)
    print(segmentArray[x].x1)
    print(segmentArray[x].y1)
    print(segmentArray[x].x2)
    print(segmentArray[x].y2)
    print("\n")


print("Ellipse List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Ellipse':
        auxEllipse = Ellipse(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'), fileobject[i].get('x2'), fileobject[i].get('y2'), fileobject[i].get('x3'), fileobject[i].get('y3'))
        ellipseArray.append(auxEllipse)
for x in range(len(ellipseArray)):
    print(ellipseArray[x].ID)
    print(ellipseArray[x].x1)
    print(ellipseArray[x].y1)
    print(ellipseArray[x].x2)
    print(ellipseArray[x].y2)
    print(ellipseArray[x].x3)
    print(ellipseArray[x].y3)
    print("\n")


print("Circle List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Circle':
        auxCircle = Circle(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'),
                        fileobject[i].get('x2'), fileobject[i].get('y2'))
        circleArray.append(auxCircle)
for x in range(len(circleArray)):
    print(circleArray[x].ID)
    print(circleArray[x].x1)
    print(circleArray[x].y1)
    print(circleArray[x].x2)
    print(circleArray[x].y2)
    print("\n")


print("Triangle List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Triangle':
        auxTriangle = Triangle(fileobject[i].get('id'), fileobject[i].get('x1'), fileobject[i].get('y1'),
                        fileobject[i].get('x2'), fileobject[i].get('y2'), fileobject[i].get('x3'), fileobject[i].get('y3'))
        triangleArray.append(auxTriangle)
for x in range(len(triangleArray)):
    print(triangleArray[x].ID)
    print(triangleArray[x].x1)
    print(triangleArray[x].y1)
    print(triangleArray[x].x2)
    print(triangleArray[x].y2)
    print(triangleArray[x].x3)
    print(triangleArray[x].y3)
    print("\n")


print("Polygon List:")
for i in range(0, len(fileobject)):
    if fileobject[i].get('type') == 'Polygon':
        polytotal = len(fileobject[i])
        polytotal = polytotal - 2
        polytotal = int(polytotal / 2)
        for y in range(1, polytotal):
            value = "x" + str(y)
            val = "y" + str(y)

            auxPolygon = Polygon(fileobject[i].get('id'), fileobject[i].get(value), fileobject[i].get(val))
            polygonArray.append(auxPolygon)

        print(polygonArray[x].ID)

for x in range(len(polygonArray)):
    print(polygonArray[x].value)
    print(polygonArray[x].val)

json_file.close()

print("SUMMARY")
print("Points: " + str(len(pointsArray)))


print("JSON FILE CLOSED.")

distanceBetweenObjects()












