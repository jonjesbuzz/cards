//
//  JJCCard.m
//  Cards
//
//  Created by Jonathan Jemson on 5/28/18.
//

#import "JJCCard.h"

static NSString * _Nonnull const JJCCardKeyRank = @"rank";
static NSString * _Nonnull const JJCCardKeySuit = @"suit";

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

- (NSData *)encode {
    uint8_t *data = malloc(sizeof(uint8_t));
    *data = (self.suit << 4 | self.rank);
    void* encoded = (void *)data;
    return [[NSData alloc] initWithBytes:encoded length:1];
}

- (instancetype)initWithEncodedData:(NSData *)data {
    void* buf = malloc(1);
    [data getBytes:buf length:1];
    
    uint8_t *encoded = (uint8_t *)buf;
    
    NSInteger rank = *encoded & 0xF;
    NSInteger suit = (*encoded & 0x30) >> 4;
    free(buf);
    
    if (suit < 0 || suit > 3 || rank < 1 || rank > 13) {
        return nil;
    }
    self = [self initWithSuit:suit rank:rank];
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeInteger:self.rank forKey:JJCCardKeyRank];
    [aCoder encodeInteger:self.suit forKey:JJCCardKeySuit];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    NSInteger rank = [aDecoder decodeIntegerForKey:JJCCardKeyRank];
    NSInteger suit = [aDecoder decodeIntegerForKey:JJCCardKeySuit];
    self = [self initWithSuit:suit rank:rank];
    return self;
}

@end
