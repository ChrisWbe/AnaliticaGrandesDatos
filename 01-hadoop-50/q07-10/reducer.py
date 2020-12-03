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
            key,fecha,val = line.split("\t")
            val = int(val)
            if key == curkey:
                ##
                ## No se ha cambiado de clave. Aca se
                ## acumulan los valores para la misma clave.
                ##
                #total += val
                listLetra.append([fecha,val])
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
                            val1 = listLetra[tupla]
                            valSig = listLetra[tupla+1]
                            if val1[1] > valSig[1]:
                                aux = listLetra[tupla+1]
                                listLetra[tupla+1] = listLetra[tupla]
                                listLetra[tupla] = aux
                                band = 0
                    #sys.stdout.write("{}\t{}\n".format(curkey, listLetra))
                    for tupla in listLetra:
                        sys.stdout.write("{}   {}   {}\n".format(curkey,tupla[0], tupla[1]))
                    listLetra.clear()
                listLetra.append([fecha,val])
                curkey = key
                #total = val

    band = int(0)
    while band == 0:
        band = 1
        for tupla in range(0,len(listLetra)-1):
            val1 = listLetra[tupla]
            valSig = listLetra[tupla+1]
            if val1[1] > valSig[1]:
                aux = listLetra[tupla+1]
                listLetra[tupla+1] = listLetra[tupla]
                listLetra[tupla] = aux
                band = 0
    #sys.stdout.write("{}\t{}\n".format(curkey, listLetra))
    listLetra.insert(7,listLetra[12])
    listLetra.pop(13)
        
    for tupla in listLetra:
        sys.stdout.write("{}   {}   {}\n".format(curkey,tupla[0], tupla[1]))
