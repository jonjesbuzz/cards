import Foundation
#if os(Linux)
import Glibc
#endif

public struct Card: CustomStringConvertible {
    public enum Suit: Int, CustomStringConvertible {
        case spade = 0
        case club
        case heart
        case diamond
        
        public var description: String {
            switch (self) {
            case .spade:
                return "Spade"
            case .club:
                return "Club"
            case .heart:
                return "Heart"
            case .diamond:
                return "Diamond"
            }
        }
    }
    public enum Rank: Int, CustomStringConvertible {
        case ace = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        case jack = 11
        case queen = 12
        case king = 13

        public var description: String {
            switch (self) {
            case .ace:
                return "Ace"
            case .jack:
                return "Jack"
            case .queen:
                return "Queen"
            case .king:
                return "King"
            default:
                return String(self.rawValue)
            }
        }
    }

    private(set) public var suit: Suit
    private(set) public var rank: Rank

    public var description: String {
        return "\(rank) of \(suit)"
    }
}
public struct Deck: CustomStringConvertible {
    private var deck: [Card]

    public init() {
        deck = [Card]()
        for s in 0..<4 {
            for v in 1...13 {
                deck.append(Card(suit: Card.Suit(rawValue: s)!, rank: Card.Rank(rawValue: v)!))
            }
        }
    }

    public mutating func shuffle() {
        deck.shuffle()
    }

    public var description: String {
        var deckString = ""
        for (i, card) in deck.enumerated() {
            deckString.append(card.description)
            if (i % 4 == 3) {
                deckString.append("\n")
            } else {
                deckString.append("\t")
            }
        }
        return deckString
    }
}
