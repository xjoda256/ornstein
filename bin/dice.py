#!/usr/bin/env python
# ported to python by opencode zen
import argparse
import random
import time
import threading
import sys
#import string

def spin():
    sp = r"\|/-"
    n = len(sp)
    i = 0
    sys.stdout.write(' ')
    sys.stdout.flush()
    while True:
        time.sleep(0.1)
        sys.stdout.write('\b%s' % sp[i % n])
        sys.stdout.flush()
        i += 1

def main():
    if len(sys.argv) == 1:
        print("Usage: dice <sides>. i.e. dice 20")
        sys.exit(1)

    parser = argparse.ArgumentParser(description='Roll a die with specified number of sides')
    parser.add_argument('sides', type=int, help='Number of sides on the die')
    args = parser.parse_args()

    if args.sides <= 0:
        print("Usage: dice <sides>. i.e. dice 20")
        sys.exit(1)

    t = threading.Thread(target=spin)
    t.daemon = True
    t.start()

    time.sleep(random.random() + 0.5)

    sys.stdout.write('\b ')
    sys.stdout.write('\b')
    sys.stdout.flush()

    result = random.randint(1, args.sides)
    print("D%d=> %d" % (args.sides, result))

if __name__ == '__main__':
    main()

