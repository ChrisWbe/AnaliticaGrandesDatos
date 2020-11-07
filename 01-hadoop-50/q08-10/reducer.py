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
            key, val = line.split("\t")
            val = float(val)

            
            count+=1
            if key == curkey:
                ##
                ## No se ha cambiado de clave. Aca se
                ## acumulan los valores para la misma clave.
                ##
                total += val
                matriz.append(val)
            else:
                ##
                ## Se cambio de clave. Se reinicia el
                ## acumulador.
                ##
                if curkey is not None:
                    ##
                    ## una vez se han reducido todos los elementos
                    ## con la misma clave se imprime el resultado en
                    ## el flujo de salida
                    ##
                    #sys.stdout.write("{}\t{}\n".format(curkey, matriz))
                    acum = 0
                    for num in matriz:
                        acum += num
                    sys.stdout.write("{}\t{}\t{}\n".format(curkey,acum,acum/len(matriz)))
                    matriz.clear()
                matriz.append(val)
                curkey = key
                total = val
    
    acum = 0
    for num in matriz:
        acum += num
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, acum, acum/len(matriz)))


    