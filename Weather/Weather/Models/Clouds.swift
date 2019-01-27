//
//  Clouds.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct Clouds: Codable {
    
    let all: Double?
    
    private enum JsonKeys: String, CodingKey {
        case all
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        all = try container.decodeIfPresent(Double.self, forKey: .all)
    }
    
}
