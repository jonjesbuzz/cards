//
//  CardsTests.m
//  CardsTests
//
//  Created by Jonathan Jemson on 5/30/18.
//

#import <XCTest/XCTest.h>
#import <Cards/Cards.h>

@interface CardsTests : XCTestCase

@end

@implementation CardsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDeckOutput {
    JJCDeck *deck = [[JJCDeck alloc] init];
    XCTAssertNotNil(deck);
    NSLog(@"%@", deck);
    [deck shuffle];
    NSLog(@"%@", deck);
}

- (void)testCardEquality {
    JJCCard *aceOfSpades = [[JJCCard alloc] initWithSuit:JJCSuitSpade rank:JJCRankAce];
    JJCCard *otherAce = [[JJCCard alloc] initWithSuit:JJCSuitSpade rank:JJCRankAce];
    XCTAssertEqualObjects(aceOfSpades, otherAce);
}

- (void)testCardEqualityWrongSuit {
    JJCCard *aceOfSpades = [[JJCCard alloc] initWithSuit:JJCSuitSpade rank:JJCRankAce];
    JJCCard *otherAce = [[JJCCard alloc] initWithSuit:JJCSuitHeart rank:JJCRankAce];
    XCTAssertNotEqualObjects(aceOfSpades, otherAce);
}

- (void)testCardEqualityWrongRank {
    JJCCard *aceOfSpades = [[JJCCard alloc] initWithSuit:JJCSuitSpade rank:JJCRankAce];
    JJCCard *threeSpade = [[JJCCard alloc] initWithSuit:JJCSuitSpade rank:JJCRankThree];
    XCTAssertNotEqualObjects(aceOfSpades, threeSpade);
}

- (void)testDeckEquality {
    JJCDeck *deck1 = [[JJCDeck alloc] init];
    JJCDeck *deck2 = [[JJCDeck alloc] init];
    XCTAssertEqualObjects(deck1, deck2);
}

// The chance of this test failing is 1 in 8.07e67
- (void)testShuffleNonEqual {
    JJCDeck *deck1 = [[JJCDeck alloc] init];
    JJCDeck *deck2 = [[JJCDeck alloc] init];
    [deck2 shuffle];
    XCTAssertNotEqualObjects(deck1, deck2);
}

- (void)testDeckPerformance {
    __block JJCDeck *deck;
    [self measureBlock:^{
        deck = [[JJCDeck alloc] init];
    }];
}

- (void)testShufflePerformance {
    JJCDeck *deck = [[JJCDeck alloc] init];
    [self measureBlock:^{
        [deck shuffle];
    }];
}

@end
