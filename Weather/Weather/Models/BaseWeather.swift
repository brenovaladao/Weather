//
//  BaseWeather.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct BaseWeather: Codable {
    
    let id: Int?
    let base: String?
    let name: String?
    let code: Int?
    let date: Date?
    let weather: [Weather]?
    let weatherMainInfo: WeatherMainInfo?
    let coordinate: Coordinate?
    let sysInfo: SysInfo?
    let rain: Rain?
    let snow: Snow?
    let clouds: Clouds?
    let wind: Wind?
    
    private enum JsonKeys: String, CodingKey {
        case id
        case base
        case name
        case code = "cod"
        case date = "dt"
        case weather
        case weatherMainInfo = "main"
        case coordinate = "coord"
        case sysInfo = "sys"
        case snow
        case rain
        case clouds
        case wind

    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: JsonKeys.self)

        id = try container.decodeIfPresent(Int.self, forKey: .id)
        base = try container.decodeIfPresent(String.self, forKey: .base)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        code = try container.decodeIfPresent(Int.self, forKey: .code)
        weather = try container.decodeIfPresent([Weather].self, forKey: .weather)
        weatherMainInfo = try container.decodeIfPresent(WeatherMainInfo.self, forKey: .weatherMainInfo)
        coordinate = try container.decodeIfPresent(Coordinate.self, forKey: .coordinate)
        sysInfo = try container.decodeIfPresent(SysInfo.self, forKey: .sysInfo)
        snow = try container.decodeIfPresent(Snow.self, forKey: .snow)
        rain = try container.decodeIfPresent(Rain.self, forKey: .rain)
        clouds = try container.decodeIfPresent(Clouds.self, forKey: .clouds)
        wind = try container.decodeIfPresent(Wind.self, forKey: .wind)
        
        if let timeInterval = try container.decodeIfPresent(TimeInterval.self, forKey: .date) {
            date = Date(timeIntervalSince1970: timeInterval)
        } else {
            date = nil
        }
    }
}
