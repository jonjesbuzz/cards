#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#include "cards.h"

const int NUM_CARDS = 52;

void CARD_to_string(Card* c, char* buffer) {
    char suit[8];
    switch(c->suit) {
        case SPADE:
            sprintf(suit, "Spade");
            break;
        case CLUB:
            sprintf(suit, "Club");
            break;
        case HEART:
            sprintf(suit, "Heart");
            break;
        case DIAMOND:
            sprintf(suit, "Diamond");
            break;
        default:
            sprintf(suit, "ERROR");
            break;
    }
    char face[6];
    switch(c->value) {
        case ACE:
            sprintf(face,"Ace");
            break;
        case JACK:
            sprintf(face, "Jack");
            break;
        case QUEEN:
            sprintf(face, "Queen");
            break;
        case KING:
            sprintf(face, "King");
            break;
        default:
            sprintf(face, "%d", c->value);
            break;
    }
    sprintf(buffer, "%s of %s", face, suit);
}

Card* makeCard(FaceValue val, Suit s) {
    Card *c = (Card*)malloc(sizeof(Card));
    if (!c) {
        return NULL;
    }
    c->value = val;
    c->suit = s;
    c->toString = CARD_to_string;
    return c;
}

Deck makeDeck(void) {
    Deck cards = (Deck) calloc(NUM_CARDS, sizeof(Card));
    if (!cards) {
        return NULL;
    }
    int i;
    for (i = 0; i < NUM_CARDS; i++) {
        cards[i] = makeCard((FaceValue)(i%13 + 1), (Suit)(i/13));
    }
    return cards;
}

void freeCard(Card* card) {
    free(card);
}

void freeDeck(Deck deck) {
    for (int i = 0; i < NUM_CARDS; i++) {
        freeCard(deck[i]);
    }
    free(deck);
}

void swap(Deck v, int i, int j) {
    Card *temp;

    temp = v[i];
    v[i] = v[j];
    v[j] = temp;
}

void randomize(Deck deck, int numRandoms) {
    int i = 0;
    int a = 0;
    int b = 0;
    for (i = 0; i < numRandoms; i++) {
        a = i % NUM_CARDS;
        do {
            b = rand() % NUM_CARDS;
        } while (a == b);
        swap(deck, a, b);
    }
}