//
//  SysInfo.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct SysInfo: Codable {
    
    let type: Int?
    let id: Int?
    let message: Double?
    let country: String?
    let sunrise: Date?
    let sunset: Date?
    
    private enum JsonKeys: String, CodingKey {
        case type
        case id
        case message
        case country
        case sunrise
        case sunset
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        type = try container.decodeIfPresent(Int.self, forKey: .type)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        message = try container.decodeIfPresent(Double.self, forKey: .message)
        country = try container.decodeIfPresent(String.self, forKey: .country)
        
        if let timeInterval = try container.decodeIfPresent(TimeInterval.self, forKey: .sunrise) {
            sunrise = Date(timeIntervalSince1970: timeInterval)
        } else {
            sunrise = nil
        }

        if let timeInterval = try container.decodeIfPresent(TimeInterval.self, forKey: .sunset) {
            sunset = Date(timeIntervalSince1970: timeInterval)
        } else {
            sunset = nil
        }
    }
}
