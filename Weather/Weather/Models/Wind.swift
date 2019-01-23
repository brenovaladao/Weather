//
//  Wind.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct Wind: Codable {
    
    let speed: Double?
    let degrees: Double?
    
    private enum JsonKeys: String, CodingKey {
        case speed = "speed"
        case degrees = "deg"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        degrees = try container.decodeIfPresent(Double.self, forKey: .degrees)
    }
    
}

// MARK: - Getters
extension Wind {
    
    var direction: String? {
        guard let degrees = degrees else { return nil }
        return WindDirection.value(by: degrees)
    }
    
}
