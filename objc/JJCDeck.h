//
//  JJCDeck.h
//  Cards
//
//  Created by Jonathan Jemson on 5/28/18.
//

#import <Foundation/Foundation.h>
#import <Cards/JJCCard.h>

@interface JJCDeck : NSObject

@property (strong, atomic, nonnull) NSArray<JJCCard *> *deck;

- (void)shuffle;

@end
