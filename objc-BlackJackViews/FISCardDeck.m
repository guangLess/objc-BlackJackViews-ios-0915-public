//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Guang on 10/5/15.
//  Copyright © 2015 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck


-(instancetype)init{
    
    self = [super self];
    if (self) {
        
        _remainingCards = [[NSMutableArray alloc] init];
        _dealtCards = [[NSMutableArray alloc] init];
        [self generateCards];
    }
    
    return self;
}

-(void)generateCards{
    
    FISCard * cardSet = [[FISCard alloc] init];
    
    NSArray * allSuitKind = [[cardSet class] validSuits];
    NSArray * allRanksKind = [[cardSet class] validRanks];
    
    for (NSString *eachSuit in allSuitKind) {
        for (NSString *eachRank in allRanksKind) {
            
            FISCard * eachCardClass = [[FISCard alloc] initWithSuit:eachSuit rank:eachRank];
            [self.remainingCards addObject:eachCardClass];
        }
    }
}


-(FISCard *)drawNextCard{
    
    if (self.remainingCards.count == 0) {
        return nil;
        NSLog(@"Array is Empty AHH");
    }
    else{

        FISCard * cardDraw = self.remainingCards.lastObject;

        [self.dealtCards addObject: cardDraw];
        [self.remainingCards removeLastObject];

        return cardDraw;
    }
}

-(void)resetDeck{
    
    [self gatherDealtCards];
    [self shuffleRemainingCards];
}

-(void)gatherDealtCards{
    
    if (self.dealtCards) {
        
    [self.remainingCards addObjectsFromArray:self.dealtCards]; // add each element in the array
    [self.dealtCards removeAllObjects];
        
    }
}


-(void)shuffleRemainingCards{
    
    NSMutableArray * cardMemory = [self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    
    NSUInteger countOfCardMemory = cardMemory.count;
    
    if (cardMemory.count == 52) {

        for (NSUInteger i = 0 ; i < countOfCardMemory ; i ++ ) {
            
            NSUInteger countOfCardMemory = cardMemory.count;
            NSUInteger random = arc4random_uniform((unsigned int)countOfCardMemory);
            
            FISCard *randomCard = [cardMemory objectAtIndex:random];
            
            [self.remainingCards addObject:randomCard];
            [cardMemory removeObjectAtIndex:random];
        }
    }
}


-(NSString *)description{
   
    NSMutableString * count = [[@(self.remainingCards.count) stringValue] mutableCopy];
    NSMutableString * formatCount = [NSMutableString stringWithFormat:@"count : %@\ncards : \n",count];

    for (FISCard * card in self.remainingCards) {
        [formatCount appendString:[NSString stringWithFormat:@" %@",card.description]];
    }
    
    return formatCount;
}

@end
