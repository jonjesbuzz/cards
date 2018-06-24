import XCTest
@testable import Cards

class CardsTests: XCTestCase {
    func testEncoding() throws {
        let deck = Deck()
        let encoder = JSONEncoder()
        let json = try encoder.encode(deck)
        let jsonString = String(data: json, encoding: .utf8)
        print(jsonString ?? "ERROR")
    }
    
    func testEncodingCard() throws {
        let card = Card(suit: .heart, rank: .ace)
        let data = card.encode()
        XCTAssertEqual(data.first, 0x21)
        let card2 = Card(encoded: data)
        XCTAssertEqual(card, card2)
    }
    
    func testEncodingDeck() throws {
        let deck = Deck()
        let data = deck.encode()
        let deck2 = Deck(encoded: data)
        XCTAssertEqual(deck, deck2)
        XCTAssertEqual(deck2, Deck())
    }
}
