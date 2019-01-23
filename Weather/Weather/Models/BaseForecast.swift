//
//  BaseForecast.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct BaseForecast: Codable {
    
    let code: Int?
    let message: Double?
    let count: Int?
    let forecasts: [Forecast]?
    let city: City?

    private enum JsonKeys: String, CodingKey {
        case code = "cod"
        case message
        case count = "cnt"
        case city
        case forecasts = "list"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        let codeStr = try container.decodeIfPresent(String.self, forKey: .code)
        if let codeStr = codeStr {
            code = Int(codeStr)
        } else {
            code = nil
        }
        
        // Verify valid status code
        if let code = code, code != 200 {
            throw NSError(domain: AppDefaults.errorDomain, code: code, userInfo: nil)
        }

        message = try container.decodeIfPresent(Double.self, forKey: .message)
        count = try container.decodeIfPresent(Int.self, forKey: .count)
        forecasts = try container.decodeIfPresent([Forecast].self, forKey: .forecasts)
        city = try container.decodeIfPresent(City.self, forKey: .city)
    }
    
}
