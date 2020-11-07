#! /usr/bin/python3

import sys

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    curkey = None
    total = 0
    listLetra = []

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
        if line!="\n":
            key,val = line.split("\t")
            val = int(val)
            if key == curkey:
                ##
                ## No se ha cambiado de clave. Aca se
                ## acumulan los valores para la misma clave.
                ##
                #total += val
                listLetra.append(val)
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

                    
                    band = int(0)
                    while band == 0:
                        band = 1
                        for tupla in range(0,len(listLetra)-1):
                            if listLetra[tupla] > listLetra[tupla+1]:
                                aux = listLetra[tupla+1]
                                listLetra[tupla+1] = listLetra[tupla]
                                listLetra[tupla] = aux
                                band = 0
                    numero = []
                    for tupla in listLetra:
                        numero.append(tupla)
                        #sys.stdout.write("{}, {}\n".format(curkey, tupla))
                    sys.stdout.write("{}\t{}\n".format(curkey, str(numero).replace(" ", "")[1:-1]))
                    listLetra.clear()
                listLetra.append(val)
                curkey = key
                #total = val

    band = int(0)
    while band == 0:
        band = 1
        for tupla in range(0,len(listLetra)-1):
            if listLetra[tupla] > listLetra[tupla+1]:
                aux = listLetra[tupla+1]
                listLetra[tupla+1] = listLetra[tupla]
                listLetra[tupla] = aux
                band = 0
    #sys.stdout.write("{}\t{}\n".format(curkey, listLetra))
    numero = []
    for tupla in listLetra:
        numero.append(tupla)
        #sys.stdout.write("{}, {}\n".format(curkey, tupla))
    sys.stdout.write("{}\t{}\n".format(curkey, str(numero).replace(" ", "")[1:-1]))
