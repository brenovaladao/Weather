//
//  DateFormatters+Util.swift
//  Weather
//
//  Created by Breno Vinícios on 23/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

extension Date {
    
    // Pattern: HH:mm
    @nonobjc static let hourDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    // Pattern: dd:HH:mm
    @nonobjc static let yearMonthDayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    // Pattern: EEEE
    @nonobjc static let dayOfWeekFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "EEEE"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
}
