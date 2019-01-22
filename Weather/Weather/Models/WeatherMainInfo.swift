//
//  WeatherMainInfo.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct WeatherMainInfo: Codable {
    
    let temperature: Double?
    let temperatureMin: Double?
    let temperatureMax: Double?
    let humidity: Double?
    let pressure: Double?
    let seaLevel: Double?
    let groundLevel: Double?
    
    private enum JsonKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
        case humidity
        case pressure
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
        temperatureMin = try container.decodeIfPresent(Double.self, forKey: .temperatureMin)
        temperatureMax = try container.decodeIfPresent(Double.self, forKey: .temperatureMax)
        humidity = try container.decodeIfPresent(Double.self, forKey: .humidity)
        pressure = try container.decodeIfPresent(Double.self, forKey: .pressure)
        seaLevel = try container.decodeIfPresent(Double.self, forKey: .seaLevel)
        groundLevel = try container.decodeIfPresent(Double.self, forKey: .groundLevel)
    }
}
