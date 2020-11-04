#! /usr/bin/python3

import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
import csv
 
if __name__ == '__main__':
    rows=0
    for line in sys.stdin:
        
        arrayWord = []
        
        for word in line.split(' '):
            arrayWord.append(word)
        sys.stdout.write("{}\t1\n".format(arrayWord[0]))