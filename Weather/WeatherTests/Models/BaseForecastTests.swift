//
//  BaseForecastTests.swift
//  WeatherTests
//
//  Created by Breno Vinícios on 25/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import XCTest
@testable import Weather

class BaseForecastTests: XCTestCase {

    func testSuccessBaseForecastRequestResponse() {
        
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "successBaseForecastResponse", withExtension: "json") else {
            XCTFail("Missing file: successBaseForecastResponse.json")
            return 
        }
        
        guard let data = try? Data(contentsOf: url) else {
            XCTFail("Error converting json file in data")
            return
        }
        
        let decoder = JSONDecoder()
        let baseWeatherResponse = try? decoder.decode(BaseForecast.self, from: data)
        
        XCTAssertNotNil(baseWeatherResponse)
        
    }
    
    func testErrorBaseForecastRequestResponse() {
        
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "errorBaseForecastResponse", withExtension: "json") else {
            XCTFail("Missing file: successBaseForecastResponse.json")
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            XCTFail("Error converting json file in data")
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let baseForecastResponse = try decoder.decode(BaseForecast.self, from: data)
            XCTAssertNil(baseForecastResponse, "Expected a nil value")
        } catch {
            XCTAssertTrue(error is AppError)
        }
    }
}
