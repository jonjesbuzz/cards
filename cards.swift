import Foundation

public struct Card: CustomStringConvertible {
    public enum Suit: Int {
        case Spade = 0
        case Club
        case Heart
        case Diamond
    }
    public enum FaceValue: Int {
        case Ace = 1
        case Two = 2
        case Three = 3
        case Four = 4
        case Five = 5
        case Six = 6
        case Seven = 7
        case Eight = 8
        case Nine = 9
        case Ten = 10
        case Jack = 11
        case Queen = 12
        case King = 13
    }

    private(set) public var suit: Suit
    private(set) public var value: FaceValue

    public var description: String {
        return "\(value) of \(suit)"
    }
}
public struct Deck: CustomStringConvertible {
    private var deck: [Card]

    public init() {
        deck = [Card]()
        for s in 0..<4 {
            for v in 1...13 {
                deck.append(Card(suit: Card.Suit(rawValue: s)!, value: Card.FaceValue(rawValue: v)!))
            }
        }
    }

    public mutating func shuffle() {
        deck.sort { (_, _) -> Bool in
            return arc4random() % 2 == 0
        }
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