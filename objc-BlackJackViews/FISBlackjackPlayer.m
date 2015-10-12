//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Guang on 10/7/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer


-(instancetype)init {
    
    self = [self initWithName:@""];
    return self;
}

-(instancetype)initWithName:(NSString *)name{
    
    self = [super init];
    if (self) {
        _name = name;
        _cardsInHand = [[NSMutableArray alloc] init];
        _handscore = 0;
        _losses = 0;
        _wins =0;
        _aceInHand = NO;
        _busted = NO;
        _stayed = NO;
        _blackjack = NO;
    }
    return self;
}


-(void)acceptCard:(FISCard *)card{
    
    [self.cardsInHand addObject:card];
    self.handscore = self.handscore + card.cardValue;
  
    if ([card.rank isEqualToString:@"A"]){
        
        self.aceInHand = YES;
        if ( self.handscore <= 11 ){
            self.handscore += 10;
        }
    }
    
    if (self.handscore == 21) {
        self.blackjack = YES;
    }
    if (self.handscore > 21) {
        self.busted = YES;
    }
}

-(void)resetForNewGame{
    
    self.cardsInHand = [@[]mutableCopy];
    self.handscore = 0;
    self.aceInHand = NO;
    self.stayed = NO;
    self.blackjack = NO;
    self.busted = NO;
    
}

-(BOOL)shouldHit{
    
    if (self.handscore > 17) {
        self.stayed = YES;
        return NO;;
    }
    return YES;
}

-(NSString *)description{
    
    NSMutableString * description = [NSMutableString stringWithFormat:@"name: %@\n cards: %@\n handscore: %ld\n ace in hand: %ld\n stayed :%ld\n blackjack : %ld\n busted : %ld \n wins : %ld\n losses : %ld", self.name, self.cardsInHand, self.handscore, self.aceInHand, self.stayed, self.blackjack, self.busted, self.wins, self.losses];
    
    return description;
}

@end
