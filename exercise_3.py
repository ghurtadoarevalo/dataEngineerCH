#Utilizando la función range() y la conversión a listas generar las siguientes listas dinámicas
# Todos los números del 0 al 10
# Todos los números del -10 al 0
# Todos los números pares del 0 al 20
# Todos los números impares entre -20 y 0
# Todos los números múltiples de 5 del 0 al 50

firstList = list(range(0, 11))
secondList = list(range(-10, 1))
thirdList = list(range(0, 21, 2))
fourthList = [-20 + i for i in range(21) if i % 2 != 0]
fifthList = list(range(0, 51, 5))

print(firstList)
print(secondList)
print(thirdList)
print(fourthList)
print(fifthList)