//
//  FISCardDeck.h
//  OOP-Cards-Model
//
//  Created by Guang on 10/5/15.
//  Copyright © 2015 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISCardDeck : NSObject

@property (nonatomic, strong) NSMutableArray *remainingCards;
@property (nonatomic, strong)NSMutableArray *dealtCards;


-(FISCard *)drawNextCard;
-(void)resetDeck;
-(void)gatherDealtCards;
-(void)shuffleRemainingCards;


-(void)generateCards;

-(instancetype)init;

@end
