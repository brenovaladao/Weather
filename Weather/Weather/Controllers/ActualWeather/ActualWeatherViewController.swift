//
//  ActualWeatherViewController.swift
//  Weather
//
//  Created by Breno Vinícios on 19/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class ActualWeatherViewController: WeatherViewController {
    
    private var presenter: ActualWeatherPresenter!
    
    // MARK: IBOutlets
    @IBOutlet private weak var weatherImageView: UIImageView!
    @IBOutlet private weak var cityCountryLabel: UILabel!
    @IBOutlet private weak var temperatureDescriptionLabel: UILabel!
    @IBOutlet private weak var humityWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var preciptationWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var pressureWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var windWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var windDirectionWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var shareWeatherInfoButton: UIButton!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ActualWeatherPresenter(actualWeatherView: self)
        setupViews()
    }
    
    @IBAction func doRequest(_ sender: Any) {
        presenter.getActualWeatherData()
    }
    
    // MARK: Views Setup
    
    private func setupViews() {
        cityCountryLabel.font = UIFont.appFontMedium(ofSize: 18)
        cityCountryLabel.textColor = .weatherDarkGray

        temperatureDescriptionLabel.font = UIFont.appFontMedium(ofSize: 24)
        temperatureDescriptionLabel.textColor = .weatherBlue

        shareWeatherInfoButton.titleLabel?.font = UIFont.appFontMedium(ofSize: 18)
        shareWeatherInfoButton.setTitleColor(.weatherOrange, for: .normal)
        shareWeatherInfoButton.setTitle(String.shareButtonTitle, for: .normal)
    }
}

// MARK: - ActualWeatherProtocol
extension ActualWeatherViewController: ActualWeatherProtocol {
    
}

// MARK: - Actions
extension ActualWeatherViewController {
    
    @IBAction private func shareWeatherInfoButtonAction() {
        
    }
}
