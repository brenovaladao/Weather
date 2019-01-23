//
//  WeatherInfoView.swift
//  Weather
//
//  Created by Breno Vinícios on 22/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class WeatherInfoView: UIView {

    // MARK: - IBOutlets
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Load view from xib
    private var customView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXib()
    }
    
    private func loadXib() {
        self.customView = Bundle.main.loadNibNamed("WeatherInfoView", owner: self, options: nil)?.first as? UIView
        guard self.customView != nil else { return }
        self.customView?.frame = self.bounds
        self.customView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.customView!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        titleLabel.font = UIFont.appFontMedium(ofSize: 15)
        titleLabel.textColor = UIColor.darkGray
    }
    
    public func setup() {
        
    }
}
