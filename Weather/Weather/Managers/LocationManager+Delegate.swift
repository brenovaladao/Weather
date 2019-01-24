//
//  LocationManager+Delegate.swift
//  Weather
//
//  Created by Breno Vinícios on 24/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

protocol LocationManagerDelegate: class {
    
    func startGettingNewLocation()
    
    func didReceiveNewLocation(_ location: Location)
    
}
