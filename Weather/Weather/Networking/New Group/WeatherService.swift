//
//  WeatherService.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation
import Moya

class WeatherService {
    
    static func getActualWeather(for lat: Double, lon: Double, _ completion: @escaping (BaseWeather?, Error?) -> Void) {

        let target = WeatherProvider.getActualWeather(lat: String(lat), lon: String(lon))

        ServiceUtil.request(provider: weatherProvider, target: target, type: BaseWeather.self, completion)
    }

    static func getForecast(for lat: Double, lon: Double, _ completion: () -> Void) {
        //
        //        let target = WeatherProvider.getForecast(lat: String(lat), lon: String(lon))
        //
        //        ServiceUtil.request(provider: weatherProvider, target: target, type: <#T##(Decodable & Encodable).Protocol#>) { (response, error) in
        //
        //        }
    }
}
