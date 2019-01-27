//
//  UserDefaultsUtil.swift
//  Weather
//
//  Created by Breno Vinícios on 24/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

struct UserDefaultsUtil {
    
    static func setObject(_ object: Any?, forKey key: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(object, forKey: key)
        userDefaults.synchronize()
    }

    static func getObject(forKey key: String) -> Any? {
        let userDefaults = UserDefaults.standard
        return userDefaults.value(forKey: key)
    }
    
}
