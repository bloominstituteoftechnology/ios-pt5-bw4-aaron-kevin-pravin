//
//  DebtIncomeRatio.h
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/18/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DebtIncomeRatio : NSObject

@property (nonatomic) double *recurringMonthlyDebt;
@property (nonatomic) double *grossMonthlyIncome;

@end

NS_ASSUME_NONNULL_END
