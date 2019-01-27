//
//  City.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct City: Codable {
    
    let id: Int?
    let name: String?
    let coordinate: Coordinate?
    let country: String?
    let population: Int?
    
    private enum JsonKeys: String, CodingKey {
        case id
        case name
        case coordinate = "coord"
        case country
        case population
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        coordinate = try container.decodeIfPresent(Coordinate.self, forKey: .coordinate)
        country = try container.decodeIfPresent(String.self, forKey: .country)
        population = try container.decodeIfPresent(Int.self, forKey: .population)
    }
    
}
