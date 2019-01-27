//
//  ActualWeatherViewController.swift
//  Weather
//
//  Created by Breno Vinícios on 19/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class ActualWeatherViewController: UIViewController {
    
    private var presenter: ActualWeatherPresenter!
    
    // MARK: IBOutlets
    @IBOutlet private weak var weatherImageView: UIImageView!
    @IBOutlet private weak var cityCountryLabel: UILabel!
    @IBOutlet private weak var temperatureDescriptionLabel: UILabel!
    @IBOutlet private weak var humityWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var precipitationWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var pressureWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var windWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var windDirectionWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var shareWeatherInfoButton: UIButton!
    private var locationText: String?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ActualWeatherPresenter(actualWeatherView: self)
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.updateActualWeatherData()
    }

    // MARK: Views Setup
    
    private func setupViews() {
        cityCountryLabel.font = UIFont.appFontMedium(ofSize: 18)
        cityCountryLabel.textColor = .weatherDarkGray

        temperatureDescriptionLabel.font = UIFont.appFontMedium(ofSize: 20)
        temperatureDescriptionLabel.textColor = .weatherBlue

        shareWeatherInfoButton.titleLabel?.font = UIFont.appFontMedium(ofSize: 18)
        shareWeatherInfoButton.setTitleColor(.weatherOrange, for: .normal)
        shareWeatherInfoButton.setTitle(String.shareButtonTitle, for: .normal)
    }    
}

// MARK: - ActualWeatherProtocol
extension ActualWeatherViewController: ActualWeatherProtocol {
    
    func bind(viewObject: ActualWeatherViewObject) {
        
        locationText = viewObject.locationText
        
        weatherImageView.image = viewObject.weatherImage
        cityCountryLabel.text = viewObject.locationText
        temperatureDescriptionLabel.text = viewObject.temperatureDescriptionText
        humityWeatherInfoView.setup(with: viewObject.humity)
        precipitationWeatherInfoView.setup(with: viewObject.precipitation)
        pressureWeatherInfoView.setup(with: viewObject.pressure)
        windWeatherInfoView.setup(with: viewObject.wind)
        windDirectionWeatherInfoView.setup(with: viewObject.windDirection)
    }
    
    func handleError(_ error: Error) {
        genericErrorHandler(error)
    }
    
    func setLoading(_ loading: Bool) {
        if loading {
            startLoader()
        } else {
            stopLoader()
        }
    }
    
    func requestLocationPermissionInSettings() {
        openAppSettings()
    }
    
}

// MARK: - Actions
extension ActualWeatherViewController {
    
    @IBAction private func shareWeatherInfoButtonAction() {
    
        shareWeatherInfoButton.isHidden = true
        
        guard let locationText = locationText,
            let viewScreenShot = view.takeScreenshot() else {
                shareWeatherInfoButton.isHidden = false
                return
        }
        shareWeatherInfoButton.isHidden = false

        let activityViewControllerTitle = String(format: String.shareActivityViewControllerTitle, locationText)
        
        let activityViewController = UIActivityViewController(activityItems: [activityViewControllerTitle, viewScreenShot],
                                                              applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
    }
    
}
