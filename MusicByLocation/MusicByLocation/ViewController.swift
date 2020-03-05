//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Barnham, Samuel (ABH) on 26/02/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit
import CoreLocation

/*
 - Outlet
 - Action
 - Updating display
 - Tweaking response to get artist names
 */

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let iTunesAdaptor = ITunesAdaptor()
    let locationManagerDelegate = LocationManagerDelegate()
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = locationManagerDelegate
        locationManagerDelegate.vc = self
    }


    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func updateDisplay(text: String?) {
        musicRecommendations.text = text
    }
    
    func updateArtistsByLocation(text: String?) {
        iTunesAdaptor.getArtists(search: text) { (artists) in
            let names = artists?.map { return $0.artistName }
            DispatchQueue.main.async {
                self.musicRecommendations.text = names?.joined(separator: ", ")
            }
        }
    }
    
    

    
    
   
    
    
}

