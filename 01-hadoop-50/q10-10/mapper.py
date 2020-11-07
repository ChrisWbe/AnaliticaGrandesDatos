#! /usr/bin/python3
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":


    for line in sys.stdin:

        valor, keys = line.split('\t')

        for word in keys.split(','):
            
            sys.stdout.write("{}\t{}\n".format(word.strip('\n'),valor))