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
    
        do {
            let codeStr = try container.decodeIfPresent(String.self, forKey: .code)
            if let codeStr = codeStr {
                code = Int(codeStr)
                guard code == 200 else {
                    throw AppError.requestError
                }
            } else {
                code = nil
            }
        } catch {
            throw AppError.objectMapperError
        }

        message = try container.decodeIfPresent(Double.self, forKey: .message)
        count = try container.decodeIfPresent(Int.self, forKey: .count)
        forecasts = try container.decodeIfPresent([Forecast].self, forKey: .forecasts)
        city = try container.decodeIfPresent(City.self, forKey: .city)
    }
    
}
