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

    // MARK: - Load view from xib

    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXib()
    }
    
    private func loadXib() {
        guard let customView = Bundle.main.loadNibNamed("ForecastTableHeaderView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        customView.frame = self.bounds
        customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(customView)
    }
    
    // MARK: - Setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        headerTitleLabel.font = UIFont.appFontSemiBold(ofSize: 14)
        headerTitleLabel.textColor = UIColor.weatherDarkGray
    }
    
    public func setup(with title: String?) {
        headerTitleLabel.text = title
    }
    
}
