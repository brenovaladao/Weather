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
    
    // MARK: Forecast Strings

    // MARK: Views
    
    // MARK: - Errors
    
    static let genericErrorTitle = NSLocalizedString("Attention", comment: "Generic text for errors (will be used as a alert title)")

    static let genericActualWeatherErrorMessage = NSLocalizedString("Some message that I'll write", comment: "Generic text for errors (will be used as a alert message in get actual weather requests)")

}
