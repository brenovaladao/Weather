//
//  ActualWeatherPresenter.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

class ActualWeatherPresenter {
    
    private var actualWeatherView: ActualWeatherProtocol?
    
    init(actualWeatherView: ActualWeatherProtocol) {
        self.actualWeatherView = actualWeatherView
    }

}

// MARK: - Public
extension ActualWeatherPresenter {

    func getActualWeatherData() {
        
        let lat = -22.912
        let lon = -48.082
        
        WeatherService.getActualWeather(for: lat, lon: lon) { (baseWeather, error) in
            if let error = error {
                // TODO: Handle error
                return
            }
            
        }
    }
    
}
