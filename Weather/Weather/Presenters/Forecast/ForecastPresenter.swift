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
    
    private var isLoadingData = false

    init(forecastView: ForecastProtocol) {
        self.forecastView = forecastView
    }
    
}

// MARK: - Public
extension ForecastPresenter {
    
    func getForecastData() {
        
        guard !isLoadingData else { return }
        isLoadingData = true

        let lat = -22.912
        let lon = -48.082
        
        WeatherService.getForecast(for: lat, lon: lon) { [weak self] (baseWeather, error) in
            guard let self = self else { return }
            self.isLoadingData = false
            if let error = error {
                self.forecastView?.handleError(error)
                return
            }
                        
        }
    }
    
}
