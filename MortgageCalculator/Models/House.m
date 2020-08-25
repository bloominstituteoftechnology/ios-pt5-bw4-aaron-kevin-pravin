//
//  House.m
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/18/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "House.h"
#import "MortgageCalculator-Swift.h"

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

- (HouseSnapShot *)houseSnapShot
{
    return [[HouseSnapShot alloc] initWithAddress:self.address
                               calculatedMortgage:self.calculatedMortgage.doubleValue];
}

- (instancetype)initWithHouseSnapShot:(HouseSnapShot *)houseSnapShot
{
    NSString *address = houseSnapShot.address;
    double calculatedMortgage = houseSnapShot.calculatedMortgage;
    return [self initWithAddress:address
              calculatedMortgage:@(calculatedMortgage)];
}

@end
