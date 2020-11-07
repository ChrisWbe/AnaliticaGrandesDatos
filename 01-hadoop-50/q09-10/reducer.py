#! /usr/bin/python3

import sys

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    curkey = None
    count = 0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    matriz = []
    for line in sys.stdin:
        if line!="\n":
            key, fecha, val = line.split("\t")
            val = int(val)

            matriz.append([key,fecha,val])
    band = int(0)
    while band == 0:
        band = 1
        for tupla in range(0,len(matriz)-1):
            val1 = matriz[tupla]
            valSig = matriz[tupla+1]
            if val1[2] > valSig[2]:
                aux = matriz[tupla+1]
                matriz[tupla+1] = matriz[tupla]
                matriz[tupla] = aux
                band = 0
    for tupla in range(0, 6):
        sys.stdout.write("{}\t{}\t{}\n".format(matriz[tupla][0], matriz[tupla][1], matriz[tupla][2]))
    

    