from enum import Enum
from typing import List
from random import randint

class Suit(Enum):
    SPADE = 0
    CLUB = 1
    HEART = 2
    DIAMOND = 3

    def __str__(self) -> str:
        return str(self.name).capitalize()

class Rank(Enum):
    ACE = 1
    TWO = 2
    THREE = 3
    FOUR = 4
    FIVE = 5
    SIX = 6
    SEVEN = 7
    EIGHT = 8
    NINE = 9
    TEN = 10
    JACK = 11
    QUEEN = 12
    KING = 13

    def __str__(self) -> str:
        if self.value >= 2 and self.value <= 10:
            return str(self.value)
        return str(self.name).capitalize()

class Card:    
    def __init__(self, suit: Suit, rank: Rank) -> None:
        self.suit = suit
        self.rank = rank
    
    @classmethod
    def from_bytes(cls, encoded: bytes):
        i = int.from_bytes(encoded, byteorder='big', signed=False)
        return cls.from_int(i)
    
    @classmethod
    def from_int(cls, encoded: int):
        rank = Rank(encoded & 0xF);
        suit = Suit((encoded & 0x30) >> 4)
        return cls(suit, rank)

    def encode(self) -> bytes:
        i = ((self.suit.value << 4) | self.rank.value)
        return i.to_bytes(1, byteorder='big', signed=False)
    
    def __str__(self) -> str:
        return "{} of {}".format(self.rank, self.suit)

class Deck:
    def __init__(self, initial_deck: List[Card] = None) -> None:
        if initial_deck is not None:
            assert len(initial_deck) == 52
            self.deck = initial_deck
            return
        self.deck = [] # type: List[Card]
        for s in list(Suit):
            for v in list(Rank):
                self.deck.append(Card(s, v))

    @classmethod
    def decode(cls, encoded: bytes):
        deck = [] # type: List[Card]
        for b in encoded:
            deck.append(Card.from_int(b))
        return cls(initial_deck=deck)

    
    def shuffle(self, iterations:int=1000) -> None:
        a, b = 0, 0
        for i in range(1000):
            a = i % 52
            while True:
                b = randint(0, 51)
                if a != b:
                    break
            self.deck[a], self.deck[b] = self.deck[b], self.deck[a]
    
    def encode(self) -> bytes:
        encoded = bytearray()
        for c in self.deck:
            encoded.extend(c.encode())
        return encoded

    def __str__(self) -> str:
        s = ""
        for i, card in enumerate(self.deck):
            s += str(card)
            separator = '\t'
            if i % 4 == 3:
                separator = '\n'
            s += separator
        return s

if __name__ == '__main__':
    d = Deck()
    d.shuffle()
    print(d.encode())
    print(d.deck[0].encode())
    print(Card.from_bytes(d.deck[0].encode()))
    print(d)
    print(d.decode(d.encode()))