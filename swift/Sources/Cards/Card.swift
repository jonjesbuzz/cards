//
//  Card.swift
//  Cards
//
//  Created by Jonathan Jemson on 12/11/16
//

import Foundation

public struct Card: CustomStringConvertible, Codable, Equatable {
    public enum Suit: Int, CustomStringConvertible, Codable {
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
    public enum Rank: Int, CustomStringConvertible, Codable {
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

public func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.suit == rhs.suit && lhs.rank == rhs.rank
}

// Cards framework's encoding/decoding
public extension Card {
    public init?(encoded: Data) {
        guard encoded.count == 1 else { return nil }
        let bytes = Array<UInt8>(encoded)
        guard let data = bytes.first,
            let rank = Rank(rawValue: Int(data & 0x0F)),
            let suit = Suit(rawValue: Int((data & 0x30) >> 4))
            else { return nil }
        self.rank = rank
        self.suit = suit
    }
    
    public func encode() -> Data {
        let encoded = UInt8((self.suit.rawValue << 4) | self.rank.rawValue)
        return Data(bytes: [encoded])
    }
}
