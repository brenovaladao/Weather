//
//  ForecastTableHeaderView.swift
//  Weather
//
//  Created by Breno Vinícios on 23/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class ForecastTableHeaderView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var headerTitleLabel: UILabel!
    
    // MARK: - Setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        headerTitleLabel.font = UIFont.appFontSemiBold(ofSize: 14)
        headerTitleLabel.textColor = UIColor.weatherDarkGray
    }
    
    public func setup(with title: String) {
        headerTitleLabel.text = title
    }
    
}
