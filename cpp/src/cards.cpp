#include "cards.h"

#include <cstdlib>
#include <ctime>
#include <sstream>

Card::Card(FaceValue face_value, Suit suit) :
face_value(face_value), suit(suit) {
}

Card::Card(const Card& c1):
face_value(c1.face_value), suit(c1.suit) {
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

    std::string face;
    switch(face_value) {
        case FaceValue::ACE:
            face = "Ace";
            break;
        case FaceValue::JACK:
            face = "Jack";
            break;
        case FaceValue::QUEEN:
            face = "Queen";
            break;
        case FaceValue::KING:
            face = "King";
            break;
        default:
            face = std::to_string(static_cast<int>(face_value));
            break;
    }

    std::stringstream stream;
    stream << face << " of " << suit_s;
    return stream.str();
}

FaceValue Card::get_face_value() const {
    return this->face_value;
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
        cards.emplace_back(static_cast<FaceValue>(i%13 + 1), static_cast<Suit>(i/13));
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
