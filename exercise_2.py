# Escribe un programa que le pida al usuario cuántos números quiere introducir. Luego que lea todos los números y realice una media aritmética.

numberList = []
print('Indique la cantidad de números quiere introducir: ', end="")
numberQuantity = int(input())

for i in range(numberQuantity):
    print('Ingrese un número: ', end="")
    number = int(input())
    numberList.append(number)

average = sum(numberList)/numberQuantity

print('El promedio de los números', numberList, 'es:', '{:.3f}'.format(round(average,3)), 'redondeado al tercer decimal')