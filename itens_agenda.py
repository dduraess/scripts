#!/usr/bin/python

t1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
t2 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
m = [1, 2, 3, 4, 5, 6, 7]

semana = 0
contador = 0

while semana < 53:
	for dia in range(1, 8):
		print(str(t1[contador%len(t1)]), ', ', str(t2[contador%len(t2)]), ', ', m[contador%len(m)], '\t', end='')
		contador+=1
	print()
	semana+=1