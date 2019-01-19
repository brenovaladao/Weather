//
//  TabBarItem.swift
//  Weather
//
//  Created by Breno Vinícios on 19/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class TabBarItem: UITabBarItem {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setTitleTextAttributes([.foregroundColor: UIColor.tabBarDeselectedColor], for: .normal)
        self.setTitleTextAttributes([.foregroundColor: UIColor.tabBarSelectedColor], for: .selected)
        
    }
}