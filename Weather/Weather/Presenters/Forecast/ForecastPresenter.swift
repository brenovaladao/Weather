//
//  ForecastPresenter.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

class ForecastPresenter {
    
    private var forecastView: ForecastProtocol?
    
    init(forecastView: ForecastProtocol) {
        self.forecastView = forecastView
    }
    
}

// MARK: - Public
extension ForecastPresenter {
    
    func getForecastData() {
        
        let lat = -22.912
        let lon = -48.082
        
        WeatherService.getForecast(for: lat, lon: lon) { (baseWeather, error) in
            if let error = error {
                // TODO: Handle error
                return
            }
            
        }
    }
    
}
