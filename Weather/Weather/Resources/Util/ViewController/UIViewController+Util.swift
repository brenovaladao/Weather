//
//  UIViewController+Util.swift
//  Weather
//
//  Created by Breno Vinícios on 24/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

// MARK: - Controllers management
extension UIViewController {
    
    private func addChildController<T: UIViewController>(_ child: T) {
        guard !children.contains(where: { $0.isKind(of: T.self) }) else { return }
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    private func removeChildController<T: UIViewController>(_ child: T) {
        guard child.parent != nil else { return }
        child.willMove(toParent: nil)
        child.removeFromParent()
        child.view.removeFromSuperview()
    }
    
}

// MARK: - Loader
extension UIViewController {
    
    public func startLoader() {
        let loaderViewController = LoaderViewController()
        addChildController(loaderViewController)
    }
    
    public func stopLoader() {
        guard let loaderViewController = children.filter({ $0.isKind(of: LoaderViewController.self) }).first as? LoaderViewController else {
            return
        }
        UIView.animate(withDuration: 0.2, animations: {
            loaderViewController.view.alpha = 0
        }, completion: { _ in
            self.removeChildController(loaderViewController)
        })
    }
    
}

// MARK: - Errors
extension UIViewController {
 
    public func genericErrorHandler(_ error: Error) {
        
        let title = (error as NSError).localizedDescription
        let message = (error as NSError).localizedFailureReason
        
        alert(with: title, message: message)
        
    }
    
    public func openAppSettings() {
        alert(with: String.locationPermissionDeniedAlertTitle,
              message: String.locationPermissionDeniedAlertMessage,
              actionButtonTitle: String.goToSettingsButtonAction) {
                guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                UIApplication.shared.open(url)
        }
    }
}

// MARK: - AlertController

extension UIViewController {

    public func alert(with title: String?, message: String? = nil, hasCancelAction: Bool = false, actionButtonTitle: String? = nil, okAction: (() -> Void)? = nil) {
        
        let actionTitle = actionButtonTitle ?? String.okText
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default) { (_) in
            okAction?()
        })
        
        if hasCancelAction {
            alertController.addAction(UIAlertAction.init(title: String.cancelText, style: .cancel, handler: nil))
        }
        
        present(alertController, animated: true, completion: nil)
    }

}
