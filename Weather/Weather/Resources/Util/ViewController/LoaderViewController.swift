//
//  LoaderViewController.swift
//  Weather
//
//  Created by Breno Vinícios on 24/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class LoaderViewController: UIViewController {
    
    // MARK: Properties
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.color = UIColor.weatherDarkGray
        return activityIndicatorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActivityIndicator()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        startAnimating()
    }
    
    // MARK: Setup
    
    private func setupActivityIndicator() {
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicatorView)
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func startAnimating() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self = self else { return }
            self.activityIndicatorView.startAnimating()
        }
    }
}
