#include <iostream>
#include "cards.h"

int main(int argc, char const *argv[])
{
    Deck d;
    d.randomize();
    std::cout << d.to_string() << std::endl;
    return 0;
}