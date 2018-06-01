//
//  JJCDeck.m
//  Cards
//
//  Created by Jonathan Jemson on 5/28/18.
//

#import "JJCDeck.h"

@implementation JJCDeck

- (instancetype)init {
    if (self = [super init]) {
        NSMutableArray<JJCCard *> *cards = [[NSMutableArray alloc] initWithCapacity:52];
        JJCCard *card = nil;
        for (int s = 0; s < 4; s++) {
            for (int r = 1; r < 14; r++) {
                card = [[JJCCard alloc] initWithSuit:(JJCSuit)s rank:(JJCRank)r];
                [cards addObject:card];
            }
        }
        _deck = [cards copy];
    }
    return self;
}

- (void)shuffle {
    self.deck = [self.deck sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return random() % 2 == 0;
    }];
}

- (NSString *)description {
    NSUInteger i = 0;
    NSMutableString *result = [NSMutableString stringWithCapacity:52 * 16];
    for (JJCCard *card in self.deck) {
        [result appendFormat:@"%@", card.description];
        if (i % 4 == 3) {
            [result appendString:@"\n"];
        } else {
            [result appendString:@"\t"];
        }
    }
    return [result copy];
}

- (BOOL)isEqual:(id)object {
    if (!object) { return NO; }
    if (self == object) { return YES; }
    if (![object isKindOfClass:[self class]]) { return NO; }
    
    JJCDeck *other = (JJCDeck *)object;
    return ([self.deck isEqualToArray:other.deck]);
}

@end
