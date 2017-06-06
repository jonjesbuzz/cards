extern crate rand;

use rand::Rng;
use std::{char, fmt};

#[derive(Clone, Debug)]
pub enum Suit {
    Spades,
    Hearts,
    Diamonds,
    Clubs,
}

impl fmt::Display for Suit {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let s = match *self {
            Suit::Spades => "♠",
            Suit::Hearts => "♥",
            Suit::Diamonds => "♦",
            Suit::Clubs => "♣",
        };
        write!(f, "{}", s)
    }
}

#[derive(Clone, Debug)]
pub enum Rank {
    Two,
    Three,
    Four,
    Five,
    Six,
    Seven,
    Eight,
    Nine,
    Ten,
    Jack,
    Queen,
    King,
    Ace,
}

impl fmt::Display for Rank {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let s = match *self {
            Rank::Two => "2",
            Rank::Three => "3",
            Rank::Four => "4",
            Rank::Five => "5",
            Rank::Six => "6",
            Rank::Seven => "7",
            Rank::Eight => "8",
            Rank::Nine => "9",
            Rank::Ten => "10",
            Rank::Jack => "J",
            Rank::Queen => "Q",
            Rank::King => "K",
            Rank::Ace => "A",
        };
        write!(f, "{}", s)
    }
}

#[derive(Clone, Debug)]
pub struct Card {
    suit: Suit,
    rank: Rank,
}

impl Card {
    pub fn new(suit: Suit, rank: Rank) -> Self {
        Self { suit: suit, rank: rank }
    }

    pub fn suit(&self) -> &Suit {
        &self.suit
    }

    pub fn rank(&self) -> &Rank {
        &self.rank
    }
}

impl fmt::Display for Card {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let suit = match self.suit {
            Suit::Spades => 0x1F0A1,
            Suit::Hearts => 0x1F0B1,
            Suit::Diamonds => 0x1F0C1,
            Suit::Clubs => 0x1F0D1,
        };
        let rank = match self.rank {
            Rank::Ace => 0,
            Rank::Two => 1,
            Rank::Three => 2,
            Rank::Four => 3,
            Rank::Five => 4,
            Rank::Six => 5,
            Rank::Seven => 6,
            Rank::Eight => 7,
            Rank::Nine => 8,
            Rank::Ten => 9,
            Rank::Jack => 10,
            Rank::Queen => 11,
            Rank::King => 12,
        };
        let c = char::from_u32(suit + rank).ok_or(fmt::Error {})?;
        write!(f, "{}", c)
    }
}

#[derive(Clone, Debug)]
pub struct Deck {
    cards: Vec<Card>,
}

impl Deck {
    pub fn new() -> Self {
        static DECK: [Card; 52] = [
            Card { suit: Suit::Spades, rank: Rank::Two },
            Card { suit: Suit::Spades, rank: Rank::Three },
            Card { suit: Suit::Spades, rank: Rank::Four },
            Card { suit: Suit::Spades, rank: Rank::Five },
            Card { suit: Suit::Spades, rank: Rank::Six },
            Card { suit: Suit::Spades, rank: Rank::Seven },
            Card { suit: Suit::Spades, rank: Rank::Eight },
            Card { suit: Suit::Spades, rank: Rank::Nine },
            Card { suit: Suit::Spades, rank: Rank::Ten },
            Card { suit: Suit::Spades, rank: Rank::Jack },
            Card { suit: Suit::Spades, rank: Rank::Queen },
            Card { suit: Suit::Spades, rank: Rank::King },
            Card { suit: Suit::Spades, rank: Rank::Ace },
            Card { suit: Suit::Hearts, rank: Rank::Two },
            Card { suit: Suit::Hearts, rank: Rank::Three },
            Card { suit: Suit::Hearts, rank: Rank::Four },
            Card { suit: Suit::Hearts, rank: Rank::Five },
            Card { suit: Suit::Hearts, rank: Rank::Six },
            Card { suit: Suit::Hearts, rank: Rank::Seven },
            Card { suit: Suit::Hearts, rank: Rank::Eight },
            Card { suit: Suit::Hearts, rank: Rank::Nine },
            Card { suit: Suit::Hearts, rank: Rank::Ten },
            Card { suit: Suit::Hearts, rank: Rank::Jack },
            Card { suit: Suit::Hearts, rank: Rank::Queen },
            Card { suit: Suit::Hearts, rank: Rank::King },
            Card { suit: Suit::Hearts, rank: Rank::Ace },
            Card { suit: Suit::Clubs, rank: Rank::Two },
            Card { suit: Suit::Clubs, rank: Rank::Three },
            Card { suit: Suit::Clubs, rank: Rank::Four },
            Card { suit: Suit::Clubs, rank: Rank::Five },
            Card { suit: Suit::Clubs, rank: Rank::Six },
            Card { suit: Suit::Clubs, rank: Rank::Seven },
            Card { suit: Suit::Clubs, rank: Rank::Eight },
            Card { suit: Suit::Clubs, rank: Rank::Nine },
            Card { suit: Suit::Clubs, rank: Rank::Ten },
            Card { suit: Suit::Clubs, rank: Rank::Jack },
            Card { suit: Suit::Clubs, rank: Rank::Queen },
            Card { suit: Suit::Clubs, rank: Rank::King },
            Card { suit: Suit::Clubs, rank: Rank::Ace },
            Card { suit: Suit::Diamonds, rank: Rank::Two },
            Card { suit: Suit::Diamonds, rank: Rank::Three },
            Card { suit: Suit::Diamonds, rank: Rank::Four },
            Card { suit: Suit::Diamonds, rank: Rank::Five },
            Card { suit: Suit::Diamonds, rank: Rank::Six },
            Card { suit: Suit::Diamonds, rank: Rank::Seven },
            Card { suit: Suit::Diamonds, rank: Rank::Eight },
            Card { suit: Suit::Diamonds, rank: Rank::Nine },
            Card { suit: Suit::Diamonds, rank: Rank::Ten },
            Card { suit: Suit::Diamonds, rank: Rank::Jack },
            Card { suit: Suit::Diamonds, rank: Rank::Queen },
            Card { suit: Suit::Diamonds, rank: Rank::King },
            Card { suit: Suit::Diamonds, rank: Rank::Ace },
        ];
        Deck { cards: DECK.to_vec() }
    }

    pub fn shuffle(&mut self) {
        rand::thread_rng().shuffle(&mut self.cards);
    }

    pub fn cards(&self) -> &[Card] {
        &self.cards
    }
}

impl fmt::Display for Deck {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        for c in &self.cards {
            write!(f, "{}", c)?;
        }
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let mut d = Deck::new();
        d.shuffle();
        assert!(!d.to_string().is_empty());
    }
}
