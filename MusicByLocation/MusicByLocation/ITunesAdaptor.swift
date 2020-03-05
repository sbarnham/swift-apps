//
//  ITunesAdaptor.swift
//  MusicByLocation
//
//  Created by Barnham, Samuel (ABH) on 05/03/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

class ITunesAdaptor {
    let baseURL = "https://itunes.apple.com/search?"
    let decoder = JSONDecoder()
    
    func getArtists(search: String?, completion: @escaping ([Artist]?) -> Void) {
        guard let search = search else {
            print("No search term provided, terminating request")
            return
        }
        
        let path = "term=\(search)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: baseURL + path)
            else {
                print("Invalid URL")
                completion(nil)
                return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    completion(response.results)
                }
            }
            }.resume()
    }
    func parseJson(json: Data) -> ArtistResponse? {
           if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
               return artistResponse
           } else {
               print("Failed to decode to Artist Response")
               return nil
           }
     
       }
}
