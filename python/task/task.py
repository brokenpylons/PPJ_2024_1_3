import sys

# WARNING: This code is for testing the automatic tests, it has nothing to do with the task at hand.

if __name__ == '__main__':
    with open(sys.argv[1], "r") as f:
        value = f.read()
        print("ANSWER" + value)
