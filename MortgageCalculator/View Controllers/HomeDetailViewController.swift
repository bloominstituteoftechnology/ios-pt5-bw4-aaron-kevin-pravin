//
//  HomeDetailViewController.swift
//  MortgageCalculator
//
//  Created by Joe on 8/21/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//
import MapKit
import UIKit


class HomeDetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var homeAddressLabel: UILabel!
    @IBOutlet weak var homePriceLabel: UILabel!
    @IBOutlet weak var homeMonthlyPaymentLabel: UILabel!
    @IBOutlet weak var addPictureButton: UIButton!
    
    
    var homeDelegate: House?
    var mortgageDelegate: Mortgage?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
