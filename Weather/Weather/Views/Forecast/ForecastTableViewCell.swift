//
//  ForecastTableViewCell.swift
//  Weather
//
//  Created by Breno Vinícios on 23/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
   
    // MARK: - IBOutlets
    @IBOutlet private weak var forecastImageView: UIImageView!
    @IBOutlet private weak var forecastTimeLabel: UILabel!
    @IBOutlet private weak var forecastDescriptionLabel: UILabel!
    @IBOutlet private weak var forecastTemperatureLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    // MARK: - Setup

    private func setupViews() {
        forecastTimeLabel.font = UIFont.appFontMedium(ofSize: 18)
        forecastTimeLabel.textColor = UIColor.weatherDarkGray

        forecastDescriptionLabel.font = UIFont.appFontMedium(ofSize: 14)
        forecastDescriptionLabel.textColor = UIColor.weatherDarkGray

        forecastTemperatureLabel.font = UIFont.appFontLight(ofSize: 44)
        forecastTemperatureLabel.textColor = UIColor.weatherBlue
    }
    
    func setup(with viewObject: ForecastItemViewObject) {
        forecastImageView.image = viewObject.forecastImage
        forecastTimeLabel.text = viewObject.forecastTime
        forecastDescriptionLabel.text = viewObject.forecastDescription
        forecastTemperatureLabel.text = viewObject.forecastTemperature
    }
    
}
