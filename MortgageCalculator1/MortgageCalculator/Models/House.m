//
//  House.m
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/18/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "House.h"

@implementation House

- (instancetype)initWithAddress:(NSString *)address
             calculatedMortgage:(NSNumber *)calculatedMortgage
{
    if (self = [super init]) {
        _address = [address copy];
        _calculatedMortgage = calculatedMortgage;
    }
    return self;
}

@end
