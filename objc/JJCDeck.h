//
//  JJCDeck.h
//  Cards
//
//  Created by Jonathan Jemson on 5/28/18.
//

#import <Foundation/Foundation.h>
#import <Cards/JJCCard.h>

@interface JJCDeck : NSObject <NSCoding>

- (nonnull instancetype)init;
- (nullable instancetype)initWithEncodedData:(nonnull NSData *)data;
- (nonnull JJCCard *)cardAtIndex:(NSUInteger)index;
- (void)shuffle;
- (nonnull NSData *)encode;

@end
