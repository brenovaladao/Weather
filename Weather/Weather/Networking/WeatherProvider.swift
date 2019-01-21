//
//  WeatherProvider.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Moya

let weatherProvider = MoyaProvider<WeatherProvider>()

public enum WeatherProvider {
    
    case getActualWeather(lat: String, lon: String)
    case getForecast(lat: String, lon: String)
    
}

extension WeatherProvider: TargetType {
    
    public var baseURL: URL {
        return AppDefaults.baseURL
    }
    
    public var path: String {
        switch self {
        case .getActualWeather(let lat, let lon):
            return "weather?lat=\(lat)&lon=\(lon)&appid=\(AppDefaults.openWeatherApiKey)"
            
        case .getForecast(let lat, let lon):
            return "forecast?lat=\(lat)&lon=\(lon)&appid=\(AppDefaults.openWeatherApiKey)"
        }
    }
    
    public var method: Method {
        switch self {
        case .getActualWeather,
             .getForecast:
            return .get
        }
    }
    
    public var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    public var task: Task {
        switch self {
        case .getActualWeather,
             .getForecast:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
