//
//  Strings.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: Shared
    
    static let okText = NSLocalizedString("OK", comment: "A text used for confirmation fields, buttons, etc")

    // MARK: Actual Weather Strings
    
    static let shareButtonTitle = NSLocalizedString("Share", comment: "Share button title")

    static let shareActivityViewControllerTitle = NSLocalizedString("Check the current weather info at %@", comment: "Share ActivityController title")
    
    // MARK: Forecast Strings
    
    static let forecastTitle = NSLocalizedString("Forecast", comment: "Default title for `Forecast` item navigation controller")

    static let todayHeaderText = NSLocalizedString("Today", comment: "Used in forecast list as a Header fot the forecast for today")
    
    // MARK: - Errors
    
    static let genericErrorTitle = NSLocalizedString("Attention", comment: "Generic text for errors (will be used as a alert title)")

    static let genericActualWeatherErrorMessage = NSLocalizedString("unfortunately a request error occurred, please try again later", comment: "Generic text for errors (will be used as a alert message in get actual weather requests)")

    static let locationPermissionDeniedAlertTitle = NSLocalizedString("Location Permission", comment: "The title of an alert which is shown when the user has denied the location services permission")

    static let locationPermissionDeniedAlertMessage = NSLocalizedString("We need your location to show the actual weather of your place", comment: "The message of an alert which is shown when the user has denied the location services permission")

    static let goToSettingsButtonAction = NSLocalizedString("Go to settings", comment: "The title of the button alert thats redirects the user to app settings in the device settings")

}
