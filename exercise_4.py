#Dadas dos listas cualquiera, generar una tercera con los elementos que estén presentes en AMBAS listas. Retornar esta nueva lista pero sin elementos duplicados

def common_elements(list1, list2):
    new_list = []
    for elem in list1:
        if elem in list2 and elem not in new_list:
            new_list.append(elem)
    return new_list

list1 = [5,2,62,5,1,5,5,62]
list2 = [7,1,8,12,45,45,5,5,2,62]
list3 = []
result = common_elements(list1, list2)
print(result)  # Output: [1, 2, 5]