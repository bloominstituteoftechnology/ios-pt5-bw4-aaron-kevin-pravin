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
                                 loanTerm:(NSString *)loanTerm
                             interestRate:(NSNumber *)interestRate
{
    if (self = [super init]) {
        _homePurchasePrice = homePurchasePrice;
        _downPayment = downpayment;
        _loanTerm = [loanTerm copy];
        _interestRate = interestRate;
    }
    return self;
}


@end