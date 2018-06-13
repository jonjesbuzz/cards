#include <iostream>
#include "cards.h"

int main()
{
    Deck d;
    d.shuffle();
    std::cout << d << std::endl;

    return 0;
}
