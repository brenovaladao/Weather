//
//  ForecastProtocol.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

protocol ForecastProtocol: class {
    
    func bind(viewObjects: [ForecastListViewObject])
    
    func bind(cityName: String)

    func handleError(_ error: Error)
    
    func setLoading(_ loading: Bool)
    
    func setupEmptyState(_ empty: Bool)
    
    func requestLocationPermissionInSettings()

}
