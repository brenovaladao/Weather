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
    
    private var isLoadingData = false {
        didSet {
            self.forecastView?.setLoading(isLoadingData)
        }
    }

    init(forecastView: ForecastProtocol) {
        self.forecastView = forecastView
    }
    
}

// MARK: - Public
extension ForecastPresenter {
    
    func getForecastData() {
        
        guard !isLoadingData else {
            forecastView?.setLoading(false)
            return
        }
        isLoadingData = true

        let lat = -22.9081223
        let lon = -47.0778804

        WeatherService.getForecast(for: lat, lon: lon) { [weak self] (baseForecast, error) in
            guard let self = self else { return }
            self.isLoadingData = false
            if let error = error {
                self.forecastView?.handleError(error)
                return
            }
            self.setCityName(from: baseForecast)
            let forecastViewObjects = self.createViewObjects(from: baseForecast)
            self.forecastView?.bind(viewObjects: forecastViewObjects)
        }
    }
    
}

// MARK: - Private
extension ForecastPresenter {
    
    private func setCityName(from baseForecast: BaseForecast?) {
        let cityName = baseForecast?.city?.name ?? String.forecastTitle
        forecastView?.bind(cityName: cityName)
    }
    
    private func createViewObjects(from baseForecast: BaseForecast?) -> [ForecastListViewObject] {
        
        guard let baseForecast = baseForecast else { return [] }
        
        let forecastItemViewObjects = baseForecast.forecasts?.compactMap({ (forecast) -> ForecastItemViewObject? in
            
            guard let date = forecast.date else { return nil }
            
            let forecastTime = Date.hourDateFormatter.string(from: date)
            let dateKey = Date.yearMonthDayDateFormatter.string(from: date)
            
            let forecastImage = forecast.weather?.first?.getImage(size: .medium)
            let forecastDescription = forecast.weather?.first?.description?.capitalized
            
            let temperature = forecast.weatherMainInfo?.temperature ?? 0
            let forecastTemperature = String(format: "%.0f°", temperature)

            let forecastItemViewObject = ForecastItemViewObject(forecastDateKey: dateKey,
                                                                forecastImage: forecastImage,
                                                                forecastTime: forecastTime,
                                                                forecastDescription: forecastDescription,
                                                                forecastTemperature: forecastTemperature)
            return forecastItemViewObject
            
        }) ?? []
        
        let forecastListViewObjects = forecastItemViewObjects.groupBy(closure: { $0.forecastDateKey }
            ).compactMap({ (arg0) -> ForecastListViewObject? in
                let (dateKey, forecastItemViewObjects) = arg0
                
                guard let date = Date.yearMonthDayDateFormatter.date(from: dateKey) else { return nil }
                
                let forecastDay: String
                if NSCalendar.current.isDateInToday(date) {
                    forecastDay = String.todayHeaderText
                } else {
                    forecastDay = Date.dayOfWeekFormatter.string(from: date)
                }
                return ForecastListViewObject(date: date, headerTitle: forecastDay.uppercased(), forecastItems: forecastItemViewObjects)
            
            }).sorted(by: { return $0.date.compare($1.date) == .orderedAscending })
        
        return forecastListViewObjects
    }
}
