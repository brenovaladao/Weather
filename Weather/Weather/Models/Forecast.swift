//
//  Forecast.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    
    let date: Date?
    let weather: [Weather]?
    let weatherMainInfo: WeatherMainInfo?
    let clouds: Clouds?
    let wind: Wind?
    let rain: Rain?
    let snow: Snow?

    private enum JsonKeys: String, CodingKey {
        case date = "dt"
        case weather
        case weatherMainInfo = "main"
        case clouds
        case wind
        case rain
        case snow
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)
        
        weather = try container.decodeIfPresent([Weather].self, forKey: .weather)
        weatherMainInfo = try container.decodeIfPresent(WeatherMainInfo.self, forKey: .weatherMainInfo)
        clouds = try container.decodeIfPresent(Clouds.self, forKey: .clouds)
        wind = try container.decodeIfPresent(Wind.self, forKey: .wind)
        rain = try container.decodeIfPresent(Rain.self, forKey: .rain)
        snow = try container.decodeIfPresent(Snow.self, forKey: .snow)
        
        if let timeInterval = try container.decodeIfPresent(TimeInterval.self, forKey: .date) {
            date = Date(timeIntervalSince1970: timeInterval)
        } else {
            date = nil
        }
    }
    
}
