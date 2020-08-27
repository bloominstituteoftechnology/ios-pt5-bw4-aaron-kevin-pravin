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
    func getLocation(from address: House, completion: @escaping (_ location: CLLocation?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address.address) { (placemarks, error) in
            guard let placemarks = placemarks,
            let location = placemarks.first?.location else {
                completion(nil)
                return
            }
            completion(location)
        }
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
