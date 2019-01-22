//
//  WeatherProvider.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Moya

let weatherProvider = MoyaProvider<WeatherProvider>(plugins: [LoggerPlugin()])

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
        case .getActualWeather:
            return "weather"
            
        case .getForecast:
            return "forecast"
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
        case .getActualWeather(let lat, let lon),
             .getForecast(let lat, let lon):
            return .requestParameters(parameters: ["lat": lat,
                                                   "lon": lon,
                                                   "units": "metric",
                                                   "appid": AppDefaults.openWeatherApiKey],
                                      encoding: URLEncoding(destination: .queryString))
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
