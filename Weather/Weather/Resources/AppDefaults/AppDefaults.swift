//
//  AppDefaults.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct AppDefaults {
    
    static var baseURL: URL { return URL(string: "https://api.openweathermap.org/data/2.5")! }
    
    static var openWeatherApiKey: String { return "ab99b0bfe9d4b0630fd40969abdd6009" }
    
}
