#include <vector>
#include <string>

enum FaceValue
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

enum Suit
{
    SPADE = 0,
    CLUB = 1,
    HEART = 2,
    DIAMOND = 3
};

class Card
{
public:
    Card(FaceValue, Suit);
    Card(const Card&);
    ~Card();
    const FaceValue face_value;
    const Suit suit;
    std::string to_string();
};

class Deck
{
public:
    Deck();
    ~Deck();
    void randomize(int random_count = 1000);
    std::shared_ptr<Card> get_card(int);
    const int num_cards;
    std::string to_string();
private:
    std::vector<std::shared_ptr<Card> > cards;
};