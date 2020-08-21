//
//  DebtIncomeRatio.m
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/18/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "DebtIncomeRatio.h"

@implementation DebtIncomeRatio

- (instancetype)initWithRecurringMonthlyDebt:(double)recurringMonthlyDebt
                          grossMonthlyIncome:(double)grossMonthlyIncome
{
    if (self = [super init]) {
        _recurringMonthlyDebt = recurringMonthlyDebt;
        _grossMonthlyIncome = grossMonthlyIncome;
    }
    return self;
}

@end
