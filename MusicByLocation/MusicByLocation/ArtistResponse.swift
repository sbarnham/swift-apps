//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Barnham, Samuel (ABH) on 28/02/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
}
