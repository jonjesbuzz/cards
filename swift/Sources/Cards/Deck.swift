import Foundation

public struct Deck: CustomStringConvertible, Codable, Equatable {
    fileprivate var deck: [Card]

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

public func ==(lhs: Deck, rhs: Deck) -> Bool {
    return lhs.deck.count == rhs.deck.count && lhs.deck.elementsEqual(rhs.deck)
}

// Cards framework's encoding/decoding
public extension Deck {
    public init?(encoded: Data) {
        var deck = [Card]()
        guard encoded.count <= 52 else { return nil }
        for (i, _) in encoded.enumerated() {
            if let card = Card(encoded: encoded.subdata(in: i..<i+1)) {
                deck.append(card)
            } else {
                return nil
            }
        }
        self.deck = deck
    }
    
    public func encode() -> Data {
        var data = Data()
        for card in self.deck {
            data.append(card.encode())
        }
        return data
    }
}
