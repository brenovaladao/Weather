//
//  WeatherNavigationController.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class WeatherNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDefaultNavigationBarLayout()
        setupDefaultNavigationBarFont()
    }
    
    // MARK: Default layout
    
    private func setupDefaultNavigationBarLayout() {
        navigationBar.barTintColor = UIColor.white
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }

    private func setupDefaultNavigationBarFont() {
        navigationBar.titleTextAttributes = [.font: UIFont.appFontMedium(ofSize: 18),
                                             .foregroundColor: UIColor.weatherDarkGray]
    }
}
