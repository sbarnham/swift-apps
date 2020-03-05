//
//  LocationManagerDelegate.swift
//  MusicByLocation
//
//  Created by Barnham, Samuel (ABH) on 05/03/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation
import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    let geocoder = CLGeocoder()
    weak var vc: ViewController?
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        vc?.updateDisplay(text: "Could not access user location. Error: \(error.localizedDescription)")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         if let firstLocation = locations.first {
                   geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                       if error != nil {
                        self.vc?.updateDisplay(text: "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)")
                       } else {
                        self.vc?.updateArtistsByLocation(text: placemarks?[0].administrativeArea)
                       }
                   })

               }
           }
    }
