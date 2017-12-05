#include <iostream>
#include "cards.h"

int main()
{
    Deck d;
    d.randomize();
    std::cout << d << std::endl;

    return 0;
}
