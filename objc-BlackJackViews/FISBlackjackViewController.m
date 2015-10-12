//
//  FISBlackjackViewController.m
//  objc-BlackJackViews
//
//  Created by Guang on 10/9/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackViewController.h"

@interface FISBlackjackViewController ()

@end

@implementation FISBlackjackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideUnusedVisual:YES];
}

#pragma mark - Navigation

- (IBAction)deal:(id)sender {
    
    [self hideUnusedVisual:YES];
    self.game = [[FISBlackjackGame alloc] init];
    [self.game.deck resetDeck];
    [self showPlayerHouseCards];

    NSLog(@"generatedCard %@",self.game.deck.description);
    
    
    [self.game dealCardToHouse];
    [self.game dealCardToPlayer];
    NSLog(@"houseCard = %@ playerCard = %@",self.game.player.cardsInHand,self.game.player.cardsInHand);
    [self showPlayerHouseCards];
    
    
    self.playerlables = [NSArray arrayWithObjects: self.playerCard1, self.playerCard2, self.playerCard3, self.playerCard4, self.playerCard5, nil];

    if (!self.game.player.wins) {
        self.hitLable.enabled = YES;
        self.stayLable.enabled = YES;
    }
}

- (IBAction)hit:(id)sender {

    //[self.game processPlayerTurn]; process turn feels no use..
    
    [self.game dealCardToPlayer];
    [self checkPlayer];
    
//    [self.game dealCardToHouse];
//    [self checkHouse];
    
    [self showPlayerHouseCards];
}

-(void)checkPlayer{
    
    if ([self.game.player blackjack]) {
        self.playerBlackjack.hidden = NO;
        self.wins.text = @"1";
        self.winner.text = self.game.player.name;
        self.winner.hidden = NO;
    }if ([self.game.player busted]){
        self.playerBust.hidden = NO;
        self.losses.text = @"1";
        self.winner.hidden = NO;
        self.winner.text = self.game.house.name;
    }
}

-(void)checkHouse{
    [self showPlayerHouseCards];

    if ([self.game.player blackjack]){
        self.houseBlackjack.hidden = NO;
        self.houseWins.text = @"1";
        self.winner.text = self.game.house.name;
        self.winner.hidden = NO;

     }if([self.game.house busted]){
        self.houseBust.hidden = NO;
        self.houseLosses.text = @"1";
        self.winner.text = self.game.player.name;
         self.winner.hidden = NO;

     }
}

- (IBAction)stay:(id)sender {
    
    [self.game dealCardToHouse];
    [self.game processHouseTurn];
    [self checkHouse];
}
/*
 
 Ask the player to hit or to stay. If they choose to hit, they should receive one card. If the player has not bust (over 21 points), then you as the "house" should take your turn.
 
 */

-(BOOL)hideUnusedVisual:(BOOL)status{
    
    self.winner.hidden = status;
    
    self.playerCard1.hidden = status;
    self.playerCard2.hidden = status;
    self.playerCard3.hidden = status;
    self.playerCard4.hidden = status;
    self.playerCard5.hidden = status;
    self.playerStayed.hidden = status;
    self.playerBlackjack.hidden = status;
    self.playerBust.hidden = status;
    
    self.houseCard1.hidden = status;
    self.houseCard2.hidden = status;
    self.houseCard3.hidden = status;
    self.houseCard4.hidden = status;
    self.houseCard5.hidden = status;
    self.houseBlackjack.hidden = status;
    self.houseBust.hidden = status;
    self.houseStayed.hidden = status;
    
    self.playerStayed.hidden = status;
    self.busted.hidden = status;
    self.blackjack.hidden = status;
    self.playScore.hidden = status;
    self.houseScore.hidden = status;
    
    
    return status;
    
}

-(void)showPlayerHouseCards{
    
    for (NSUInteger i = 0 ; i < self.game.player.cardsInHand.count ; i ++ ) {
        
        if (i == 0) {
            self.playerCard1.text = [self.game.player.cardsInHand[i] cardLabel];
            self.playerCard1.hidden = NO;
        }
        if (i == 1) {
            self.playerCard2.text = [self.game.player.cardsInHand[i] cardLabel];
            self.playerCard2.hidden = NO;

        }
        if (i == 2) {
            self.playerCard3.text = [self.game.player.cardsInHand[i] cardLabel];
            self.playerCard3.hidden = NO;

        }
        if (i == 3) {
            self.playerCard4.text = [self.game.player.cardsInHand[i] cardLabel];
            self.playerCard4.hidden = NO;

        }
        if (i == 4) {
            self.playerCard5.text = [self.game.player.cardsInHand[i] cardLabel];
            self.playerCard5.hidden = NO;

        }
    }

    for (NSUInteger i = 0 ; i < self.game.house.cardsInHand.count ; i ++ ) {
        
        if (i == 0) {
            self.houseCard1.text = [self.game.house.cardsInHand[i] cardLabel];
            self.houseCard1.hidden = NO;
        }
        if (i == 1) {
            self.houseCard2.text = [self.game.house.cardsInHand[i] cardLabel];
            self.houseCard2.hidden = NO;
        }
        if (i == 2) {
            self.houseCard3.text = [self.game.house.cardsInHand[i] cardLabel];
            self.houseCard3.hidden = NO;
        }
        if (i == 3) {
            self.houseCard4.text = [self.game.house.cardsInHand[i] cardLabel];
            self.houseCard4.hidden = NO;
        }
        if (i == 4) {
            self.houseCard5.text = [self.game.house.cardsInHand[i] cardLabel];
            self.houseCard5.hidden = NO;
        }
    }
}

-(void)playerCardsLableArray{
    
    self.playerlables = [NSArray arrayWithObjects: self.playerCard1.text, self.playerCard2.text, self.playerCard3.text, self.playerCard4.text, self.playerCard5.text, nil];
}

-(BOOL)prefersStatusBarHidden{
    return  YES;
}


@end
