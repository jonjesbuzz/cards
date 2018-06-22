#include "cards.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
    Deck deck = makeDeck();
    shuffle(deck, NUM_CARDS * 2);
    int i;
    Card *current;
    char buffer[25];
    for (i = 0; i < NUM_CARDS; i++) {
        current = deck[i];
        current->toString(current, buffer);
        printf("%s", buffer);
        if (i % 4 == 3) {
            putchar('\n');
        } else {
            putchar('\t');
        }
    }

    uint8_t* encodedDeck = encodeDeck(deck);
    for (i = 0; i < NUM_CARDS; i++) {
        printf("0x%04X\t", encodedDeck[i]);
        current = decodeCard(encodedDeck[i]);
        current->toString(current, buffer);
        printf("%s\n", buffer);
        freeCard(current);
    }

    putchar('\n');
    freeDeck(deck);
    return 0;
}
