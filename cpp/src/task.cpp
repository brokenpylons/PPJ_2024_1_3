#include <string>
#include <iostream>
#include <fstream>

// WARNING: This code is for testing the automatic tests, it has nothing to do with the task at hand.

int main(int argc, char** argv)
{
    std::ifstream ifs(argv[1]);
    std::string input;
    ifs >> input;
    std::cout << "ANSWER" << input << std::endl;
}
