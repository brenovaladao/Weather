//
//  ActualWeatherViewObject.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

struct ActualWeatherViewObject {
    
    let weatherImage: UIImage?
    let locationText: String?
    let temperatureDescriptionText: String?
    let humity: ActualWeatherInfoItem
    let precipitation: ActualWeatherInfoItem
    let pressure: ActualWeatherInfoItem
    let wind: ActualWeatherInfoItem
    let windDirection: ActualWeatherInfoItem
    
}

struct ActualWeatherInfoItem {
    let image: UIImage?
    let title: String?
}
