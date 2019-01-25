//
//  Strings.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - Shared
    
    static let okText = NSLocalizedString("OK", comment: "A text used for confirmation fields, buttons, etc")

    static let cancelText = NSLocalizedString("Cancel", comment: "A text used for the `cancel` action")

    static let tryAgainText = NSLocalizedString("Try again", comment: "A text used for the try again action in buttons")

    // MARK: - Actual Weather
    
    static let shareButtonTitle = NSLocalizedString("Share", comment: "Share button title")

    static let defaultInfoPlaceholder = NSLocalizedString(" -- ", comment: "The default info placeholde for actual weather view")

    static let shareActivityViewControllerTitle = NSLocalizedString("Check the current weather info at %@", comment: "Share ActivityController title")
    
    static let humidityPercetagePlaceholder = NSLocalizedString("-- %", comment: "the placeholder for humity field")
    
    static let precepitatioMMPlaceholder = NSLocalizedString("-- mm", comment: "the placeholder for preceptation field")

    static let pressureHPaPlaceholder = NSLocalizedString("-- hPa", comment: "the placeholder for pressure field")

    static let windSpeedPlaceholder = NSLocalizedString("-- Km/h", comment: "the placeholder for wind speed field")

    static let temperatureTextComplete = NSLocalizedString("%.0f°C | %@", comment: "the string that will be filled with temperature and description infos")

    static let temperatureTextPartial = NSLocalizedString("%.0f°C", comment: "the string that will be filled with temperature info")

    static let humidityText = NSLocalizedString("%.1f%%", comment: "the string that will be filled with humity info")

    static let precepitationText = NSLocalizedString("%.1f mm", comment: "the string that will be filled with precepitation info")

    static let pressureText = NSLocalizedString("%.0f hPa", comment: "the string that will be filled with pressure info")

    static let windSpeedText = NSLocalizedString("%.0f km/h", comment: "the string that will be filled with wind speed info")
    
    // MARK: - Forecast
    
    static let forecastTitle = NSLocalizedString("Forecast", comment: "Default title for `Forecast` item navigation controller")

    static let todayHeaderText = NSLocalizedString("Today", comment: "Used in forecast list as a Header fot the forecast for today")
    
    static let forecastEmptyStateMessage = NSLocalizedString("An error occurred getting your current forecast, please, try again later", comment: "The message that Forecast list shown when an error occurred getting the data")
    
    static let temperatureTextSimple = NSLocalizedString("%.0f°", comment: "the string that will be filled with temperature info")
    
    // MARK: - Errors
    
    static let genericErrorTitle = NSLocalizedString("Attention", comment: "Generic text for errors (will be used as a alert title)")

    static let genericActualWeatherErrorMessage = NSLocalizedString("unfortunately a request error occurred, please try again later", comment: "Generic text for errors (will be used as a alert message in get actual weather requests)")

    static let locationPermissionDeniedAlertTitle = NSLocalizedString("Location Permission", comment: "The title of an alert which is shown when the user has denied the location services permission")

    static let locationPermissionDeniedAlertMessage = NSLocalizedString("We need your location to show the actual weather of your place", comment: "The message of an alert which is shown when the user has denied the location services permission")

    static let goToSettingsButtonAction = NSLocalizedString("Go to settings", comment: "The title of the button alert thats redirects the user to app settings in the device settings")
    
}
