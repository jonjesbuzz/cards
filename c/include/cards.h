#ifndef CARD_H
#define CARD_H

#include <stdint.h>

extern const int NUM_CARDS;

typedef enum {
    SPADE = 0,
    CLUB = 1,
    HEART = 2,
    DIAMOND = 3
} Suit;

typedef enum {
    ACE = 1,
    TWO = 2,
    THREE = 3,
    FOUR = 4,
    FIVE = 5,
    SIX = 6,
    SEVEN = 7,
    EIGHT = 8,
    NINE = 9,
    TEN = 10,
    JACK = 11,
    QUEEN = 12,
    KING = 13
} Rank;

typedef struct _card {
    Rank rank;
    Suit suit;
    void (*toString)(struct _card*, char*);
} Card;

typedef Card** Deck;

Card* makeCard(Rank, Suit);
Deck makeDeck(void);
void freeCard(Card*);
void freeDeck(Deck);
void swap(Deck, int, int);
void shuffle(Deck, int);
uint8_t encodeCard(Card*);
Card* decodeCard(uint8_t);
uint8_t* encodeDeck(Deck);
Deck decodeDeck(uint8_t*);

#endif