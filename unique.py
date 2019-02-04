import sys


def main(path):
    with open(path) as f:
        text = f.read()

    words = set(text.split())
    print(' '.join(words))


if __name__ == '__main__':
    main(sys.argv[1])
