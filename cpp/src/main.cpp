#include <iostream>
#include <cstdio>
#include "cards.h"

int main()
{
    Deck d;
    d.shuffle();
    std::cout << d << std::endl;
    std::vector<uint8_t> e = d.encode();
    for (auto i = 0ul; i < e.size(); i++) {
        printf("0x%02X\t", e[i]);
        std::cout << Card(e[i]) << std::endl;
    }
    return 0;
}
