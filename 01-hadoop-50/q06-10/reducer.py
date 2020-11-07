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
            key, val = line.split("\t")
            val = float(val)

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

                    sys.stdout.write("{}\t{}\t{}\n".format(curkey, listLetra[len(listLetra)-1], listLetra[0]))

                    listLetra.clear()
                listLetra.append(val)
                curkey = key
                #total = val

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, listLetra[len(listLetra)-1], listLetra[0]))