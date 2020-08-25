//
//  HomeDetailViewController.swift
//  MortgageCalculator
//
//  Created by Joe on 8/21/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//
import CoreLocation
import MapKit
import UIKit


class HomeDetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var homeAddressLabel: UILabel!
    @IBOutlet weak var homePriceLabel: UILabel!
    @IBOutlet weak var homeMonthlyPaymentLabel: UILabel!
    @IBOutlet weak var addPictureButton: UIButton!
    
    
    var houseDelegate: House?
    var mortgageDelegate: Mortgage?
    let formatter = NumberFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPictureButton.isHidden = true
        updateViews()
    }
    
    func updateViews() {
        guard let house = houseDelegate, let mortgage = mortgageDelegate else { return }
        homeAddressLabel.text = house.address
        homePriceLabel.text = formatter.string(from: mortgage.homePurchasePrice)
        homeMonthlyPaymentLabel.text = formatter.string(from: house.calculatedMortgage)
        let coordinates = convertAddressToCoordinates(house: house)
        let location = CLLocation(latitude: coordinates.0, longitude: coordinates.1)
        mapView.centerToLocation(location)
    }
    

    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
