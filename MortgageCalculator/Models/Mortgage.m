//
//  Mortgage.m
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/18/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "Mortgage.h"

@implementation Mortgage

- (instancetype)initWithHomePurchasePrice:(NSNumber *)homePurchasePrice
                              downpayment:(NSNumber *)downpayment
                                 loanTerm:(NSNumber *)loanTerm
                             interestRate:(NSNumber *)interestRate
{
    if (self = [super init]) {
        _homePurchasePrice = homePurchasePrice;
        _downPayment = downpayment;
        _loanTerm = loanTerm;
        _interestRate = interestRate;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.homePurchasePrice];
    [aCoder encodeObject:self.downPayment];
    [aCoder encodeObject:self.loanTerm];
    [aCoder encodeObject:self.interestRate];
}

@end
