//
//  MortgageController.swift
//  MortgageCalculator
//
//  Created by Kevin Stewart on 8/19/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import Foundation
import CoreData
import UIKit

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
    var house = House()
    var houseArray: [House] = []
    
    func addHouse(_ house: House) {
        houseArray.append(house)
        print("House array total: \(houseArray)")
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
            let data = try encoder.encode(mortgageArray.map { $0.mortgageSnapShot })
            try data.write(to: url)
            let houseData = try encoder.encode(houseArray.map { $0.houseSnapShot })
            try houseData.write(to: url)
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
            mortgageArray = (try decoder.decode([MortgageSnapShot].self, from: data)).map { Mortgage(mortgageSnapShot: $0) }
            houseArray = (try decoder.decode([HouseSnapShot].self, from: data)).map { House(houseSnapShot: $0) }
        } catch {
            print("Error loading data: \(error)")
        }
    }
    
    // MARK: - Alert method
    
    func alertUserInvalidAddress() {
        if house != house {
            let alertController = UIAlertController(title: "The address entered was invalid",
                                                    message: "Please enter a valid address",
                                                    preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok",
                                            style: .default,
                                            handler: nil)
            alertController.addAction(alertAction)
            alertController.present(alertController, animated: true)
        }
    }
}
