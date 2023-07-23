#Contar cuántas veces aparece un elemento en una lista

list = [5,3,2,6,9,2,1,5]

dictList = {}

for listNumber in list:
    if listNumber not in dictList.keys():
        dictList[listNumber] = 1
    else:
        dictList[listNumber] = dictList[listNumber] + 1

print(dictList)