//
//  ActualWeatherProtocol.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

protocol ActualWeatherProtocol: class {
    
    func bind(viewObject: ActualWeatherViewObject)
    
    func handleError(_ error: Error)
    
    func setLoading(_ loading: Bool)
    
}
