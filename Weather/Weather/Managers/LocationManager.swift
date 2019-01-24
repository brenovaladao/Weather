//
//  LocationManager.swift
//  Weather
//
//  Created by Breno Vinícios on 24/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    var latitude: Double
    var longitude: Double
}

class LocationManager: NSObject {
    
    // MARK: Singleton init
    static let shared = LocationManager()
    private override init() {}

    // MARK: - Constants
    private let lastLocationRequestDateKey = "com.brenovinicios.lastLocationRequest.key"
//    private let lastLocationRequestTime: TimeInterval = 5 * 60 // 5 = minutes
    private let lastLocationRequestTime: TimeInterval = 30 // 5 = minutes

    // MARK: Properties
    private var isUpdatingLocation = false
    private (set) var currentLocation: Location?
    
    weak var delegate: LocationManagerDelegate?
    
    // MARK: Properties
    
    private lazy var location: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10.0
        return locationManager
    }()
    
}

// MARK: - Public
extension LocationManager {
    
    public func requestLocationPermission() -> Bool {
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            location.requestWhenInUseAuthorization()
            return true
        case .restricted,
             .denied:
            return false
        case .authorizedAlways,
             .authorizedWhenInUse:
            return true
        }
    }
    
    public func getNewLocationIfIsPossible() {
        
        guard !isUpdatingLocation else { return }
        
        // Verifying the permission
        guard CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways else {
            return
        }
        // Verifying timestamp
        
        // If There's no date saved, just continue. fisrt request
        if let lastLocationUpdate = UserDefaultsUtil.getObject(forKey: lastLocationRequestDateKey) as? Date {
            guard Date().compare(lastLocationUpdate.addingTimeInterval(lastLocationRequestTime)) == .orderedDescending else {
                return
            }
        }
        UserDefaultsUtil.setObject(Date(), forKey: lastLocationRequestDateKey)
        
        location.startUpdatingLocation()
        delegate?.startGettingNewLocation()
        isUpdatingLocation = true
    }
    
}

// MARK: - Private
extension LocationManager {
    
    func stopTrackingLocation() {
        location.stopUpdatingLocation()
        isUpdatingLocation = false
    }
}

// MARK: - LocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        getNewLocationIfIsPossible()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        stopTrackingLocation()
        
        guard locations.count > 0,
            let currentLocation = locations.first else {
                return
        }
        let location = Location(latitude: currentLocation.coordinate.latitude,
                                        longitude: currentLocation.coordinate.longitude)
        self.currentLocation = location
        delegate?.didReceiveNewLocation(location)
    }
    
}
