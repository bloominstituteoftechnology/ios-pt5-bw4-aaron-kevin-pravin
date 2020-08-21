//
//  Mortgage.h
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/18/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Mortgage : NSObject

@property (nonatomic) NSNumber *homePurchasePrice;
@property (nonatomic) NSNumber *downPayment;
@property (nonatomic) NSNumber *loanTerm;
@property (nonatomic) NSNumber *interestRate;

- (instancetype)initWithHomePurchasePrice:(NSNumber *)homePurchasePrice
 downpayment:(NSNumber *)downpayment
    loanTerm:(NSString *)loanTerm
                             interestRate:(NSNumber *)interestRate;

- (void)encodeWithCoder:(NSCoder *)aCoder;


@end

NS_ASSUME_NONNULL_END
