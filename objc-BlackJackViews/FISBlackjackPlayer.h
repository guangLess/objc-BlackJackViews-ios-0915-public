//
//  FISBlackjackPlayer.h
//  BlackJack
//
//  Created by Guang on 10/7/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISBlackjackPlayer : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSMutableArray *cardsInHand;

@property(nonatomic,assign)NSUInteger handscore;
@property(nonatomic,assign)NSUInteger wins;
@property(nonatomic,assign)NSUInteger losses;


@property(nonatomic) BOOL aceInHand;
@property (nonatomic) BOOL blackjack;
@property (nonatomic) BOOL busted;
@property (nonatomic) BOOL stayed;


-(instancetype)initWithName:(NSString *)name;
-(void)resetForNewGame;
-(void)acceptCard:(FISCard *)card;
-(BOOL)shouldHit;

@end
