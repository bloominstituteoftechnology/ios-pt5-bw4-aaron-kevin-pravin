//
//  Mortgage.h
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/18/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MortgageSnapShot;

NS_ASSUME_NONNULL_BEGIN

@interface Mortgage : NSObject

@property (nonatomic) NSNumber *homePurchasePrice;
@property (nonatomic) NSNumber *downPayment;
@property (nonatomic) NSNumber *loanTerm;
@property (nonatomic) NSNumber *interestRate;



- (instancetype)initWithHomePurchasePrice:(NSNumber *)homePurchasePrice
                              downPayment:(NSNumber *)downpayment
                                 loanTerm:(NSNumber *)loanTerm
                             interestRate:(NSNumber *)interestRate;

@property (nonatomic, readonly) MortgageSnapShot *mortgageSnapShot;

- (instancetype)initWithMortgageSnapShot:(MortgageSnapShot *)mortgageSnapShot;

@end

NS_ASSUME_NONNULL_END
