//
//  MortgageSnapShot.swift
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/21/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import Foundation

// MARK: - Mortgage snap shot (conforms to codable for persistence)
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

// MARK: - House snap shot (conforms to codable for persistence)
class HouseSnapShot: NSObject, Codable {
    @objc init(address: String, calculatedMortgage: Double) {
        self.address = address
        self.calculatedMortgage = calculatedMortgage
    }
    @objc var address: String
    @objc var calculatedMortgage: Double
}
