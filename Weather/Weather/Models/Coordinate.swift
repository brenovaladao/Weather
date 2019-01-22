//
//  Coordinate.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct Coordinate: Codable {
    
    let latitude: Double?
    let longitude: Double?
 
    private enum JsonKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
    }
}
