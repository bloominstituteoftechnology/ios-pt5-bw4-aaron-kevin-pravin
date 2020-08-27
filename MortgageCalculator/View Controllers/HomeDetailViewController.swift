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
    // IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var homeAddressLabel: UILabel!
    @IBOutlet weak var homePriceLabel: UILabel!
    @IBOutlet weak var homeMonthlyPaymentLabel: UILabel!
    
    // Properties
    var houseDelegate: House?
    let formatter = NumberFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func openInMapsButtonPressed(_ sender: Any) {
        let coordinate = self.mapView.centerCoordinate
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.02))
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: region.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: region.span)]
        mapItem.name = "House Location"
        mapItem.openInMaps(launchOptions: options)
    }
    
    func updateViews() {
        guard let house = houseDelegate else { return }
        homeAddressLabel.text = "Address: \(house.address)"
        homeMonthlyPaymentLabel.text = "Calculated Mortgage: $\(String(formatter.string(from: house.calculatedMortgage)!)) Per Month"
        getLocation(from: house) { location in
            guard let location = location else { return }
            self.mapView.centerToLocation(location)
        }
    }
}
