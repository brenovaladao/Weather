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
    
    private var isLoadingData = false
    
    init(actualWeatherView: ActualWeatherProtocol) {
        self.actualWeatherView = actualWeatherView
        self.createEmptyViewObject()
        LocationManager.shared.delegate = self
    }

}

// MARK: - Public
extension ActualWeatherPresenter {

    public func getActualWeatherData() {
        
        guard !isLoadingData else { return }

        guard let location = LocationManager.shared.currentLocation else { return }
        
        actualWeatherView?.setLoading(true)
        isLoadingData = true

        WeatherService.getActualWeather(for: location.latitude, lon: location.longitude) { [weak self] (baseWeather, error) in
            guard let self = self else { return }
            self.isLoadingData = false
            self.actualWeatherView?.setLoading(false)
            if let error = error {
                self.actualWeatherView?.handleError(error)
                return
            }
            guard let viewObject = self.createViewObject(from: baseWeather) else {
                return
            }
            self.actualWeatherView?.bind(viewObject: viewObject)
        }
    }
    
    public func updateActualWeatherData() {
        if LocationManager.shared.requestLocationPermission() {
            LocationManager.shared.getNewLocationIfIsPossible()
        } else {
            actualWeatherView?.requestLocationPermissionInSettings()
        }
    }
    
}

// MARK: - Private
extension ActualWeatherPresenter {
    
    private func createEmptyViewObject() {
        
        let humity = ActualWeatherInfoItem(image: .humiditySmall, title: String.humidityPercetagePlaceholder)
        let precipitation = ActualWeatherInfoItem(image: .precipitationSmall, title: String.precepitatioMMPlaceholder)
        let pressure = ActualWeatherInfoItem(image: .pressureSmall, title: String.pressureHPaPlaceholder)
        let windSpeed = ActualWeatherInfoItem(image: .windSmall, title: String.windSpeedPlaceholder)
        let windDirection = ActualWeatherInfoItem(image: .windDirectionSmall, title: String.defaultInfoPlaceholder)

        let emptyViewObject = ActualWeatherViewObject(weatherImage: WeatherImageType.clearSkyD.imageBig,
                                                     locationText: String.defaultInfoPlaceholder,
                                                     temperatureDescriptionText: String.defaultInfoPlaceholder,
                                                     humity: humity,
                                                     precipitation: precipitation,
                                                     pressure: pressure,
                                                     wind: windSpeed,
                                                     windDirection: windDirection)

        actualWeatherView?.bind(viewObject: emptyViewObject)
    }
    
    private func createViewObject(from baseWeather: BaseWeather?) -> ActualWeatherViewObject? {
        
        guard let baseWeather = baseWeather else { return nil }

        let weatherImage = baseWeather.weather?.first?.getImage(size: .big)
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
        guard let name = baseWeather.name else { return String.defaultInfoPlaceholder }
        if let country = baseWeather.sysInfo?.country {
            return "\(name), \(country)"
        } else {
            return name
        }
    }
    
    private func getTemperatureDescription(_ baseWeather: BaseWeather) -> String? {
        guard let temperature = baseWeather.weatherMainInfo?.temperature else { return nil }
        if let weatherDescription = baseWeather.weather?.first?.description?.capitalized {
            return String(format: String.temperatureTextComplete, temperature, weatherDescription)
        } else {
            return String(format: String.temperatureTextPartial, temperature)
        }
    }
    
    private func getHumidityInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        let humitidy = baseWeather.weatherMainInfo?.humidity ?? 0.0
        return ActualWeatherInfoItem(image: .humiditySmall, title: String(format: String.humidityText, humitidy))
    }

    private func getPrecipitationInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        var precipitation: Double = 0.0
        if let rain3h = baseWeather.rain?.threeHours {
            precipitation = rain3h
        } else if let rain1h = baseWeather.rain?.oneHour {
            precipitation = rain1h
        }
        return ActualWeatherInfoItem(image: .precipitationSmall, title: String(format: String.precepitationText, precipitation))
    }

    private func getPressureInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        let pressure = baseWeather.weatherMainInfo?.pressure ?? 0.0
        return ActualWeatherInfoItem(image: .pressureSmall, title: String(format: String.pressureText, pressure))
    }

    private func getWindSpeedInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        let wind = baseWeather.wind?.speed ?? 0.0
        return ActualWeatherInfoItem(image: .windSmall, title: String(format: String.windSpeedText, wind))
    }

    private func getWindDirectionInfoItem(_ baseWeather: BaseWeather) -> ActualWeatherInfoItem {
        let windDirection = baseWeather.wind?.direction ?? String.defaultInfoPlaceholder
        return ActualWeatherInfoItem(image: .windDirectionSmall, title: windDirection)
    }
    
}

// MARK: - LocationManagerDelegate
extension ActualWeatherPresenter: LocationManagerDelegate {
    
    func startGettingNewLocation() {
        guard !isLoadingData else { return }
        actualWeatherView?.setLoading(true)
    }
    
    func didReceiveNewLocation() {
        getActualWeatherData()
    }
    
}
