//
//  MortgageController.swift
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/19/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import Foundation
import CoreData

class MortgageController {
    
    // MARK: - Mortgage properties and methods
    var mortgage = Mortgage()
    var mortgageArray: [Mortgage] = []
    
    func addMortgage(_ mortgage: Mortgage) {
        mortgageArray.append(mortgage)
    }
    
    func deleteMortgage(_ mortgage: Mortgage) {
        guard let index = mortgageArray.firstIndex(of: mortgage) else { return }
        mortgageArray.remove(at: index)
    }
    
    func calculateMortgage() -> Double {
        let homeValue = mortgage.homePurchasePrice.doubleValue
        let interestRate = mortgage.interestRate.doubleValue
        let numberOfPeriods = mortgage.loanTerm.doubleValue
        let downPayment = mortgage.downPayment.doubleValue
        
        var mortgageAfterDownPayment: Double
        var interestCost: Double
        var mortgageAfterAddingInterestCost: Double
        var monthlyPayment: Double
        
        mortgageAfterDownPayment = homeValue - downPayment
        
        interestCost = mortgageAfterDownPayment * interestRate
        
        mortgageAfterAddingInterestCost = mortgageAfterDownPayment + interestCost
        
        monthlyPayment = mortgageAfterAddingInterestCost / numberOfPeriods
        
        return monthlyPayment
    }
    
    
    
    
    
    
    // MARK: - Debt to income ratio properties and methods
    var debtIncomeRatioArray: [DebtIncomeRatio] = []
    
    
    
    
    
    // MARK: - House properties and methods
    var houseArray: [House] = []
    
    func addHouse(_ house: House) {
        houseArray.append(house)
    }
    
    func deleteHouse(_ house: House) {
        guard let index = houseArray.firstIndex(of: house) else { return }
        houseArray.remove(at: index)
    }
    
    
    
    
    
    
    // MARK: - Basic persistence methods
    
    init() {
        loadFromPersistentStore()
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("mortgages.list")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(mortgageArray)
            try data.write(to: url)
        } catch {
            print("Error saving data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            mortgageArray = try decoder.decode([Mortgage].self, from: data)
        } catch {
            print("Error loading data: \(error)")
        }
    }
}
