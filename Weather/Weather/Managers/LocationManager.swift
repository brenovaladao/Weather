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
    private let lastLatitudeLocationKey = "com.brenovinicios.lastLocation.latitude.key"
    private let lastLongitudeLocationKey = "com.brenovinicios.lastLocation.longitude.key"
    
    private let lastLocationRequestTime: TimeInterval = 5 * 60 // 5 = minutes

    // MARK: Properties
    private var isUpdatingLocation = false
    
    private(set) var currentLocation: Location? {
        get {
            guard let lat = UserDefaultsUtil.getObject(forKey: lastLatitudeLocationKey) as? Double,
                let lon = UserDefaultsUtil.getObject(forKey: lastLongitudeLocationKey) as? Double else {
                    return nil
            }
            return Location(latitude: lat, longitude: lon)
        }
        set {
            UserDefaultsUtil.setObject(newValue?.latitude, forKey: lastLatitudeLocationKey)
            UserDefaultsUtil.setObject(newValue?.longitude, forKey: lastLongitudeLocationKey)
        }
    }
    
    weak var delegate: LocationManagerDelegate?
    
    private lazy var location: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
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
    
    public func requestNewLocationIfIsPossible() {
        
        guard !isUpdatingLocation else { return }
        
        // Verifying the permission
        guard CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways else {
            return
        }

        guard verifyIfCanUpdateLocationByTime() else { return }
        
        location.startUpdatingLocation()
        delegate?.startGettingNewLocation()
        isUpdatingLocation = true
    }
    
}

// MARK: - Private
extension LocationManager {
    
    private func stopTrackingLocation() {
        location.stopUpdatingLocation()
        isUpdatingLocation = false
    }
    
    private func verifyIfCanUpdateLocationByTime() -> Bool {
        // Verifying timestamp
        // If There's no date saved, just continue. fisrt request
        if let lastLocationUpdate = UserDefaultsUtil.getObject(forKey: lastLocationRequestDateKey) as? Date {
            guard Date().compare(lastLocationUpdate.addingTimeInterval(lastLocationRequestTime)) == .orderedDescending else {
                return false
            }
        }
        UserDefaultsUtil.setObject(Date(), forKey: lastLocationRequestDateKey)
        return true
    }

}

// MARK: - LocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        requestNewLocationIfIsPossible()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        stopTrackingLocation()
        
        guard locations.count > 0,
            let currentLocation = locations.first else {
                return
        }
        self.currentLocation = Location(latitude: currentLocation.coordinate.latitude,
                                        longitude: currentLocation.coordinate.longitude)
        DispatchQueue.main.async {
            self.delegate?.didReceiveNewLocation()
        }
    }
    
}
