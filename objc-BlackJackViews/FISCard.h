//
//  FISCard.h
//  OOP-Cards-Model
//
//  Created by Guang on 10/5/15.
//  Copyright © 2015 Al Tyus. All rights reserved.


/* 
 Notes : format : @property first then method
 class method. 
 Else if for the logic check
 
 */

#import <Foundation/Foundation.h>

@interface FISCard : NSObject

@property (nonatomic, readonly) NSString * suit;
@property (nonatomic, readonly) NSString * rank;
@property (nonatomic, readonly) NSString * cardLabel;
@property (nonatomic, readonly) NSUInteger cardValue;

+(NSArray *)validSuits;
+(NSArray *)validRanks;

-(instancetype)initWithSuit:(NSString *)suit
                       rank:(NSString *)rank;


@end
