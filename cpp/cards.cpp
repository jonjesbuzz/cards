#include "cards.h"

#include <algorithm>
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

std::string Card::to_string() {
    std::string suit_s;
    switch(suit) {
        case SPADE:
            suit_s = "Spade";
            break;
        case CLUB:
            suit_s = "Club";
            break;
        case HEART:
            suit_s = "Heart";
            break;
        case DIAMOND:
            suit_s = "Diamond";
            break;
        default:
            return std::string("Error");
    }

    std::string face;
    switch(face_value) {
        case ACE:
            face = "Ace";
            break;
        case JACK:
            face = "Jack";
            break;
        case QUEEN:
            face = "Queen";
            break;
        case KING:
            face = "King";
            break;
        default:
            std::stringstream str;
            str << static_cast<int>(face_value);
            face = str.str();
            break;
    }

    std::stringstream stream;
    stream << face << " of " << suit_s;
    return stream.str();

}

Deck::Deck() :
num_cards(52) {
    for (auto i = 0; i < num_cards; i++) {
        cards.push_back(std::make_shared<Card>((FaceValue)(i%13 + 1), (Suit)(i/13)));
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
        std::iter_swap(cards.begin() + a, cards.begin() + b);
    }
}

std::shared_ptr<Card> Deck::get_card(int index) {
    return cards[index];
}

std::string Deck::to_string() {
    std::stringstream stream;
    for (auto i = 0; i < num_cards; i++) {
        auto current = cards[i];
        auto s = current->to_string();
        stream << s;
        if (i % 4 == 3) {
            stream << std::endl;
        } else {
            stream << "\t";
        }
    }
    return stream.str();
}