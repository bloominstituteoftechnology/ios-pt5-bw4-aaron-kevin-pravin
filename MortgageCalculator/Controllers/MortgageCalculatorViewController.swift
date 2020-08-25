//
//  MortgageCalculatorViewController.swift
//  MortgageCalculator
//
//  Created by patelpra on 8/22/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import UIKit

class MortgageCalculatorViewController: UIViewController {
    
    var homePrice: Float = 0.00
    var loanTerm: Float = 0.00
    var downPayment: Float = 0.00
    var interestRate: Float = 0.00
    var loanAjustCalculation: Float = 0.00
    var downPaymentMinusHomePrice: Float = 0.00
    var monthlyPayments: [[Float]] = [[]]
   
    var interestDivisorByTerm: Float {
        interestAmount / loanTerm
    }
   
    var loanAmountAndTerm: Float {
        loanAmount / loanTerm
    }
    
    var interestAmount: Float {
        (loanAmount * interestRate) / 100
    }
    
    var loanAmount: Float {
        downPaymentMinusHomePrice
    }
    
    var monthlyPayment: Float = 0.00
    
    @IBOutlet var monthlyPaymentLabel: UILabel!
    
    @IBOutlet var homePurchasePrice: UILabel!
    @IBOutlet var priceSlider: UISlider!
    @IBOutlet var homePriceLabel: UILabel!
    
    @IBOutlet var downPaymentLabel: UILabel!
    @IBOutlet var downPaymentSlider: UISlider!
    @IBOutlet var downPaymentPercentageLabel: UILabel!
    
    
    @IBOutlet var interestRateLabel: UILabel!
    @IBOutlet var interestPercentageSlider: UISlider!
    @IBOutlet var interestPercentageLabel: UILabel!
    
    @IBOutlet var termSignLabel: UILabel!
    @IBOutlet var termAmountLabel: UILabel!
    @IBOutlet var termSlider: UISlider!
    
    @IBOutlet var calculatePaymentOutlet: UIButton!
    
    @IBAction func amountSlider(_ sender: UISlider) {
        
        let homePricing = String(format: "%.2f", sender.value)
        homePriceLabel.text = "$\(homePricing)"
        homePrice = Float(homePricing)!
  
    }

    @IBAction func downPaymentSliderChanged(_ sender: UISlider) {
  
        let downPaymentPercentage = String(format: "%.0f", sender.value)
        downPaymentPercentageLabel.text = "\(downPaymentPercentage)%"
        downPayment = Float(downPaymentPercentage)!
        
        let downPaymentAmount = (homePrice * downPayment) / 100
        downPaymentLabel.text = "$\(downPaymentAmount)"
        downPaymentMinusHomePrice = homePrice - downPaymentAmount
    }
 
    @IBAction func interestPercetangeSliderChanged(_ sender: UISlider) {
  
        let mortgageRate = String(format: "%.2f", sender.value)
        interestPercentageLabel.text = "\(mortgageRate)%"
        interestRate = Float(mortgageRate)!
    }
 
    @IBAction func termSliderChanged(_ sender: UISlider) {

        let loanTermLabel = String(format: "%.0f", sender.value)
        termAmountLabel.text = "\(loanTermLabel)"
        loanAjustCalculation = Float(loanTermLabel)!
        loanTerm = loanAjustCalculation * 12
    }
    
    @IBAction func calculatePaymentTapped(_ sender: UIButton) {
        guard loanTerm >= 1.0 else { return }
        
     monthlyPayment = monthlyPayment(loanAmount: loanAmount, termMonth: loanTerm, interestRate: interestRate)
        let roundedResult = monthlyPayment.rounded(toPlaces: 2)
        monthlyPaymentLabel.text = "$\(roundedResult)"
        
        monthlyPayments = getPaymentSchedule(loanAmount: loanAmount, termMonth: Int(loanTerm), interestRate: interestRate)
    }

    func monthlyPayment(loanAmount: Float, termMonth: Float, interestRate: Float) -> Float {
        let r : Float = interestRate / (100 * 12)
        let m : Float = Float(termMonth)
        let l : Float = loanAmount
        let payment : Float = l * (r * pow((1 + r), m)) / (pow((1 + r), m) - 1)
        return payment
    }
    
    func getPaymentSchedule(loanAmount: Float, termMonth: Int, interestRate: Float) -> [[Float]] {
        let r : Float = interestRate / (100 * 12)
        _ = monthlyPayment(loanAmount: loanAmount, termMonth: loanTerm, interestRate: interestRate)
        var totalInterest: Float = 0
        var remainingBalance = loanAmount
        var scheduleArray : [[Float]] = []
        
        for m in 1...termMonth {
            let interest = remainingBalance * r
            let principal = monthlyPayment - interest
            totalInterest += interest
            remainingBalance -= principal
            scheduleArray += [[interest, principal, remainingBalance]]
        }
        
        return scheduleArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    
    extension Float {
        func rounded(toPlaces places: Int) -> Float {
            let divisor = pow(10.0, Float(places))
            return (self * divisor).rounded() / divisor
        }
    }
