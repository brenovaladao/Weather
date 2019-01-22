//
//  Weather.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
    
    private enum JsonKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        main = try container.decodeIfPresent(String.self, forKey: .main)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        icon = try container.decodeIfPresent(String.self, forKey: .icon)
    }
}
