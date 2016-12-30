#include <iostream>
#include "cards.h"

int main(int argc, char const *argv[])
{
    Deck d;
    d.randomize();
    std::cout << d << std::endl;

    return 0;
}
