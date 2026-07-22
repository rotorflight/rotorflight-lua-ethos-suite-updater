#!/usr/bin/python3

import sys

def main(args):
    release = args[1]
    inputfile = args[2]

    found = False

    with open(inputfile) as input:
        for line in input:
            stripped = line.strip()
            if stripped.startswith('#'):
                found = stripped.lstrip('#').strip() == release
            elif stripped.startswith('***'):
                found = False
            elif found:
                sys.stdout.write(line)


if __name__ == '__main__': main(sys.argv)
