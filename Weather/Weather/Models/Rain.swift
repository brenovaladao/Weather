//
//  Rain.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct Rain: Codable {
    
    let oneHour: Double?
    let threeHours: Double?
    
    private enum JsonKeys: String, CodingKey {
        case oneHour = "1h"
        case threeHours = "3h"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        oneHour = try container.decodeIfPresent(Double.self, forKey: .oneHour)
        threeHours = try container.decodeIfPresent(Double.self, forKey: .threeHours)
    }
    
}
