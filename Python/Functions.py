import math
import csv
from PythonGeometry import  focusObject, objMode, pointsArray, lineArray, curveArray, segmentArray, ellipseArray, triangleArray, circleArray, polygonArray


def distanceFormula(x1, x2, y1, y2):
    dist_sqt1 = (x1 - x2) * (x1 - x2)
    dist_sqt2 = (y1 - y2) * (y1 - y2)
    dist = math.sqrt(dist_sqt1 + dist_sqt2)
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
    print(pointsArray)

    # test if the focusObject is atleast present
    if focusObject > 0:
        #### Point Comparison ####
        if (objMode[focusObject-1] == "Point"):
            ins = 0
            for i in range(0, focusObject):
                if (objMode[i] == "Point"):
                    ins = ins + 1

        #Point - Point
        if len(pointsArray) > 0:
            distances.clear()
            for i in range(0, len(pointsArray)):
                if i != ins-1:
                    # distance formula required
                    distance = distanceFormula(pointsArray[ins-1].x1, pointsArray[ins-1].y1, pointsArray[i].x1, pointsArray[i].y1)
                    distances.append(distance)

                    #code to traverse through objMode
                    insAux = 0
                    for k in range(0, len(objMode)):
                        if objMode[k] == "Point":
                            insAux += 1
                            if insAux == i+1:
                                vark = k
                                break

                    print(distances)