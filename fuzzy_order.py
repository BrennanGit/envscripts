#!/usr/bin/env python
from fuzzywuzzy import process
import argparse


def order_strings(pattern, options, limit):
    if limit < 0:
        sorted_options = process.extractBests(pattern, options, limit=None)
    else:
        sorted_options = process.extractBests(pattern, options, limit=limit)
    for opt, score in sorted_options:
        print(opt)
    return sorted_options


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Output list of options in order of similarity to the first')
    parser.add_argument('--number', '-n',
                        metavar='INT',
                        type=int,
                        default=-1,
                        help='The number of matches to show.')
    parser.add_argument('pattern',
                        metavar='STR',
                        help='The string to match.')
    parser.add_argument('options',
                        nargs='+',
                        metavar='STR',
                        help='A list of strings to reorder.')

    args = parser.parse_args()

    order_strings(args.pattern, args.options, args.number)
