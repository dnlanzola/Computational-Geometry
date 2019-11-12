import json

import Polygon
import Circle
import Curve
import Ellipse
import Line
from Point import Point
import Segment
import Triangle


def main():
    with open("new.json", "r") as json_file:
        fileobject = json.load(json_file)
        print(fileobject)


    print("\n")
    print(fileobject[0])

    print(fileobject[0].get('id'))
    print(fileobject[0].get('x'))
    print(fileobject[0].get('y'))
    print(fileobject[0].get('type'))
    print(len(fileobject[0]))

    auxPoint = Point(fileobject[0].get('id'),fileobject[0].get('x'),fileobject[0].get('y'))
    
    pointsArray = []

    pointsArray.append(auxPoint)

    print("\n")
    print(pointsArray[0].ID)
    print(pointsArray[0].x1)
    print(pointsArray[0].y1)




    # below is the list of array for each object input and method of printing data in each array
    # pointsArray = []
    # for i in range(1, len(fileobject) + 1):
    #         pointsArray.append(i)
    # print("Points List:")
    # for x in range(len(pointsArray)):
    #     print(pointsArray[x])
    # print("\n")

    # lineArray = []
    # for i in range(1, len(fileobject) + 1):
    #     lineArray.append(i)
    # print("Line List:")
    # for x in range(len(lineArray)):
    #     print(lineArray[x])
    # print("\n")

    # curveArray = []
    # for i in range(1, len(fileobject) + 1):
    #     curveArray.append(i)
    # print("Curve List:")
    # for x in range(len(curveArray)):
    #     print(curveArray[x])
    # print("\n")

    # segmentArray = []
    # for i in range(1, len(fileobject) + 1):
    #     segmentArray.append(i)
    # print("Segment List:")
    # for x in range(len(segmentArray)):
    #     print(segmentArray[x])
    # print("\n")

    # ellipseArray = []
    # for i in range(1, len(fileobject) + 1):
    #     ellipseArray.append(i)
    # print("Ellipse List:")
    # for x in range(len(ellipseArray)):
    #     print(ellipseArray[x])
    # print("\n")

    # circleArray = []
    # for i in range(1, len(fileobject) + 1):
    #     circleArray.append(i)
    # print("Circle List:")
    # for x in range(len(circleArray)):
    #     print(circleArray[x])
    # print("\n")

    # triangleArray = []
    # for i in range(1, len(fileobject) + 1):
    #     triangleArray.append(i)
    # print("Triangle List:")
    # for x in range(len(triangleArray)):
    #     print(triangleArray[x])
    # print("\n")

    # polygonArray = []
    # for i in range(1, len(fileobject) + 1):
    #     polygonArray.append(i)
    # print("Polygon List:")
    # for x in range(len(polygonArray)):
    #     print(polygonArray[x])
    # print("\n")

    json_file.close()


main()










