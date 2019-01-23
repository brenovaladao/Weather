//
//  WeatherImageType.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation
import UIKit

enum WeatherImageType: String, CaseIterable {
   
    case clearSkyD = "01d"
    case clearSkyN = "01n"
    case fewCloudsD = "02d"
    case fewCloudsN = "02n"
    case scatteredCloudsD = "03d"
    case scatteredCloudsN = "03n"
    case brokenCloudsD = "04d"
    case brokenCloudsN = "04n"
    case showerRainD = "09d"
    case showerRainN = "09n"
    case rainD = "10d"
    case rainN = "10n"
    case thunderstormD = "11d"
    case thunderstormN = "11n"
    case snowD = "13d"
    case snowN = "13n"
    case mistD = "50d"
    case mistN = "50n"
    
    var image: UIImage? {
        switch self {
        case .clearSkyD:
            return .clearSkyDayBig
        case .clearSkyN:
            return .clearSkyNightBig
        case .fewCloudsD:
            return .fewCloudsDayBig
        case .fewCloudsN:
            return .fewCloudsNightBig
        case .scatteredCloudsD:
            return .scatteredCloudsDayBig
        case .scatteredCloudsN:
            return .scatteredCloudsNightBig
        case .brokenCloudsD:
            return .brokenCloudsDayBig
        case .brokenCloudsN:
            return .brokenCloudsNightBig
        case .showerRainD:
            return .showerRainDayBig
        case .showerRainN:
            return .showerRainNightBig
        case .rainD:
            return .rainDayBig
        case .rainN:
            return .rainNightBig
        case .thunderstormD:
            return .thunderstormDayBig
        case .thunderstormN:
            return .thunderstormNightBig
        case .snowD:
            return .snowDayBig
        case .snowN:
            return .snowNightBig
        case .mistD:
            return .mistDayBig
        case .mistN:
            return .mistNightBig
        }
    }
    
}
