# Escribir un programa que sume todos los números eneteros impares desde 0 hasta 100

sumNotEven = 0

for i in range(0,101):
    if(i%2!=0):
       sumNotEven+=i

print(sumNotEven)