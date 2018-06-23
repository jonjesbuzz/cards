//
//  JJCDeck.m
//  Cards
//
//  Created by Jonathan Jemson on 5/28/18.
//

#import "JJCDeck.h"
#import <os/log.h>

static NSString * _Nonnull const JJCDeckKeyDeck = @"deck";

@interface JJCDeck ()

@property (strong, atomic, nonnull) NSArray<JJCCard *> *deck;

@end

@implementation JJCDeck

+ (os_log_t)log {
    static os_log_t _log;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _log = os_log_create("com.jjemson.cards", "deck");
    });
    return _log;
}

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
        i++;
    }
    return [result copy];
}

- (nonnull JJCCard *)cardAtIndex:(NSUInteger)index {
    NSParameterAssert(index >= 0 && index < [self.deck count]);
    return [self.deck objectAtIndex:index];
}

- (BOOL)isEqual:(id)object {
    if (!object) { return NO; }
    if (self == object) { return YES; }
    if (![object isKindOfClass:[self class]]) { return NO; }
    
    JJCDeck *other = (JJCDeck *)object;
    return ([self.deck isEqualToArray:other.deck]);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        NSError *error;
        [aDecoder decodeTopLevelObjectOfClasses:[NSSet setWithObjects:[NSArray class], [JJCCard class], nil] forKey:JJCDeckKeyDeck error:&error];
        if (error) {
            os_log_error([[self class] log], "Deserialization error: %@", error.description);
            return nil;
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.deck forKey:JJCDeckKeyDeck];
}

- (NSData *)encode {
    NSMutableData *data = [[NSMutableData alloc] initWithCapacity:[self.deck count]];
    for (JJCCard *card in self.deck) {
        [data appendData:[card encode]];
    }
    return [data copy];
}

- (instancetype)initWithEncodedData:(NSData *)data {
    NSUInteger cardsInDeck = [data length];
    if (cardsInDeck > 52) return nil;
    
    NSMutableArray<JJCCard *> *deck = [[NSMutableArray alloc] initWithCapacity:cardsInDeck];
    
    uint8_t *buffer = (uint8_t *)[data bytes];
    
    JJCCard *currentCard = nil;
    NSData *tempData = nil;
    for (NSUInteger i = 0; i < cardsInDeck; i++) {
        tempData = [[NSData alloc] initWithBytesNoCopy:(buffer + i) length:1 freeWhenDone:NO];
        currentCard = [[JJCCard alloc] initWithEncodedData:tempData];
        if (!currentCard) {
            return nil;
        }
        [deck addObject:currentCard];
    }
    
    if (self = [super init]) {
        _deck = [deck copy];
    }
    return self;
}

@end
