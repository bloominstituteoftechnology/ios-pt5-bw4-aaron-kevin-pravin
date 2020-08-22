//
//  MapkitHelper.swift
//  MortgageCalculator
//
//  Created by Joe on 8/21/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import CoreLocation
import Foundation
import MapKit

extension HomeDetailViewController: CLLocationManagerDelegate {

    //Credit: https://stackoverflow.com/questions/42279252/convert-address-to-coordinates-swift
    func convertAddressToCoordinates(house: House) -> (Double, Double) {
        let address = house.address
        var coordinates = (0.0,0.0)
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
            else {
                print("Invalid Address")
                return
            }
            coordinates = (location.coordinate.latitude, location.coordinate.longitude)
        }
        return coordinates
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
                   print(location.coordinate)
    
               }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       print(error)
    }
}

extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion (
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        pin.title = "Home Location"
        addAnnotation(pin)
    }
}
