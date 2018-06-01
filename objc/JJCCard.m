//
//  JJCCard.m
//  Cards
//
//  Created by Jonathan Jemson on 5/28/18.
//

#import "JJCCard.h"

NSString * _Nonnull NSStringFromJJCRank(JJCRank rank) {
    switch (rank) {
        case JJCRankAce:
            return @"Ace";
        case JJCRankJack:
            return @"Jack";
        case JJCRankQueen:
            return @"Queen";
        case JJCRankKing:
            return @"King";
        default:
            return [NSString stringWithFormat:@"%lu", rank];
    }
}
NSString * _Nonnull NSStringFromJJCSuit(JJCSuit suit) {
    switch (suit) {
        case JJCSuitSpade:
            return @"Spade";
        case JJCSuitClub:
            return @"Club";
        case JJCSuitHeart:
            return @"Heart";
        case JJCSuitDiamond:
            return @"Diamond";
        default:
            return @"Unknown";
    }
}

@implementation JJCCard

- (instancetype)initWithSuit:(JJCSuit)suit rank:(JJCRank)rank {
    NSParameterAssert(suit >= 0 && suit <= 3);
    NSParameterAssert(rank >= 1 && rank <= 13);
    if (self = [super init]) {
        _suit = suit;
        _rank = rank;
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    if (!object) { return NO; }
    if (self == object) { return YES; }
    if (![object isKindOfClass:[self class]]) { return NO; }
    JJCCard *other = (JJCCard *)object;
    return (self.suit == other.suit) && (self.rank == other.rank);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ of %@", NSStringFromJJCRank(self.rank), NSStringFromJJCSuit(self.suit)];
}

@end
