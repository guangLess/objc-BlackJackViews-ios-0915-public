//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Guang on 10/7/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

-(instancetype)init{
    self = [super self];
    if (self) {
        _deck = [[FISCardDeck alloc] init];
        _house = [[FISBlackjackPlayer alloc] initWithName:@"House"];
        _player = [[FISBlackjackPlayer alloc] initWithName:@"Player"];
    }
    
    return self;
}

-(void)dealCardToPlayer{
 
    [self.player acceptCard:[self.deck drawNextCard]];
}

-(void)dealCardToHouse{
    
    [self.house acceptCard:[self.deck drawNextCard]];
}

-(void)dealNewRound{
    
    [self.player resetForNewGame]; // draw next card -(FISCard *)drawNextCard{
    [self.house resetForNewGame];
    
    for (NSInteger i = 0 ; i < 2 ; i++) {
        [self dealCardToHouse];
        [self dealCardToPlayer];
    }
}

-(void)playBlackjack{
    
    
}

-(void)processPlayerTurn{

    
    // if the player hasn't busted or stayed, then we need to see if they want to hit, and deal them a card if they do
    
    if(!self.player.busted && !self.player.stayed) {
        if( [self.player shouldHit] ){
            [self dealCardToPlayer];
            //[self dealCardToHouse];
        }           
    }
    
//    if ([self.player shouldHit]){
//        
//        if ([self.player stayed] == NO ||
//            [self.player shouldHit] == NO ||
//            [self.player busted] ||
//            [self.player stayed]){
//            
//        }else [self dealCardToPlayer];
//
//    }
    
    /*  if ([self.house busted] || [self.house stayed]) {
     }
     if ([self.house shouldHit]){
     [self.house stayed] == NO;
     [self.house shouldHit] == NO;
     }//else [self dealCardToHouse];
     */
}
           
           
-(void)processHouseTurn{
    
    if ( !self.house.busted && !self.house.stayed) {
        if ([self.house shouldHit]) {
            [self dealCardToHouse];
        }
    }
    
}
-(BOOL)houseWins{
    
    if (self.player.handscore > self.house.handscore) {
        return NO;
    }
    
    if ([self.house busted] == YES) {
        return NO;
    }
    if ([self.player blackjack] == YES && [self.house blackjack] == YES){
        return NO;
    }
    
    if (self.player.handscore == self.player.handscore) {
        return YES;
    }
    
    return NO;
}

-(void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins{

    if (houseWins) {
        self.house.wins += 1;
        self.player.losses += 1;
    }else{
        self.house.losses += 1;
        self.player.wins += 1;
    }
    
}







@end
