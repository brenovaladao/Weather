//
//  ForecastViewController.swift
//  Weather
//
//  Created by Breno Vinícios on 19/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

class ForecastViewController: WeatherViewController {
    
    private var presenter: ForecastPresenter!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ForecastPresenter(forecastView: self)
    }
    
    @IBAction func doRequest(_ sender: Any) {
        presenter.getForecastData()
    }
    
}

// MARK: - ForecastProtocol
extension ForecastViewController: ForecastProtocol {
    
}
