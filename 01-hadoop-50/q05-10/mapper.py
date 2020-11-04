#! /usr/bin/python3

import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

 
if __name__ == '__main__':
    rows=0
    for line in sys.stdin:
        
        arrayWord = []
        
        for word in line.split('  '):
            arrayWord.append(word)
        ano, mes, dia = arrayWord[1].split('-')
        sys.stdout.write("{}\t1\n".format(mes))