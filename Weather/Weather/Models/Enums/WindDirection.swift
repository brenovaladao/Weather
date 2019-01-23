//
//  WindDirection.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

enum WindDirection: String, CaseIterable {
    
    case north = "N"
    case northE = "NE"
    case east = "E"
    case southE = "SE"
    case south = "S"
    case southW = "SW"
    case west = "W"
    case northW = "NW"
    
    static func value(by degrees: Double) -> String? {
        guard degrees >= 0 else { return nil }
        let index = Int((degrees + 22.5) / 45.0) & (WindDirection.allCases.count - 1)
        return WindDirection.allCases[index].rawValue
    }
    
}
