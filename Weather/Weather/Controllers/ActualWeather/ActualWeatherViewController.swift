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
    @IBOutlet private weak var precipitationWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var pressureWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var windWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var windDirectionWeatherInfoView: WeatherInfoView!
    @IBOutlet private weak var shareWeatherInfoButton: UIButton!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ActualWeatherPresenter(actualWeatherView: self)
        presenter.getActualWeatherData()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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

    #warning("remove this button and delete in storyboard file")
    @IBAction func buttonAction(_ sender: Any) {
        presenter.getActualWeatherData()
    }
    
}

// MARK: - ActualWeatherProtocol
extension ActualWeatherViewController: ActualWeatherProtocol {
    
    func bind(viewObject: ActualWeatherViewObject) {
        
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
        
    }
    
}

// MARK: - Actions
extension ActualWeatherViewController {
    
    @IBAction private func shareWeatherInfoButtonAction() {
        
    }
    
}
