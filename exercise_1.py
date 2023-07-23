# Escribir un programa que lea un número impar por teclado. Si el usuario no introduce un número impar, debe repetirse el proceso hasta que lo introduzca correctamente.

condition = True
while(condition):
    print('Escribe un número impar en la consola: ')
    number = int(input())
    if (number%2 == 0):
        print('El número ingresado es par, por favor vuelva a ingresarlo \n')
    else:
        print('El número ingresado no es par, felicitaciones. \n')
        condition = False

