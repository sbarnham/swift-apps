//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Barnham, Samuel (ABH) on 26/02/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    var countryCode = ""
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }


    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                } else {
                    self.musicRecommendations.text = self.getArtists(countryCode: placemarks?[0].isoCountryCode, term: placemarks?[0].administrativeArea)
                }
            })

        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user location. Error: \(error.localizedDescription)"
    }
    
    
    func getArtists(countryCode: String?, term: String?) -> String {
        guard let url = URL(string: "http://itunes.apple.com/search?term=\(term ?? "nothing")&country=\(countryCode ?? "US")&entity=musicArtist")
            else {
                print("Invalid URL")
                return "Invalid URL. Wasn't able to search iTunes"
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator: ", ")
                    }
                }
            }
            }.resume()
        
        
        return ""
    }
    
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }
  
    }
    
    
}

