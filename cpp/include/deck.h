#ifndef CARDS_DECK_H_
#define CARDS_DECK_H_

#include <string>
#include <vector>
#include <ostream>

#include "card.h"

class Deck
{
public:
    Deck();
    ~Deck();
    void shuffle(int random_count = 1000);
    Card get_card(int) const;
    std::string to_string() const;

    const int num_cards;
private:
    std::vector<Card> cards;
};

std::ostream& operator<<(std::ostream &strm, const Deck &d);

#endif
