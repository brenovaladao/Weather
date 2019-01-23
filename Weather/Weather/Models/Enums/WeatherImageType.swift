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
            return UIImage(named: "ClearSkyDayBig")
        case .clearSkyN:
            return UIImage(named: "ClearSkyNightBig")
        case .fewCloudsD:
            return UIImage(named: "FewCloudsDayBig")
        case .fewCloudsN:
            return UIImage(named: "FewCloudsNightBig")
        case .scatteredCloudsD:
            return UIImage(named: "ScatteredCloudsDayBig")
        case .scatteredCloudsN:
            return UIImage(named: "ScatteredCloudsNightBig")
        case .brokenCloudsD:
            return UIImage(named: "BrokenCloudsDayBig")
        case .brokenCloudsN:
            return UIImage(named: "BrokenCloudsNightBig")
        case .showerRainD:
            return UIImage(named: "ShowerRainDayBig")
        case .showerRainN:
            return UIImage(named: "ShowerRainNightBig")
        case .rainD:
            return UIImage(named: "RainDayBig")
        case .rainN:
            return UIImage(named: "RainNightBig")
        case .thunderstormD:
            return UIImage(named: "ThunderstormDayBig")
        case .thunderstormN:
            return UIImage(named: "ThunderstormNightBig")
        case .snowD:
            return UIImage(named: "SnowDayBig")
        case .snowN:
            return UIImage(named: "SnowNightBig")
        case .mistD:
            return UIImage(named: "MistDayBig")
        case .mistN:
            return UIImage(named: "MistNightBig")
        }
    }
    
}
