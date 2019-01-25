//
//  ForecastEmptyStateView.swift
//  Weather
//
//  Created by Breno Vinícios on 25/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class ForecastEmptyStateView: UIView {
    
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var tryAgainButton: UIButton!
    
    private var actionBlock: (() -> Void)?
    
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
        guard let customView = Bundle.main.loadNibNamed("ForecastEmptyStateView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        customView.frame = self.bounds
        customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(customView)
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        messageLabel.font = UIFont.appFontLight(ofSize: 18)
        messageLabel.textColor = UIColor.weatherDarkGray
        messageLabel.text = String.forecastEmptyStateMessage
        
        tryAgainButton.backgroundColor = UIColor.weatherBlue
        tryAgainButton.titleLabel?.font = UIFont.appFontSemiBold(ofSize: 16)
        tryAgainButton.setTitleColor(UIColor.white, for: .normal)
        tryAgainButton.setTitle(String.tryAgainText, for: .normal)
        tryAgainButton.layer.cornerRadius = tryAgainButton.bounds.height / 2
    }
    
    func setupAction(_ action: @escaping () -> Void) {
        setupViews()
        actionBlock = action
    }
    
}

// MARK: - Action
extension ForecastEmptyStateView {
    
    @IBAction func tryAgainButtonAction(_ sender: Any) {
        actionBlock?()
    }
    
}
