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

// MARK: - Shared Public Methods

extension WeatherViewController {
    
    public func genericErrorHandler(_ error: Error) {
    
        let title = (error as NSError).localizedDescription
        let message = (error as NSError).localizedFailureReason

        alert(with: title, message: message)
        
    }
    
    public func alert(with title: String?, message: String? = nil, hasCancelAction: Bool = false, okButtonTitle: String = String.okText, okAction: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
        alertController.addAction(UIAlertAction(title: okButtonTitle, style: .default) { (_) in
            okAction?()
        })
        present(alertController, animated: true, completion: nil)
    }
    
}
