//
//  JJCCard.h
//  Cards
//
//  Created by Jonathan Jemson on 5/28/18.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JJCSuit) {
    JJCSuitSpade = 0,
    JJCSuitClub,
    JJCSuitHeart,
    JJCSuitDiamond
};

typedef NS_ENUM(NSUInteger, JJCRank) {
    JJCRankAce = 1,
    JJCRankTwo = 2,
    JJCRankThree = 3,
    JJCRankFour = 4,
    JJCRankFive = 5,
    JJCRankSix = 6,
    JJCRankSeven = 7,
    JJCRankEight = 8,
    JJCRankNine = 9,
    JJCRankTen = 10,
    JJCRankJack = 11,
    JJCRankQueen = 12,
    JJCRankKing = 13
};

NSString * _Nonnull NSStringFromJJCRank(JJCRank rank);
NSString * _Nonnull NSStringFromJJCSuit(JJCSuit suit);

@interface JJCCard : NSObject

@property (atomic, assign) JJCSuit suit;
@property (atomic, assign) JJCRank rank;

- (nonnull instancetype)initWithSuit:(JJCSuit)suit rank:(JJCRank)rank;

@end
