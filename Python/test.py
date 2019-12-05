
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
