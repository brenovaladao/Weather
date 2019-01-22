//
//  UIFont+Weather.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

extension UIFont {
    
    /// Montserrat-Light
    class func appFontLight(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Montserrat-Light", size: size) else {
            return UIFont.systemFont(ofSize: size, weight: .light)
        }
        return UIFontMetrics.default.scaledFont(for: font)
    }

    /// Montserrat-Medium
    class func appFontMedium(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Montserrat-Medium", size: size) else {
            return UIFont.systemFont(ofSize: size, weight: .medium)
        }
        return UIFontMetrics.default.scaledFont(for: font)
    }

    /// Montserrat-SemiBold
    class func appFontSemiBold(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Montserrat-SemiBold", size: size) else {
            return UIFont.systemFont(ofSize: size, weight: .semibold)
        }
        return UIFontMetrics.default.scaledFont(for: font)
    }
}
