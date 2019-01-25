//
//  BaseWeatherTests.swift
//  WeatherTests
//
//  Created by Breno Vinícios on 25/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import XCTest
@testable import Weather

class BaseWeatherTests: XCTestCase {

    func testSuccessBaseWeatherRequestResponse() {
        
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "successBaseWeatherResponse", withExtension: "json") else {
            XCTFail("Missing file: successBaseWeatherResponse.json")
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            XCTFail("Error converting json file in data")
            return
        }

        let decoder = JSONDecoder()
        let baseWeatherResponse = try? decoder.decode(BaseWeather.self, from: data)
        
        XCTAssertNotNil(baseWeatherResponse)
        
    }
    
    func testErrorBaseWeatherRequestResponse() {
        
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "errorBaseWeatherResponse", withExtension: "json") else {
            XCTFail("Missing file: successBaseWeatherResponse.json")
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            XCTFail("Error converting json file in data")
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let baseWeatherResponse = try decoder.decode(BaseWeather.self, from: data)
            XCTAssertNil(baseWeatherResponse, "Expected a nil value")
        } catch {
            XCTAssertTrue(error is AppError)
        }
    }
    
}
