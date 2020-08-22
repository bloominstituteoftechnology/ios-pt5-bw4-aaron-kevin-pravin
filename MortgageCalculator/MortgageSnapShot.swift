//
//  MortgageSnapShot.swift
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/21/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import Foundation

class MortgageSnapShot: NSObject, Codable {
    @objc init(homePurchasePrice: Double, downPayment: Double, loanTerm: Double, interestRate: Double) {
        self.homePurchasePrice = homePurchasePrice
        self.downPayment = downPayment
        self.loanTerm = loanTerm
        self.interestRate = interestRate
    }
    
    @objc var homePurchasePrice: Double
    @objc var downPayment: Double
    @objc var loanTerm: Double
    @objc var interestRate: Double
    
    
}
