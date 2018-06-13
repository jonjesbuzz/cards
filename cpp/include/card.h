#ifndef CARDS_CARD_H_
#define CARDS_CARD_H_

#include <string>
#include <ostream>

enum class Rank
{
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
};

enum class Suit
{
    SPADE = 0,
    CLUB = 1,
    HEART = 2,
    DIAMOND = 3
};

class Card
{
public:
    Card(Rank, Suit);
    Card(const Card&);
    ~Card();

    Rank get_rank() const;
    Suit get_suit() const;
    std::string to_string() const;

private:
    Rank rank;
    Suit suit;
};

std::ostream& operator<<(std::ostream &strm, const Card &c);

#endif
