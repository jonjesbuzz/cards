"use strict";

let Suit = Object.freeze({
    'Spade': 0,
    'Club': 1,
    'Heart': 2,
    'Diamond': 3
});

let Rank = Object.freeze({
    'Ace': 1,
    'Two': 2,
    'Three': 3,
    'Four': 4,
    'Five': 5,
    'Six': 6,
    'Seven': 7,
    'Eight': 8,
    'Nine': 9,
    'Ten': 10,
    'Jack': 11,
    'Queen': 12,
    'King': 13
});

function StringFromSuit(suit) {
    switch (suit) {
        case Suit.Spade:
            return "Spade";
        case Suit.Club:
            return "Club";
        case Suit.Heart:
            return "Heart";
        case Suit.Diamond:
            return "Diamond";
    }
    return "";
}

function StringFromRank(rank) {
    switch (rank) {
        case Rank.Ace:
            return "Ace";
        case Rank.Jack:
            return "Jack";
        case Rank.Queen:
            return "Queen";
        case Rank.King:
            return "King";
        default:
            return String(rank);
    }
}

class Card {
    constructor(suit, rank) {
        this.suit = suit;
        this.rank = rank;
    }

    static decode(encoded) {
        let r = encoded & 0xF;
        let s = (encoded & 0x30) >> 4
        return new Card(s, r);
    }

    encode() {
        return (this.suit << 4) | this.rank;
    }

    toString() {
        return StringFromRank(this.rank) + " of " + StringFromSuit(this.suit);
    }
};

class Deck {
    constructor(deck) {
        if (deck !== undefined && deck.length <= 52) {
            this.deck = deck;
            return
        }
        this.deck = Array();
        for (var s = 0; s < 4; s++) {
            for (var r = 1; r <= 13; r++) {
                var c = new Card(s, r);
                this.deck.push(c);
            }
        }
    }

    static decode(encoded) {
        let d = Array();
        encoded.forEach(function(e) {
            d.push(Card.decode(e));
        });
        return new Deck(d);
    }

    encode() {
        let encoded = Array();
        this.deck.forEach(function(c) {
            encoded.push(c.encode());
        });
        return encoded;
    }

    shuffle() {
        this.deck.sort(function(a, b) {
            return Math.random() < 0.5;
        });
    }

    toString() {
        var res = "";
        this.deck.forEach(function(v, i) {
            res += v.toString();
            if (i % 4 == 3) {
                res += "\n";
            } else {
                res += "\t";
            }
        });
        return res;
    }
};

module.exports = Object.freeze({
    'Suit': Suit,
    'Rank': Rank,
    'Card': Object.freeze(Card),
    'Deck': Object.freeze(Deck)
});