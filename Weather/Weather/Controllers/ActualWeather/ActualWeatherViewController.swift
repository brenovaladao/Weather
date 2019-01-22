//
//  ActualWeatherViewController.swift
//  Weather
//
//  Created by Breno Vinícios on 19/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

class ActualWeatherViewController: WeatherViewController {
    
    private var presenter: ActualWeatherPresenter!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ActualWeatherPresenter(actualWeatherView: self)
    }
    
    @IBAction func doRequest(_ sender: Any) {
        presenter.getActualWeatherData()
    }
    
}

// MARK: - ActualWeatherProtocol
extension ActualWeatherViewController: ActualWeatherProtocol {
    
}
