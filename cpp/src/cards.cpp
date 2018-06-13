#include "cards.h"

#include <cstdlib>
#include <ctime>
#include <sstream>

Card::Card(Rank rank, Suit suit) :
rank(rank), suit(suit) {
}

Card::Card(const Card& c1):
rank(c1.rank), suit(c1.suit) {
}

Card::~Card() {

}

std::string Card::to_string() const {
    std::string suit_s;
    switch(suit) {
        case Suit::SPADE:
            suit_s = "Spade";
            break;
        case Suit::CLUB:
            suit_s = "Club";
            break;
        case Suit::HEART:
            suit_s = "Heart";
            break;
        case Suit::DIAMOND:
            suit_s = "Diamond";
            break;
        default:
            return std::string("Error");
    }

    std::string rank_s;
    switch(rank) {
        case Rank::ACE:
            rank_s = "Ace";
            break;
        case Rank::JACK:
            rank_s = "Jack";
            break;
        case Rank::QUEEN:
            rank_s = "Queen";
            break;
        case Rank::KING:
            rank_s = "King";
            break;
        default:
            rank_s = std::to_string(static_cast<int>(rank));
            break;
    }

    std::stringstream stream;
    stream << rank_s << " of " << suit_s;
    return stream.str();
}

Rank Card::get_rank() const {
    return this->rank;
}

Suit Card::get_suit() const {
    return this->suit;
}

std::ostream& operator<<(std::ostream &strm, const Card &c) {
  return strm << c.to_string();
}

Deck::Deck() :
num_cards(52) {
    cards.reserve(num_cards);
    for (auto i = 0; i < num_cards; i++) {
        cards.emplace_back(static_cast<Rank>(i%13 + 1), static_cast<Suit>(i/13));
    }
}

Deck::~Deck() {
}

void Deck::randomize(int random_count) {
    std::srand(std::time(0));
    auto a = 0;
    auto b = 0;
    for (auto i = 0; i < random_count; i++) {
        a = i % num_cards;
        do {
            b = std::rand() % num_cards;
        } while (a == b);
        std::swap(cards[a], cards[b]);
    }
}

Card Deck::get_card(int index) const {
    return cards[index];
}

std::string Deck::to_string() const {
    std::stringstream stream;
    for (auto i = 0; i < num_cards; i++) {
        auto s = cards[i].to_string();
        stream << s;
        if (i % 4 == 3) {
            stream << std::endl;
        } else {
            stream << "\t";
        }
    }
    return stream.str();
}

std::ostream& operator<<(std::ostream &strm, const Deck &d) {
  return strm << d.to_string();
}
