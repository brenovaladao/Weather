//
//  ActualWeatherPresenter.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class ActualWeatherPresenter {
    
    private var actualWeatherView: ActualWeatherProtocol?
    
    init(actualWeatherView: ActualWeatherProtocol) {
        self.actualWeatherView = actualWeatherView
        self.bindEmptyViewObject()
    }

}

// MARK: - Public
extension ActualWeatherPresenter {

    public func getActualWeatherData() {
        
        let lat = -22.9081223
        let lon = -47.0778804
        
        WeatherService.getActualWeather(for: lat, lon: lon) { [weak self] (baseWeather, error) in
            guard let self = self else { return }
            if let error = error {
                // TODO: Handle error
                return
            }
            guard let viewObject = self.createViewObject(from: baseWeather) else {
                return
            }
            self.actualWeatherView?.bind(viewObject: viewObject)
        }
    }
    
    public func updateActualWeatherData() {

    }
    
}

// MARK: - Private
extension ActualWeatherPresenter {
    
    private func bindEmptyViewObject() {
        
        let humity = ActualWeatherInfoItem(image: UIImage(named: "HumiditySmall"), title: "-- %")
        let precipitation = ActualWeatherInfoItem(image: UIImage(named: "PrecipitationSmall"), title: "-- mm")
        let pressure = ActualWeatherInfoItem(image: UIImage(named: "PressureSmall"), title: "-- hPa")
        let windSpeed = ActualWeatherInfoItem(image: UIImage(named: "WindSmall"), title: "-- km/h")
        let windDirection = ActualWeatherInfoItem(image: UIImage(named: "WindDirectionSmall"), title: "--")

        let emptyViewObject = ActualWeatherViewObject(weatherImage: WeatherImageType.clearSkyD.image,
                                                     locationText: " -- ",
                                                     temperatureDescriptionText: " --",
                                                     humity: humity,
                                                     precipitation: precipitation,
                                                     pressure: pressure,
                                                     wind: windSpeed,
                                                     windDirection: windDirection)

        actualWeatherView?.bind(viewObject: emptyViewObject)
    }
    
    private func createViewObject(from baseWeather: BaseWeather?) -> ActualWeatherViewObject? {
        
        guard let baseWeather = baseWeather else { return nil }

        let weatherImage = baseWeather.weather?.first?.weatherImage
        let locationText = getLocationText(baseWeather)
        let temperatureDescriptionText = getTemperatureDescription(baseWeather)
        let humityInfoItem = getHumidityInfoItem(baseWeather)
        let precipitationInfoItem = getPrecipitationInfoItem(baseWeather)
        let pressureInfoItem = getPressureInfoItem(baseWeather)
        let windInfoItem = getWindSpeedInfoItem(baseWeather)
        let windDirectionInfoItem = getWindDirectionInfoItem(baseWeather)
        
        let viewObject = ActualWeatherViewObject(weatherImage: weatherImage,
                                                 locationText: locationText,
                                                 temperatureDescriptionText: temperatureDescriptionText,
                                                 humity: humityInfoItem,
                                                 precipitation: precipitationInfoItem,
                                                 pressure: pressureInfoItem,
                                                 wind: windInfoItem,
                                                 windDirection: windDirectionInfoItem)
        return viewObject
    }
    
    private func getLocationText(_ baseWeather: BaseWeather) -> String? {
        guard let name = baseWeather.name else { return nil }
        if let country = baseWeather.sysInfo?.country {
            return "\(name), \(country)"
        } else {
            return name
        }
    }
    
    private func getTemperatureDescription(_ baseWeather: BaseWeather) -> String? {
        guard let temperature = baseWeather.weatherMainInfo?.temperature else { return nil }
        if let weatherDescription = baseWeather.weather?.first?.description?.capitalized {
            return "\(temperature)°C | \(weatherDescription)"
        } else {
            return "\(temperature)°C"
        }
    }
    
    private func getHumidityInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        let humitidy = baseWeather.weatherMainInfo?.humidity ?? 0.0
        return ActualWeatherInfoItem(image: UIImage(named: "HumiditySmall"), title: String(format: "%.1f%%", humitidy))
    }

    private func getPrecipitationInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        var precipitation: Double = 0.0
        if let rain3h = baseWeather.rain?.threeHours {
            precipitation = rain3h
        } else if let rain1h = baseWeather.rain?.oneHour {
            precipitation = rain1h
        }
        return ActualWeatherInfoItem(image: UIImage(named: "PrecipitationSmall"), title: String(format: "%.1f mm", precipitation))
    }

    private func getPressureInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        let pressure = baseWeather.weatherMainInfo?.pressure ?? 0.0
        return ActualWeatherInfoItem(image: UIImage(named: "PressureSmall"), title: String(format: "%.0f hPa", pressure))
    }

    private func getWindSpeedInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        let wind = baseWeather.wind?.speed ?? 0.0
        return ActualWeatherInfoItem(image: UIImage(named: "WindSmall"), title: String(format: "%.0f km/h", wind))
    }

    private func getWindDirectionInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        let windDirection = baseWeather.wind?.direction ?? " -- "
        return ActualWeatherInfoItem(image: UIImage(named: "WindDirectionSmall"), title: windDirection)
    }
}
