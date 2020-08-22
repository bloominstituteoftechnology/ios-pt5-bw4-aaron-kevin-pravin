//
//  Mortgage.m
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/18/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "Mortgage.h"
#import "MortgageCalculator-Swift.h"

@implementation Mortgage

- (instancetype)initWithHomePurchasePrice:(NSNumber *)homePurchasePrice
                              downPayment:(NSNumber *)downpayment
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

- (MortgageSnapShot *)mortgageSnapShot
{
    return [[MortgageSnapShot alloc] initWithHomePurchasePrice:self.homePurchasePrice.doubleValue downPayment:self.downPayment.doubleValue loanTerm:self.loanTerm.doubleValue interestRate:self.interestRate.doubleValue];
}

- (instancetype)initWithMortgageSnapShot:(MortgageSnapShot *)mortgageSnapShot
{
    double homePurchasePrice = mortgageSnapShot.homePurchasePrice;
    double downPayment = mortgageSnapShot.downPayment;
    double loanTerm = mortgageSnapShot.loanTerm;
    double interestRate = mortgageSnapShot.interestRate;
    return [self initWithHomePurchasePrice:@(homePurchasePrice) downPayment:@(downPayment) loanTerm:@(loanTerm) interestRate:@(interestRate)];
}

@end
