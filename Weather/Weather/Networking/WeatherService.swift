//
//  WeatherService.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation
import Moya

import Foundation

class WeatherService {
    
    static func getActualWeather(with lat: Double, lon: Double, _ completion: () -> Void) {
        
        weatherProvider.request(WeatherProvider.getActualWeather(lat: String(lat), lon: String(lon)), completion: <#T##Completion##Completion##(Result<Response, MoyaError>) -> Void#>)
        
    }
    
}
