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

class FaceValue(Enum):
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
    def __init__(self, suit: Suit, faceValue: FaceValue) -> None:
        self.suit = suit
        self.faceValue = faceValue
    
    def __str__(self) -> str:
        return "{} of {}".format(self.faceValue, self.suit)

class Deck:
    def __init__(self) -> None:
        self.deck = [] # type: List[Card]
        for s in list(Suit):
            for v in list(FaceValue):
                self.deck.append(Card(s, v))
    
    def shuffle(self, iterations:int=1000) -> None:
        a, b = 0, 0
        for i in range(1000):
            a = i % 52
            while True:
                b = randint(0, 51)
                if a != b:
                    break
            self.deck[a], self.deck[b] = self.deck[b], self.deck[a]

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
    print(d)
