//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by Guang on 10/5/15.
//  Copyright © 2015 Al Tyus. All rights reserved.
//

#import "FISCard.h"


@interface FISCard ()

@property (nonatomic, readwrite) NSString * suit;
@property (nonatomic, readwrite) NSString * rank;
@property (nonatomic, readwrite) NSString * cardLabel;
@property (nonatomic, readwrite) NSUInteger cardValue;

@end

@implementation FISCard

-(instancetype)init{
    
    self = [self initWithSuit:@"!" rank:@"N"];
    return self;
}

-(instancetype)initWithSuit:(NSString *)suit
                       rank:(NSString *)rank{
    
    self = [super init];
    
    if (self) {
        _suit = suit;
        _rank = rank;
        _cardLabel = [self cardWithLabe];
        _cardValue = [self cardWithValue];
    }
    
    return self;
}

+(NSArray *)validSuits{
    
    return @[@"♠",@"♥",@"♣",@"♦"];
}

+(NSArray *)validRanks{
    
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

-(NSString *)cardWithLabe{
    
    NSString * card = [NSString stringWithFormat:@"%@%@",self.suit, self.rank];
    return card;
    
}


-(NSUInteger )cardWithValue{

    //NSInteger cardValue;
    NSArray * jqk = @[@"J",@"Q",@"K"];
    
    if ([self.rank isEqualToString:@"A"]) {
        self.cardValue = 1;
    }
    else if ([jqk containsObject:self.rank]) {
        self.cardValue = 10;
    }
    else {
        self.cardValue = self.rank.integerValue;
    }
    
    return self.cardValue;
}

-(NSString *)description{
    //what is string value
    return self.cardLabel;
}

@end

