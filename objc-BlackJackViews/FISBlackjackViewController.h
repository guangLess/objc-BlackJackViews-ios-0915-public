//
//  FISBlackjackViewController.h
//  objc-BlackJackViews
//
//  Created by Guang on 10/9/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISBlackjackGame.h"

@interface FISBlackjackViewController : UIViewController

@property (strong, nonatomic) FISBlackjackGame * game;


@property (weak, nonatomic) IBOutlet UILabel *winner;

@property (weak, nonatomic) IBOutlet UILabel *house;
@property (weak, nonatomic) IBOutlet UILabel *houseScore;
@property (weak, nonatomic) IBOutlet UILabel *houseStayed;
@property (weak, nonatomic) IBOutlet UILabel *houseCard1;
@property (weak, nonatomic) IBOutlet UILabel *houseCard2;
@property (weak, nonatomic) IBOutlet UILabel *houseCard3;
@property (weak, nonatomic) IBOutlet UILabel *houseCard4;
@property (weak, nonatomic) IBOutlet UILabel *houseCard5;

@property (weak, nonatomic) IBOutlet UILabel *houseBust;
@property (weak, nonatomic) IBOutlet UILabel *houseBlackjack;
@property (weak, nonatomic) IBOutlet UILabel *houseWins;
@property (weak, nonatomic) IBOutlet UILabel *houseLosses;

@property (weak, nonatomic) IBOutlet UILabel *player;
@property (weak, nonatomic) IBOutlet UILabel *playScore;
@property (weak, nonatomic) IBOutlet UILabel *playerStayed;

@property (weak, nonatomic) IBOutlet UILabel *playerCard1;
@property (weak, nonatomic) IBOutlet UILabel *playerCard2;
@property (weak, nonatomic) IBOutlet UILabel *playerCard3;
@property (weak, nonatomic) IBOutlet UILabel *playerCard4;
@property (weak, nonatomic) IBOutlet UILabel *playerCard5;
@property (weak, nonatomic) IBOutlet UILabel *wins;
@property (weak, nonatomic) IBOutlet UILabel *losses;
@property (weak, nonatomic) IBOutlet UILabel *playerBlackjack;

@property (weak, nonatomic) IBOutlet UIButton *hitLable;
@property (weak, nonatomic) IBOutlet UIButton *stayLable;

@property (weak, nonatomic) IBOutlet UILabel *playerBust;

- (IBAction)hit:(id)sender;
- (IBAction)stay:(id)sender;
- (IBAction)deal:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *busted;
@property (weak, nonatomic) IBOutlet UILabel *blackjack;


@property (strong, nonatomic)NSArray *playerlables;


@end
