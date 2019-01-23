//
//  WeatherViewController.swift
//  Weather
//
//  Created by Breno Vinícios on 19/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit
import Moya

class WeatherViewController: UIViewController {
    
}

// MARK: -
extension WeatherViewController {
    
    func genericErrorHandler(_ error: Error) {

        let title = (error as NSError).localizedDescription
        let message = (error as NSError).localizedFailureReason

        alert(with: title, message: message)
        
    }
    
    func alert(with title: String?, message: String? = nil, hasCancelAction: Bool = false, okAction: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
        alertController.addAction(UIAlertAction(title: String.okText, style: .default) { (_) in
            okAction?()
        })
        present(alertController, animated: true, completion: nil)
    }
    
}
