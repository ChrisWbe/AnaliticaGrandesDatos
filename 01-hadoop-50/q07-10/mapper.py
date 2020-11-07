#! /usr/bin/python3
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":


    for line in sys.stdin:

        arrayWord = []
        for word in line.split('  '):
            arrayWord.append(word)
        sys.stdout.write("{}\t{}\t{}\n".format(arrayWord[0].strip(),arrayWord[1].strip(),arrayWord[2].strip()))