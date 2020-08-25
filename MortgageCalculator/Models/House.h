//
//  House.h
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/18/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HouseSnapShot;

NS_ASSUME_NONNULL_BEGIN

@interface House : NSObject

@property (nonatomic, copy) NSString *address;
@property (nonatomic) NSNumber *calculatedMortgage;

- (instancetype)initWithAddress:(NSString *)address
             calculatedMortgage:(NSNumber *)calculatedMortgage;

@property (nonatomic, readonly) HouseSnapShot *houseSnapShot;
- (instancetype)initWithHouseSnapShot:(HouseSnapShot *)houseSnapShot;



@end

NS_ASSUME_NONNULL_END
